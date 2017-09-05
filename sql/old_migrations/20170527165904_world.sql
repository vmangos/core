INSERT INTO `migrations` VALUES ('20170527165904');

-- remove non-pet duplicates of Gelkis Earthcaller's pet Gelkis Rumbler (summoned with spell)'
DELETE FROM `creature` WHERE `guid`='27600';
DELETE FROM `creature` WHERE `guid`='27599';
DELETE FROM `creature` WHERE `guid`='27598';
DELETE FROM `creature` WHERE `guid`='27597';
DELETE FROM `creature` WHERE `guid`='27596';
DELETE FROM `creature` WHERE `guid`='27595';
DELETE FROM `creature` WHERE `guid`='27594';
DELETE FROM `creature` WHERE `guid`='27593';
DELETE FROM `creature` WHERE `guid`='27592';
DELETE FROM `creature` WHERE `guid`='27591';
DELETE FROM `creature` WHERE `guid`='27590';
DELETE FROM `creature` WHERE `guid`='27589';
DELETE FROM `creature` WHERE `guid`='27588';
DELETE FROM `creature` WHERE `guid`='27587';
