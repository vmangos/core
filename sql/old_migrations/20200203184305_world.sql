DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200203184305');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200203184305');
-- Add your query below.


-- Preparations for removal of currentwaypoint field.
UPDATE `creature` SET `position_x`=-6241.2, `position_y`=319.528, `position_z`=382.653 WHERE `guid`=334;
UPDATE `creature` SET `position_x`=3848.86, `position_y`=-113.652, `position_z`=3.57058 WHERE `guid`=32905;
UPDATE `creature` SET `position_x`=3850.151, `position_y`=-116.055, `position_z`=3.7 WHERE `guid`=32908;
UPDATE `creature` SET `position_x`=2844.85, `position_y`=-1200.43, `position_z`=178.398 WHERE `guid`=34503;
UPDATE `creature` SET `position_x`=2856.17, `position_y`=-926.562, `position_z`=199.263 WHERE `guid`=51882;
UPDATE `creature` SET `position_x`=3205.45, `position_y`=-3341.86, `position_z`=320.177 WHERE `guid`=88303;
DELETE FROM `creature_movement` WHERE `id`=302703;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES 
(302703, 1, -3814.83, -4441.11, 12.7771, 100, 0, 0, 0),
(302703, 2, -3815.15, -4427.66, 12.763, 100, 0, 0, 0),
(302703, 3, -3809.01, -4409.73, 12.669, 100, 0, 0, 0),
(302703, 4, -3802.21, -4400.65, 11.5244, 100, 0, 0, 0),
(302703, 5, -3794.93, -4395.24, 10.6712, 100, 0, 0, 0),
(302703, 6, -3781.06, -4391.76, 10.6061, 100, 0, 0, 0),
(302703, 7, -3769.9, -4388.29, 10.7627, 100, 0, 0, 0),
(302703, 8, -3764.39, -4386.69, 10.8774, 100, 0, 0, 0),
(302703, 9, -3746.19, -4376.68, 10.6401, 100, 0, 0, 0),
(302703, 10, -3735.81, -4371.1, 10.6122, 100, 0, 0, 0),
(302703, 11, -3723.93, -4364.82, 10.6106, 100, 0, 0, 0),
(302703, 12, -3720.11, -4363.64, 10.6105, 100, 0, 0, 0),
(302703, 13, -3715.5, -4362.44, 10.6105, 100, 0, 0, 0),
(302703, 14, -3704.25, -4365.37, 10.6189, 100, 0, 0, 0),
(302703, 15, -3694.47, -4372.87, 10.6123, 100, 0, 0, 0),
(302703, 16, -3686.47, -4378.63, 10.6547, 100, 0, 0, 0),
(302703, 17, -3681.36, -4383.64, 10.5456, 100, 0, 0, 0),
(302703, 18, -3674.37, -4391.72, 10.5979, 100, 0, 0, 0),
(302703, 19, -3671.98, -4396, 10.6167, 100, 0, 0, 0),
(302703, 20, -3670.13, -4405.68, 10.6124, 100, 0, 0, 0),
(302703, 21, -3669.59, -4422.79, 11.1054, 100, 0, 0, 0),
(302703, 22, -3669.83, -4434.42, 11.287, 100, 0, 0, 0),
(302703, 23, -3671.6, -4453.29, 11.3563, 100, 0, 0, 0),
(302703, 24, -3673.25, -4463.39, 11.2932, 100, 0, 0, 0),
(302703, 25, -3678.93, -4472.78, 11.4281, 100, 0, 0, 0),
(302703, 26, -3687.8, -4481.52, 11.7807, 100, 0, 0, 0),
(302703, 27, -3694.9, -4486.88, 11.9902, 100, 0, 0, 0),
(302703, 28, -3707.11, -4493.58, 12.3282, 100, 0, 0, 0),
(302703, 29, -3723.84, -4500.61, 12.6368, 100, 0, 0, 0),
(302703, 30, -3744.45, -4506.32, 12.7283, 100, 0, 0, 0),
(302703, 31, -3756.41, -4509.51, 12.5543, 100, 0, 0, 0),
(302703, 32, -3770.51, -4512.61, 12.1972, 100, 0, 0, 0),
(302703, 33, -3788.17, -4513.91, 11.6785, 100, 0, 0, 0),
(302703, 34, -3795.74, -4513.85, 11.5425, 100, 0, 0, 0),
(302703, 35, -3809.2, -4524.98, 9.30651, 100, 0, 0, 0),
(302703, 36, -3819.26, -4534.51, 9.21871, 100, 0, 0, 0),
(302703, 37, -3828.68, -4544.44, 9.21871, 100, 0, 0, 0),
(302703, 38, -3830.22, -4548.31, 9.16624, 100, 0, 0, 0),
(302703, 39, -3830.09, -4556.53, 8.94808, 100, 0, 0, 0),
(302703, 40, -3831.86, -4560.59, 8.7139, 100, 0, 0, 0),
(302703, 41, -3836.37, -4563.43, 8.55354, 100, 0, 0, 0),
(302703, 42, -3842.58, -4563.52, 8.40634, 100, 0, 0, 0),
(302703, 43, -3849.64, -4560.64, 8.34026, 100, 0, 0, 0),
(302703, 44, -3853.45, -4553.78, 8.43196, 100, 0, 0, 0),
(302703, 45, -3851.46, -4545.34, 8.71554, 100, 0, 0, 0),
(302703, 46, -3844.97, -4541.38, 9.13023, 100, 0, 0, 0),
(302703, 47, -3837.46, -4542.53, 9.21078, 100, 0, 0, 0),
(302703, 48, -3833.36, -4540.53, 9.21938, 100, 0, 0, 0),
(302703, 49, -3827.1, -4534.17, 9.21938, 100, 0, 0, 0),
(302703, 50, -3818.33, -4525.04, 9.21798, 100, 0, 0, 0),
(302703, 51, -3810.17, -4516.84, 10.1008, 100, 0, 0, 0),
(302703, 52, -3803.93, -4510.45, 11.3555, 100, 0, 0, 0),
(302703, 53, -3799.82, -4506.8, 11.5427, 100, 0, 0, 0),
(302703, 54, -3803.91, -4496.69, 11.5571, 100, 0, 0, 0),
(302703, 55, -3808.44, -4487.01, 12.1497, 100, 0, 0, 0),
(302703, 56, -3813.08, -4476.4, 12.6551, 100, 0, 0, 0),
(302703, 57, -3814.6, -4469.21, 12.7007, 100, 0, 0, 0),
(302703, 58, -3814.92, -4461.76, 12.6977, 100, 0, 0, 0),
(302703, 59, -3815.12, -4457.45, 12.6943, 100, 0, 0, 0);

-- Preparations for removal of DeathState field.
UPDATE `creature` SET `spawnFlags` = `spawnFlags` | 128 WHERE `DeathState` != 0;

-- Rename and remove some fields from spawn tables.
ALTER TABLE `creature`
	CHANGE COLUMN `spawndist` `wander_distance` FLOAT NOT NULL DEFAULT '5' AFTER `spawntimesecsmax`,
	CHANGE COLUMN `curhealth` `health_percent` FLOAT NOT NULL DEFAULT '100' AFTER `wander_distance`,
	CHANGE COLUMN `curmana` `mana_percent` FLOAT UNSIGNED NOT NULL DEFAULT '100' AFTER `health_percent`,
	CHANGE COLUMN `MovementType` `movement_type` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `mana_percent`,
	CHANGE COLUMN `spawnFlags` `spawn_flags` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `movement_type`,
	CHANGE COLUMN `visibilitymod` `visibility_mod` FLOAT NULL DEFAULT '0' AFTER `spawn_flags`,
	DROP COLUMN `currentwaypoint`,
	DROP COLUMN `DeathState`;

ALTER TABLE `gameobject`
	CHANGE COLUMN `spawnFlags` `spawn_flags` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `state`,
	CHANGE COLUMN `visibilitymod` `visibility_mod` FLOAT NULL DEFAULT '0' AFTER `spawn_flags`;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
