DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20191101232753');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20191101232753');
-- Add your query below.


-- Add patrolling Theramore Guards.
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (2530569, 4979, 0, 0, 0, 1, 0, 0, -3815.12, -4457.45, 12.6943, 1.51038, 360, 360, 0, 0, 100, 0, 0, 2, 0, 0, 0, 10);
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (2530570, 4979, 0, 0, 0, 1, 0, 0, -3812.29, -4457.69, 12.7017, 1.51038, 360, 360, 0, 0, 100, 0, 0, 0, 0, 0, 0, 10);
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (2530571, 4979, 0, 0, 0, 1, 0, 0, -3811.48, -4441.44, 12.7737, 1.56143, 360, 360, 0, 0, 100, 0, 0, 0, 0, 0, 0, 10);
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (2530572, 4979, 0, 0, 0, 1, 0, 0, -3815.16, -4441.36, 12.7486, 1.57321, 360, 360, 0, 1, 100, 0, 0, 2, 0, 0, 0, 10);
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES (2530569, 2530570, 3.5, 4.50248, 3);
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES (2530569, 2530569, 0, 4.50248, 3);
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES (2530572, 2530571, 3.5, 4.50248, 3);
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES (2530572, 2530572, 0, 4.50248, 3);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `wander_distance`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES 
(2530569, 1, -3815.12, -4457.45, 12.6943, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530569, 2, -3814.83, -4441.11, 12.7771, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530569, 3, -3815.15, -4427.66, 12.763, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530569, 4, -3809.01, -4409.73, 12.669, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530569, 5, -3802.21, -4400.65, 11.5244, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530569, 6, -3794.93, -4395.24, 10.6712, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530569, 7, -3781.06, -4391.76, 10.6061, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530569, 8, -3769.9, -4388.29, 10.7627, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530569, 9, -3764.39, -4386.69, 10.8774, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530569, 10, -3746.19, -4376.68, 10.6401, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530569, 11, -3735.81, -4371.1, 10.6122, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530569, 12, -3723.93, -4364.82, 10.6106, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530569, 13, -3720.11, -4363.64, 10.6105, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530569, 14, -3715.5, -4362.44, 10.6105, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530569, 15, -3704.25, -4365.37, 10.6189, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530569, 16, -3694.47, -4372.87, 10.6123, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530569, 17, -3686.47, -4378.63, 10.6547, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530569, 18, -3681.36, -4383.64, 10.5456, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530569, 19, -3674.37, -4391.72, 10.5979, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530569, 20, -3671.98, -4396, 10.6167, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530569, 21, -3670.13, -4405.68, 10.6124, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530569, 22, -3669.59, -4422.79, 11.1054, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530569, 23, -3669.83, -4434.42, 11.287, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530569, 24, -3671.6, -4453.29, 11.3563, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530569, 25, -3673.25, -4463.39, 11.2932, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530569, 26, -3678.93, -4472.78, 11.4281, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530569, 27, -3687.8, -4481.52, 11.7807, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530569, 28, -3694.9, -4486.88, 11.9902, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530569, 29, -3707.11, -4493.58, 12.3282, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530569, 30, -3723.84, -4500.61, 12.6368, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530569, 31, -3744.45, -4506.32, 12.7283, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530569, 32, -3756.41, -4509.51, 12.5543, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530569, 33, -3770.51, -4512.61, 12.1972, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530569, 34, -3788.17, -4513.91, 11.6785, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530569, 35, -3795.74, -4513.85, 11.5425, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530569, 36, -3809.2, -4524.98, 9.30651, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530569, 37, -3819.26, -4534.51, 9.21871, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530569, 38, -3828.68, -4544.44, 9.21871, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530569, 39, -3830.22, -4548.31, 9.16624, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530569, 40, -3830.09, -4556.53, 8.94808, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530569, 41, -3831.86, -4560.59, 8.7139, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530569, 42, -3836.37, -4563.43, 8.55354, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530569, 43, -3842.58, -4563.52, 8.40634, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530569, 44, -3849.64, -4560.64, 8.34026, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530569, 45, -3853.45, -4553.78, 8.43196, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530569, 46, -3851.46, -4545.34, 8.71554, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530569, 47, -3844.97, -4541.38, 9.13023, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530569, 48, -3837.46, -4542.53, 9.21078, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530569, 49, -3833.36, -4540.53, 9.21938, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530569, 50, -3827.1, -4534.17, 9.21938, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530569, 51, -3818.33, -4525.04, 9.21798, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530569, 52, -3810.17, -4516.84, 10.1008, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530569, 53, -3803.93, -4510.45, 11.3555, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530569, 54, -3799.82, -4506.8, 11.5427, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530569, 55, -3803.91, -4496.69, 11.5571, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530569, 56, -3808.44, -4487.01, 12.1497, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530569, 57, -3813.08, -4476.4, 12.6551, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530569, 58, -3814.6, -4469.21, 12.7007, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530569, 59, -3814.92, -4461.76, 12.6977, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `wander_distance`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES 
(2530572, 1, -3815.12, -4457.45, 12.6943, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530572, 2, -3814.83, -4441.11, 12.7771, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530572, 3, -3815.15, -4427.66, 12.763, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530572, 4, -3809.01, -4409.73, 12.669, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530572, 5, -3802.21, -4400.65, 11.5244, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530572, 6, -3794.93, -4395.24, 10.6712, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530572, 7, -3781.06, -4391.76, 10.6061, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530572, 8, -3769.9, -4388.29, 10.7627, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530572, 9, -3764.39, -4386.69, 10.8774, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530572, 10, -3746.19, -4376.68, 10.6401, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530572, 11, -3735.81, -4371.1, 10.6122, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530572, 12, -3723.93, -4364.82, 10.6106, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530572, 13, -3720.11, -4363.64, 10.6105, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530572, 14, -3715.5, -4362.44, 10.6105, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530572, 15, -3704.25, -4365.37, 10.6189, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530572, 16, -3694.47, -4372.87, 10.6123, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530572, 17, -3686.47, -4378.63, 10.6547, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530572, 18, -3681.36, -4383.64, 10.5456, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530572, 19, -3674.37, -4391.72, 10.5979, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530572, 20, -3671.98, -4396, 10.6167, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530572, 21, -3670.13, -4405.68, 10.6124, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530572, 22, -3669.59, -4422.79, 11.1054, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530572, 23, -3669.83, -4434.42, 11.287, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530572, 24, -3671.6, -4453.29, 11.3563, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530572, 25, -3673.25, -4463.39, 11.2932, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530572, 26, -3678.93, -4472.78, 11.4281, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530572, 27, -3687.8, -4481.52, 11.7807, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530572, 28, -3694.9, -4486.88, 11.9902, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530572, 29, -3707.11, -4493.58, 12.3282, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530572, 30, -3723.84, -4500.61, 12.6368, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530572, 31, -3744.45, -4506.32, 12.7283, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530572, 32, -3756.41, -4509.51, 12.5543, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530572, 33, -3770.51, -4512.61, 12.1972, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530572, 34, -3788.17, -4513.91, 11.6785, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530572, 35, -3795.74, -4513.85, 11.5425, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530572, 36, -3809.2, -4524.98, 9.30651, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530572, 37, -3819.26, -4534.51, 9.21871, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530572, 38, -3828.68, -4544.44, 9.21871, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530572, 39, -3830.22, -4548.31, 9.16624, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530572, 40, -3830.09, -4556.53, 8.94808, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530572, 41, -3831.86, -4560.59, 8.7139, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530572, 42, -3836.37, -4563.43, 8.55354, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530572, 43, -3842.58, -4563.52, 8.40634, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530572, 44, -3849.64, -4560.64, 8.34026, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530572, 45, -3853.45, -4553.78, 8.43196, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530572, 46, -3851.46, -4545.34, 8.71554, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530572, 47, -3844.97, -4541.38, 9.13023, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530572, 48, -3837.46, -4542.53, 9.21078, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530572, 49, -3833.36, -4540.53, 9.21938, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530572, 50, -3827.1, -4534.17, 9.21938, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530572, 51, -3818.33, -4525.04, 9.21798, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530572, 52, -3810.17, -4516.84, 10.1008, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530572, 53, -3803.93, -4510.45, 11.3555, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530572, 54, -3799.82, -4506.8, 11.5427, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530572, 55, -3803.91, -4496.69, 11.5571, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530572, 56, -3808.44, -4487.01, 12.1497, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530572, 57, -3813.08, -4476.4, 12.6551, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530572, 58, -3814.6, -4469.21, 12.7007, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2530572, 59, -3814.92, -4461.76, 12.6977, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0);

-- Events list for Theramore Combat Dummy
DELETE FROM `creature_ai_events` WHERE `creature_id`=4952;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (495201, 4952, 0, 11, 0, 100, 0, 0, 0, 0, 0, 495201, 0, 0, 'Theramore Combat Dummy - Set Unkillable on Respawn');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (495202, 4952, 0, 30, 0, 100, 0, 0, 0, 0, 0, 495201, 0, 0, 'Theramore Combat Dummy - Set Unkillable on Leave Combat');
DELETE FROM `creature_ai_scripts` WHERE `id`=495201;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (495201, 0, 52, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Theramore Combat Dummy - Set Unkillable');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=4952;

-- Events list for Theramore Practicing Guard
DELETE FROM `creature_ai_events` WHERE `creature_id`=4951;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (495101, 4951, 0, 2, 0, 100, 0, 15, 0, 0, 0, 495101, 0, 0, 'Theramore Practicing Guard - Flee at 15% HP');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (495102, 4951, 6567, 1, 4, 100, 1, 1000, 1000, 1000, 1000, 495102, 0, 0, 'Theramore Practicing Guard - Attack Combat Dummy on OOC');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (495103, 4951, 0, 0, 1, 100, 0, 120000, 120000, 0, 0, 495103, 0, 0, 'Theramore Practicing Guard - Stop Attacking after 2 minutes');
DELETE FROM `creature_ai_scripts` WHERE `id`=495102;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (495102, 0, 26, 0, 0, 0, 0, 4952, 5, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Theramore Practicing Guard - Attack Combat Dummy');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (495102, 0, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Theramore Practicing Guard - Set Phase to 1');
DELETE FROM `creature_ai_scripts` WHERE `id`=495103;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (495103, 0, 39, 495103, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Theramore Practicing Guard - Start Script');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (495103, 0, 44, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Theramore Practicing Guard - Set Phase to 2');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (495103, 0, 73, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Theramore Practicing Guard - Combat Stop');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (495103, 0, 73, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Theramore Combat Dummy - Combat Stop');
DELETE FROM `event_scripts` WHERE `id`=495103;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (495103, 2, 28, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Theramore Practicing Guard - Sit Down');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (495103, 30, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Theramore Practicing Guard - Stand Up');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (495103, 32, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Theramore Practicing Guard - Set Phase to 0');
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (6567, 20, 4952, 5, 0, 0, 2);
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=4951;

-- Waypoints for Guard Lasiter.
DELETE FROM `creature_movement` WHERE `id`=30458;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `wander_distance`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES 
(30458, 1, -3772.62, -4533.36, 11.5873, 12000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5.25, 0, 0),
(30458, 2, -3772.62, -4533.36, 11.5873, 2000, 0, 0, 1790, 1791, 1792, 0, 0, 0, 0, 5.25, 0, 0),
(30458, 3, -3770.08, -4531.74, 11.5426, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30458, 4, -3770.08, -4531.74, 11.5426, 18000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5.25, 0, 0),
(30458, 5, -3770.08, -4531.74, 11.5426, 2000, 0, 0, 1789, 1791, 1792, 0, 0, 0, 0, 5.25, 0, 0),
(30458, 6, -3772.62, -4533.36, 11.5873, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0);

-- Spot should do random movement.
UPDATE `creature` SET `spawndist`=1, `MovementType`=1 WHERE `guid`=30652;

-- Waypoints for Privateer Groy.
UPDATE `creature` SET `MovementType`=2 WHERE `guid`=7896;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `wander_distance`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES 
(2616, 1, -3896.16, -4588.84, 9.22015, 480000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3.89208, 0, 0),
(2616, 2, -3896.16, -4588.84, 9.22015, 0, 0, 261602, 0, 0, 0, 0, 0, 0, 0, 3.89208, 0, 0),
(2616, 3, -3877.52, -4581.24, 9.15066, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2616, 4, -3867.44, -4574.61, 8.24416, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2616, 5, -3861.71, -4569.2, 7.88555, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2616, 6, -3854.78, -4555.84, 8.35153, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2616, 7, -3850.18, -4546.64, 8.7103, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2616, 8, -3843.44, -4530.2, 9.65426, 630000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4.6, 0, 0),
(2616, 9, -3843.44, -4530.2, 9.65426, 0, 0, 261609, 0, 0, 0, 0, 0, 0, 0, 4.6, 0, 0),
(2616, 10, -3850.18, -4546.64, 8.7103, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2616, 11, -3854.78, -4555.84, 8.35153, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2616, 12, -3861.71, -4569.2, 7.88555, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2616, 13, -3867.44, -4574.61, 8.24416, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2616, 14, -3877.52, -4581.24, 9.15066, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0);
DELETE FROM `creature_movement_scripts` WHERE `id`=261602;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (261602, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 737, 738, 739, 0, 0, 0, 0, 0, 0, 'Privateer Groy - Yell Text');
DELETE FROM `creature_movement_scripts` WHERE `id`=261609;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (261609, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 737, 738, 739, 0, 0, 0, 0, 0, 0, 'Privateer Groy - Yell Text');

-- These Theramore Guards should have random movement.
UPDATE `creature` SET `spawndist`=8, `MovementType`=1 WHERE `guid`=30525;
UPDATE `creature` SET `position_x`=-3864.39, `position_y`=-4570.106, `position_z`=7.81, `spawndist`=5, `MovementType`=1 WHERE `guid`=30656;
UPDATE `creature` SET `position_x`=-3832.713, `position_y`=-4569.31, `position_z`=8.64, `spawndist`=5, `MovementType`=1 WHERE `guid`=30487;
UPDATE `creature` SET `position_x`=-3683.09, `position_y`=-4391.55, `position_z`=10.6123, `orientation`=0.666157 WHERE `guid`=150018;

-- Wrong spawns.
DELETE FROM `creature` WHERE `guid` IN (30637, 8486, 30522, 30638, 8487, 25147, 30644, 30643, 30639);
DELETE FROM `creature_addon` WHERE `guid` IN (30637, 8486, 30522, 30638, 8487, 25147, 30644, 30643, 30639);
DELETE FROM `creature_movement` WHERE `id` IN (30637, 8486, 30522, 30638, 8487, 25147, 30644, 30643, 30639);

-- Gossip menu for Decedra Willham.
UPDATE `creature_template` SET `gossip_menu_id`=4357 WHERE `entry`=12716;
INSERT INTO `gossip_menu` VALUES (4357, 5579, 0);

-- Gossip menu for Baldruc.
UPDATE `creature_template` SET `gossip_menu_id`=6944, `npc_flags`=9 WHERE `entry`=4321;

-- Add missing Theramore Lieutenant.
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (2530574, 4947, 0, 0, 0, 1, 0, 4947, -3819.47, -4502.38, 11.4069, 0.049492, 25, 25, 0, 0, 100, 0, 0, 0, 0, 0, 0, 10);

-- Gossip menu for Timothy Worthington.
UPDATE `creature_template` SET `gossip_menu_id`=4355 WHERE `entry`=11052;
INSERT INTO `gossip_menu` VALUES (4355, 5571, 0);

-- Correct coordinates for Chicken.
UPDATE `creature` SET `position_x`=-3821.785, `position_y`=-4386.38, `position_z`=11.5, `spawndist`=12, `MovementType`=1 WHERE `guid`=33908;
UPDATE `creature` SET `position_x`=-3788.65, `position_y`=-4343.15, `position_z`=13, `spawndist`=10, `MovementType`=1 WHERE `guid`=30886;

-- Delete wrong items from Uma Bartulm.
DELETE FROM `npc_vendor` WHERE `entry`=4899 && `item`=1710;
DELETE FROM `npc_vendor` WHERE `entry`=4899 && `item`=3827;
DELETE FROM `npc_vendor` WHERE `entry`=4899 && `item`=6217;

-- Gossip menu for Alchemist Narett.
UPDATE `creature_template` SET `gossip_menu_id`=4122 WHERE `entry`=4900;
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (4454, 7, 171, 150, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (4122, 5049, 0);
INSERT INTO `gossip_menu` VALUES (4122, 5050, 4454);

-- Brant Jasperbloom should not have the gossip flag.
UPDATE `creature_template` SET `npc_flags`=18 WHERE `entry`=4898;

-- Correct waypoints for Theramore Guards at entrance.
DELETE FROM `creature_movement` WHERE `id`=30634;
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES (30633, 30634, 2.2, 1.57, 3);
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES (30633, 30633, 0, 1.57, 3);
UPDATE `creature` SET `position_x`=-3632.6, `position_y`=-4349.78, `position_z`=6.23993, `orientation`=0.710781, `spawndist`=0, `MovementType`=0 WHERE `guid`=30634;
DELETE FROM `creature_movement` WHERE `id`=30633;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `wander_distance`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES 
(30633, 1, -3629.74, -4350.74, 6.07444, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30633, 2, -3625.27, -4346.66, 7.41274, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30633, 3, -3615.14, -4338.04, 9.09229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30633, 4, -3605.1, -4329.83, 9.35807, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30633, 5, -3597.76, -4323.73, 8.23622, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30633, 6, -3590.05, -4317.35, 6.50544, 500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30633, 7, -3597.66, -4323.66, 8.21746, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30633, 8, -3607, -4331.22, 9.39326, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30633, 9, -3618.46, -4340.77, 8.66189, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30633, 10, -3630.57, -4350.6, 6.02683, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30633, 11, -3641.08, -4358.23, 8.23087, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30633, 12, -3649.69, -4365.45, 9.30783, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30633, 13, -3661.37, -4374.82, 9.3562, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30633, 14, -3669.16, -4380.84, 9.52321, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30633, 15, -3672.77, -4383.54, 9.93784, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30633, 16, -3676.67, -4385.52, 10.367, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30633, 17, -3684.88, -4389.08, 10.613, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30633, 18, -3691.28, -4391.12, 11.5975, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30633, 19, -3697.47, -4392.11, 13.7802, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30633, 20, -3701.65, -4392.21, 15.3721, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30633, 21, -3706.59, -4393.27, 17.1351, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30633, 22, -3710.8, -4396.69, 18.8129, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30633, 23, -3713.35, -4400.5, 20.547, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30633, 24, -3715.88, -4405.43, 22.5667, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30633, 25, -3718.29, -4409.51, 24.0483, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30633, 26, -3720.23, -4411.67, 24.9374, 500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30633, 27, -3718.29, -4409.51, 24.0483, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30633, 28, -3715.88, -4405.43, 22.5672, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30633, 29, -3713.35, -4400.5, 20.547, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30633, 30, -3710.8, -4396.69, 18.814, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30633, 31, -3706.59, -4393.27, 17.1349, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30633, 32, -3701.65, -4392.21, 15.3723, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30633, 33, -3697.47, -4392.11, 13.7804, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30633, 34, -3691.28, -4391.12, 11.597, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30633, 35, -3685.43, -4389.17, 10.6291, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30633, 36, -3681.22, -4387.65, 10.5599, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30633, 37, -3675.12, -4384.75, 10.1936, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30633, 38, -3665.29, -4378.04, 9.35568, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30633, 39, -3659.9, -4373.78, 9.3558, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30633, 40, -3654.9, -4369.74, 9.3558, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30633, 41, -3648.41, -4364.34, 9.31729, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30633, 42, -3645.05, -4361.36, 8.92897, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30633, 43, -3639.69, -4357.41, 7.96369, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30633, 44, -3633.75, -4353.22, 6.78305, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0);

-- Gossip menu for Smiling Jim.
UPDATE `creature_template` SET `gossip_menu_id`=541, `ai_name`='EventAI' WHERE `entry`=4895;
INSERT INTO `gossip_menu` VALUES (541, 1058, 0);

-- Fix emotes for Smiling Jim texts.
UPDATE `broadcast_text` SET `EmoteId0`=1 WHERE `ID`=1632;
UPDATE `broadcast_text` SET `EmoteId0`=11 WHERE `ID`=1633;
UPDATE `broadcast_text` SET `EmoteId0`=1 WHERE `ID`=1634;
UPDATE `broadcast_text` SET `EmoteId0`=25 WHERE `ID`=1635;

-- Events list for Smiling Jim.
DELETE FROM `creature_ai_events` WHERE `creature_id`=4895;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (489501, 4895, 0, 2, 0, 100, 0, 15, 0, 0, 0, 489501, 0, 0, 'Smiling Jim - Flee at 15% HP');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (489502, 4895, 0, 1, 0, 100, 1, 240000, 300000, 240000, 300000, 489502, 0, 0, 'Smiling Jim - Say Text OOC');
DELETE FROM `creature_ai_scripts` WHERE `id`=489502;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (489502, 0, 39, 489502, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Smiling Jim - Start Script');
DELETE FROM `event_scripts` WHERE `id`=489502;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (489502, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1632, 0, 0, 0, 0, 0, 0, 0, 0, 'Smiling Jim - Say Text');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (489502, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1633, 0, 0, 0, 0, 0, 0, 0, 0, 'Smiling Jim - Say Text');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (489502, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1634, 0, 0, 0, 0, 0, 0, 0, 0, 'Smiling Jim - Say Text');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (489502, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1635, 0, 0, 0, 0, 0, 0, 0, 0, 'Smiling Jim - Say Text');

-- Sara Pierce should have random movement.
UPDATE `creature` SET `spawndist`=5, `MovementType`=1 WHERE `guid`=8462;

-- Dahne Pierce should have random movement.
UPDATE `creature` SET `spawndist`=5, `MovementType`=1 WHERE `guid`=8463;

-- Events list for Spot
DELETE FROM `creature_ai_events` WHERE `creature_id`=4950;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (495001, 4950, 0, 1, 2, 100, 1, 180000, 360000, 180000, 360000, 495001, 0, 0, 'Spot - Fall Asleep OOC');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (495002, 4950, 0, 1, 1, 100, 1, 60000, 120000, 60000, 120000, 495002, 0, 0, 'Spot - Wake Up OOC');
DELETE FROM `creature_ai_scripts` WHERE `id`=495001;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (495001, 0, 28, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Spot - Sleep');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (495001, 0, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Spot - Set Phase to 1');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (495001, 0, 20, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Spot - Move Idle');
DELETE FROM `creature_ai_scripts` WHERE `id`=495002;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (495002, 0, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Spot - Stand Up');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (495002, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Spot - Set Phase to 0');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (495002, 0, 20, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 'Spot - Move Random');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=4950;

/*
  Guard Dueling Event Scripts Below
*/

-- Conditions to check who won duel.
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (4403, 36, 4403, 0, 0, 0, 0); -- Edward
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (4404, 36, 4404, 0, 0, 0, 0); -- Jarad
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (4405, 36, 4405, 0, 0, 0, 0); -- Kahil
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (4406, 36, 4406, 0, 0, 0, 0); -- Lana
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (4407, 36, 4407, 0, 0, 0, 0); -- Narrisha
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (4408, 36, 4408, 0, 0, 0, 0); -- Tark

-- Events list for Guard Edward
DELETE FROM `creature_ai_events` WHERE `creature_id`=4922;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (492201, 4922, 0, 31, 0, 100, 1, 4400, 1, 0, 0, 492201, 0, 0, 'Guard Edward - Attack Guard Jarad on Event Received');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (492202, 4922, 0, 2, 1, 100, 1, 30, 1, 60000, 60000, 492202, 0, 0, 'Guard Edward - End Fight on 30% HP');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (492203, 4922, 0, 2, 0, 100, 0, 15, 0, 0, 0, 492203, 0, 0, 'Guard Edward - Flee at 15% HP');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (492204, 4922, 0, 0, 0, 100, 3, 1000, 3000, 30000, 180000, 492204, 492205, 0, 'Guard Edward - Cast Battle Stance or Defensive Stance');
DELETE FROM `creature_ai_scripts` WHERE `id`=492201;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (492201, 0, 26, 0, 0, 0, 0, 4923, 30, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Edward - Attack Guard Jarad');
DELETE FROM `creature_ai_scripts` WHERE `id`=492202;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (492202, 0, 62, 4400, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Edward - End Map Event');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (492202, 0, 61, 4404, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Edward - Start Jarad Win Event');
DELETE FROM `creature_ai_scripts` WHERE `id`=492204;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (492204, 0, 15, 7165, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Edward - Cast Battle Stance');
DELETE FROM `creature_ai_scripts` WHERE `id`=492205;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (492205, 0, 15, 7164, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Edward - Cast Defensive Stance');
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (49220, 'Dustwallow Marsh - Guard Edward', 11976, 60, 1, 0, 0, 0, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Events list for Guard Jarad
DELETE FROM `creature_ai_events` WHERE `creature_id`=4923;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (492301, 4923, 0, 0, 0, 100, 3, 1000, 3000, 30000, 180000, 492301, 492304, 0, 'Guard Jarad - Cast Battle Stance or Defensive Stance');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (492302, 4923, 0, 2, 1, 100, 1, 30, 1, 60000, 60000, 492302, 0, 0, 'Guard Jarad - End Fight at 30% HP');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (492303, 4923, 0, 2, 0, 100, 0, 15, 0, 0, 0, 492303, 0, 0, 'Guard Jarad - Flee at 15% HP');
DELETE FROM `creature_ai_scripts` WHERE `id`=492301;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (492301, 0, 15, 7165, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Jarad - Cast Battle Stance');
DELETE FROM `creature_ai_scripts` WHERE `id`=492302;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (492302, 0, 62, 4400, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Jarad - End Map Event');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (492302, 0, 61, 4403, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Jarad - Start Edward Win Event');
DELETE FROM `creature_ai_scripts` WHERE `id`=492304;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (492304, 0, 15, 7164, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Jarad - Cast Defensive Stance');
DELETE FROM `creature_spells` WHERE `entry`=49230;
UPDATE `creature_template` SET `spell_list_id`=0 WHERE `entry`=4923;

-- Events list for Guard Kahil
DELETE FROM `creature_ai_events` WHERE `creature_id`=5091;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (509101, 5091, 0, 2, 1, 100, 1, 30, 1, 60000, 60000, 509101, 0, 0, 'Guard Kahil - End Fight at 30% HP');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (509102, 5091, 0, 0, 0, 100, 3, 1000, 3000, 30000, 180000, 509102, 509104, 0, 'Guard Kahil - Cast Battle Stance or Defensive Stance');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (509103, 5091, 0, 2, 0, 100, 0, 15, 0, 0, 0, 509103, 0, 0, 'Guard Kahil - Flee at 15% HP');
DELETE FROM `creature_ai_scripts` WHERE `id`=509101;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (509101, 0, 62, 4401, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Kahil - End Map Event');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (509101, 0, 61, 4406, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Kahil - Start Lana Win Event');
DELETE FROM `creature_ai_scripts` WHERE `id`=509102;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (509102, 0, 15, 7164, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Kahil - Cast Defensive Stance');
DELETE FROM `creature_ai_scripts` WHERE `id`=509104;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (509104, 0, 15, 7165, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Kahil - Cast Battle Stance');
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (50910, 'Dustwallow Marsh - Guard Kahil', 11976, 60, 1, 0, 0, 0, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Events list for Guard Lana
DELETE FROM `creature_ai_events` WHERE `creature_id`=5092;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (509201, 5092, 0, 31, 0, 100, 1, 4401, 1, 0, 0, 509201, 0, 0, 'Guard Lana - Attack Guard Kahil on Event Received');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (509202, 5092, 0, 2, 1, 100, 1, 30, 1, 60000, 60000, 509202, 0, 0, 'Guard Lana - End Fight at 30% HP');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (509203, 5092, 0, 2, 0, 100, 0, 15, 0, 0, 0, 509203, 0, 0, 'Guard Lana - Flee at 15% HP');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (509204, 5092, 0, 0, 0, 100, 3, 1000, 3000, 30000, 180000, 509204, 509205, 0, 'Guard Lana - Cast Battle Stance or Defensive Stance');
DELETE FROM `creature_ai_scripts` WHERE `id`=509201;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (509201, 0, 26, 0, 0, 0, 0, 5091, 30, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Lana - Attack Guard Kahil');
DELETE FROM `creature_ai_scripts` WHERE `id`=509202;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (509202, 0, 62, 4401, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Lana - End Map Event');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (509202, 0, 61, 4405, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Lana - Start Kahil Win Event');
DELETE FROM `creature_ai_scripts` WHERE `id`=509204;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (509204, 0, 15, 7165, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Lana - Cast Battle Stance');
DELETE FROM `creature_ai_scripts` WHERE `id`=509205;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (509205, 0, 15, 7164, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Lana - Cast Defensive Stance');
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (50920, 'Dustwallow Marsh - Guard Lana', 17207, 100, 0, 0, 0, 0, 3, 8, 3, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Events list for Guard Narrisha
DELETE FROM `creature_ai_events` WHERE `creature_id`=5093;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (509301, 5093, 0, 0, 0, 100, 3, 1000, 3000, 30000, 180000, 509301, 509304, 0, 'Guard Narrisha - Cast Battle Stance or Defensive Stance');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (509302, 5093, 0, 2, 1, 100, 1, 30, 1, 60000, 60000, 509302, 0, 0, 'Guard Narrisha - End Fight at 30% HP');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (509303, 5093, 0, 2, 0, 100, 0, 15, 0, 0, 0, 509303, 0, 0, 'Guard Narrisha - Flee at 15% HP');
DELETE FROM `creature_ai_scripts` WHERE `id`=509301;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (509301, 0, 15, 7164, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Kahil - Cast Defensive Stance');
DELETE FROM `creature_ai_scripts` WHERE `id`=509304;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (509304, 0, 15, 7165, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Kahil - Cast Battle Stance');
DELETE FROM `creature_ai_scripts` WHERE `id`=509302;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (509302, 0, 62, 4402, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Narrisha - End Map Event');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (509302, 0, 61, 4408, 30, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Narrisha - Start Tark Win Event');
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (50930, 'Dustwallow Marsh - Guard Narrisha', 11976, 60, 1, 0, 0, 0, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Events list for Guard Tark
DELETE FROM `creature_ai_events` WHERE `creature_id`=5094;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (509401, 5094, 0, 31, 0, 100, 1, 4402, 1, 0, 0, 509401, 0, 0, 'Guard Tark - Attack Guard Narrisha on Event Received');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (509402, 5094, 0, 2, 1, 100, 1, 30, 1, 60000, 60000, 509402, 0, 0, 'Guard Tark - End Fight at 30% HP');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (509403, 5094, 0, 2, 0, 100, 0, 15, 0, 0, 0, 509403, 0, 0, 'Guard Tark - Flee at 15% HP');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (509404, 5094, 0, 0, 0, 100, 3, 1000, 3000, 30000, 180000, 509404, 509405, 0, 'Guard Narrisha - Cast Battle Stance or Defensive Stance');
DELETE FROM `creature_ai_scripts` WHERE `id`=509401;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (509401, 0, 26, 0, 0, 0, 0, 5093, 30, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Tark - Attack Guard Narrisha');
DELETE FROM `creature_ai_scripts` WHERE `id`=509402;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (509402, 0, 62, 4402, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Tark - End Map Event');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (509402, 0, 61, 4407, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Tark - Start Narrisha Win Event');
DELETE FROM `creature_ai_scripts` WHERE `id`=509404;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (509404, 0, 15, 7164, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Kahil - Cast Defensive Stance');
DELETE FROM `creature_ai_scripts` WHERE `id`=509405;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (509405, 0, 15, 7165, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Kahil - Cast Battle Stance');
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (50940, 'Dustwallow Marsh - Guard Tark', 11976, 60, 1, 0, 0, 0, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Events list for Combat Master Criton
DELETE FROM `creature_ai_events` WHERE `creature_id`=4924;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (492401, 4924, 0, 2, 0, 100, 0, 15, 0, 0, 0, 492401, 0, 0, 'Combat Master Criton - Flee at 15% HP');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (492402, 4924, 0, 1, 0, 100, 1, 60000, 60000, 900000, 900000, 492402, 0, 0, 'Combat Master Criton - Start Dueling Event');
DELETE FROM `creature_ai_scripts` WHERE `id`=492402;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (492402, 0, 0, 0, 0, 0, 0, 5093, 30, 8, 0, 1771, 0, 0, 0, 0, 0, 0, 0, 0, 'Combat Master Criton - Say Text');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (492402, 0, 39, 492402, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Combat Master Criton - Start Script');

-- Round 1 Jared vs Edward Begin
DELETE FROM `event_scripts` WHERE `id`=492402;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (492402, 0, 61, 4400, 120, 0, 0, 0, 0, 0, 8, 0, 44400, 0, 44400, 0, 0, 0, 0, 0, 'Start Edward vs Jarad Event');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (492402, 1, 63, 4400, 0, 0, 0, 4922, 30, 8, 2, 0, 44403, 0, 44403, 0, 0, 0, 0, 0, 'Guard Edward - Add to Scripted Map Event');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (492402, 1, 63, 4400, 0, 0, 0, 4923, 30, 8, 2, 0, 44402, 0, 44402, 0, 0, 0, 0, 0, 'Guard Jarad - Add to Scripted Map Event');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (492402, 1, 63, 4400, 0, 0, 0, 5199, 30, 8, 2, 0, 44404, 0, 44404, 0, 0, 0, 0, 0, 'Medic Tamberlyn - Add to Scripted Map Event');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (492402, 1, 63, 4400, 0, 0, 0, 5200, 30, 8, 2, 0, 44405, 0, 44405, 0, 0, 0, 0, 0, 'Medic Helaina - Add to Scripted Map Event');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (492402, 2, 0, 0, 0, 0, 0, 5095, 30, 8, 2, 1775, 0, 0, 0, 0, 0, 0, 0, 0, 'Captain Andrews - Say Text');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (492402, 2, 3, 0, 0, 2, 2, 4923, 30, 8, 2, 0, 0, 0, 0, -3652.811, -4515.007, 9.498757, 1.53, 0, 'Guard Jarad - Move');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (492402, 2, 34, 0, 0, 0, 0, 4923, 30, 8, 2, 0, 0, 0, 0, -3652.811, -4515.007, 9.498757, 0.7871988, 0, 'Guard Jarad - Set Home Position');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (492402, 2, 44, 1, 0, 0, 0, 4923, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Jarad - Set Phase to 1');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (492402, 3, 34, 0, 0, 0, 0, 4922, 30, 8, 2, 0, 0, 0, 0, -3644.488, -4506.659, 9.498757, 3.928499, 0, 'Guard Edward - Set Home Position');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (492402, 3, 44, 1, 0, 0, 0, 4922, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Edward - Set Phase to 1');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (492402, 3, 3, 0, 0, 2, 2, 4922, 30, 8, 2, 0, 0, 0, 0, -3644.488, -4506.659, 9.498757, 4.502949, 0, 'Guard Edward - Move');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (492402, 3, 0, 0, 0, 0, 0, 5096, 30, 8, 2, 1776, 0, 0, 0, 0, 0, 0, 0, 0, 'Captain Thomas - Say Text');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (492402, 6, 35, 1, 0, 0, 0, 4923, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0.7871988, 0, 'Guard Jarad - Set Facing');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (492402, 7, 35, 1, 0, 0, 0, 4922, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 3.928499, 0, 'Guard Edward - Set Facing');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (492402, 8, 0, 0, 0, 0, 0, 4923, 30, 8, 2, 1778, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Jarad - Say Text');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (492402, 8, 1, 66, 0, 0, 0, 4923, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Jarad - Emote Salute');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (492402, 9, 1, 66, 0, 0, 0, 4922, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Edward - Emote Salute');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (492402, 9, 0, 0, 0, 0, 0, 4922, 30, 8, 2, 1777, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Edward - Say Text');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (492402, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1643, 0, 0, 0, 0, 0, 0, 0, 0, 'Combat Master Criton - Say Text');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (492402, 22, 1, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Combat Master Criton - Emote Point');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (492402, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1641, 0, 0, 0, 0, 0, 0, 0, 0, 'Combat Master Criton - Say Text');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (492402, 22, 22, 1622, 2, 0, 0, 4923, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Jarad - Set Faction to Red');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (492402, 22, 22, 1621, 2, 0, 0, 4922, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Edward -Set Faction to Blue');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (492402, 23, 66, 4400, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Send Fight Begin Event');

-- Round 1 Jared vs Edward End
-- Round 2 Kahil vs Lana Begin
DELETE FROM `event_scripts` WHERE `id`=44400;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44400, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1636, 0, 0, 0, 0, 0, 0, 0, 0, 'Combat Master Criton - Say Text');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44400, 0, 0, 0, 0, 0, 0, 5090, 30, 8, 2, 1795, 0, 0, 0, 0, 0, 0, 0, 4403, 'Combat Master Szigeti - Say Text');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44400, 0, 0, 0, 0, 0, 0, 5090, 30, 8, 2, 1794, 0, 0, 0, 0, 0, 0, 0, 4404, 'Combat Master Szigeti - Say Text');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44400, 0, 1, 25, 0, 0, 0, 5090, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Combat Master Szigeti - Emote Point');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44400, 0, 1, 4, 0, 0, 0, 5091, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 4403, 'Guard Kahil - Emote Cheer');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44400, 0, 1, 4, 0, 0, 0, 5093, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 4403, 'Guard Narrisha - Emote Cheer');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44400, 0, 1, 4, 0, 0, 0, 5094, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 4404, 'Guard Tark - Emote Cheer');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44400, 0, 1, 4, 0, 0, 0, 5092, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 4404, 'Guard Lana - Emote Cheer');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44400, 10, 0, 0, 0, 0, 0, 5095, 30, 8, 2, 1766, 0, 0, 0, 0, 0, 0, 0, 4403, 'Captain Andrews - Say Text');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44400, 10, 0, 0, 0, 0, 0, 5096, 30, 8, 2, 1760, 0, 0, 0, 0, 0, 0, 0, 4404, 'Captain Thomas - Say Text');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44400, 11, 61, 4401, 120, 0, 0, 0, 0, 0, 8, 0, 44401, 0, 44401, 0, 0, 0, 0, 0, 'Combat Master Criton - Start Kahil vs Lana Event');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44400, 12, 63, 4401, 0, 0, 0, 5091, 30, 8, 2, 0, 44407, 0, 44407, 0, 0, 0, 0, 0, 'Guard Kahil - Add To Scripted Map Event');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44400, 12, 63, 4401, 0, 0, 0, 5092, 30, 8, 2, 0, 44406, 0, 44406, 0, 0, 0, 0, 0, 'Guard Lana - Add To Scripted Map Event');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44400, 12, 63, 4401, 0, 0, 0, 5199, 30, 8, 2, 0, 44411, 0, 44411, 0, 0, 0, 0, 0, 'Medic Tamberlyn - Add to Scripted Map Event');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44400, 12, 63, 4401, 0, 0, 0, 5200, 30, 8, 2, 0, 44410, 0, 44410, 0, 0, 0, 0, 0, 'Medic Helaina - Add to Scripted Map Event');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44400, 21, 3, 0, 0, 2, 2, 5091, 30, 8, 2, 0, 0, 0, 0, -3644.451, -4506.66, 9.498757, 3.928484, 0, 'Guard Kahil - Move');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44400, 21, 34, 0, 0, 0, 0, 5091, 30, 8, 2, 0, 0, 0, 0, -3644.451, -4506.66, 9.498757, 3.928484, 0, 'Guard Kahil - Set Home Position');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44400, 21, 44, 1, 0, 0, 0, 5091, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Kahil - Set Phase to 1');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44400, 23, 3, 0, 0, 2, 2, 5092, 30, 8, 2, 0, 0, 0, 0, -3652.83, -4515.062, 9.498757, 0.7868186, 0, 'Guard Lana - Move');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44400, 23, 34, 0, 0, 0, 0, 5092, 30, 8, 2, 0, 0, 0, 0, -3652.83, -4515.062, 9.498757, 0.7868186, 0, 'Guard Lana - Set Home Position');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44400, 23, 44, 1, 0, 0, 0, 5092, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Lana - Set Phase to 1');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44400, 26, 1, 66, 0, 0, 0, 5091, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Kahil - Emote Salute');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44400, 26, 0, 0, 0, 0, 0, 5091, 30, 8, 2, 1777, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Kahil - Say Text');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44400, 29, 1, 66, 0, 0, 0, 5092, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Lana - Emote Salute');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44400, 29, 0, 0, 0, 0, 0, 5092, 30, 8, 2, 1778, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Lana - Say Text');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44400, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1643, 0, 0, 0, 0, 0, 0, 0, 0, 'Combat Master Criton - Say Text');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44400, 39, 22, 1622, 2, 0, 0, 5092, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Lana - Set Faction to Red');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44400, 39, 22, 1621, 2, 0, 0, 5091, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Kahil - Set Faction to Blue');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44400, 39, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1641, 0, 0, 0, 0, 0, 0, 0, 0, 'Combat Master Criton - Say Text');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44400, 40, 66, 4401, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Combat Master Criton - Send Fight Begin Event');

-- Round 2 Kahil vs Lana End
-- Round 3 Narrisha vs Tark Begin
DELETE FROM `event_scripts` WHERE `id`=44401;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44401, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1636, 0, 0, 0, 0, 0, 0, 0, 0, 'Combat Master Criton - Say Text');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44401, 0, 0, 0, 0, 0, 0, 5090, 30, 8, 2, 1795, 0, 0, 0, 0, 0, 0, 0, 4405, 'Combat Master Szigeti - Say Text');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44401, 0, 0, 0, 0, 0, 0, 5090, 30, 8, 2, 1794, 0, 0, 0, 0, 0, 0, 0, 4406, 'Combat Master Szigeti - Say Text');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44401, 0, 1, 25, 0, 0, 0, 5090, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Combat Master Szigeti - Emote Point');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44401, 0, 1, 4, 0, 0, 0, 4922, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 4405, 'Guard Edward - Emote Cheer');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44401, 0, 1, 4, 0, 0, 0, 5093, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 4405, 'Guard Narrisha - Emote Cheer');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44401, 0, 1, 4, 0, 0, 0, 5094, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 4406, 'Guard Tark - Emote Cheer');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44401, 0, 1, 4, 0, 0, 0, 4923, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 4406, 'Guard Jarad - Emote Cheer');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44401, 10, 0, 0, 0, 0, 0, 5095, 30, 8, 2, 1767, 0, 0, 0, 0, 0, 0, 0, 4405, 'Captain Andrews - Say Text');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44401, 10, 0, 0, 0, 0, 0, 5096, 30, 8, 2, 1762, 0, 0, 0, 0, 0, 0, 0, 4406, 'Captain Thomas - Say Text');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44401, 11, 61, 4402, 120, 0, 0, 0, 0, 0, 8, 0, 44414, 0, 44414, 0, 0, 0, 0, 0, 'Combat Master Criton - Start Narrisha vs Tark Event');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44401, 12, 63, 4402, 0, 0, 0, 5093, 30, 8, 2, 0, 44409, 0, 44409, 0, 0, 0, 0, 0, 'Guard Narrisha - Add To Scripted Map Event');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44401, 12, 63, 4402, 0, 0, 0, 5094, 30, 8, 2, 0, 44408, 0, 44408, 0, 0, 0, 0, 0, 'Guard Tark - Add To Scripted Map Event');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44401, 12, 63, 4402, 0, 0, 0, 5199, 30, 8, 2, 0, 44413, 0, 44413, 0, 0, 0, 0, 0, 'Medic Tamberlyn - Add to Scripted Map Event');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44401, 12, 63, 4402, 0, 0, 0, 5200, 30, 8, 2, 0, 44412, 0, 44412, 0, 0, 0, 0, 0, 'Medic Helaina - Add to Scripted Map Event');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44401, 21, 3, 0, 0, 2, 2, 5093, 30, 8, 2, 0, 0, 0, 0, -3644.451, -4506.66, 9.498757, 3.930513, 0, 'Guard Narrisha - Move');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44401, 21, 34, 0, 0, 0, 0, 5093, 30, 8, 2, 0, 0, 0, 0, -3644.451, -4506.66, 9.498757, 3.930513, 0, 'Guard Narrisha - Set Home Position');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44401, 21, 44, 1, 0, 0, 0, 5093, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Narrisha - Set Phase to 1');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44401, 23, 3, 0, 0, 2, 2, 5094, 30, 8, 2, 0, 0, 0, 0, -3652.83, -4515.062, 9.498757, 2.1, 0, 'Guard Tark - Move');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44401, 23, 34, 0, 0, 0, 0, 5094, 30, 8, 2, 0, 0, 0, 0, -3652.83, -4515.062, 9.498757, 0.7868186, 0, 'Guard Tark - Set Home Position');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44401, 23, 44, 1, 0, 0, 0, 5094, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Tark - Set Phase to 1');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44401, 26, 1, 66, 0, 0, 0, 5093, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Narrisha - Emote Salute');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44401, 26, 35, 1, 0, 0, 0, 5094, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0.7868186, 0, 'Guard Tark - Set Facing');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44401, 26, 0, 0, 0, 0, 0, 5093, 30, 8, 2, 1777, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Narrisha - Say Text');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44401, 29, 1, 66, 0, 0, 0, 5094, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Tark - Emote Salute');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44401, 29, 0, 0, 0, 0, 0, 5094, 30, 8, 2, 1778, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Tark - Say Text');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44401, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1643, 0, 0, 0, 0, 0, 0, 0, 0, 'Combat Master Criton - Say Text');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44401, 39, 22, 1622, 2, 0, 0, 5094, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Tark - Set Faction to Red');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44401, 39, 22, 1621, 2, 0, 0, 5093, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Narrisha - Set Faction to Blue');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44401, 39, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1641, 0, 0, 0, 0, 0, 0, 0, 0, 'Combat Master Criton - Say Text');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44401, 40, 66, 4402, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Combat Master Criton - Send Fight Begin Event');

-- Round 3 Narrisha vs Tark End
DELETE FROM `event_scripts` WHERE `id`=44414;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44414, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1636, 0, 0, 0, 0, 0, 0, 0, 0, 'Combat Master Criton - Say Text');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44414, 0, 1, 4, 0, 0, 0, 4923, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 4408, 'Guard Jarad - Emote Cheer (Red Win)');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44414, 0, 1, 4, 0, 0, 0, 5092, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 4408, 'Guard Lana - Emote Cheer (Red Win)');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44414, 0, 1, 4, 0, 0, 0, 5093, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 4407, 'Guard Kahil - Emote Cheer (Blue Win)');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44414, 0, 1, 4, 0, 0, 0, 4922, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 4407, 'Guard Edward - Emote Cheer (Blue Win)');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44414, 0, 1, 25, 0, 0, 0, 5090, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Combat Master Szigeti - Emote Point');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44414, 0, 0, 0, 0, 0, 0, 5090, 30, 8, 2, 1794, 0, 0, 0, 0, 0, 0, 0, 4408, 'Combat Master Szigeti - Say Text (Red Win)');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44414, 0, 0, 0, 0, 0, 0, 5090, 30, 8, 2, 1795, 0, 0, 0, 0, 0, 0, 0, 4407, 'Combat Master Szigeti - Say Text (Blue Win)');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44414, 10, 0, 0, 0, 0, 0, 5095, 30, 8, 2, 1768, 0, 0, 0, 0, 0, 0, 0, 4407, 'Captain Andrews - Say Text (Blue Win)');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44414, 10, 0, 0, 0, 0, 0, 5096, 30, 8, 2, 1763, 0, 0, 0, 0, 0, 0, 0, 4408, 'Captain Thomas - Say Text (Red Win)');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44414, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1773, 0, 0, 0, 0, 0, 0, 0, 4408, 'Combat Master Criton - Say Text (Red Win)');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44414, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1774, 0, 0, 0, 0, 0, 0, 0, 4407, 'Combat Master Criton - Say Text (Blue Win)');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44414, 18, 3, 0, 0, 2, 0, 5096, 30, 8, 2, 0, 0, 0, 0, -3646.21, -4503.163, 9.498757, 1.53589, 0, 'Captain Thomas - Move');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44414, 18, 35, 1, 0, 0, 0, 5095, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 5.759586, 0, 'Captain Andrews - Set Facing');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44414, 20, 0, 0, 0, 0, 0, 5095, 30, 8, 2, 1769, 0, 0, 0, 0, 0, 0, 0, 4408, 'Captain Andrews - Say Text (Red Win)');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44414, 20, 0, 0, 0, 0, 0, 5095, 30, 8, 2, 1770, 0, 0, 0, 0, 0, 0, 0, 4407, 'Captain Andrews - Say Text (Blue Win)');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44414, 22, 0, 0, 0, 0, 0, 5096, 30, 8, 2, 1765, 0, 0, 0, 0, 0, 0, 0, 4408, 'Captain Thomas - Say Text (Red Win)');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44414, 22, 0, 0, 0, 0, 0, 5096, 30, 8, 2, 1764, 0, 0, 0, 0, 0, 0, 0, 4407, 'Captain Thomas - Say Text (Blue Win)');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44414, 25, 35, 1, 0, 0, 0, 5095, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0.994838, 0, 'Captain Andrews - Set Facing');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44414, 25, 20, 6, 0, 0, 0, 5096, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Captain Thomas - Move Home');

-- Guard Jarad End Script.
DELETE FROM `event_scripts` WHERE `id`=44402;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44402, 0, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Jarad - Enter Evade Mode');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44402, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Jarad - Set Phase to 0');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44402, 2, 51, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Jarad - Set Sheath Unarmed');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44402, 3, 1, 66, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Jarad - Emote Salute');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44402, 6, 3, 0, 0, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, -3653.16, -4520.27, 9.49876, 1.36136, 0, 'Guard Jarad - Move to Spawn Position');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44402, 6, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -3653.16, -4520.27, 9.49876, 1.36136, 0, 'Guard Jarad - Set Home Position');

-- Guard Edward End Script.
DELETE FROM `event_scripts` WHERE `id`=44403;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44403, 0, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Edward - Enter Evade Mode');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44403, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Edward - Set Phase to 0');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44403, 2, 51, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Edward - Set Sheath Unarmed');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44403, 3, 1, 66, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Edward - Emote Salute');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44403, 6, 3, 0, 0, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, -3644.61, -4500.68, 9.49876, 4.50295, 0, 'Guard Edward - Move to Spawn Position');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44403, 6, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -3644.61, -4500.68, 9.49876, 4.50295, 0, 'Guard Edward - Set Home Position');

-- Guard Lana End Script.
DELETE FROM `event_scripts` WHERE `id`=44406;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44406, 0, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Lana - Enter Evade Mode');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44406, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Lana - Set Phase to 0');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44406, 2, 51, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Lana - Set Sheath Unarmed');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44406, 3, 1, 66, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Lana - Emote Salute');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44406, 6, 3, 0, 0, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, -3651.524, -4520.244, 9.498757, 1.413717, 0, 'Guard Lana - Move to Spawn Position');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44406, 6, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -3651.524, -4520.244, 9.498757, 1.413717, 0, 'Guard Lana - Set Home Position');

-- Guard Kahil End Script.
DELETE FROM `event_scripts` WHERE `id`=44407;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44407, 0, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Kahil - Enter Evade Mode');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44407, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Kahil - Set Phase to 0');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44407, 2, 51, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Kahil - Set Sheath Unarmed');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44407, 3, 1, 66, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Kahil - Emote Salute');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44407, 6, 3, 0, 0, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, -3646.152, -4500.667, 9.498757, 4.642576, 0, 'Guard Kahil - Move to Spawn Position');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44407, 6, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -3646.152, -4500.667, 9.498757, 4.642576, 0, 'Guard Kahil - Set Home Position');

-- Guard Tark End Script.
DELETE FROM `event_scripts` WHERE `id`=44408;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44408, 0, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Tark - Enter Evade Mode');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44408, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Tark - Set Phase to 0');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44408, 2, 51, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Tark - Set Sheath Unarmed');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44408, 3, 1, 66, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Tark - Emote Salute');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44408, 6, 3, 0, 0, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, -3649.813, -4520.187, 9.498757, 1.623156, 0, 'Guard Tark - Move to Spawn Position');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44408, 6, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -3649.813, -4520.187, 9.498757, 1.623156, 0, 'Guard Tark - Set Home Position');

-- Guard Narrisha End Script.
DELETE FROM `event_scripts` WHERE `id`=44409;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44409, 0, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Narrisha - Enter Evade Mode');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44409, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Narrisha - Set Phase to 0');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44409, 2, 51, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Narrisha - Set Sheath Unarmed');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44409, 3, 1, 66, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Narrisha - Emote Salute');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44409, 6, 3, 0, 0, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, -3647.815, -4500.805, 9.498757, 4.764749, 0, 'Guard Narrisha - Move to Spawn Position');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44409, 6, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -3647.815, -4500.805, 9.498757, 4.764749, 0, 'Guard Narrisha - Set Home Position');

-- Scripts for Medics.
DELETE FROM `event_scripts` WHERE `id`=44405;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44405, 0, 15, 7162, 4, 0, 0, 4923, 30, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Medic Helaina - Cast First Aid on Guard Jarad');
DELETE FROM `event_scripts` WHERE `id`=44404;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44404, 0, 15, 7162, 4, 0, 0, 4922, 30, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Medic Tamberlyn - Cast First Aid on Guard Edward');
DELETE FROM `event_scripts` WHERE `id`=44410;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44410, 0, 15, 7162, 4, 0, 0, 5092, 30, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Medic Helaina - Cast First Aid on Guard Lana');
DELETE FROM `event_scripts` WHERE `id`=44411;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44411, 0, 15, 7162, 4, 0, 0, 5091, 30, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Medic Tamberlyn - Cast First Aid on Guard Kahil');
DELETE FROM `event_scripts` WHERE `id`=44412;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44412, 0, 15, 7162, 4, 0, 0, 5094, 30, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Medic Helaina - Cast First Aid on Guard Tark');
DELETE FROM `event_scripts` WHERE `id`=44413;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44413, 0, 15, 7162, 4, 0, 0, 5093, 30, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Medic Tamberlyn - Cast First Aid on Guard Narrisha');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
