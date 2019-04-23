DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20181206124915');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20181206124915');
-- Add your query below.


-- Vultros
UPDATE `creature` SET `spawndist` = 20, `MovementType` = 1 WHERE `guid` = 28407 AND `id` = 462;
DELETE FROM `creature` WHERE `guid` IN (99118, 99119, 99120, 99121, 99122, 99123, 99124, 99125, 99126, 99127, 99128, 99129, 99130, 99131, 99132) AND `id` = 462;
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(99118, 462, 0, 507, 0, -10812.2, 1594.89, 40.5767, 3.77027, 108000, 108000, 20, 0, 920, 0, 0, 1),
(99119, 462, 0, 507, 0, -10858.9, 1729.85, 34.0217, 5.03084, 108000, 108000, 20, 0, 920, 0, 0, 1),
(99120, 462, 0, 507, 0, -10746.1, 1402.35, 31.2243, 5.6843, 108000, 108000, 20, 0, 920, 0, 0, 1),
(99121, 462, 0, 507, 0, -10801.9, 1418.7, 33.4624, 1.94188, 108000, 108000, 20, 0, 920, 0, 0, 1),
(99122, 462, 0, 507, 0, -10477.4, 1471.47, 48.6513, 5.2162, 108000, 108000, 20, 0, 920, 0, 0, 1),
(99123, 462, 0, 507, 0, -10425.4, 1426.25, 44.2233, 2.22619, 108000, 108000, 20, 0, 920, 0, 0, 1),
(99124, 462, 0, 507, 0, -10431.2, 1378.46, 65.494, 0.722943, 108000, 108000, 20, 0, 920, 0, 0, 1),
(99125, 462, 0, 507, 0, -9955.56, 1228.82, 42.7644, 3.27077, 108000, 108000, 20, 0, 920, 0, 0, 1),
(99126, 462, 0, 507, 0, -9941.29, 1098.53, 35.6962, 2.56156, 108000, 108000, 20, 0, 920, 0, 0, 1),
(99127, 462, 0, 507, 0, -10730.7, 802.78, 37.7118, 3.13019, 108000, 108000, 20, 0, 920, 0, 0, 1),
(99128, 462, 0, 507, 0, -10757.4, 779.167, 35.7259, 4.05696, 108000, 108000, 20, 0, 920, 0, 0, 1),
(99129, 462, 0, 507, 0, -10770.2, 723.453, 37.2173, 1.87277, 108000, 108000, 20, 0, 920, 0, 0, 1),
(99130, 462, 0, 507, 0, -11161.7, 845.012, 39.2314, 0.226577, 108000, 108000, 20, 0, 920, 0, 0, 1),
(99131, 462, 0, 507, 0, -11124.4, 863.032, 40.5566, 0.620062, 108000, 108000, 20, 0, 920, 0, 0, 1),
(99132, 462, 0, 507, 0, -11131.2, 826.004, 35.7787, 5.17773, 108000, 108000, 20, 0, 920, 0, 0, 1);
DELETE FROM `pool_template` WHERE `entry` = 462;
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES
(462, 1, "Vultros (462)");
DELETE FROM `pool_creature_template` WHERE `id` = 462;
INSERT INTO `pool_creature_template` (`id`, `pool_entry`, `chance`, `description`) VALUES
(462, 462, 0, "Vultros (462)");


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
