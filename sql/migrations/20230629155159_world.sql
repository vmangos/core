DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230629155159');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230629155159');
-- Add your query below.


-- Create new pool to hold Mossy Footlocker spawns in Swamp of Sorrows.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(457, 7, 'Mossy Footlockers in Swamp of Sorrows', 1, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(30567, 457, 0, 'Mossy Footlocker', 1, 10),
(30568, 457, 0, 'Mossy Footlocker', 1, 10),
(30570, 457, 0, 'Mossy Footlocker', 1, 10),
(30572, 457, 0, 'Mossy Footlocker', 1, 10),
(30573, 457, 0, 'Mossy Footlocker', 1, 10),
(30576, 457, 0, 'Mossy Footlocker', 1, 10);

-- Create new pool to hold Mossy Footlocker spawns in Desolace.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(455, 5, 'Mossy Footlockers in Desolace', 1, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(30163, 455, 0, 'Mossy Footlocker', 1, 10),
(30164, 455, 0, 'Mossy Footlocker', 1, 10),
(30165, 455, 0, 'Mossy Footlocker', 1, 10);

-- Create new pool to hold Mossy Footlocker spawns in Sunken Temple
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(456, 4, 'Mossy Footlockers in Sunken Temple', 1, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(30566, 456, 0, 'Mossy Footlocker', 1, 10),
(30580, 456, 0, 'Mossy Footlocker', 1, 10),
(30582, 456, 0, 'Mossy Footlocker', 1, 10);

-- Missing Mossy Footlocker spawns in Swamp of Sorrows.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(30569, 179493, 0, -10482.1, -3701.74, -19.4023, 2.19911, 0, 0, 0.891006, 0.453991, 600, 600, 1, 100, 1, 10), -- Closest existing guid is 30567 at 51.654026 yards.
(30575, 179493, 0, -10521.1, -3779.46, -16.6978, 2.40855, 0, 0, 0.93358, 0.358368, 600, 600, 1, 100, 1, 10), -- Closest existing guid is 30567 at 37.523335 yards.
(30593, 179493, 0, -10467.2, -3905.3, -15.7276, 5.81195, 0, 0, -0.233445, 0.97237, 600, 600, 1, 100, 1, 10), -- Closest existing guid is 30576 at 52.244759 yards.
(30595, 179493, 0, -10302.7, -3810.34, -13.1259, 2.32129, 0, 0, 0.91706, 0.39875, 600, 600, 1, 100, 1, 10), -- Closest existing guid is 30570 at 79.810295 yards.
(30596, 179493, 0, -10574, -3917.21, -19.01, 2.9845, 0, 0, 0.996917, 0.0784664, 600, 600, 1, 100, 1, 10), -- Closest existing guid is 30573 at 48.485054 yards.
(30620, 179493, 0, -10477.1, -3717.89, -19.6291, 0.453785, 0, 0, 0.224951, 0.97437, 600, 600, 1, 100, 1, 10), -- Closest existing guid is 30567 at 44.043659 yards.
(30621, 179493, 0, -10550.3, -3840.56, -19.2394, 2.09439, 0, 0, 0.866025, 0.500001, 600, 600, 1, 100, 1, 10), -- Closest existing guid is 30568 at 20.259188 yards.
(30623, 179493, 0, -10536.3, -3882.09, -19.6291, 0.0523589, 0, 0, 0.0261765, 0.999657, 600, 600, 1, 100, 1, 10), -- Closest existing guid is 30573 at 29.017849 yards.
(30625, 179493, 0, -10322.3, -3827.63, -8.78169, 2.3911, 0, 0, 0.930417, 0.366502, 600, 600, 1, 100, 1, 10), -- Closest existing guid is 30570 at 53.880108 yards.
(30626, 179493, 0, -10314.5, -3887.94, -12.7077, 3.50812, 0, 0, -0.983254, 0.182238, 600, 600, 1, 100, 1, 10), -- Closest existing guid is 30570 at 48.433655 yards.
(30627, 179493, 0, -10318.8, -3835.39, -8.1594, 5.14872, 0, 0, -0.537299, 0.843392, 600, 600, 1, 100, 1, 10), -- Closest existing guid is 30570 at 51.128468 yards.
(30634, 179493, 0, -10549, -3922.14, -19.1219, 0.802851, 0, 0, 0.390731, 0.920505, 600, 600, 1, 100, 1, 10); -- Closest existing guid is 30576 at 33.611668 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(30569, 457, 0, 'Mossy Footlocker', 1, 10), -- Mossy Footlockers in Swamp of Sorrows
(30575, 457, 0, 'Mossy Footlocker', 1, 10), -- Mossy Footlockers in Swamp of Sorrows
(30593, 457, 0, 'Mossy Footlocker', 1, 10), -- Mossy Footlockers in Swamp of Sorrows
(30595, 457, 0, 'Mossy Footlocker', 1, 10), -- Mossy Footlockers in Swamp of Sorrows
(30596, 457, 0, 'Mossy Footlocker', 1, 10), -- Mossy Footlockers in Swamp of Sorrows
(30620, 457, 0, 'Mossy Footlocker', 1, 10), -- Mossy Footlockers in Swamp of Sorrows
(30621, 457, 0, 'Mossy Footlocker', 1, 10), -- Mossy Footlockers in Swamp of Sorrows
(30623, 457, 0, 'Mossy Footlocker', 1, 10), -- Mossy Footlockers in Swamp of Sorrows
(30625, 457, 0, 'Mossy Footlocker', 1, 10), -- Mossy Footlockers in Swamp of Sorrows
(30626, 457, 0, 'Mossy Footlocker', 1, 10), -- Mossy Footlockers in Swamp of Sorrows
(30627, 457, 0, 'Mossy Footlocker', 1, 10), -- Mossy Footlockers in Swamp of Sorrows
(30634, 457, 0, 'Mossy Footlocker', 1, 10); -- Mossy Footlockers in Swamp of Sorrows

-- Missing Mossy Footlocker spawns in Desolace.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(30179, 179493, 1, -64.3885, 2595.78, -85.2495, 0.418879, 0, 0, 0.207911, 0.978148, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 30164 at 94.667030 yards.
(30180, 179493, 1, 22.3544, 2755.5, -21.9691, 4.50295, 0, 0, -0.777145, 0.629321, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 30163 at 113.030151 yards.
(30194, 179493, 1, 143.776, 2750.75, -70.1861, 4.95674, 0, 0, -0.615661, 0.788011, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 30163 at 104.736702 yards.
(30195, 179493, 1, -23.0186, 2883.63, -24.2955, 2.93214, 0, 0, 0.994521, 0.104536, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 30164 at 212.185608 yards.
(30198, 179493, 1, -66.8945, 2662.57, -101.944, 2.28638, 0, 0, 0.909961, 0.414694, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 30164 at 28.269732 yards.
(30205, 179493, 1, -33.1207, 2803.82, -28.6924, 1.69297, 0, 0, 0.748956, 0.66262, 180, 180, 1, 100, 1, 10); -- Closest existing guid is 30164 at 138.036453 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(30179, 455, 0, 'Mossy Footlocker', 1, 10), -- Mossy Footlockers in Desolace
(30180, 455, 0, 'Mossy Footlocker', 1, 10), -- Mossy Footlockers in Desolace
(30194, 455, 0, 'Mossy Footlocker', 1, 10), -- Mossy Footlockers in Desolace
(30195, 455, 0, 'Mossy Footlocker', 1, 10), -- Mossy Footlockers in Desolace
(30198, 455, 0, 'Mossy Footlocker', 1, 10), -- Mossy Footlockers in Desolace
(30205, 455, 0, 'Mossy Footlocker', 1, 10); -- Mossy Footlockers in Desolace

-- Missing Mossy Footlocker spawns in Sunken Temple.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(30571, 179493, 0, -10476.1, -3779.97, 8.15162, 4.50295, 0, 0, -0.777145, 0.629321, 600, 600, 1, 100, 1, 10), -- Closest existing guid is 30566 at 108.843536 yards.
(30574, 179493, 0, -10493.1, -3788.77, -2.88936, 2.16421, 0, 0, 0.882947, 0.469473, 600, 600, 1, 100, 1, 10), -- Closest existing guid is 30566 at 125.475525 yards.
(30581, 179493, 0, -10462.9, -3879.23, 10.2241, 3.82227, 0, 0, -0.942641, 0.333808, 600, 600, 1, 100, 1, 10), -- Closest existing guid is 30580 at 68.122574 yards.
(30587, 179493, 0, -10497.2, -3881.17, -11.1845, 3.50812, 0, 0, -0.983254, 0.182238, 600, 600, 1, 100, 1, 10), -- Closest existing guid is 30580 at 98.513741 yards.
(30591, 179493, 0, -10391.1, -3852.76, 17.7112, 5.2709, 0, 0, -0.484809, 0.87462, 600, 600, 1, 100, 1, 10), -- Closest existing guid is 30580 at 59.121109 yards.
(30579, 179493, 0, -10438.5, -3750.29, -2.10462, 1.23918, 0, 0, 0.580703, 0.814116, 600, 600, 1, 100, 1, 10), -- Closest existing guid is 30566 at 74.626846 yards.
(30594, 179493, 0, -10366.6, -3791.72, 13.7301, 6.07375, 0, 0, -0.104528, 0.994522, 600, 600, 1, 100, 1, 10), -- Closest existing guid is 30582 at 24.102236 yards.
(30613, 179493, 0, -10511.8, -3791.45, -5.88725, 2.87979, 0, 0, 0.991445, 0.130528, 600, 600, 1, 100, 1, 10), -- Closest existing guid is 30566 at 144.295197 yards.
(30614, 179493, 0, -10496.7, -3850.98, 9.46467, 2.04204, 0, 0, 0.85264, 0.522499, 600, 600, 1, 100, 1, 10); -- Closest existing guid is 30580 at 110.440681 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(30571, 456, 0, 'Mossy Footlocker', 1, 10), -- Mossy Footlockers in Sunken Temple
(30574, 456, 0, 'Mossy Footlocker', 1, 10), -- Mossy Footlockers in Sunken Temple
(30581, 456, 0, 'Mossy Footlocker', 1, 10), -- Mossy Footlockers in Sunken Temple
(30587, 456, 0, 'Mossy Footlocker', 1, 10), -- Mossy Footlockers in Sunken Temple
(30591, 456, 0, 'Mossy Footlocker', 1, 10), -- Mossy Footlockers in Sunken Temple
(30579, 456, 0, 'Mossy Footlocker', 1, 10), -- Mossy Footlockers in Sunken Temple
(30594, 456, 0, 'Mossy Footlocker', 1, 10), -- Mossy Footlockers in Sunken Temple
(30613, 456, 0, 'Mossy Footlocker', 1, 10), -- Mossy Footlockers in Sunken Temple
(30614, 456, 0, 'Mossy Footlocker', 1, 10); -- Mossy Footlockers in Sunken Temple

UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `id` = 179493;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
