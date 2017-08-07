INSERT INTO `migrations` VALUES ('20170707183148');

-- remove "Treant Ally" duplicate spawns as they are spell summoned pets of Sons of Cenarius
DELETE FROM `creature` WHERE `guid`='29980';
DELETE FROM `creature` WHERE `guid`='29979';
DELETE FROM `creature` WHERE `guid`='29978';
DELETE FROM `creature` WHERE `guid`='29977';
DELETE FROM `creature` WHERE `guid`='29976';
DELETE FROM `creature` WHERE `guid`='29975';
DELETE FROM `creature` WHERE `guid`='29974';

