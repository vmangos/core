DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220826172845');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220826172845');
-- Add your query below.


-- Western Plaguelands
-- Gold Vein / Mithril Deposit / Truesilver Deposit
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Western Plaguelands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 80 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Western Plaguelands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2040);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Western Plaguelands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);

-- Truesilver Deposit / Small Thorium Vein
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Truesilver Deposit / Small Thorium Vein - Western Plaguelands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 324);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Truesilver Deposit / Small Thorium Vein - Western Plaguelands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);

-- Truesilver Deposit / Rich Thorium Vein
UPDATE `pool_gameobject` SET `chance` = 60 WHERE `description` = "Truesilver Deposit / Rich Thorium Vein - Western Plaguelands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);
UPDATE `pool_gameobject` SET `chance` = 40 WHERE `description` = "Truesilver Deposit / Rich Thorium Vein - Western Plaguelands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 175404);


-- Eastern Plaguelands
-- Gold Vein / Mithril Deposit / Truesilver Deposit
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Eastern Plaguelands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 70 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Eastern Plaguelands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2040);
UPDATE `pool_gameobject` SET `chance` = 25 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Eastern Plaguelands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);

-- Truesilver Deposit / Small Thorium Vein
UPDATE `pool_gameobject` SET `chance` = 80 WHERE `description` = "Truesilver Deposit / Small Thorium Vein - Eastern Plaguelands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 324);
UPDATE `pool_gameobject` SET `chance` = 20 WHERE `description` = "Truesilver Deposit / Small Thorium Vein - Eastern Plaguelands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);

-- Truesilver Deposit / Rich Thorium Vein
UPDATE `pool_gameobject` SET `chance` = 20 WHERE `description` = "Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);
UPDATE `pool_gameobject` SET `chance` = 80 WHERE `description` = "Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 175404);


-- Silverpine Forest
-- Tin Vein / Silver Vein
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Tin Vein / Silver Vein - Silverpine Forest" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1732);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Tin Vein / Silver Vein - Silverpine Forest" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);


-- Hillsbrad Foothills
-- Azurelode Mine
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Tin Vein / Silver Vein - Hillsbrad Foothills - Azurelode Mine" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 103711);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Tin Vein / Silver Vein - Hillsbrad Foothills - Azurelode Mine" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 105569);

-- Tin Vein / Silver Vein
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Tin Vein / Silver Vein - Hillsbrad Foothills" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1732);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Tin Vein / Silver Vein - Hillsbrad Foothills" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);

-- Gold Vein / Iron Deposit
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Gold Vein / Iron Deposit - Hillsbrad Foothills" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Gold Vein / Iron Deposit - Hillsbrad Foothills" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1735);

-- Darrow Hill
UPDATE `pool_gameobject` SET `chance` = 20 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Darrow Hill - Hillsbrad Foothills" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Darrow Hill - Hillsbrad Foothills" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 60 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Darrow Hill - Hillsbrad Foothills" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1735);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Darrow Hill - Hillsbrad Foothills" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2040);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Darrow Hill - Hillsbrad Foothills" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);


-- Arathi Highlands
-- Silver Vein / Gold Vein / Iron Deposit
UPDATE `pool_gameobject` SET `chance` = 15 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);
UPDATE `pool_gameobject` SET `chance` = 15 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 70 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1735);

--  Tin Vein / Silver Vein
UPDATE `pool_gameobject` SET `chance` = 70 WHERE `description` = "Tin Vein / Silver Vein - Arathi Highlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1732);
UPDATE `pool_gameobject` SET `chance` = 30 WHERE `description` = "Tin Vein / Silver Vein - Arathi Highlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);

-- Mithril Deposit / Truesilver Deposit
UPDATE `pool_gameobject` SET `chance` = 80 WHERE `description` = "Mithril Deposit / Truesilver Deposit - Arathi Highlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2040);
UPDATE `pool_gameobject` SET `chance` = 20 WHERE `description` = "Mithril Deposit / Truesilver Deposit - Arathi Highlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);

-- Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Arathi Highlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Arathi Highlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 50 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Arathi Highlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1735);
UPDATE `pool_gameobject` SET `chance` = 20 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Arathi Highlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2040);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Arathi Highlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);


-- Wetlands
-- Tin Vein / Silver Vein
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Tin Vein / Silver Vein - Wetlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1732);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Tin Vein / Silver Vein - Wetlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);

-- Tin Vein / Silver Vein / Incendicite Mineral Vein (1610)
UPDATE `pool_gameobject` SET `chance` = 80 WHERE `description` = "Tin Vein / Silver Vein / Incendicite Mineral Vein (1610) - Wetlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1732);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Tin Vein / Silver Vein / Incendicite Mineral Vein (1610) - Wetlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Tin Vein / Silver Vein / Incendicite Mineral Vein (1610) - Wetlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1610);

-- Gold Vein / Iron Deposit
UPDATE `pool_gameobject` SET `chance` = 30 WHERE `description` = "Gold Vein / Iron Deposit - Wetlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 70 WHERE `description` = "Gold Vein / Iron Deposit - Wetlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1735);


-- Loch Modan
-- Tin Vein / Silver Vein
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Tin Vein / Silver Vein - Loch Modan" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1732);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Tin Vein / Silver Vein - Loch Modan" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);


-- Badlands
-- Silver Vein / Gold Vein / Iron Deposit
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Badlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Badlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 80 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Badlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1735);

-- Mithril Deposit / Truesilver Deposit
UPDATE `pool_gameobject` SET `chance` = 80 WHERE `description` = "Mithril Deposit / Truesilver Deposit - Badlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2040);
UPDATE `pool_gameobject` SET `chance` = 20 WHERE `description` = "Mithril Deposit / Truesilver Deposit - Badlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);


-- Duskwood
-- Tin Vein / Silver Vein
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Tin Vein / Silver Vein - Duskwood" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1732);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Tin Vein / Silver Vein - Duskwood" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);

-- Gold Vein / Iron Deposit
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Gold Vein / Iron Deposit - Duskwood" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Gold Vein / Iron Deposit - Duskwood" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1735);

-- Tin Vein / Silver Vein / Gold Vein / Iron Deposit
UPDATE `pool_gameobject` SET `chance` = 50 WHERE `description` = "Tin Vein / Silver Vein / Gold Vein / Iron Deposit - Duskwood" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1732);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Tin Vein / Silver Vein / Gold Vein / Iron Deposit - Duskwood" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Tin Vein / Silver Vein / Gold Vein / Iron Deposit - Duskwood" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 30 WHERE `description` = "Tin Vein / Silver Vein / Gold Vein / Iron Deposit - Duskwood" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1735);


-- Westfall
-- Tin Veins / Silver Veins
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Tin Vein / Silver Vein - Westfall" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1732);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Tin Vein / Silver Vein - Westfall" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);


-- Redridge
-- Tin Vein / Silver Vein
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Tin Vein / Silver Vein - Redridge Mountains" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1732);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Tin Vein / Silver Vein - Redridge Mountains" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);


-- Swamp of Sorrows
-- Silver Vein / Gold Vein / Iron Deposit
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Swamp of Sorrows" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Swamp of Sorrows" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 80 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Swamp of Sorrows" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1735);

-- Mithril Deposit / Truesilver Deposit
UPDATE `pool_gameobject` SET `chance` = 80 WHERE `description` = "Mithril Deposit / Truesilver Deposit - Swamp of Sorrows" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2040);
UPDATE `pool_gameobject` SET `chance` = 20 WHERE `description` = "Mithril Deposit / Truesilver Deposit - Swamp of Sorrows" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);

-- Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 50 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1735);
UPDATE `pool_gameobject` SET `chance` = 20 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2040);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);


-- Blasted Lands
-- Gold Vein / Mithril Deposit
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Gold Vein / Mithril Deposit - Blasted Lands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Gold Vein / Mithril Deposit - Blasted Lands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2040);

-- Truesilver Deposit / Small Thorium Vein
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Truesilver Deposit / Small Thorium Vein - Blasted Lands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 324);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Truesilver Deposit / Small Thorium Vein - Blasted Lands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);

-- Gold Vein / Mithril Deposit / Truesilver Deposit / Small Thorium Vein
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit / Small Thorium Vein - Blasted Lands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 40 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit / Small Thorium Vein - Blasted Lands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2040);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit / Small Thorium Vein - Blasted Lands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);
UPDATE `pool_gameobject` SET `chance` = 40 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit / Small Thorium Vein - Blasted Lands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 324);


-- Searing George
-- Updates First
UPDATE `pool_gameobject` SET `description`='Gold Vein / Mithril Deposit / Dark Iron Deposit / Truesilver Deposit - Searing George' WHERE  `guid` IN (38445, 38345, 38245, 38448, 38348, 38248, 38460, 38360, 38260, 38461, 38361, 38464, 38364, 38264, 38466, 38366, 38266, 38468, 38368, 38268, 38471, 38371, 38271, 38475, 38375, 38275, 38476, 38376, 38276, 38478, 38378, 38278, 38479, 38379, 38279, 38481, 38381, 38281, 38483, 38383, 38283, 38489, 38389, 38289, 38492, 38392, 38292, 38496, 38396, 38296, 38505, 38405, 38305, 38506, 38406, 38306, 38504, 38404, 38304, 38537, 38437, 38337, 38539, 38439, 38339);
UPDATE `pool_gameobject` SET `description`='Gold Vein / Mithril Deposit / Dark Iron Deposit / Silver Vein / Iron Deposit - Searing George' WHERE  `guid` IN (38453, 38353, 38253, 38510, 38410, 38310);
UPDATE `pool_gameobject` SET `description`='Gold Vein / Mithril Deposit / Dark Iron Deposit / Truesilver Deposit / Small Thorium Vein - Searing George' WHERE  `guid` IN (38467, 38367, 38267, 38494, 38394, 38294, 38499, 38399, 38299, 29699, 38542, 38442, 38342);
UPDATE `pool_gameobject` SET `description`='Gold Vein / Mithril Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George' WHERE  `guid` IN (38497, 38397, 38297, 38503, 38403, 38303, 38515, 38415, 38315, 38516, 38416, 38316);
UPDATE `pool_template` SET `description`='Gold Vein / Mithril Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George' WHERE  `entry` IN (4066, 4009);
UPDATE `pool_pool` SET `description`='Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit / Silver Vein / Iron Deposit' WHERE  `pool_id` IN (4066, 4009);
UPDATE `pool_template` SET `description`='Gold Vein / Mithril Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George' WHERE  `entry` IN (4053, 4059, 4071, 4072);
UPDATE `pool_pool` SET `description`='Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit / Silver Vein / Iron Deposit' WHERE  `pool_id` IN (4053, 4059, 4071, 4072);
UPDATE `pool_template` SET `description`='Gold Vein / Mithril Deposit / Dark Iron Deposit / Truesilver Deposit - Searing George' WHERE  `entry` IN (4001, 4004, 4016, 4017, 4020, 4022, 4024, 4027, 4031, 4032, 4034, 4035, 4037, 4039, 4045, 4048, 4052, 4060, 4061, 4062, 4093, 4095);
UPDATE `pool_pool` SET `description`='Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit / Silver Vein / Iron Deposit' WHERE  `pool_id` IN (4001, 4004, 4016, 4017, 4020, 4022, 4024, 4027, 4031, 4032, 4034, 4035, 4037, 4039, 4045, 4048, 4052, 4060, 4061, 4062, 4093, 4095);
UPDATE `pool_template` SET `description`='Gold Vein / Mithril Deposit / Dark Iron Deposit / Truesilver Deposit / Small Thorium Vein - Searing George' WHERE  `entry` IN (4023, 4050, 4055, 4098);
UPDATE `pool_pool` SET `description`='Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit / Silver Vein / Iron Deposit' WHERE  `pool_id` IN (4023, 4050, 4055, 4098);

-- Gold Vein / Mithril Deposit / Dark Iron Deposit
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Gold Vein / Mithril Deposit / Dark Iron Deposit - Searing George" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 60 WHERE `description` = "Gold Vein / Mithril Deposit / Dark Iron Deposit - Searing George" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2040);
UPDATE `pool_gameobject` SET `chance` = 30 WHERE `description` = "Gold Vein / Mithril Deposit / Dark Iron Deposit - Searing George" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 165658);

-- Gold Vein / Mithril Deposit / Dark Iron Deposit / Silver Vein / Iron Deposit
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Dark Iron Deposit - Searing George" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 50 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Dark Iron Deposit - Searing George" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2040);
UPDATE `pool_gameobject` SET `chance` = 30 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Dark Iron Deposit - Searing George" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 165658);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Dark Iron Deposit - Searing George" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Dark Iron Deposit - Searing George" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1735);

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


-- Burning Steppes
-- Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit - Burning Steppes" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 50 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit - Burning Steppes" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2040);
UPDATE `pool_gameobject` SET `chance` = 15 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit - Burning Steppes" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);
UPDATE `pool_gameobject` SET `chance` = 30 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit - Burning Steppes" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 165658);

-- Small Thorium Vein / Truesilver Deposit / Dark Iron Deposit
UPDATE `pool_gameobject` SET `chance` = 20 WHERE `description` = "Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein - Burning Steppes" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);
UPDATE `pool_gameobject` SET `chance` = 40 WHERE `description` = "Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein - Burning Steppes" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 165658);
UPDATE `pool_gameobject` SET `chance` = 40 WHERE `description` = "Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein - Burning Steppes" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 324);

-- Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Small Thorium Vein / Truesilver Deposit / Dark Iron Deposit - Burning Steppes" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);
UPDATE `pool_gameobject` SET `chance` = 60 WHERE `description` = "Small Thorium Vein / Truesilver Deposit / Dark Iron Deposit - Burning Steppes" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 165658);
UPDATE `pool_gameobject` SET `chance` = 30 WHERE `description` = "Small Thorium Vein / Truesilver Deposit / Dark Iron Deposit - Burning Steppes" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 175404);


-- Tanaris
-- Gold Vein / Mithril Deposit / Truesilver Deposit
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 80 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2040);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);

-- Silver Vein / Gold Vein / Iron Deposit
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Tanaris" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Tanaris" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 80 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Tanaris" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1735);


-- Un'Goro Crater
-- Gold Vein / Mithril Deposit / Truesilver Deposit
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Un\'Goro Crater" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 80 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Un\'Goro Crater" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2040);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Un\'Goro Crater" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);

-- Truesilver Deposit / Small Thorium Vein
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Truesilver Deposit / Small Thorium Vein - Un\'Goro Crater" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 324);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Truesilver Deposit / Small Thorium Vein - Un\'Goro Crater" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);

-- Truesilver Deposit / Rich Thorium Vein
UPDATE `pool_gameobject` SET `chance` = 20 WHERE `description` = "Truesilver Deposit / Rich Thorium Vein - Un\'Goro Crater" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);
UPDATE `pool_gameobject` SET `chance` = 80 WHERE `description` = "Truesilver Deposit / Rich Thorium Vein - Un\'Goro Crater" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 175404);

-- Ooze Covered Truesilver Deposit / Ooze Covered Thorium Vein
UPDATE `pool_gameobject` SET `chance` = 20 WHERE `description` = "Ooze Covered Truesilver Deposit / Ooze Covered Thorium Vein - Un\'Goro Crater" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 123309);
UPDATE `pool_gameobject` SET `chance` = 80 WHERE `description` = "Ooze Covered Truesilver Deposit / Ooze Covered Thorium Vein - Un\'Goro Crater" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 123848);


-- Silithus
-- Truesilver Deposit / Small Thorium Vein
UPDATE `pool_gameobject` SET `chance` = 80 WHERE `description` = "Truesilver Deposit / Small Thorium Vein - Silithus" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 324);
UPDATE `pool_gameobject` SET `chance` = 20 WHERE `description` = "Truesilver Deposit / Small Thorium Vein - Silithus" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);

-- Mithril Deposit / Truesilver Deposit
UPDATE `pool_gameobject` SET `chance` = 60 WHERE `description` = "Mithril Deposit / Truesilver Deposit - Silithus" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2040);
UPDATE `pool_gameobject` SET `chance` = 40 WHERE `description` = "Mithril Deposit / Truesilver Deposit - Silithus" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);

-- Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein - Silithus" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 123309);
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein - Silithus" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 177388);


-- Feralas
-- Gold Vein / Mithril Deposit
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Gold Vein / Mithril Deposit - Feralas" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Gold Vein / Mithril Deposit - Feralas" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2040);

-- Mithril Deposit / Truesilver Deposit
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Mithril Deposit / Truesilver Deposit - Feralas" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2040);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Mithril Deposit / Truesilver Deposit - Feralas" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);

-- Silver Vein / Gold Vein / Iron Deposit
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Feralas" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Feralas" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 80 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Feralas" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1735);

-- Truesilver Deposit / Small Thorium Vein
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Truesilver Deposit / Small Thorium Vein - Feralas" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 324);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Truesilver Deposit / Small Thorium Vein - Feralas" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);

-- Ooze Covered Gold Vein / Ooze Covered Mithril Deposit / Ooze Covered Truesilver Deposit
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Ooze Covered Gold Vein / Ooze Covered Mithril Deposit / Ooze Covered Truesilver Deposit - Feralas" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 123309);
UPDATE `pool_gameobject` SET `chance` = 80 WHERE `description` = "Ooze Covered Gold Vein / Ooze Covered Mithril Deposit / Ooze Covered Truesilver Deposit - Feralas" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 123310);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Ooze Covered Gold Vein / Ooze Covered Mithril Deposit / Ooze Covered Truesilver Deposit - Feralas" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 73941);


-- Thousand Needles
-- Tin Vein / Silver Vein
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Tin Vein / Silver Vein - Thousand Needles" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1732);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Tin Vein / Silver Vein - Thousand Needles" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);

-- Gold Vein / Iron Deposit
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Gold Vein / Iron Deposit - Thousand Needles" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Gold Vein / Iron Deposit - Thousand Needles" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1735);

-- Silver Vein / Gold Vein / Iron Deposit
UPDATE `pool_gameobject` SET `chance` = 20 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Thousand Needles" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Thousand Needles" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 70 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Thousand Needles" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1735);

-- Ooze Covered Silver Vein / Ooze Covered Gold Vein / Ooze Covered Mithril Deposit
UPDATE `pool_gameobject` SET `chance` = 80 WHERE `description` = "Ooze Covered Silver Vein / Ooze Covered Gold Vein / Ooze Covered Mithril Deposit Ooze Covered Silver Vein / Ooze Covered Gold Vein / Ooze Covered Mithril Deposit - Thousand Needles" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 123310);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Ooze Covered Silver Vein / Ooze Covered Gold Vein / Ooze Covered Mithril Deposit Ooze Covered Silver Vein / Ooze Covered Gold Vein / Ooze Covered Mithril Deposit - Thousand Needles" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 73940);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Ooze Covered Silver Vein / Ooze Covered Gold Vein / Ooze Covered Mithril Deposit Ooze Covered Silver Vein / Ooze Covered Gold Vein / Ooze Covered Mithril Deposit - Thousand Needles" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 73941);


-- Stonetalon Mountains
-- Tin Vein / Silver Vein
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Tin Vein / Silver Vein - Stonetalon Mountains" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1732);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Tin Vein / Silver Vein - Stonetalon Mountains" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);

-- Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 35 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1735);
UPDATE `pool_gameobject` SET `chance` = 35 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2040);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);


-- Ashenvale
-- Tin Vein / Silver Vein
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Tin Vein / Silver Vein - Ashenvale" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1732);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Tin Vein / Silver Vein - Ashenvale" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);

-- Silver Vein / Gold Vein / Iron Deposit
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Ashenvale" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Ashenvale" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 80 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Ashenvale" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1735);

-- Tin Vein / Silver Vein / Iron Deposit
UPDATE `pool_gameobject` SET `chance` = 45 WHERE `description` = "Tin Vein / Silver Vein / Iron Deposit - Ashenvale" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1732);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Tin Vein / Silver Vein / Iron Deposit - Ashenvale" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);
UPDATE `pool_gameobject` SET `chance` = 45 WHERE `description` = "Tin Vein / Silver Vein / Iron Deposit - Ashenvale" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1735);


-- Winterspring
-- Gold Vein / Mithril Deposit / Truesilver Deposit
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Winterspring" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 80 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Winterspring" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2040);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Winterspring" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);

-- Truesilver Deposit / Small Thorium Vein
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Truesilver Deposit / Small Thorium Vein - Winterspring" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 324);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Truesilver Deposit / Small Thorium Vein - Winterspring" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);

-- Truesilver Deposit / Rich Thorium Vein
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Truesilver Deposit / Rich Thorium Vein - Winterspring" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Truesilver Deposit / Rich Thorium Vein - Winterspring" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 175404);


-- Felwood
-- Gold Vein / Mithril Deposit / Truesilver Deposit
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Felwood" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 181109);
UPDATE `pool_gameobject` SET `chance` = 80 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Felwood" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 176645);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Felwood" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 181108);

-- Truesilver Deposit / Small Thorium Vein
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Truesilver Deposit / Small Thorium Vein - Felwood" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 181108);
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Truesilver Deposit / Small Thorium Vein - Felwood" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 176643);


-- Darkshore
-- Tin Vein / Silver Vein
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Tin Vein / Silver Vein - Darkshore" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1732);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Tin Vein / Silver Vein - Darkshore" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);


-- The Barrens
UPDATE `pool_gameobject` SET `description`= 'Tin Vein (3764) / Silver Vein - Barrens' WHERE  `guid` IN (34669, 34670, 34684, 34686, 34687, 34688, 34698, 34702, 34703, 34661, 34729, 34730);
UPDATE `pool_template` SET `description` = 'Tin Vein (3764) / Silver Vein - Barrens' WHERE `entry` IN (1920, 1860, 1861, 1875, 1877, 1878, 1879, 1889, 1893, 1894, 1921);

-- Tin Vein / Silver Vein
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Tin Vein / Silver Vein - Barrens" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1732);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Tin Vein / Silver Vein - Barrens" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);

-- Copper Vein (103713)/ Tin Vein (103711)/ Silver Vein (105569)
UPDATE `pool_gameobject` SET `chance` = 60 WHERE `description` = "Copper Vein / Tin Vein / Silver Vein - Barrens" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 103713);
UPDATE `pool_gameobject` SET `chance` = 30 WHERE `description` = "Copper Vein / Tin Vein / Silver Vein - Barrens" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 103711);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Copper Vein / Tin Vein / Silver Vein - Barrens" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 105569);

-- Tin Vein (3764) / Silver Vein
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Tin Vein (3764) / Silver Vein - Barrens" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 3764);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Tin Vein (3764) / Silver Vein - Barrens" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);


-- The Hinterlands
-- Gold Vein / Mithril Deposit / Truesilver Deposit
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 80 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2040);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);

-- Small Thorium Vein / Truesilver Deposit
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Truesilver Deposit / Small Thorium Vein - Hinterlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 324);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Truesilver Deposit / Small Thorium Vein - Hinterlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);

-- Silver Vein / Gold Vein / Iron Deposit
UPDATE `pool_gameobject` SET `chance` = 15 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Hinterlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);
UPDATE `pool_gameobject` SET `chance` = 15 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Hinterlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 70 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Hinterlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1735);


-- End of migration.
END IF;
END??
delimiter ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
