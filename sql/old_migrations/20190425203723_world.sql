DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190425203723');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190425203723');
-- Add your query below.


-- Stormwind
-- Stormwind Royal Guards in Stormwind Keep updated to vanilla locations
UPDATE `creature` SET `position_x` = -8444.23, `position_y` = 346.977, `position_z` = 121.169, `orientation` = 4.99164 WHERE `guid` = 10516;
UPDATE `creature` SET `position_x` = -8431.5, `position_y` = 345.53, `position_z` = 121.169, `orientation` = 4.18879 WHERE `guid` = 10518;
UPDATE `creature` SET `position_x` = -8423.43, `position_y` = 335.506, `position_z` = 121.169, `orientation` = 3.40339 WHERE `guid` = 51984;
UPDATE `creature` SET `position_x` = -8424.72, `position_y` = 322.64, `position_z` = 121.169, `orientation` = 2.61799 WHERE `guid` = 10519;
UPDATE `creature` SET `position_x` = -8434.85, `position_y` = 314.422, `position_z` = 121.169, `orientation` = 1.85005 WHERE `guid` = 10517;
UPDATE `creature` SET `position_x` = -8447.89, `position_y` = 315.885, `position_z` = 121.169, `orientation` = 1.0821 WHERE `guid` = 10515;
UPDATE `creature` SET `position_x` = -8456, `position_y` = 326.151, `position_z` = 121.169, `orientation` = 0.296706 WHERE `guid` = 10513;
UPDATE `creature` SET `position_x` = -8454.35, `position_y` = 339.019, `position_z` = 121.169, `orientation` = 5.79449 WHERE `guid` = 10514;
-- Update Stormwind Royal Guard position to sniff
UPDATE `creature` SET `position_x` = -8531.29, `position_y` = 438.994, `position_z` = 105.311, `orientation` = 0.680678 WHERE `guid` = 10508;
-- Update High Sorcerer Andromath position to sniff
UPDATE `creature` SET `position_x` = -9010.78, `position_y` = 876.575, `position_z` = 148.802, `orientation` = 4.86947 WHERE `id` = 5694;

-- Ashenvale
-- Update Sentinel Melyria Frostshadow to vanilla location
DELETE FROM `creature_movement` WHERE `id` = 32344;
UPDATE `creature` SET `MovementType` = 0 WHERE `id` = 3880;
UPDATE `creature` SET `position_x` = 2636.49, `position_y` = 417.815, `position_z` = 74.1523, `orientation` = 5.58505 WHERE `id` = 3880;
-- Update Illiyana to vanilla location
UPDATE `creature` SET `position_x` = 2622.503906, `position_y` = 446.767914, `position_z` = 73.698997, `orientation` = 2.775074 WHERE `id` = 3901;

-- Random
-- Update Fiora Longears position to sniff
UPDATE `creature` SET `position_x` = -3613.47, `position_y` = -4464.02, `position_z` = 13.7054, `orientation` = 2.61799 WHERE `id` = 4456;
-- Move Aelthalyste to vanilla location
UPDATE `creature` SET `position_x` = 1760.67, `position_y` = 403.122, `position_z` = -57.1312, `orientation` = 3.9619 WHERE `id` = 4606;
-- Update Nazgrel position to sniff
UPDATE `creature` SET `position_x` = 1939.05, `position_y` = -4133.25, `position_z` = 40.9998, `orientation` = 4.04916 WHERE `id` = 3230;
-- Update Vincent Hyal position to sniff
UPDATE `creature` SET `position_x` = -3812.639404, `position_y` = -837.369995, `position_z` = 9.737679, `orientation` = 2.443461 WHERE `id` = 5082;
-- Update Anachronos position to sniff
UPDATE `creature` SET `position_x` = -8176.576660, `position_y` = -4722.568848, `position_z` = 28.078407, `orientation` = 1.759070 WHERE `id` = 15192;

-- Delete Campfires from Tarren Mill, 2xx
DELETE FROM `gameobject` WHERE `guid` = 17759;
DELETE FROM `gameobject` WHERE `guid` = 17634;

-- Innkeeper Shay should have random movement
-- Delia Verana should have random movement
-- Mallen Swain should have random movement
-- High Executor Darthalia should have random movement
-- Deathguard Samsa should have random movement
-- Derak Nightfall should have random movement
-- Vinna Wayne should have random movement
-- https://youtu.be/D9O903Wnmb4?t=1h41m35s
-- https://youtu.be/D9O903Wnmb4?t=11m6s
UPDATE `creature` SET `MovementType`=1, `spawndist`=1 WHERE `guid`=15287;
UPDATE `creature` SET `MovementType`=1, `spawndist`=1 WHERE `guid`=15302;
UPDATE `creature` SET `MovementType`=1, `spawndist`=3 WHERE `guid`=15520;
UPDATE `creature` SET `MovementType`=1, `spawndist`=3 WHERE `guid`=15542;
UPDATE `creature` SET `MovementType`=1, `spawndist`=3 WHERE `guid`=15532;
UPDATE `creature` SET `MovementType`=1, `spawndist`=3 WHERE `guid`=15288;
UPDATE `creature` SET `MovementType`=1, `spawndist`=3 WHERE `guid`=15289;
DELETE FROM `creature_movement` WHERE `id`=15289;

-- Horde Warbringer
-- Arathi Highlands
INSERT INTO `creature` VALUES (86991, 15350, 0, 0, 15350, -832.362, -3512.62, 72.3318, 4.55531, 25, 25, 0, 0, 100, 0, 0, 0, 0, 0, 6, 10);
-- Alterac Mountains
INSERT INTO `creature` VALUES (86992, 15350, 0, 0, 15350, 382.498, -983.076, 109.979, 2.82743, 25, 25, 0, 0, 100, 0, 0, 0, 0, 0, 6, 10);
-- Barrens
INSERT INTO `creature` VALUES (86993, 15350, 1, 0, 15350, 1026.33, -2110.51, 123.1, 5.49779, 25, 25, 0, 0, 100, 0, 0, 0, 0, 0, 6, 10);
-- Undercity
-- Horde Warbringer, spawned based on pics
UPDATE `creature` SET `position_x` = 1251.3, `position_y` = 314.174, `position_z` = -63.689, `orientation` = 0.208065 WHERE `guid` = 32075;
-- Orgrimmar
UPDATE `creature` SET `position_x` = 1988.5, `position_y` = -4812.28, `position_z` = 56.8494, `orientation` = 1.5708 WHERE `guid` = 6505;

-- Alliance Brigadier General
-- Refuge Pointe, updated to sniff
UPDATE `creature` SET `position_x` = -1231.22, `position_y` = -2510.21, `position_z` = 23.1758, `orientation` = 4.36332 WHERE `guid` = 151180;
-- Alterac Mountains
INSERT INTO `creature` VALUES (86994, 15351, 0, 0, 0, -36.7805, -316.826, 130.69, 4.7822, 25, 25, 0, 0, 100, 0, 0, 0, 0, 0, 6, 10);
-- Ashenvale
INSERT INTO `creature` VALUES (86995, 15351, 1, 0, 0, 1450.77, -1872.06, 126.998, 0.436332, 25, 25, 0, 0, 100, 0, 0, 0, 0, 0, 6, 10);
-- Stormwind
UPDATE `creature` SET `position_x` = -8441.82, `position_y` = 311.616, `position_z` = 120.886, `orientation` = 1.45789 WHERE `guid` = 14740;
-- Ironforge, moved to sniff location
UPDATE `creature` SET `position_x` = -5042.52, `position_y` = -1265.13, `position_z` = 510.325, `orientation` = 4.6373 WHERE `guid` = 86263;

-- Battlemasters
-- Thunderbluff
-- Arathi Basin
UPDATE `creature` SET `position_x` = -995.143, `position_y` = 217.173, `position_z` = 104.729, `orientation` = 4.46804 WHERE `id` = 12198;

-- Stormwind
-- Warsong Gulch
UPDATE `creature` SET `position_x` = -8454.6, `position_y` = 318.918, `position_z` = 120.886, `orientation` = 0.65759 WHERE `id` = 14981;
-- Alterac Valley
UPDATE `creature` SET `position_x` = -8424.55, `position_y` = 342.807, `position_z` = 120.886, `orientation` = 3.80942 WHERE `id` = 7410;
-- Arathi basin
UPDATE `creature` SET `position_x` = -8420.48, `position_y` = 328.711, `position_z` = 120.886, `orientation` = 3.06638 WHERE `id` = 15008;

-- Darnassus
-- Alterac Valley
UPDATE `creature` SET `position_x` = 9923.77, `position_y` = 2323.84, `position_z` = 1330.87, `orientation` = 1.6057 WHERE `id` = 5118;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
