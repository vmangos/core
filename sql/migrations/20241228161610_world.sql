DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20241228161610');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20241228161610');
-- Add your query below.


-- Banner
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(8058, 180776, 0, 1608.54, 227.274, -46.2984, 5.48033, 0, 0, -0.390731, 0.920505, 120, 120, 100, 1, 7, 10), -- Undercity
(8059, 180776, 0, 1582.5, 227.39, -45.8039, 4.01426, 0, 0, -0.906307, 0.422619, 120, 120, 100, 1, 7, 10), -- Undercity
(8060, 180776, 0, 1608.55, 253.162, -46.6006, 0.715585, 0, 0, 0.350207, 0.936672, 120, 120, 100, 1, 7, 10), -- Undercity
(8061, 180776, 0, 1582.64, 253.478, -45.6257, 2.40855, 0, 0, 0.93358, 0.358368, 120, 120, 100, 1, 7, 10), -- Undercity
(8064, 180776, 1, 1382.96, -4355.71, 38.0235, 3.28124, 0, 0, -0.997563, 0.0697661, 120, 120, 100, 1, 7, 10), -- Orgrimmar
(8065, 180776, 1, 1676.75, -4363.53, 46.238, 3.57793, 0, 0, -0.976295, 0.216442, 120, 120, 100, 1, 7, 10), -- Orgrimmar
(8066, 180776, 1, 1733.14, -4408.25, 48.4424, 2.18166, 0, 0, 0.887011, 0.461749, 120, 120, 100, 1, 7, 10), -- Orgrimmar
(8067, 180776, 1, 1386.3, -4382.36, 38.4741, 3.26377, 0, 0, -0.998135, 0.0610518, 120, 120, 100, 1, 7, 10), -- Orgrimmar
(8068, 180776, 1, -1235.89, -90.114, 165.731, 0.488691, 0, 0, 0.241921, 0.970296, 120, 120, 100, 1, 7, 10), -- Thunder Bluff
(8069, 180776, 1, -1420.32, -111.116, 173.95, 5.67232, 0, 0, -0.300705, 0.953717, 120, 120, 100, 1, 7, 10), -- Thunder Bluff
(8072, 180776, 1, -1124.17, 64.2812, 146.743, 4.4855, 0, 0, -0.782608, 0.622515, 120, 120, 100, 1, 7, 10), -- Thunder Bluff
(8073, 180776, 1, -1181.29, -91.9861, 165.958, 2.53072, 0, 0, 0.953716, 0.300708, 120, 120, 100, 1, 7, 10), -- Thunder Bluff
(8074, 180776, 1, -1276.95, 50.0955, 132.456, 0.506145, 0, 0, 0.25038, 0.968148, 120, 120, 100, 1, 7, 10), -- Thunder Bluff
(8075, 180776, 1, -1206.35, 133.66, 138.144, 3.82227, 0, 0, -0.942641, 0.333808, 120, 120, 100, 1, 7, 10); -- Thunder Bluff
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES 
(4825, 1, 'Luner Festival Banner', 0, 13, 7, 10),
(4826, 1, 'Luner Festival Banner', 0, 13, 7, 10),
(4827, 1, 'Luner Festival Banner', 0, 13, 7, 10),
(4828, 1, 'Luner Festival Banner', 0, 13, 7, 10),
(4829, 1, 'Luner Festival Banner', 0, 13, 7, 10),
(4830, 1, 'Luner Festival Banner', 0, 13, 7, 10),
(4831, 1, 'Luner Festival Banner', 0, 12, 7, 10),
(4832, 1, 'Luner Festival Banner', 0, 12, 7, 10),
(4833, 1, 'Luner Festival Banner', 0, 1, 7, 10),
(4834, 1, 'Luner Festival Banner', 0, 1, 7, 10),
(4835, 1, 'Luner Festival Banner', 0, 1, 7, 10),
(4836, 1, 'Luner Festival Banner', 0, 1, 7, 10),
(4837, 1, 'Luner Festival Banner', 0, 16, 7, 10),
(4838, 1, 'Luner Festival Banner', 0, 16, 7, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES 
(65203, 4825, 0, 'Lunar Festival Banner - Yellow', 0, 7, 10),
(8069, 4825, 0, 'Lunar Festival Banner - White', 0, 7, 10),
(65204, 4826, 0, 'Lunar Festival Banner - Yellow', 0, 7, 10),
(8074, 4826, 0, 'Lunar Festival Banner - White', 0, 7, 10),
(65205, 4827, 0, 'Lunar Festival Banner - Yellow', 0, 7, 10),
(8068, 4827, 0, 'Lunar Festival Banner - White', 0, 7, 10),
(65206, 4828, 0, 'Lunar Festival Banner - Yellow', 0, 7, 10),
(8075, 4828, 0, 'Lunar Festival Banner - White', 0, 7, 10),
(65207, 4829, 0, 'Lunar Festival Banner - Yellow', 0, 7, 10),
(8073, 4829, 0, 'Lunar Festival Banner - White', 0, 7, 10),
(65208, 4830, 0, 'Lunar Festival Banner - Yellow', 0, 7, 10),
(8072, 4830, 0, 'Lunar Festival Banner - White', 0, 7, 10),
(65209, 4831, 0, 'Lunar Festival Banner - Yellow', 0, 7, 10),
(8064, 4831, 0, 'Lunar Festival Banner - White', 0, 7, 10),
(65210, 4832, 0, 'Lunar Festival Banner - Yellow', 0, 7, 10),
(8067, 4832, 0, 'Lunar Festival Banner - White', 0, 7, 10),
(65199, 4833, 0, 'Lunar Festival Banner - Yellow', 0, 7, 10),
(8059, 4833, 0, 'Lunar Festival Banner - White', 0, 7, 10),
(65200, 4834, 0, 'Lunar Festival Banner - Yellow', 0, 7, 10),
(8061, 4834, 0, 'Lunar Festival Banner - White', 0, 7, 10),
(65201, 4835, 0, 'Lunar Festival Banner - Yellow', 0, 7, 10),
(8058, 4835, 0, 'Lunar Festival Banner - White', 0, 7, 10),
(65202, 4836, 0, 'Lunar Festival Banner - Yellow', 0, 7, 10),
(8060, 4836, 0, 'Lunar Festival Banner - White', 0, 7, 10),
(65211, 4837, 0, 'Lunar Festival Banner - Yellow', 0, 7, 10),
(8065, 4837, 0, 'Lunar Festival Banner - White', 0, 7, 10),
(65212, 4838, 0, 'Lunar Festival Banner - Yellow', 0, 7, 10),
(8066, 4838, 0, 'Lunar Festival Banner - White', 0, 7, 10);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES 
(8058, 7),
(8059, 7),
(8060, 7),
(8061, 7),
(8064, 7),
(8065, 7),
(8066, 7),
(8067, 7),
(8068, 7),
(8069, 7),
(8072, 7),
(8073, 7),
(8074, 7),
(8075, 7);

-- AQWar - Resource, Bars, Alliance, Tier 1
-- Event 22: AQ War Effort (NPC & GO 'Initial')
UPDATE `gameobject` SET `position_x`=-4913.73, `position_y`=-1225.95, `position_z`=501.651, `orientation`=2.26893, `rotation0`=0, `rotation1`=0, `rotation2`=0.906307, `rotation3`=0.422619 WHERE `guid`=220101;

-- AQWar - Resource, Bars, Alliance, Tier 2
-- Event 22: AQ War Effort (NPC & GO 'Initial')
UPDATE `gameobject` SET `position_x`=-4913.74, `position_y`=-1225.93, `position_z`=501.651, `orientation`=2.26893, `rotation0`=0, `rotation1`=0, `rotation2`=0.906307, `rotation3`=0.422619 WHERE `guid`=220102;

-- AQWar - Resource, Bars, Alliance, Tier 3
-- Event 22: AQ War Effort (NPC & GO 'Initial')
UPDATE `gameobject` SET `position_x`=-4913.72, `position_y`=-1225.92, `position_z`=501.651, `orientation`=2.26893, `rotation0`=0, `rotation1`=0, `rotation2`=0.906307, `rotation3`=0.422619 WHERE `guid`=220103;

-- AQWar - Resource, Bars, Alliance, Tier 4
-- Event 22: AQ War Effort (NPC & GO 'Initial')
UPDATE `gameobject` SET `position_x`=-4913.71, `position_y`=-1225.91, `position_z`=501.651, `orientation`=2.26893, `rotation0`=0, `rotation1`=0, `rotation2`=0.906307, `rotation3`=0.422619 WHERE `guid`=220104;

-- AQWar - Resource, Bars, Alliance, Tier 5
-- Event 22: AQ War Effort (NPC & GO 'Initial')
UPDATE `gameobject` SET `position_x`=-4913.78, `position_y`=-1225.86, `position_z`=501.651, `orientation`=2.28638, `rotation0`=0, `rotation1`=0, `rotation2`=0.909961, `rotation3`=0.414694 WHERE `guid`=220105;

-- Festive Gift
-- Event 21: Feast of Winter Veil: Gifts
UPDATE `gameobject` SET `position_x`=-4917.09, `position_y`=-981.593, `position_z`=501.838, `orientation`=2.40855, `rotation0`=0, `rotation1`=0, `rotation2`=0.93358, `rotation3`=0.358368 WHERE `guid`=151765;
UPDATE `gameobject` SET `position_x`=1627.26, `position_y`=-4414.72, `position_z`=15.8731, `orientation`=4.90438, `rotation0`=0, `rotation1`=0, `rotation2`=-0.636078, `rotation3`=0.771625 WHERE `guid`=151766;

-- AQWar - Resource, Cooking, Alliance, Tier 1
-- Event 22: AQ War Effort (NPC & GO 'Initial')
UPDATE `gameobject` SET `position_x`=-4937.28, `position_y`=-1282.87, `position_z`=501.672, `orientation`=2.25147, `rotation0`=0, `rotation1`=0, `rotation2`=0.902585, `rotation3`=0.430512 WHERE `guid`=220111;

-- AQWar - Resource, Herbs, Alliance, Tier 1
-- Event 22: AQ War Effort (NPC & GO 'Initial')
UPDATE `gameobject` SET `position_x`=-4935.58, `position_y`=-1284.82, `position_z`=501.671, `orientation`=2.25147, `rotation0`=0, `rotation1`=0, `rotation2`=0.902585, `rotation3`=0.430512 WHERE `guid`=220121;

-- AQWar - Resource, Herbs, Alliance, Tier 2
-- Event 22: AQ War Effort (NPC & GO 'Initial')
UPDATE `gameobject` SET `position_x`=-4935.6, `position_y`=-1284.84, `position_z`=501.671, `orientation`=2.25147, `rotation0`=0, `rotation1`=0, `rotation2`=0.902585, `rotation3`=0.430512 WHERE `guid`=220122;

-- AQWar - Resource, Herbs, Alliance, Tier 3
-- Event 22: AQ War Effort (NPC & GO 'Initial')
UPDATE `gameobject` SET `position_x`=-4935.59, `position_y`=-1284.83, `position_z`=501.671, `orientation`=2.25147, `rotation0`=0, `rotation1`=0, `rotation2`=0.902585, `rotation3`=0.430512 WHERE `guid`=220123;

-- AQWar - Resource, Herbs, Alliance, Tier 4
-- Event 22: AQ War Effort (NPC & GO 'Initial')
UPDATE `gameobject` SET `position_x`=-4935.62, `position_y`=-1284.83, `position_z`=501.671, `orientation`=2.25147, `rotation0`=0, `rotation1`=0, `rotation2`=0.902585, `rotation3`=0.430512 WHERE `guid`=220124;

-- AQWar - Resource, Herbs, Alliance, Tier 5
-- Event 22: AQ War Effort (NPC & GO 'Initial')
UPDATE `gameobject` SET `position_x`=-4935.56, `position_y`=-1284.89, `position_z`=501.671, `orientation`=2.23402, `rotation0`=0, `rotation1`=0, `rotation2`=0.898793, `rotation3`=0.438373 WHERE `guid`=220125;

-- AQWar - Resource, Cooking, Alliance, Tier 2
-- Event 22: AQ War Effort (NPC & GO 'Initial')
UPDATE `gameobject` SET `position_x`=-4937.14, `position_y`=-1282.9, `position_z`=501.672, `orientation`=2.26893, `rotation0`=0, `rotation1`=0, `rotation2`=0.906307, `rotation3`=0.422619 WHERE `guid`=220112;

-- AQWar - Resource, Cooking, Alliance, Tier 3
-- Event 22: AQ War Effort (NPC & GO 'Initial')
UPDATE `gameobject` SET `position_x`=-4937.29, `position_y`=-1282.87, `position_z`=501.672, `orientation`=2.25147, `rotation0`=0, `rotation1`=0, `rotation2`=0.902585, `rotation3`=0.430512 WHERE `guid`=220113;

-- AQWar - Resource, Skins, Horde, Initial
-- Event 22: AQ War Effort (NPC & GO 'Initial')
UPDATE `gameobject` SET `position_x`=1590.82, `position_y`=-4155.33, `position_z`=36.2926, `orientation`=3.7001, `rotation0`=0, `rotation1`=0, `rotation2`=-0.961261, `rotation3`=0.27564 WHERE `guid`=220040;

-- AQWar - Resource, Skins, Horde, Tier 1
-- Event 22: AQ War Effort (NPC & GO 'Initial')
UPDATE `gameobject` SET `position_x`=1590.88, `position_y`=-4155.33, `position_z`=36.298, `orientation`=3.68265, `rotation0`=0, `rotation1`=0, `rotation2`=-0.96363, `rotation3`=0.267241 WHERE `guid`=220041;

-- AQWar - Resource, Skins, Horde, Tier 2
-- Event 22: AQ War Effort (NPC & GO 'Initial')
UPDATE `gameobject` SET `position_x`=1590.85, `position_y`=-4155.34, `position_z`=36.2996, `orientation`=3.7001, `rotation0`=0, `rotation1`=0, `rotation2`=-0.961261, `rotation3`=0.27564 WHERE `guid`=220042;

-- AQWar - Resource, Skins, Horde, Tier 3
-- Event 22: AQ War Effort (NPC & GO 'Initial')
UPDATE `gameobject` SET `position_x`=1590.85, `position_y`=-4155.34, `position_z`=36.2992, `orientation`=3.7001, `rotation0`=0, `rotation1`=0, `rotation2`=-0.961261, `rotation3`=0.27564 WHERE `guid`=220043;

-- AQWar - Resource, Skins, Horde, Tier 4
-- Event 22: AQ War Effort (NPC & GO 'Initial')
UPDATE `gameobject` SET `position_x`=1590.85, `position_y`=-4155.34, `position_z`=36.2995, `orientation`=3.7001, `rotation0`=0, `rotation1`=0, `rotation2`=-0.961261, `rotation3`=0.27564 WHERE `guid`=220044;

-- AQWar - Resource, Skins, Horde, Tier 5
-- Event 22: AQ War Effort (NPC & GO 'Initial')
UPDATE `gameobject` SET `position_x`=1590.85, `position_y`=-4155.34, `position_z`=36.2999, `orientation`=3.7001, `rotation0`=0, `rotation1`=0, `rotation2`=-0.961261, `rotation3`=0.27564 WHERE `guid`=220045;

-- AQWar - Resource, Herbs, Horde, Initial
-- Event 22: AQ War Effort (NPC & GO 'Initial')
UPDATE `gameobject` SET `position_x`=1637.11, `position_y`=-4147.21, `position_z`=36.0414, `orientation`=3.73501, `rotation0`=0, `rotation1`=0, `rotation2`=-0.956305, `rotation3`=0.292372 WHERE `guid`=220020;

-- AQWar - Resource, Herbs, Horde, Tier 1
-- Event 22: AQ War Effort (NPC & GO 'Initial')
UPDATE `gameobject` SET `position_x`=1637.1, `position_y`=-4147.25, `position_z`=36.0531, `orientation`=3.73501, `rotation0`=0, `rotation1`=0, `rotation2`=-0.956305, `rotation3`=0.292372 WHERE `guid`=220021;

-- AQWar - Resource, Herbs, Horde, Tier 2
-- Event 22: AQ War Effort (NPC & GO 'Initial')
UPDATE `gameobject` SET `position_x`=1637.11, `position_y`=-4147.25, `position_z`=36.0536, `orientation`=3.73501, `rotation0`=0, `rotation1`=0, `rotation2`=-0.956305, `rotation3`=0.292372 WHERE `guid`=220022;

-- AQWar - Resource, Herbs, Horde, Tier 3
-- Event 22: AQ War Effort (NPC & GO 'Initial')
UPDATE `gameobject` SET `position_x`=1637.11, `position_y`=-4147.26, `position_z`=36.0547, `orientation`=3.75246, `rotation0`=0, `rotation1`=0, `rotation2`=-0.953716, `rotation3`=0.300708 WHERE `guid`=220023;

-- AQWar - Resource, Herbs, Horde, Tier 4
-- Event 22: AQ War Effort (NPC & GO 'Initial')
UPDATE `gameobject` SET `position_x`=1637.08, `position_y`=-4147.23, `position_z`=36.0448, `orientation`=3.71755, `rotation0`=0, `rotation1`=0, `rotation2`=-0.958819, `rotation3`=0.284016 WHERE `guid`=220024;

-- AQWar - Resource, Herbs, Horde, Tier 5
-- Event 22: AQ War Effort (NPC & GO 'Initial')
UPDATE `gameobject` SET `position_x`=1637.1, `position_y`=-4147.23, `position_z`=36.0451, `orientation`=3.71755, `rotation0`=0, `rotation1`=0, `rotation2`=-0.958819, `rotation3`=0.284016 WHERE `guid`=220025;

-- AQWar - Resource, Bandages, Horde, Initial
-- Event 22: AQ War Effort (NPC & GO 'Initial')
UPDATE `gameobject` SET `position_x`=1579.35, `position_y`=-4109.25, `position_z`=34.5417, `orientation`=3.75246, `rotation0`=0, `rotation1`=0, `rotation2`=-0.953716, `rotation3`=0.300708 WHERE `guid`=220000;

-- AQWar - Resource, Bandages, Horde, Tier 1
-- Event 22: AQ War Effort (NPC & GO 'Initial')
UPDATE `gameobject` SET `position_x`=1579.33, `position_y`=-4109.25, `position_z`=34.5487, `orientation`=3.71755, `rotation0`=0, `rotation1`=0, `rotation2`=-0.958819, `rotation3`=0.284016 WHERE `guid`=220001;

-- AQWar - Resource, Bandages, Horde, Tier 2
-- Event 22: AQ War Effort (NPC & GO 'Initial')
UPDATE `gameobject` SET `position_x`=1579.32, `position_y`=-4109.28, `position_z`=34.5515, `orientation`=3.73501, `rotation0`=0, `rotation1`=0, `rotation2`=-0.956305, `rotation3`=0.292372 WHERE `guid`=220002;

-- AQWar - Resource, Bandages, Horde, Tier 3
-- Event 22: AQ War Effort (NPC & GO 'Initial')
UPDATE `gameobject` SET `position_x`=1579.33, `position_y`=-4109.28, `position_z`=34.547, `orientation`=3.73501, `rotation0`=0, `rotation1`=0, `rotation2`=-0.956305, `rotation3`=0.292372 WHERE `guid`=220003;

-- AQWar - Resource, Bandages, Horde, Tier 4
-- Event 22: AQ War Effort (NPC & GO 'Initial')
UPDATE `gameobject` SET `position_x`=1579.33, `position_y`=-4109.28, `position_z`=34.5475, `orientation`=3.73501, `rotation0`=0, `rotation1`=0, `rotation2`=-0.956305, `rotation3`=0.292372 WHERE `guid`=220004;

-- AQWar - Resource, Bandages, Horde, Tier 5
-- Event 22: AQ War Effort (NPC & GO 'Initial')
UPDATE `gameobject` SET `position_x`=1579.33, `position_y`=-4109.28, `position_z`=34.5478, `orientation`=3.73501, `rotation0`=0, `rotation1`=0, `rotation2`=-0.956305, `rotation3`=0.292372 WHERE `guid`=220005;

-- AQWar - Resource, Cooking, Horde, Initial
-- Event 22: AQ War Effort (NPC & GO 'Initial')
UPDATE `gameobject` SET `position_x`=1619.83, `position_y`=-4092.43, `position_z`=34.5107, `orientation`=3.7001, `rotation0`=0, `rotation1`=0, `rotation2`=-0.961261, `rotation3`=0.27564 WHERE `guid`=220010;

-- AQWar - Resource, Cooking, Horde, Tier 1
-- Event 22: AQ War Effort (NPC & GO 'Initial')
UPDATE `gameobject` SET `position_x`=1619.8, `position_y`=-4092.53, `position_z`=34.4888, `orientation`=3.7001, `rotation0`=0, `rotation1`=0, `rotation2`=-0.961261, `rotation3`=0.27564 WHERE `guid`=220011;

-- AQWar - Resource, Cooking, Horde, Tier 2
-- Event 22: AQ War Effort (NPC & GO 'Initial')
UPDATE `gameobject` SET `position_x`=1619.8, `position_y`=-4092.53, `position_z`=34.4892, `orientation`=3.7001, `rotation0`=0, `rotation1`=0, `rotation2`=-0.961261, `rotation3`=0.27564 WHERE `guid`=220012;

-- AQWar - Resource, Cooking, Horde, Tier 3
-- Event 22: AQ War Effort (NPC & GO 'Initial')
UPDATE `gameobject` SET `position_x`=1619.81, `position_y`=-4092.53, `position_z`=34.4901, `orientation`=3.7001, `rotation0`=0, `rotation1`=0, `rotation2`=-0.961261, `rotation3`=0.27564 WHERE `guid`=220013;

-- AQWar - Resource, Cooking, Horde, Tier 4
-- Event 22: AQ War Effort (NPC & GO 'Initial')
UPDATE `gameobject` SET `position_x`=1619.81, `position_y`=-4092.53, `position_z`=34.4894, `orientation`=3.7001, `rotation0`=0, `rotation1`=0, `rotation2`=-0.961261, `rotation3`=0.27564 WHERE `guid`=220014;

-- AQWar - Resource, Cooking, Horde, Tier 5
-- Event 22: AQ War Effort (NPC & GO 'Initial')
UPDATE `gameobject` SET `position_x`=1619.81, `position_y`=-4092.52, `position_z`=34.4912, `orientation`=3.7001, `rotation0`=0, `rotation1`=0, `rotation2`=-0.961261, `rotation3`=0.27564 WHERE `guid`=220015;

-- AQWar - Resource, Bars, Horde, Initial
-- Event 22: AQ War Effort (NPC & GO 'Initial')
UPDATE `gameobject` SET `position_x`=1683.11, `position_y`=-4134.35, `position_z`=39.5419, `orientation`=3.71755, `rotation0`=0, `rotation1`=0, `rotation2`=-0.958819, `rotation3`=0.284016 WHERE `guid`=220030;

-- AQWar - Resource, Bars, Horde, Tier 1
-- Event 22: AQ War Effort (NPC & GO 'Initial')
UPDATE `gameobject` SET `position_x`=1683.1, `position_y`=-4134.31, `position_z`=39.539, `orientation`=3.73501, `rotation0`=0, `rotation1`=0, `rotation2`=-0.956305, `rotation3`=0.292372 WHERE `guid`=220031;

-- AQWar - Resource, Bars, Horde, Tier 2
-- Event 22: AQ War Effort (NPC & GO 'Initial')
UPDATE `gameobject` SET `position_x`=1683.1, `position_y`=-4134.3, `position_z`=39.5387, `orientation`=3.73501, `rotation0`=0, `rotation1`=0, `rotation2`=-0.956305, `rotation3`=0.292372 WHERE `guid`=220032;

-- AQWar - Resource, Bars, Horde, Tier 3
-- Event 22: AQ War Effort (NPC & GO 'Initial')
UPDATE `gameobject` SET `position_x`=1683.11, `position_y`=-4134.31, `position_z`=39.5403, `orientation`=3.73501, `rotation0`=0, `rotation1`=0, `rotation2`=-0.956305, `rotation3`=0.292372 WHERE `guid`=220033;

-- AQWar - Resource, Bars, Horde, Tier 4
-- Event 22: AQ War Effort (NPC & GO 'Initial')
UPDATE `gameobject` SET `position_x`=1683.03, `position_y`=-4134.31, `position_z`=39.528, `orientation`=3.71755, `rotation0`=0, `rotation1`=0, `rotation2`=-0.958819, `rotation3`=0.284016 WHERE `guid`=220034;

-- AQWar - Resource, Bars, Horde, Tier 5
-- Event 22: AQ War Effort (NPC & GO 'Initial')
UPDATE `gameobject` SET `position_x`=1683.14, `position_y`=-4134.34, `position_z`=39.5466, `orientation`=3.75246, `rotation0`=0, `rotation1`=0, `rotation2`=-0.953716, `rotation3`=0.300708 WHERE `guid`=220035;

-- War Map
-- Event 54: AQ War Troop Silithus (NPC & GO) DAY 1
UPDATE `gameobject` SET `position_x`=-6779.12, `position_y`=815.042, `position_z`=55.747, `orientation`=0, `rotation0`=0, `rotation1`=0, `rotation2`=0, `rotation3`=1 WHERE `guid`=220200;

-- Duke's Box
-- Event 54: AQ War Troop Silithus (NPC & GO) DAY 1
UPDATE `gameobject` SET `position_x`=-6782.3, `position_y`=812.623, `position_z`=55.7469, `orientation`=0.698131, `rotation0`=0, `rotation1`=0, `rotation2`=0.34202, `rotation3`=0.939693 WHERE `guid`=220207;

-- Firework Launcher
-- Event 7: Lunar Festival
UPDATE `gameobject` SET `position_x`=10152.6, `position_y`=2607.9, `position_z`=1330.83, `orientation`=4.32842, `rotation0`=0, `rotation1`=0, `rotation2`=-0.829037, `rotation3`=0.559194 WHERE `guid`=65331;

-- Festive Mug
-- Event 38: Chinese New Year
UPDATE `gameobject` SET `position_x`=-14412.9, `position_y`=424.427, `position_z`=9.90461, `orientation`=1.88495, `rotation0`=0, `rotation1`=0, `rotation2`=0.809016, `rotation3`=0.587786 WHERE `guid`=375057;
UPDATE `gameobject` SET `position_x`=-14347.1, `position_y`=439.873, `position_z`=8.53721, `orientation`=3.6652, `rotation0`=0, `rotation1`=0, `rotation2`=-0.965925, `rotation3`=0.258821 WHERE `guid`=379588;

-- Arena Spoils
UPDATE `gameobject` SET `position_x`=595.293, `position_y`=-188.853, `position_z`=-54.1381, `orientation`=0.191985, `rotation0`=0, `rotation1`=0, `rotation2`=0.0958452, `rotation3`=0.995396 WHERE `guid`=399068;

-- Grand Widow Faerlina Door
UPDATE `gameobject` SET `id`=181167 WHERE `id`=194022;
UPDATE `gameobject_template` SET `flags`=34 WHERE `entry`=181167;

-- Undead Fire
-- Event 90: Scourge Invasion - Attacking Winterspring
-- Event 91: Scourge Invasion - Attacking Tanaris
-- Event 92: Scourge Invasion - Attacking Azshara
-- Event 93: Scourge Invasion - Attacking Blasted Lands
-- Event 94: Scourge Invasion - Attacking Eastern Plaguelands
-- Event 95: Scourge Invasion - Attacking Burning Steppes
UPDATE `gameobject` SET `position_x`=-11539.1, `position_y`=-3284.73, `position_z`=8.61913, `orientation`=3.87463, `rotation0`=0, `rotation1`=0, `rotation2`=-0.93358, `rotation3`=0.358368 WHERE `guid`=67986;

-- Undead Fire Aura
-- Event 90: Scourge Invasion - Attacking Winterspring
-- Event 91: Scourge Invasion - Attacking Tanaris
-- Event 92: Scourge Invasion - Attacking Azshara
-- Event 93: Scourge Invasion - Attacking Blasted Lands
-- Event 94: Scourge Invasion - Attacking Eastern Plaguelands
-- Event 95: Scourge Invasion - Attacking Burning Steppes
UPDATE `gameobject` SET `position_x`=-11539.1, `position_y`=-3284.73, `position_z`=8.61913, `orientation`=3.87463, `rotation0`=0, `rotation1`=0, `rotation2`=-0.93358, `rotation3`=0.358368 WHERE `guid`=68016;

-- Heigan the Unclean - Exit Door
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(13336, 181203, 533, 2771.5, -3737.34, 273.596, 4.71239, 0, 0, -0.707107, 0.707107, 180, 180, 100, 0, 9, 10); -- Naxxramas

-- Standing, Large
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(13504, 181300, 0, 1595.84, 240.163, -52.1429, 0.890117, 0, 0, 0.430511, 0.902586, 180, 180, 100, 1, 9, 10), -- Undercity
(13505, 181300, 0, -8884.23, 566.347, 92.8298, 0.715585, 0, 0, 0.350207, 0.936672, 180, 180, 100, 1, 9, 10), -- Stormwind City
(13506, 181300, 0, -8893.99, 578.844, 92.8094, 0.680677, 0, 0, 0.333806, 0.942642, 180, 180, 100, 1, 9, 10), -- Stormwind City
(13507, 181300, 0, -8973.18, 490.654, 97.0779, 2.19911, 0, 0, 0.891006, 0.453991, 180, 180, 100, 1, 9, 10), -- Stormwind City
(13508, 181300, 0, -8987.69, 509.24, 97.0765, 5.39307, 0, 0, -0.430511, 0.902586, 180, 180, 100, 1, 9, 10), -- Stormwind City
(13509, 181300, 0, -9018.08, 485.234, 97.1197, 5.42797, 0, 0, -0.414693, 0.909961, 180, 180, 100, 1, 9, 10), -- Stormwind City
(13510, 181300, 0, -9003.58, 466.834, 97.1185, 2.1293, 0, 0, 0.874619, 0.48481, 180, 180, 100, 1, 9, 10), -- Stormwind City
(13528, 181300, 0, -9066.78, 452.947, 93.2955, 5.51524, 0, 0, -0.374606, 0.927184, 180, 180, 100, 1, 9, 10), -- Stormwind City
(13539, 181300, 0, -9046.63, 428.583, 93.2955, 2.30383, 0, 0, 0.913545, 0.406738, 180, 180, 100, 1, 9, 10), -- Stormwind City
(13545, 181300, 0, -9060.67, 417.703, 93.2955, 2.28638, 0, 0, 0.909961, 0.414694, 180, 180, 100, 1, 9, 10), -- Stormwind City
(13553, 181300, 0, -9079.23, 442.914, 93.2955, 5.37562, 0, 0, -0.438371, 0.898794, 180, 180, 100, 1, 9, 10), -- Stormwind City
(13554, 181300, 0, -9106.58, 422.097, 93.7786, 3.78737, 0, 0, -0.948323, 0.317306, 180, 180, 100, 1, 9, 10), -- Stormwind City
(13555, 181300, 0, -9085.16, 396.496, 93.5758, 3.82227, 0, 0, -0.942641, 0.333808, 180, 180, 100, 1, 9, 10); -- Stormwind City
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES
(13504, 1),
(13505, 1),
(13506, 1),
(13507, 1),
(13508, 1),
(13509, 1),
(13510, 1),
(13528, 1),
(13539, 1),
(13545, 1),
(13553, 1),
(13554, 1),
(13555, 1);

-- Camp Table
-- Event 1: Midsummer Fire Festival
UPDATE `gameobject` SET `position_x`=-11279.4, `position_y`=-3054.08, `position_z`=-0.157278, `orientation`=5.96903, `rotation0`=0, `rotation1`=0, `rotation2`=-0.156434, `rotation3`=0.987688 WHERE `guid`=36099;

-- Floating, medium
-- Event 1: Midsummer Fire Festival
UPDATE `gameobject` SET `position_x`=10043.9, `position_y`=2380.27, `position_z`=1313.66, `orientation`=4.32842, `rotation0`=0, `rotation1`=0, `rotation2`=-0.829037, `rotation3`=0.559194 WHERE `guid`=36265;

-- Kel'Thuzad Trigger
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(13558, 181444, 533, 3716.13, -5106.58, 128.42, 4.7822, 0, 0, -0.681998, 0.731354, 180, 180, 100, 1, 0, 10); -- Naxxramas

-- Doodad_kelthuzad_throne02
UPDATE `gameobject` SET `position_x`=3764.48, `position_y`=-5116.53, `position_z`=146.207, `orientation`=2.94088, `rotation0`=0, `rotation1`=0, `rotation2`=0.994968, `rotation3`=0.100189 WHERE `guid`=533128;

-- Plague Fissure
UPDATE `gameobject` SET `position_x`=2803.05, `position_y`=-3676.46, `position_z`=273.84, `orientation`=0, `rotation0`=0, `rotation1`=0, `rotation2`=0, `rotation3`=1 WHERE `guid`=533177;

-- Plague Fissure
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(13562, 181695, 533, 2759.12, -3705.27, 273.667, 0, 0, 0, 0, 1, 180, 180, 100, 1, 9, 10); -- Naxxramas
UPDATE `gameobject` SET `position_x`=2786.7, `position_y`=-3733, `position_z`=273.631, `orientation`=0, `rotation0`=0, `rotation1`=0, `rotation2`=0, `rotation3`=1 WHERE `guid`=533189;

-- Dust Bag
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES 
-- Alliance Camp
(9496, 181962, 1, -7144.21, 1402.09, 4.55081, 6.10865, 0, 0, -0.0871553, 0.996195, 180, 180, 100, 1, 2, 0, 10, 10),
(9497, 181962, 1, -7142.41, 1402.99, 4.79462, 6.03884, 0, 0, -0.121869, 0.992546, 180, 180, 100, 1, 2, 0, 10, 10),
(9498, 181962, 1, -7140.45, 1401.68, 4.85929, 5.98648, 0, 0, -0.147809, 0.989016, 180, 180, 100, 1, 2, 0, 10, 10),
(9499, 181962, 1, -7142.03, 1403.94, 4.91669, 1.02974, 0, 0, 0.492423, 0.870356, 180, 180, 100, 1, 2, 0, 10, 10),
(9500, 181962, 1, -7143.07, 1403.95, 4.82184, 1.81514, 0, 0, 0.788011, 0.615662, 180, 180, 100, 1, 2, 0, 10, 10),
(9501, 181962, 1, -7145.65, 1401.86, 4.39894, 2.23402, 0, 0, 0.898793, 0.438373, 180, 180, 100, 1, 2, 0, 10, 10),
(9502, 181962, 1, -7144.95, 1402.46, 4.51687, 1.36136, 0, 0, 0.62932, 0.777146, 180, 180, 100, 1, 2, 0, 10, 10),
(9503, 181962, 1, -7144.9, 1401.41, 4.42734, 4.4855, 0, 0, -0.782608, 0.622515, 180, 180, 100, 1, 2, 0, 10, 10),
(9504, 181962, 1, -7147.84, 1405.12, 4.44306, 0.506145, 0, 0, 0.25038, 0.968148, 180, 180, 100, 1, 2, 0, 10, 10),
(9507, 181962, 1, -7148.8, 1405.12, 4.35205, 1.98967, 0, 0, 0.83867, 0.54464, 180, 180, 100, 1, 2, 0, 10, 10),
(9508, 181962, 1, -7148.12, 1403.96, 4.36007, 5.55015, 0, 0, -0.358368, 0.93358, 180, 180, 100, 1, 2, 0, 10, 10),
-- Horde Camp
(13566, 181962, 1, -7596.26, 756.602, -16.7828, 2.51327, 0, 0, 0.951056, 0.309017, 180, 180, 100, 1, 2, 0, 10, 10),
(13567, 181962, 1, -7595.53, 756.927, -16.7378, 1.15192, 0, 0, 0.544639, 0.838671, 180, 180, 100, 1, 2, 0, 10, 10),
(13568, 181962, 1, -7595.12, 756.091, -16.7162, 5.28835, 0, 0, -0.477159, 0.878817, 180, 180, 100, 1, 2, 0, 10, 10),
(13582, 181962, 1, -7596.3, 754.496, -16.8031, 0.59341, 0, 0, 0.292371, 0.956305, 180, 180, 100, 1, 2, 0, 10, 10),
(13583, 181962, 1, -7598.29, 756.553, -16.8921, 0.383971, 0, 0, 0.190808, 0.981627, 180, 180, 100, 1, 2, 0, 10, 10),
(13584, 181962, 1, -7594.49, 753.237, -16.7275, 2.26893, 0, 0, 0.906307, 0.422619, 180, 180, 100, 1, 2, 0, 10, 10),
(13585, 181962, 1, -7598.62, 755.709, -16.9598, 1.98967, 0, 0, 0.83867, 0.54464, 180, 180, 100, 1, 2, 0, 10, 10),
(13587, 181962, 1, -7597.09, 754.64, -16.8684, 4.04917, 0, 0, -0.898793, 0.438373, 180, 180, 100, 1, 2, 0, 10, 10),
(13588, 181962, 1, -7596.59, 755.269, -16.8084, 1.20428, 0, 0, 0.566406, 0.824126, 180, 180, 100, 1, 2, 0, 10, 10),
(13589, 181962, 1, -7594.29, 752.393, -16.7654, 1.46608, 0, 0, 0.66913, 0.743145, 180, 180, 100, 1, 2, 0, 10, 10),
(13590, 181962, 1, -7599.11, 757.084, -16.9406, 4.69494, 0, 0, -0.71325, 0.70091, 180, 180, 100, 1, 2, 0, 10, 10),
(13591, 181962, 1, -7598.36, 757.403, -16.8868, 2.18166, 0, 0, 0.887011, 0.461749, 180, 180, 100, 1, 2, 0, 10, 10);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
