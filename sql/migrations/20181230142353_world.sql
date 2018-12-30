DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20181230142353');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20181230142353');
-- Add your query below.


-- Fix movement for some creatures
-- Fix position for some creatures
-- Add emotes for some creatures
UPDATE `creature` SET `spawndist` = 0, `MovementType` = 0 WHERE `guid` IN (14096, 14081, 14166, 14174, 14256);
UPDATE `creature` SET `spawndist` = 3, `MovementType` = 1 WHERE `guid` IN (13605, 13607);
UPDATE `creature` SET `spawndist` = 5, `MovementType` = 1 WHERE `guid` IN (13820, 15066, 14418, 19791, 13598, 13594, 13614, 13611, 13615, 13627, 13626, 13600);
UPDATE `creature` SET `spawndist` = 10, `MovementType` = 1 WHERE `guid` IN (51814, 51810, 14033);
UPDATE `creature` SET `spawndist` = 25, `MovementType` = 1 WHERE `guid` IN (51815, 51816, 15081);

UPDATE `creature` SET `position_x` = -912.213, `position_y` = -2217.01, `position_z` = 93.6255, `spawndist` = 10, `MovementType` = 1 WHERE `guid` = 20567;
UPDATE `creature` SET `position_x` = -107.326, `position_y` = -1851.97, `position_z` = 92.4291, `spawndist` = 8, `MovementType` = 1 WHERE `guid` = 19473;
UPDATE `creature` SET `position_x` = -53.9019, `position_y` = -1633.82, `position_z` = 91.6667, `orientation` = 4.1112 WHERE `guid` = 20635;
UPDATE `creature` SET `position_x` = -4062.05, `position_y` = -2173.13, `position_z` = 51.4807, `orientation` = 0.690689 WHERE `guid` = 13610;

UPDATE `creature_addon` SET `emote` = 173 WHERE `guid` IN (13610, 13583, 13617);
UPDATE `creature_addon` SET `bytes1` = 3 WHERE `guid` IN (14200, 14253, 14195, 14215);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
