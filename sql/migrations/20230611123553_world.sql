DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230611123553');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230611123553');
-- Add your query below.


-- Icecap (176588)
SET @OGUID = 29013;

-- Missing Icecap spawns in Winterspring.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 176588, 1, 6526.16, -4103.31, 661.573, 0.174532, 0, 0, 0.0871553, 0.996195, 2700, 2700, 1, 100, 0, 10), -- Closest existing guid is 20261 at 14.392767 yards.
(@OGUID+2, 176588, 1, 5267.52, -4901.57, 690.987, 0.610863, 0, 0, 0.300705, 0.953717, 2700, 2700, 1, 100, 0, 10), -- Closest existing guid is 49123 at 18.956522 yards.
(@OGUID+3, 176588, 1, 6457.21, -3587.55, 680.945, 4.7822, 0, 0, -0.681998, 0.731354, 2700, 2700, 1, 100, 0, 10), -- Closest existing guid is 49132 at 225.920197 yards.
(@OGUID+4, 176588, 1, 6451.75, -3584.58, 682.357, 2.58308, 0, 0, 0.961261, 0.27564, 2700, 2700, 1, 100, 0, 10), -- Closest existing guid is 49132 at 225.464111 yards.
(@OGUID+5, 176588, 1, 6223.48, -4188.69, 727.235, 2.91469, 0, 0, 0.993571, 0.113208, 2700, 2700, 1, 100, 0, 10), -- Closest existing guid is 49129 at 81.595734 yards.
(@OGUID+6, 176588, 1, 6049.27, -4390.58, 709.758, 1.20428, 0, 0, 0.566406, 0.824126, 2700, 2700, 1, 100, 0, 10), -- Closest existing guid is 20212 at 45.055138 yards.
(@OGUID+7, 176588, 1, 5644.77, -4574.31, 766.659, 1.11701, 0, 0, 0.529919, 0.848048, 2700, 2700, 1, 100, 0, 10), -- Closest existing guid is 20244 at 61.897308 yards.
(@OGUID+8, 176588, 1, 6828.07, -3437.83, 706.807, 4.60767, 0, 0, -0.743144, 0.669131, 2700, 2700, 1, 100, 0, 10), -- Closest existing guid is 20170 at 71.043182 yards.
(@OGUID+9, 176588, 1, 5077.42, -4713.18, 846.748, 4.50295, 0, 0, -0.777145, 0.629321, 2700, 2700, 1, 100, 0, 10), -- Closest existing guid is 20224 at 26.266981 yards.
(@OGUID+10, 176588, 1, 6452.4, -3043.28, 573.872, 4.66003, 0, 0, -0.725374, 0.688355, 2700, 2700, 1, 100, 0, 10), -- Closest existing guid is 20199 at 20.443680 yards.
(@OGUID+11, 176588, 1, 6710.26, -4405.53, 738.596, 4.7822, 0, 0, -0.681998, 0.731354, 2700, 2700, 1, 100, 0, 10), -- Closest existing guid is 20229 at 95.813690 yards.
(@OGUID+12, 176588, 1, 6482.95, -5062.63, 750.388, 1.88495, 0, 0, 0.809016, 0.587786, 2700, 2700, 1, 100, 0, 10), -- Closest existing guid is 20154 at 246.933487 yards.
(@OGUID+13, 176588, 1, 6773.42, -4154.48, 718.614, 1.29154, 0, 0, 0.601814, 0.798636, 2700, 2700, 1, 100, 0, 10), -- Closest existing guid is 20136 at 236.655411 yards.
(@OGUID+14, 176588, 1, 6268.37, -4792.4, 757.083, 3.05433, 0, 0, 0.999048, 0.0436193, 2700, 2700, 1, 100, 0, 10), -- Closest existing guid is 20154 at 138.282150 yards.
(@OGUID+15, 176588, 1, 6786.74, -3284.2, 656.729, 4.36332, 0, 0, -0.819152, 0.573577, 2700, 2700, 1, 100, 0, 10), -- Closest existing guid is 20143 at 69.426270 yards.
(@OGUID+16, 176588, 1, 6379.19, -5052.92, 752.284, 0.401425, 0, 0, 0.199368, 0.979925, 2700, 2700, 1, 100, 0, 10), -- Closest existing guid is 20154 at 161.478439 yards.
(@OGUID+17, 176588, 1, 7113.89, -4231.54, 691.835, 5.77704, 0, 0, -0.25038, 0.968148, 2700, 2700, 1, 100, 0, 10), -- Closest existing guid is 20213 at 45.164650 yards.
(@OGUID+18, 176588, 1, 5935.55, -4583.15, 717.809, 3.05433, 0, 0, 0.999048, 0.0436193, 2700, 2700, 1, 100, 0, 10), -- Closest existing guid is 20138 at 27.140123 yards.
(@OGUID+19, 176588, 1, 5571.02, -4874.4, 845.86, 4.24115, 0, 0, -0.85264, 0.522499, 2700, 2700, 1, 100, 0, 10), -- Closest existing guid is 20148 at 123.200233 yards.
(@OGUID+20, 176588, 1, 6342.89, -2458.11, 545.942, 0.471238, 0, 0, 0.233445, 0.97237, 2700, 2700, 1, 100, 0, 10), -- Closest existing guid is 20207 at 69.148834 yards.
(@OGUID+21, 176588, 1, 5121.67, -4969.84, 877.953, 0.95993, 0, 0, 0.461748, 0.887011, 2700, 2700, 1, 100, 0, 10), -- Closest existing guid is 49122 at 53.169540 yards.
(@OGUID+22, 176588, 1, 7187.52, -4762.29, 723.539, 2.87979, 0, 0, 0.991445, 0.130528, 2700, 2700, 1, 100, 0, 10), -- Closest existing guid is 49118 at 252.654037 yards.
(@OGUID+23, 176588, 1, 6748.4, -5178.43, 749.852, 1.13446, 0, 0, 0.537299, 0.843392, 2700, 2700, 1, 100, 0, 10), -- Closest existing guid is 49121 at 260.971039 yards.
(@OGUID+24, 176588, 1, 6570.82, -3575.14, 708.331, 4.29351, 0, 0, -0.83867, 0.54464, 2700, 2700, 1, 100, 0, 10), -- Closest existing guid is 20190 at 178.045364 yards.
(@OGUID+25, 176588, 1, 5491.81, -4616.75, 810.12, 1.5708, 0, 0, 0.707107, 0.707107, 2700, 2700, 1, 100, 0, 10), -- Closest existing guid is 20214 at 82.023178 yards.
(@OGUID+26, 176588, 1, 5299.71, -4791.05, 692.076, 0.977383, 0, 0, 0.469471, 0.882948, 300, 300, 1, 100, 0, 10),
(@OGUID+27, 176588, 1, 5362.61, -4663.41, 693.484, 0.925024, 0, 0, 0.446198, 0.894935, 300, 300, 1, 100, 0, 10),
(@OGUID+28, 176588, 1, 5499.93, -4500.92, 753.462, 0.977383, 0, 0, 0.469471, 0.882948, 300, 300, 1, 100, 0, 10),
(@OGUID+29, 176588, 1, 5683.18, -4967.84, 805.606, 3.05433, 0, 0, 0.999048, 0.0436193, 300, 300, 1, 100, 0, 10),
(@OGUID+30, 176588, 1, 5753.22, -4379.39, 795.883, 0.0523589, 0, 0, 0.0261765, 0.999657, 300, 300, 1, 100, 0, 10),
(@OGUID+31, 176588, 1, 5828.07, -4488.39, 835.466, 1.74533, 0, 0, 0.766044, 0.642789, 300, 300, 1, 100, 0, 10),
(@OGUID+32, 176588, 1, 5895.33, -4316.94, 793.796, 5.35816, 0, 0, -0.446198, 0.894935, 300, 300, 1, 100, 0, 10),
(@OGUID+33, 176588, 1, 6003.07, -4418.86, 710.217, 2.74016, 0, 0, 0.979924, 0.19937, 300, 300, 1, 100, 0, 10),
(@OGUID+34, 176588, 1, 6008.44, -4535.46, 703.405, 2.1293, 0, 0, 0.874619, 0.48481, 300, 300, 1, 100, 0, 10),
(@OGUID+35, 176588, 1, 6333.68, -4801.04, 746.995, 1.71042, 0, 0, 0.754709, 0.656059, 300, 300, 1, 100, 0, 10),
(@OGUID+36, 176588, 1, 6370.14, -4551.88, 748.762, 2.23402, 0, 0, 0.898793, 0.438373, 300, 300, 1, 100, 0, 10),
(@OGUID+37, 176588, 1, 6448.57, -4510.68, 732.77, 3.56047, 0, 0, -0.978148, 0.207912, 300, 300, 1, 100, 0, 10),
(@OGUID+38, 176588, 1, 6454.25, -2619.77, 565.284, 0.558504, 0, 0, 0.275637, 0.961262, 300, 300, 1, 100, 0, 10),
(@OGUID+39, 176588, 1, 6515.3, -3416.05, 604.219, 3.7001, 0, 0, -0.961261, 0.27564, 300, 300, 1, 100, 0, 10),
(@OGUID+40, 176588, 1, 6516.43, -3904.8, 662.851, 4.88692, 0, 0, -0.642787, 0.766045, 300, 300, 1, 100, 0, 10),
(@OGUID+41, 176588, 1, 6578.92, -4341.99, 691.947, 0.0174525, 0, 0, 0.00872612, 0.999962, 300, 300, 1, 100, 0, 10),
(@OGUID+42, 176588, 1, 6589.15, -4946.13, 706.289, 0.506145, 0, 0, 0.25038, 0.968148, 300, 300, 1, 100, 0, 10),
(@OGUID+43, 176588, 1, 6639.7, -2747.25, 555.466, 0.558504, 0, 0, 0.275637, 0.961262, 300, 300, 1, 100, 0, 10),
(@OGUID+44, 176588, 1, 6640.42, -3021.46, 574.477, 2.09439, 0, 0, 0.866025, 0.500001, 300, 300, 1, 100, 0, 10),
(@OGUID+45, 176588, 1, 6658.68, -4852.1, 717.863, 1.50098, 0, 0, 0.681998, 0.731354, 300, 300, 1, 100, 0, 10),
(@OGUID+46, 176588, 1, 6675.95, -2620.21, 521.512, 1.41372, 0, 0, 0.649447, 0.760406, 300, 300, 1, 100, 0, 10),
(@OGUID+47, 176588, 1, 6679.33, -2481.88, 537.281, 0.942477, 0, 0, 0.45399, 0.891007, 300, 300, 1, 100, 0, 10),
(@OGUID+48, 176588, 1, 6754.1, -3469.91, 680.081, 3.24635, 0, 0, -0.998629, 0.0523532, 300, 300, 1, 100, 0, 10),
(@OGUID+49, 176588, 1, 6763.77, -3122.37, 575.62, 3.29869, 0, 0, -0.996917, 0.0784664, 300, 300, 1, 100, 0, 10),
(@OGUID+50, 176588, 1, 6781.86, -3677.09, 731.957, 5.93412, 0, 0, -0.173648, 0.984808, 300, 300, 1, 100, 0, 10),
(@OGUID+51, 176588, 1, 6784.3, -2776.45, 576.472, 4.5204, 0, 0, -0.771625, 0.636078, 300, 300, 1, 100, 0, 10),
(@OGUID+52, 176588, 1, 6786.35, -3076.26, 577.885, 4.17134, 0, 0, -0.870356, 0.492424, 300, 300, 1, 100, 0, 10),
(@OGUID+53, 176588, 1, 6851.45, -3222.5, 640.463, 4.90438, 0, 0, -0.636078, 0.771625, 300, 300, 1, 100, 0, 10),
(@OGUID+54, 176588, 1, 6851.57, -3695.66, 743.162, 2.74016, 0, 0, 0.979924, 0.19937, 300, 300, 1, 100, 0, 10),
(@OGUID+55, 176588, 1, 6878.13, -4446.98, 741.202, 3.08918, 0, 0, 0.999657, 0.0262016, 300, 300, 1, 100, 0, 10),
(@OGUID+56, 176588, 1, 7006.49, -5190.46, 728.23, 1.93731, 0, 0, 0.824125, 0.566408, 300, 300, 1, 100, 0, 10),
(@OGUID+57, 176588, 1, 7045.73, -4755.71, 743.707, 2.02458, 0, 0, 0.848047, 0.529921, 300, 300, 1, 100, 0, 10),
(@OGUID+58, 176588, 1, 7158.97, -4899.96, 704.893, 5.44543, 0, 0, -0.406736, 0.913546, 300, 300, 1, 100, 0, 10),
(@OGUID+59, 176588, 1, 7169.13, -4930.43, 713.605, 4.62512, 0, 0, -0.737277, 0.675591, 300, 300, 1, 100, 0, 10),
(@OGUID+60, 176588, 1, 7272.5, -4981.05, 728.168, 5.58505, 0, 0, -0.34202, 0.939693, 300, 300, 1, 100, 0, 10),
(@OGUID+61, 176588, 1, 7277.05, -4973.89, 727.433, 2.91469, 0, 0, 0.993571, 0.113208, 300, 300, 1, 100, 0, 10),
(@OGUID+62, 176588, 1, 7327.13, -4419.86, 648.908, 0.314158, 0, 0, 0.156434, 0.987688, 300, 300, 1, 100, 0, 10),
(@OGUID+63, 176588, 1, 7352.37, -4970.27, 706.48, 4.46804, 0, 0, -0.788011, 0.615662, 300, 300, 1, 100, 0, 10),
(@OGUID+64, 176588, 1, 7507.19, -3946.16, 721.172, 4.95674, 0, 0, -0.615661, 0.788011, 300, 300, 1, 100, 0, 10),
(@OGUID+65, 176588, 1, 7529.78, -4746.17, 679.327, 0.0174525, 0, 0, 0.00872612, 0.999962, 300, 300, 1, 100, 0, 10),
(@OGUID+66, 176588, 1, 7589.46, -3850.07, 685.916, 3.94445, 0, 0, -0.920505, 0.390732, 300, 300, 1, 100, 0, 10),
(@OGUID+67, 176588, 1, 7695.14, -4542.93, 651.58, 0.209439, 0, 0, 0.104528, 0.994522, 300, 300, 1, 100, 0, 10),
(@OGUID+68, 176588, 1, 7756.69, -4347.63, 720.633, 1.36136, 0, 0, 0.62932, 0.777146, 300, 300, 1, 100, 0, 10),
(@OGUID+69, 176588, 1, 7869.31, -3854.13, 694.101, 6.21337, 0, 0, -0.0348988, 0.999391, 300, 300, 1, 100, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(@OGUID+2, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(@OGUID+3, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(@OGUID+4, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(@OGUID+5, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(@OGUID+6, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(@OGUID+7, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(@OGUID+8, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(@OGUID+9, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(@OGUID+10, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(@OGUID+11, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(@OGUID+12, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(@OGUID+13, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(@OGUID+14, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(@OGUID+15, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(@OGUID+16, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(@OGUID+17, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(@OGUID+18, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(@OGUID+19, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(@OGUID+20, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(@OGUID+21, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(@OGUID+22, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(@OGUID+23, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(@OGUID+24, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(@OGUID+25, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(@OGUID+26, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(@OGUID+27, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(@OGUID+28, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(@OGUID+29, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(@OGUID+30, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(@OGUID+31, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(@OGUID+32, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(@OGUID+33, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(@OGUID+34, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(@OGUID+35, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(@OGUID+36, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(@OGUID+37, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(@OGUID+38, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(@OGUID+39, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(@OGUID+40, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(@OGUID+41, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(@OGUID+42, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(@OGUID+43, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(@OGUID+44, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(@OGUID+45, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(@OGUID+46, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(@OGUID+47, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(@OGUID+48, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(@OGUID+49, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(@OGUID+50, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(@OGUID+51, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(@OGUID+52, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(@OGUID+53, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(@OGUID+54, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(@OGUID+55, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(@OGUID+56, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(@OGUID+57, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(@OGUID+58, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(@OGUID+59, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(@OGUID+60, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(@OGUID+61, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(@OGUID+62, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(@OGUID+63, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(@OGUID+64, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(@OGUID+65, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(@OGUID+66, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(@OGUID+67, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(@OGUID+68, 1236, 0, 'Icecap', 0, 10), -- Icecaps in Winterspring 153 objects total
(@OGUID+69, 1236, 0, 'Icecap', 0, 10); -- Icecaps in Winterspring 153 objects total

-- Correct Pools
UPDATE `pool_template` SET `description`='Icecap in Winterspring' WHERE  `entry`=1236;

-- Remove Custom Spawns (Non of these spawns exist in the sniff-db)
DELETE FROM `gameobject` WHERE `guid` IN (20195, 20174, 20134, 20135, 20136, 20137, 20138, 20140, 20141, 20142, 20143, 20144, 20145, 20146, 20147, 20148, 20149, 20150, 20151, 20152, 20153, 20154, 20155, 20156, 20157, 20158, 20159, 20160, 20162, 20163, 20164, 20165, 20166, 20167, 20168, 20169, 20170, 20171, 20172, 20173, 20175, 20176, 20177, 20179, 20180, 20181, 20182, 20183, 20184, 20185, 20186, 20187, 20188, 20189, 20190, 20191, 20192, 20193, 20194, 20196, 20197, 20198, 20200, 20201, 20202, 20203, 20204, 20205, 20206, 20207, 20208, 20209, 20210, 20211, 20212, 20213, 20214, 20215, 20216, 20217, 20218, 20219, 20220, 20221, 20222, 20223, 20224, 20225, 20226, 20227, 20228, 20229, 20230, 20231, 20232, 20233, 20234, 20235, 20236, 20238, 20239, 20240, 20241, 20242, 20243, 20244, 20245, 20246, 20247, 20248, 20249, 20250, 20251, 20252, 20253, 20254, 20255, 20256, 20257, 20258, 20259, 20260, 20261, 20262);
DELETE FROM `pool_gameobject` WHERE `guid` IN (20195, 20174, 20134, 20135, 20136, 20137, 20138, 20140, 20141, 20142, 20143, 20144, 20145, 20146, 20147, 20148, 20149, 20150, 20151, 20152, 20153, 20154, 20155, 20156, 20157, 20158, 20159, 20160, 20162, 20163, 20164, 20165, 20166, 20167, 20168, 20169, 20170, 20171, 20172, 20173, 20175, 20176, 20177, 20179, 20180, 20181, 20182, 20183, 20184, 20185, 20186, 20187, 20188, 20189, 20190, 20191, 20192, 20193, 20194, 20196, 20197, 20198, 20200, 20201, 20202, 20203, 20204, 20205, 20206, 20207, 20208, 20209, 20210, 20211, 20212, 20213, 20214, 20215, 20216, 20217, 20218, 20219, 20220, 20221, 20222, 20223, 20224, 20225, 20226, 20227, 20228, 20229, 20230, 20231, 20232, 20233, 20234, 20235, 20236, 20238, 20239, 20240, 20241, 20242, 20243, 20244, 20245, 20246, 20247, 20248, 20249, 20250, 20251, 20252, 20253, 20254, 20255, 20256, 20257, 20258, 20259, 20260, 20261, 20262);

-- Sync Gobject Data
UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300, `spawn_flags` = 0, `animprogress` = 100 WHERE `id` IN (176588);

-- Update Counters
UPDATE `pool_template` SET `max_limit`=45 WHERE  `entry`=1236;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
