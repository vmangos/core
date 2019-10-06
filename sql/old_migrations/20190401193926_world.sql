DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190401193926');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190401193926');
-- Add your query below.


-- Add Food Crate (3719) / Water Barrel (3658) Pooling for zones: Dun Morogh, Elwynn Forest, Teldrassil, Durotar, Mulgore, Tirisfal Glades
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES
(88000, 3719, 0, -5862.66, -1538.93, 371.974, -2.14675, 0, 0, 0, 0, 180, 180, 100, 1), -- 10847
(88001, 3719, 0, -5662.8, -1553.14, 387.125, 0.436332, 0, 0, 0, 0, 180, 180, 100, 1), -- 10838
(88002, 3719, 0, -5637.03, -505.798, 396.955, 3.00197, 0, 0, 0, 0, 180, 180, 100, 1), -- 31414
(88003, 3658, 0, -5602.55, -2006.01, 395.767, -0.872665, 0, 0, 0, 0, 180, 180, 100, 1), -- 29626
(88004, 3658, 0, -5566.9, 106.377, 482.453, -1.23918, 0, 0, 0, 0, 180, 180, 100, 1), -- 10063
(88005, 3719, 0, -5521.79, -1299.64, 405.023, 0.331613, 0, 0, 0, 0, 180, 180, 100, 1), -- 10734
(88006, 3719, 0, -5416.44, -1249.67, 444.115, -1.22173, 0, 0, 0, 0, 180, 180, 100, 1), -- 29317
(88007, 3658, 0, -5371.96, 287.039, 394.127, -1.0472, 0, 0, 0, 0, 180, 180, 100, 1), -- 29640
(88008, 3719, 0, -5316.5, -1053.26, 393.347, -1.79769, 0, 0, -0.782608, 0.622514, 180, 180, 100, 1),
(88009, 3658, 0, -5316.5, -1053.26, 393.347, -1.79769, 0, 0, -0.782608, 0.622514, 180, 180, 100, 1),
(88010, 3719, 0, -5123.81, -2339.11, 400.498, 2.21657, 0, 0, 0, 0, 180, 180, 100, 1), -- 10946
(88011, 3658, 0, -5077.23, 494.845, 401.821, -2.47837, 0, 0, 0, 0, 180, 180, 100, 1), -- 9467
(88012, 3719, 0, -5073.84, 445.727, 410.966, 0.10472, 0, 0, 0, 0, 180, 180, 100, 1), -- 32369
(88013, 3719, 0, -5060.36, -249.986, 442.184, -1.53589, 0, 0, 0, 0, 180, 180, 100, 1), -- 10173
(88014, 3719, 0, -10063.4, 622.68, 39.2654, -0.523599, 0, 0, -0.258819, 0.965926, 180, 180, 100, 1), -- 26862
(88015, 3719, 0, -10009.8, 38.8972, 35.1709, 2.26893, 0, 0, 0.906308, 0.422617, 180, 180, 100, 1), -- 26888
(88016, 3658, 0, -10004.2, 668.569, 35.7438, 1.48353, 0, 0, 0.67559, 0.737277, 180, 180, 100, 1), -- 34031
(88017, 3658, 0, -9947.94, 625.232, 37.2732, 1.0821, 0, 0, 0.515036, 0.857168, 180, 180, 100, 1), -- 34822
(88018, 3719, 0, -9940.45, -1108.79, 22.2839, 0.785398, 0, 0, 0.382683, 0.92388, 180, 180, 100, 1), -- 33491
(88019, 3719, 0, -9930.38, 582.718, 37.709, -0.436333, 0, 0, -0.21644, 0.976296, 180, 180, 100, 1), -- 30971
(88020, 3658, 0, -9909.52, 26.2754, 32.0256, 0.401426, 0, 0, 0.199368, 0.979925, 180, 180, 100, 1), -- 30685
(88021, 3658, 0, -9862.25, -230.512, 35.5091, -1.29154, 0, 0, -0.601814, 0.798637, 180, 180, 100, 1), -- 26898
(88022, 3658, 0, -9853.07, 366.57, 36.4383, -0.418879, 0, 0, -0.207912, 0.978148, 180, 180, 100, 1), -- 26877
(88023, 3719, 0, -9851.94, 173.276, 21.2732, -1.72788, 0, 0, -0.760407, 0.649446, 180, 180, 100, 1), -- 30846
(88024, 3658, 0, -9809.68, 718.15, 33.1179, 1.02974, 0, 0, 0.492422, 0.870357, 180, 180, 100, 1), -- 26851
(88025, 3658, 0, -9789.66, -1399.88, 62.8007, 1.58825, 0, 0, 0.713251, 0.700909, 180, 180, 100, 1), -- 27052
(88026, 3658, 0, -9630.97, -53.8834, 44.6324, 1.64061, 0, 0, 0.731354, 0.681998, 180, 180, 100, 1), -- 32752
(88027, 3719, 0, -9605.92, 674.789, 38.6522, 1.50098, 0, 0, 0.681997, 0.731355, 180, 180, 100, 1), -- 32825
(88028, 3719, 0, -9572.89, -718.307, 64.7386, 3.07178, 0, 0, 0.999391, 0.0348993, 180, 180, 100, 1), -- 31104
(88029, 3658, 0, -9555.29, -718.836, 99.0869, -2.84489, 0, 0, -0.989016, 0.147808, 180, 180, 100, 1), -- 26962
(88030, 3719, 0, -9538.32, -1406.06, 55.6784, 2.79253, 0, 0, 0.984808, 0.173647, 180, 180, 100, 1), -- 27084
(88031, 3658, 0, -9439.13, 485.315, 53.1871, -1.90241, 0, 0, -0.814116, 0.580702, 180, 180, 100, 1), -- 29578
(88032, 3719, 0, -9379.27, -115.021, 58.7317, -0.139626, 0, 0, -0.0697563, 0.997564, 180, 180, 100, 1), -- 26983
(88033, 3719, 0, -9316.71, 290.286, 70.5393, -0.959931, 0, 0, -0.461749, 0.887011, 180, 180, 100, 1), -- 26782
(88034, 3719, 0, -9307.25, -291.366, 70.4318, 2.26893, 0, 0, 0.906308, 0.422617, 180, 180, 100, 1), -- 30748
(88035, 3658, 0, -8981.32, -815.302, 70.3834, -1.50098, 0, 0, -0.681997, 0.731355, 180, 180, 100, 1), -- 30751
(88036, 3658, 0, -8900.41, -770.323, 69.5532, -2.42601, 0, 0, -0.936673, 0.350206, 180, 180, 100, 1), -- 26994
(88037, 3658, 0, -8823.07, -872.418, 74.7945, 2.98451, 0, 0, 0.996917, 0.0784606, 180, 180, 100, 1), -- 26998
(88038, 3719, 1, 9107.97, 1857.2, 1328.11, -0.191986, 0, 0, 0, 0, 180, 180, 100, 1), -- 49612
(88039, 3719, 1, 9199.46, 1402.7, 1311.31, -2.67035, 0, 0, 0, 0, 180, 180, 100, 1), -- 49611
(88040, 3719, 1, 9554.9, 1897.06, 1314.51, 1.16937, 0, 0, 0, 0, 180, 180, 100, 1), -- 49613
(88041, 3658, 1, 9757.14, 1577.77, 1299.06, -0.645772, 0, 0, 0, 0, 180, 180, 100, 1), -- 49734
(88042, 3658, 1, 9804.29, 966.447, 1308.77, -1.65806, 0, 0, 0, 0, 180, 180, 100, 1), -- 49733
(88043, 3719, 1, 9824.22, 447.278, 1307.79, -0.558505, 0, 0, 0, 0, 180, 180, 100, 1), -- 49614
(88044, 3719, 1, 9908.29, 985.799, 1354.8, 2.74017, 0, 0, 0, 0, 180, 180, 100, 1), -- 49615
(88045, 3658, 1, 10031.4, 287.298, 1323.28, 2.35619, 0, 0, 0, 0, 180, 180, 100, 1), -- 49736
(88046, 3658, 1, 10410.2, 1624.57, 1288.32, 2.58309, 0, 0, 0, 0, 180, 180, 100, 1), -- 49737
(88047, 3719, 1, 10503.2, 1983.78, 1326.53, -1.93731, 0, 0, 0, 0, 180, 180, 100, 1), -- 49609
(88048, 3658, 1, 10648.4, 2078.58, 1332.94, 1.20428, 0, 0, 0, 0, 180, 180, 100, 1), -- 49735
(88049, 3719, 1, 10747.1, 2177.42, 1331.39, -1.58825, 0, 0, 0, 0, 180, 180, 100, 1), -- 49610
(88050, 3719, 1, -1642.23, -5284.79, -0.033276, 0.523599, 0, 0, 0, 0, 180, 180, 100, 1), -- 12498
(88051, 3719, 1, -1336.29, -5200.97, -0.091026, -0.680679, 0, 0, 0, 0, 180, 180, 100, 1), -- 12550
(88052, 3719, 1, -1123.15, -5575.75, 7.39658, 0.226893, 0, 0, 0, 0, 180, 180, 100, 1), -- 12393
(88053, 3719, 1, -1045.77, -4608.98, 25.831, 0.034907, 0, 0, 0, 0, 180, 180, 100, 1), -- 12391
(88054, 3719, 1, -758.5, -5366.35, -0.032768, -2.05949, 0, 0, 0, 0, 180, 180, 100, 1), -- 12394
(88055, 3658, 1, -639.43, -5185.13, 0.112274, 2.60054, 0, 0, 0, 0, 180, 180, 100, 1), -- 12553
(88056, 3658, 1, -153.696, -5023.12, 21.9477, -0.10472, 0, 0, 0, 0, 180, 180, 100, 1), -- 12501
(88057, 3719, 1, 269.644, -4701.72, 11.9075, 1.39626, 0, 0, 0, 0, 180, 180, 100, 1),
(88058, 3658, 1, 269.644, -4701.72, 11.9075, 1.39626, 0, 0, 0, 0, 180, 180, 100, 1),
(88059, 3719, 1, 319.082, -4768.63, 11.9896, 1.72787, 0, 0, 0, 0, 180, 180, 100, 1),
(88060, 3658, 1, 319.082, -4768.63, 11.9896, 1.72787, 0, 0, 0, 0, 180, 180, 100, 1),
(88061, 3658, 1, 339.336, -4700.81, 16.4578, 1.91986, 0, 0, 0, 0, 180, 180, 100, 1), -- 12350
(88062, 3719, 1, 382.927, -4597.71, 54.7897, 0.610865, 0, 0, 0, 0, 180, 180, 100, 1), -- 12351
(88063, 3658, 1, 387.24, -4586.66, 76.1843, 0.680678, 0, 0, 0, 0, 180, 180, 100, 1),
(88064, 3719, 1, 563.076, -4090.13, 15.6692, 1.16937, 0, 0, 0, 0, 180, 180, 100, 1), -- 12551
(88065, 3719, 1, 665.216, -4540.14, 8.83067, -1.78024, 0, 0, 0, 0, 180, 180, 100, 1), -- 12397
(88066, 3658, 1, 787.201, -4530.7, 5.7406, 1.78024, 0, 0, 0, 0, 180, 180, 100, 1), -- 12602
(88067, 3719, 1, 915.418, -4633.35, 18.9878, 1.41372, 0, 0, 0, 0, 180, 180, 100, 1), -- 12395
(88068, 3658, 1, 933.269, -5104.26, -0.032131, 0.471239, 0, 0, 0, 0, 180, 180, 100, 1), -- 12502
(88069, 3658, 1, 946.095, -4704.73, 23.0614, 3.00197, 0, 0, 0, 0, 180, 180, 100, 1), -- 12549
(88070, 3658, 1, 992.105, -4407.13, 14.5778, -2.94961, 0, 0, 0, 0, 180, 180, 100, 1), -- 12505
(88071, 3658, 1, 1269, -4178.72, 26.0548, 1.39626, 0, 0, 0, 0, 180, 180, 100, 1), -- 12392
(88072, 3658, 1, -2750.28, -438.494, -2.84708, 0.942478, 0, 0, 0, 0, 180, 180, 100, 1), -- 20529
(88073, 3719, 1, -2416.05, 498.563, 64.3684, -1.27409, 0, 0, 0, 0, 180, 180, 100, 1), -- 18305
(88074, 3658, 1, -2246.88, -313.829, -9.4249, 2.74017, 0, 0, 0, 0, 180, 180, 100, 1), -- 20532
(88075, 3719, 1, -2212.89, -376.176, -8.69453, 1.69297, 0, 0, 0, 0, 180, 180, 100, 1), -- 18434
(88076, 3658, 1, -2189.53, -420.679, -4.39675, 1.0472, 0, 0, 0, 0, 180, 180, 100, 1), -- 20527
(88077, 3658, 1, -1925.28, 417.42, 133.59, -2.04204, 0, 0, 0, 0, 180, 180, 100, 1), -- 20528
(88078, 3658, 1, -1917.36, -711.039, 3.66848, -1.6057, 0, 0, 0, 0, 180, 180, 100, 1), -- 20530
(88079, 3719, 1, -1894.44, 357.08, 107.787, 3.14159, 0, 0, 0, 0, 180, 180, 100, 1), -- 18304
(88080, 3658, 1, -1774.41, -1175.7, 116.892, 2.54818, 0, 0, 0, 0, 180, 180, 100, 1), -- 20526
(88081, 3658, 1, -1756.74, -1256.07, 113.383, -1.43117, 0, 0, 0, 0, 180, 180, 100, 1), -- 20525
(88082, 3719, 1, -1604.49, -1224.06, 136.574, -1.3439, 0, 0, 0, 0, 180, 180, 100, 1), -- 18302
(88083, 3719, 1, -1577.29, -1191.23, 142.176, 1.0472, 0, 0, 0, 0, 180, 180, 100, 1), -- 18303
(88084, 3719, 1, -1466.17, -980.293, 148.621, -2.09439, 0, 0, 0, 0, 180, 180, 100, 1), -- 18300
(88085, 3719, 1, -1343.92, -1127.75, 141.794, 0.506145, 0, 0, 0, 0, 180, 180, 100, 1), -- 18301
(88086, 3658, 1, -825.687, -23.4734, -13.1944, 1.69297, 0, 0, 0, 0, 180, 180, 100, 1), -- 20531
(88087, 3719, 0, 1660.01, -735.278, 59.8819, 0.418879, 0, 0, 0, 0, 180, 180, 100, 1), -- 45059
(88088, 3719, 0, 2040.9, -461.893, 35.9081, 2.19912, 0, 0, 0, 0, 180, 180, 100, 1), -- 45105
(88089, 3719, 0, 2340.66, 1306.41, 34.0632, -3.10669, 0, 0, 0, 0, 180, 180, 100, 1), -- 45108
(88090, 3719, 0, 2522.86, 1512.94, 0.003494, 1.0472, 0, 0, 0, 0, 180, 180, 100, 1), -- 45160
(88091, 3719, 0, 2670.02, 954.971, 114.079, 2.14675, 0, 0, 0, 0, 180, 180, 100, 1), -- 45259
(88092, 3719, 0, 2831.79, 822.436, 113.144, 2.72271, 0, 0, 0, 0, 180, 180, 100, 1), -- 45103
(88093, 3719, 0, 3054.27, -350.856, -0.050096, 2.54818, 0, 0, 0, 0, 180, 180, 100, 1); -- 45107

UPDATE `gameobject` SET `spawntimesecsmin` = 180, `spawntimesecsmax` = 900 WHERE `id` IN (3658, 3719);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES
(21400, 8, 'Dun Morogh - Food Crate (3719) / Water Barrel (3658) - Master Pool'),
(21401, 1, 'Dun Morogh - Food Crate (3719) / Water Barrel (3658) - #1'),
(21402, 1, 'Dun Morogh - Food Crate (3719) / Water Barrel (3658) - #2'),
(21403, 1, 'Dun Morogh - Food Crate (3719) / Water Barrel (3658) - #3'),
(21404, 1, 'Dun Morogh - Food Crate (3719) / Water Barrel (3658) - #4'),
(21405, 1, 'Dun Morogh - Food Crate (3719) / Water Barrel (3658) - #5'),
(21406, 1, 'Dun Morogh - Food Crate (3719) / Water Barrel (3658) - #6'),
(21407, 1, 'Dun Morogh - Food Crate (3719) / Water Barrel (3658) - #7'),
(21408, 1, 'Dun Morogh - Food Crate (3719) / Water Barrel (3658) - #8'),
(21409, 1, 'Dun Morogh - Food Crate (3719) / Water Barrel (3658) - #9'),
(21410, 1, 'Dun Morogh - Food Crate (3719) / Water Barrel (3658) - #10'),
(21411, 1, 'Dun Morogh - Food Crate (3719) / Water Barrel (3658) - #11'),
(21412, 1, 'Dun Morogh - Food Crate (3719) / Water Barrel (3658) - #12'),
(21413, 1, 'Dun Morogh - Food Crate (3719) / Water Barrel (3658) - #13'),
(21414, 1, 'Dun Morogh - Food Crate (3719) / Water Barrel (3658) - #14'),
(21415, 1, 'Dun Morogh - Food Crate (3719) / Water Barrel (3658) - #15'),

(21450, 14, 'Elwynn Forest - Food Crate (3719) / Water Barrel (3658) - Master Pool'),
(21451, 1, 'Elwynn Forest - Food Crate (3719) / Water Barrel (3658) - #1'),
(21452, 1, 'Elwynn Forest - Food Crate (3719) / Water Barrel (3658) - #2'),
(21453, 1, 'Elwynn Forest - Food Crate (3719) / Water Barrel (3658) - #3'),
(21454, 1, 'Elwynn Forest - Food Crate (3719) / Water Barrel (3658) - #4'),
(21455, 1, 'Elwynn Forest - Food Crate (3719) / Water Barrel (3658) - #5'),
(21456, 1, 'Elwynn Forest - Food Crate (3719) / Water Barrel (3658) - #6'),
(21457, 1, 'Elwynn Forest - Food Crate (3719) / Water Barrel (3658) - #7'),
(21458, 1, 'Elwynn Forest - Food Crate (3719) / Water Barrel (3658) - #8'),
(21459, 1, 'Elwynn Forest - Food Crate (3719) / Water Barrel (3658) - #9'),
(21460, 1, 'Elwynn Forest - Food Crate (3719) / Water Barrel (3658) - #10'),
(21461, 1, 'Elwynn Forest - Food Crate (3719) / Water Barrel (3658) - #11'),
(21462, 1, 'Elwynn Forest - Food Crate (3719) / Water Barrel (3658) - #12'),
(21463, 1, 'Elwynn Forest - Food Crate (3719) / Water Barrel (3658) - #13'),
(21464, 1, 'Elwynn Forest - Food Crate (3719) / Water Barrel (3658) - #14'),
(21465, 1, 'Elwynn Forest - Food Crate (3719) / Water Barrel (3658) - #15'),
(21466, 1, 'Elwynn Forest - Food Crate (3719) / Water Barrel (3658) - #16'),
(21467, 1, 'Elwynn Forest - Food Crate (3719) / Water Barrel (3658) - #17'),
(21468, 1, 'Elwynn Forest - Food Crate (3719) / Water Barrel (3658) - #18'),
(21469, 1, 'Elwynn Forest - Food Crate (3719) / Water Barrel (3658) - #19'),
(21470, 1, 'Elwynn Forest - Food Crate (3719) / Water Barrel (3658) - #20'),
(21471, 1, 'Elwynn Forest - Food Crate (3719) / Water Barrel (3658) - #21'),
(21472, 1, 'Elwynn Forest - Food Crate (3719) / Water Barrel (3658) - #22'),
(21473, 1, 'Elwynn Forest - Food Crate (3719) / Water Barrel (3658) - #23'),
(21474, 1, 'Elwynn Forest - Food Crate (3719) / Water Barrel (3658) - #24'),
(21475, 1, 'Elwynn Forest - Food Crate (3719) / Water Barrel (3658) - #25'),
(21476, 1, 'Elwynn Forest - Food Crate (3719) / Water Barrel (3658) - #26'),
(21477, 1, 'Elwynn Forest - Food Crate (3719) / Water Barrel (3658) - #27'),
(21478, 1, 'Elwynn Forest - Food Crate (3719) / Water Barrel (3658) - #28'),

(21500, 6, 'Teldrassil - Food Crate (3719) / Water Barrel (3658) - Master Pool'),
(21501, 1, 'Teldrassil - Food Crate (3719) / Water Barrel (3658) - #1'),
(21502, 1, 'Teldrassil - Food Crate (3719) / Water Barrel (3658) - #2'),
(21503, 1, 'Teldrassil - Food Crate (3719) / Water Barrel (3658) - #3'),
(21504, 1, 'Teldrassil - Food Crate (3719) / Water Barrel (3658) - #4'),
(21505, 1, 'Teldrassil - Food Crate (3719) / Water Barrel (3658) - #5'),
(21506, 1, 'Teldrassil - Food Crate (3719) / Water Barrel (3658) - #6'),
(21507, 1, 'Teldrassil - Food Crate (3719) / Water Barrel (3658) - #7'),
(21508, 1, 'Teldrassil - Food Crate (3719) / Water Barrel (3658) - #8'),
(21509, 1, 'Teldrassil - Food Crate (3719) / Water Barrel (3658) - #9'),
(21510, 1, 'Teldrassil - Food Crate (3719) / Water Barrel (3658) - #10'),
(21511, 1, 'Teldrassil - Food Crate (3719) / Water Barrel (3658) - #11'),
(21512, 1, 'Teldrassil - Food Crate (3719) / Water Barrel (3658) - #12'),

(21550, 10, 'Durotar - Food Crate (3719) / Water Barrel (3658) - Master Pool'),
(21551, 1, 'Durotar - Food Crate (3719) / Water Barrel (3658) - #1'),
(21552, 1, 'Durotar - Food Crate (3719) / Water Barrel (3658) - #2'),
(21553, 1, 'Durotar - Food Crate (3719) / Water Barrel (3658) - #3'),
(21554, 1, 'Durotar - Food Crate (3719) / Water Barrel (3658) - #4'),
(21555, 1, 'Durotar - Food Crate (3719) / Water Barrel (3658) - #5'),
(21556, 1, 'Durotar - Food Crate (3719) / Water Barrel (3658) - #6'),
(21557, 1, 'Durotar - Food Crate (3719) / Water Barrel (3658) - #7'),
(21558, 1, 'Durotar - Food Crate (3719) / Water Barrel (3658) - #8'),
(21559, 1, 'Durotar - Food Crate (3719) / Water Barrel (3658) - #9'),
(21560, 1, 'Durotar - Food Crate (3719) / Water Barrel (3658) - #10'),
(21561, 1, 'Durotar - Food Crate (3719) / Water Barrel (3658) - #11'),
(21562, 1, 'Durotar - Food Crate (3719) / Water Barrel (3658) - #12'),
(21563, 1, 'Durotar - Food Crate (3719) / Water Barrel (3658) - #13'),
(21564, 1, 'Durotar - Food Crate (3719) / Water Barrel (3658) - #14'),
(21565, 1, 'Durotar - Food Crate (3719) / Water Barrel (3658) - #15'),
(21566, 1, 'Durotar - Food Crate (3719) / Water Barrel (3658) - #16'),
(21567, 1, 'Durotar - Food Crate (3719) / Water Barrel (3658) - #17'),
(21568, 1, 'Durotar - Food Crate (3719) / Water Barrel (3658) - #18'),
(21569, 1, 'Durotar - Food Crate (3719) / Water Barrel (3658) - #19'),
(21570, 1, 'Durotar - Food Crate (3719) / Water Barrel (3658) - #20'),

(21600, 8, 'Mulgore - Food Crate (3719) / Water Barrel (3658) - Master Pool'),
(21601, 1, 'Mulgore - Food Crate (3719) / Water Barrel (3658) - #1'),
(21602, 1, 'Mulgore - Food Crate (3719) / Water Barrel (3658) - #2'),
(21603, 1, 'Mulgore - Food Crate (3719) / Water Barrel (3658) - #3'),
(21604, 1, 'Mulgore - Food Crate (3719) / Water Barrel (3658) - #4'),
(21605, 1, 'Mulgore - Food Crate (3719) / Water Barrel (3658) - #5'),
(21606, 1, 'Mulgore - Food Crate (3719) / Water Barrel (3658) - #6'),
(21607, 1, 'Mulgore - Food Crate (3719) / Water Barrel (3658) - #7'),
(21608, 1, 'Mulgore - Food Crate (3719) / Water Barrel (3658) - #8'),
(21609, 1, 'Mulgore - Food Crate (3719) / Water Barrel (3658) - #9'),
(21610, 1, 'Mulgore - Food Crate (3719) / Water Barrel (3658) - #10'),
(21611, 1, 'Mulgore - Food Crate (3719) / Water Barrel (3658) - #11'),
(21612, 1, 'Mulgore - Food Crate (3719) / Water Barrel (3658) - #12'),
(21613, 1, 'Mulgore - Food Crate (3719) / Water Barrel (3658) - #13'),
(21614, 1, 'Mulgore - Food Crate (3719) / Water Barrel (3658) - #14'),
(21615, 1, 'Mulgore - Food Crate (3719) / Water Barrel (3658) - #15'),

(21650, 4, 'Tirisfal Glades - Food Crate (3719) / Water Barrel (3658) - Master Pool'),
(21651, 1, 'Tirisfal Glades - Food Crate (3719) / Water Barrel (3658) - #1'),
(21652, 1, 'Tirisfal Glades - Food Crate (3719) / Water Barrel (3658) - #2'),
(21653, 1, 'Tirisfal Glades - Food Crate (3719) / Water Barrel (3658) - #3'),
(21654, 1, 'Tirisfal Glades - Food Crate (3719) / Water Barrel (3658) - #4'),
(21655, 1, 'Tirisfal Glades - Food Crate (3719) / Water Barrel (3658) - #5'),
(21656, 1, 'Tirisfal Glades - Food Crate (3719) / Water Barrel (3658) - #6'),
(21657, 1, 'Tirisfal Glades - Food Crate (3719) / Water Barrel (3658) - #7');

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`) VALUES
(21401,21400,0,'Dun Morogh - Food Crate (3719) / Water Barrel (3658) - #1'),
(21402,21400,0,'Dun Morogh - Food Crate (3719) / Water Barrel (3658) - #2'),
(21403,21400,0,'Dun Morogh - Food Crate (3719) / Water Barrel (3658) - #3'),
(21404,21400,0,'Dun Morogh - Food Crate (3719) / Water Barrel (3658) - #4'),
(21405,21400,0,'Dun Morogh - Food Crate (3719) / Water Barrel (3658) - #5'),
(21406,21400,0,'Dun Morogh - Food Crate (3719) / Water Barrel (3658) - #6'),
(21407,21400,0,'Dun Morogh - Food Crate (3719) / Water Barrel (3658) - #7'),
(21408,21400,0,'Dun Morogh - Food Crate (3719) / Water Barrel (3658) - #8'),
(21409,21400,0,'Dun Morogh - Food Crate (3719) / Water Barrel (3658) - #9'),
(21410,21400,0,'Dun Morogh - Food Crate (3719) / Water Barrel (3658) - #10'),
(21411,21400,0,'Dun Morogh - Food Crate (3719) / Water Barrel (3658) - #11'),
(21412,21400,0,'Dun Morogh - Food Crate (3719) / Water Barrel (3658) - #12'),
(21413,21400,0,'Dun Morogh - Food Crate (3719) / Water Barrel (3658) - #13'),
(21414,21400,0,'Dun Morogh - Food Crate (3719) / Water Barrel (3658) - #14'),
(21415,21400,0,'Dun Morogh - Food Crate (3719) / Water Barrel (3658) - #15'),

(21451,21450,0,'Elwynn Forest - Food Crate (3719) / Water Barrel (3658) - #1'),
(21452,21450,0,'Elwynn Forest - Food Crate (3719) / Water Barrel (3658) - #2'),
(21453,21450,0,'Elwynn Forest - Food Crate (3719) / Water Barrel (3658) - #3'),
(21454,21450,0,'Elwynn Forest - Food Crate (3719) / Water Barrel (3658) - #4'),
(21455,21450,0,'Elwynn Forest - Food Crate (3719) / Water Barrel (3658) - #5'),
(21456,21450,0,'Elwynn Forest - Food Crate (3719) / Water Barrel (3658) - #6'),
(21457,21450,0,'Elwynn Forest - Food Crate (3719) / Water Barrel (3658) - #7'),
(21458,21450,0,'Elwynn Forest - Food Crate (3719) / Water Barrel (3658) - #8'),
(21459,21450,0,'Elwynn Forest - Food Crate (3719) / Water Barrel (3658) - #9'),
(21460,21450,0,'Elwynn Forest - Food Crate (3719) / Water Barrel (3658) - #10'),
(21461,21450,0,'Elwynn Forest - Food Crate (3719) / Water Barrel (3658) - #11'),
(21462,21450,0,'Elwynn Forest - Food Crate (3719) / Water Barrel (3658) - #12'),
(21463,21450,0,'Elwynn Forest - Food Crate (3719) / Water Barrel (3658) - #13'),
(21464,21450,0,'Elwynn Forest - Food Crate (3719) / Water Barrel (3658) - #14'),
(21465,21450,0,'Elwynn Forest - Food Crate (3719) / Water Barrel (3658) - #15'),
(21466,21450,0,'Elwynn Forest - Food Crate (3719) / Water Barrel (3658) - #16'),
(21467,21450,0,'Elwynn Forest - Food Crate (3719) / Water Barrel (3658) - #17'),
(21468,21450,0,'Elwynn Forest - Food Crate (3719) / Water Barrel (3658) - #18'),
(21469,21450,0,'Elwynn Forest - Food Crate (3719) / Water Barrel (3658) - #19'),
(21470,21450,0,'Elwynn Forest - Food Crate (3719) / Water Barrel (3658) - #20'),
(21471,21450,0,'Elwynn Forest - Food Crate (3719) / Water Barrel (3658) - #21'),
(21472,21450,0,'Elwynn Forest - Food Crate (3719) / Water Barrel (3658) - #22'),
(21473,21450,0,'Elwynn Forest - Food Crate (3719) / Water Barrel (3658) - #23'),
(21474,21450,0,'Elwynn Forest - Food Crate (3719) / Water Barrel (3658) - #24'),
(21475,21450,0,'Elwynn Forest - Food Crate (3719) / Water Barrel (3658) - #25'),
(21476,21450,0,'Elwynn Forest - Food Crate (3719) / Water Barrel (3658) - #26'),
(21477,21450,0,'Elwynn Forest - Food Crate (3719) / Water Barrel (3658) - #27'),
(21478,21450,0,'Elwynn Forest - Food Crate (3719) / Water Barrel (3658) - #28'),

(21501,21500,0,'Teldrassil - Food Crate (3719) / Water Barrel (3658) - #1'),
(21502,21500,0,'Teldrassil - Food Crate (3719) / Water Barrel (3658) - #2'),
(21503,21500,0,'Teldrassil - Food Crate (3719) / Water Barrel (3658) - #3'),
(21504,21500,0,'Teldrassil - Food Crate (3719) / Water Barrel (3658) - #4'),
(21505,21500,0,'Teldrassil - Food Crate (3719) / Water Barrel (3658) - #5'),
(21506,21500,0,'Teldrassil - Food Crate (3719) / Water Barrel (3658) - #6'),
(21507,21500,0,'Teldrassil - Food Crate (3719) / Water Barrel (3658) - #7'),
(21508,21500,0,'Teldrassil - Food Crate (3719) / Water Barrel (3658) - #8'),
(21509,21500,0,'Teldrassil - Food Crate (3719) / Water Barrel (3658) - #9'),
(21510,21500,0,'Teldrassil - Food Crate (3719) / Water Barrel (3658) - #10'),
(21511,21500,0,'Teldrassil - Food Crate (3719) / Water Barrel (3658) - #11'),
(21512,21500,0,'Teldrassil - Food Crate (3719) / Water Barrel (3658) - #12'),

(21551,21550,0,'Durotar - Food Crate (3719) / Water Barrel (3658) - #1'),
(21552,21550,0,'Durotar - Food Crate (3719) / Water Barrel (3658) - #2'),
(21553,21550,0,'Durotar - Food Crate (3719) / Water Barrel (3658) - #3'),
(21554,21550,0,'Durotar - Food Crate (3719) / Water Barrel (3658) - #4'),
(21555,21550,0,'Durotar - Food Crate (3719) / Water Barrel (3658) - #5'),
(21556,21550,0,'Durotar - Food Crate (3719) / Water Barrel (3658) - #6'),
(21557,21550,0,'Durotar - Food Crate (3719) / Water Barrel (3658) - #7'),
(21558,21550,0,'Durotar - Food Crate (3719) / Water Barrel (3658) - #8'),
(21559,21550,0,'Durotar - Food Crate (3719) / Water Barrel (3658) - #9'),
(21560,21550,0,'Durotar - Food Crate (3719) / Water Barrel (3658) - #10'),
(21561,21550,0,'Durotar - Food Crate (3719) / Water Barrel (3658) - #11'),
(21562,21550,0,'Durotar - Food Crate (3719) / Water Barrel (3658) - #12'),
(21563,21550,0,'Durotar - Food Crate (3719) / Water Barrel (3658) - #13'),
(21564,21550,0,'Durotar - Food Crate (3719) / Water Barrel (3658) - #14'),
(21565,21550,0,'Durotar - Food Crate (3719) / Water Barrel (3658) - #15'),
(21566,21550,0,'Durotar - Food Crate (3719) / Water Barrel (3658) - #16'),
(21567,21550,0,'Durotar - Food Crate (3719) / Water Barrel (3658) - #17'),
(21568,21550,0,'Durotar - Food Crate (3719) / Water Barrel (3658) - #18'),
(21569,21550,0,'Durotar - Food Crate (3719) / Water Barrel (3658) - #19'),
(21570,21550,0,'Durotar - Food Crate (3719) / Water Barrel (3658) - #20'),

(21601,21600,0,'Mulgore - Food Crate (3719) / Water Barrel (3658) - #1'),
(21602,21600,0,'Mulgore - Food Crate (3719) / Water Barrel (3658) - #2'),
(21603,21600,0,'Mulgore - Food Crate (3719) / Water Barrel (3658) - #3'),
(21604,21600,0,'Mulgore - Food Crate (3719) / Water Barrel (3658) - #4'),
(21605,21600,0,'Mulgore - Food Crate (3719) / Water Barrel (3658) - #5'),
(21606,21600,0,'Mulgore - Food Crate (3719) / Water Barrel (3658) - #6'),
(21607,21600,0,'Mulgore - Food Crate (3719) / Water Barrel (3658) - #7'),
(21608,21600,0,'Mulgore - Food Crate (3719) / Water Barrel (3658) - #8'),
(21609,21600,0,'Mulgore - Food Crate (3719) / Water Barrel (3658) - #9'),
(21610,21600,0,'Mulgore - Food Crate (3719) / Water Barrel (3658) - #10'),
(21611,21600,0,'Mulgore - Food Crate (3719) / Water Barrel (3658) - #11'),
(21612,21600,0,'Mulgore - Food Crate (3719) / Water Barrel (3658) - #12'),
(21613,21600,0,'Mulgore - Food Crate (3719) / Water Barrel (3658) - #13'),
(21614,21600,0,'Mulgore - Food Crate (3719) / Water Barrel (3658) - #14'),
(21615,21600,0,'Mulgore - Food Crate (3719) / Water Barrel (3658) - #15'),

(21651,21650,0,'Tirisfal Glades - Food Crate (3719) / Water Barrel (3658) - #1'),
(21652,21650,0,'Tirisfal Glades - Food Crate (3719) / Water Barrel (3658) - #2'),
(21653,21650,0,'Tirisfal Glades - Food Crate (3719) / Water Barrel (3658) - #3'),
(21654,21650,0,'Tirisfal Glades - Food Crate (3719) / Water Barrel (3658) - #4'),
(21655,21650,0,'Tirisfal Glades - Food Crate (3719) / Water Barrel (3658) - #5'),
(21656,21650,0,'Tirisfal Glades - Food Crate (3719) / Water Barrel (3658) - #6'),
(21657,21650,0,'Tirisfal Glades - Food Crate (3719) / Water Barrel (3658) - #7');

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`) VALUES 
-- Dun Morogh
(10677, 21401, 0, 'Dun Morogh - Food Crate (3719) - #1'),(1462, 21401, 0, 'Dun Morogh - Water Barrel (3658) - #1'),
(88000, 21402, 0, 'Dun Morogh - Food Crate (3719) - #2'),(10847, 21402, 0, 'Dun Morogh - Water Barrel (3658) - #2'),
(88001, 21403, 0, 'Dun Morogh - Food Crate (3719) - #3'),(10838, 21403, 0, 'Dun Morogh - Water Barrel (3658) - #3'),
(88002, 21404, 0, 'Dun Morogh - Food Crate (3719) - #4'),(31414, 21404, 0, 'Dun Morogh - Water Barrel (3658) - #4'),
(29626, 21405, 0, 'Dun Morogh - Food Crate (3719) - #5'),(88003, 21405, 0, 'Dun Morogh - Water Barrel (3658) - #5'),
(10063, 21406, 0, 'Dun Morogh - Food Crate (3719) - #6'),(88004, 21406, 0, 'Dun Morogh - Water Barrel (3658) - #6'),
(88005, 21407, 0, 'Dun Morogh - Food Crate (3719) - #7'),(10734, 21407, 0, 'Dun Morogh - Water Barrel (3658) - #7'),
(29306, 21408, 0, 'Dun Morogh - Food Crate (3719) - #8'),(29609, 21408, 0, 'Dun Morogh - Water Barrel (3658) - #8'),
(88006, 21409, 0, 'Dun Morogh - Food Crate (3719) - #9'),(29317, 21409, 0, 'Dun Morogh - Water Barrel (3658) - #9'),
(29640, 21410, 0, 'Dun Morogh - Food Crate (3719) - #10'),(88007, 21410, 0, 'Dun Morogh - Water Barrel (3658) - #10'),
(88008, 21411, 0, 'Dun Morogh - Food Crate (3719) - #11'),(88009, 21411, 0, 'Dun Morogh - Water Barrel (3658) - #11'),
(88010, 21412, 0, 'Dun Morogh - Food Crate (3719) - #12'),(10946, 21412, 0, 'Dun Morogh - Water Barrel (3658) - #12'),
(9467, 21413, 0, 'Dun Morogh - Food Crate (3719) - #13'),(88011, 21413, 0, 'Dun Morogh - Water Barrel (3658) - #13'),
(88012, 21414, 0, 'Dun Morogh - Food Crate (3719) - #14'),(32369, 21414, 0, 'Dun Morogh - Water Barrel (3658) - #14'),
(88013, 21415, 0, 'Dun Morogh - Food Crate (3719) - #15'),(10173, 21415, 0, 'Dun Morogh - Water Barrel (3658) - #15'),
-- Elwynn Forest
(88014, 21451, 0, 'Elwynn Forest - Food Crate (3719) - #1'),(26862, 21451, 0, 'Elwynn Forest - Water Barrel (3658) - #1'),
(88015, 21452, 0, 'Elwynn Forest - Food Crate (3719) - #2'),(26888, 21452, 0, 'Elwynn Forest - Water Barrel (3658) - #2'),
(34031, 21453, 0, 'Elwynn Forest - Food Crate (3719) - #3'),(88016, 21453, 0, 'Elwynn Forest - Water Barrel (3658) - #3'),
(34822, 21454, 0, 'Elwynn Forest - Food Crate (3719) - #4'),(88017, 21454, 0, 'Elwynn Forest - Water Barrel (3658) - #4'),
(88018, 21455, 0, 'Elwynn Forest - Food Crate (3719) - #5'),(33491, 21455, 0, 'Elwynn Forest - Water Barrel (3658) - #5'),
(88019, 21456, 0, 'Elwynn Forest - Food Crate (3719) - #6'),(30971, 21456, 0, 'Elwynn Forest - Water Barrel (3658) - #6'),
(30685, 21457, 0, 'Elwynn Forest - Food Crate (3719) - #7'),(88020, 21457, 0, 'Elwynn Forest - Water Barrel (3658) - #7'),
(26898, 21458, 0, 'Elwynn Forest - Food Crate (3719) - #8'),(88021, 21458, 0, 'Elwynn Forest - Water Barrel (3658) - #8'),
(26877, 21459, 0, 'Elwynn Forest - Food Crate (3719) - #9'),(88022, 21459, 0, 'Elwynn Forest - Water Barrel (3658) - #9'),
(88023, 21460, 0, 'Elwynn Forest - Food Crate (3719) - #10'),(30846, 21460, 0, 'Elwynn Forest - Water Barrel (3658) - #10'),
(26851, 21461, 0, 'Elwynn Forest - Food Crate (3719) - #11'),(88024, 21461, 0, 'Elwynn Forest - Water Barrel (3658) - #11'),
(27052, 21462, 0, 'Elwynn Forest - Food Crate (3719) - #12'),(88025, 21462, 0, 'Elwynn Forest - Water Barrel (3658) - #12'),
(30758, 21463, 0, 'Elwynn Forest - Food Crate (3719) - #13'),(29275, 21463, 0, 'Elwynn Forest - Water Barrel (3658) - #13'),
(32752, 21464, 0, 'Elwynn Forest - Food Crate (3719) - #14'),(88026, 21464, 0, 'Elwynn Forest - Water Barrel (3658) - #14'),
(88027, 21465, 0, 'Elwynn Forest - Food Crate (3719) - #15'),(32825, 21465, 0, 'Elwynn Forest - Water Barrel (3658) - #15'),
(88028, 21466, 0, 'Elwynn Forest - Food Crate (3719) - #16'),(31104, 21466, 0, 'Elwynn Forest - Water Barrel (3658) - #16'),
(26962, 21467, 0, 'Elwynn Forest - Food Crate (3719) - #17'),(88029, 21467, 0, 'Elwynn Forest - Water Barrel (3658) - #17'),
(88030, 21468, 0, 'Elwynn Forest - Food Crate (3719) - #18'),(27084, 21468, 0, 'Elwynn Forest - Water Barrel (3658) - #18'),
(32754, 21469, 0, 'Elwynn Forest - Food Crate (3719) - #19'),(32313, 21469, 0, 'Elwynn Forest - Water Barrel (3658) - #19'),
(30839, 21470, 0, 'Elwynn Forest - Food Crate (3719) - #20'),(30677, 21470, 0, 'Elwynn Forest - Water Barrel (3658) - #20'),
(29578, 21471, 0, 'Elwynn Forest - Food Crate (3719) - #21'),(88031, 21471, 0, 'Elwynn Forest - Water Barrel (3658) - #21'),
(88032, 21472, 0, 'Elwynn Forest - Food Crate (3719) - #22'),(26983, 21472, 0, 'Elwynn Forest - Water Barrel (3658) - #22'),
(88033, 21473, 0, 'Elwynn Forest - Food Crate (3719) - #23'),(26782, 21473, 0, 'Elwynn Forest - Water Barrel (3658) - #23'),
(88034, 21474, 0, 'Elwynn Forest - Food Crate (3719) - #24'),(30748, 21474, 0, 'Elwynn Forest - Water Barrel (3658) - #24'),
(30687, 21475, 0, 'Elwynn Forest - Food Crate (3719) - #25'),(29276, 21475, 0, 'Elwynn Forest - Water Barrel (3658) - #25'),
(30751, 21476, 0, 'Elwynn Forest - Food Crate (3719) - #26'),(88035, 21476, 0, 'Elwynn Forest - Water Barrel (3658) - #26'),
(26994, 21477, 0, 'Elwynn Forest - Food Crate (3719) - #27'),(88036, 21477, 0, 'Elwynn Forest - Water Barrel (3658) - #27'),
(26998, 21478, 0, 'Elwynn Forest - Food Crate (3719) - #28'),(88037, 21478, 0, 'Elwynn Forest - Water Barrel (3658) - #28'),
-- Teldrassil
(88038, 21501, 0, 'Teldrassil - Food Crate (3719) - #1'),(49612, 21501, 0, 'Teldrassil - Water Barrel (3658) - #1'),
(88039, 21502, 0, 'Teldrassil - Food Crate (3719) - #2'),(49611, 21502, 0, 'Teldrassil - Water Barrel (3658) - #2'),
(88040, 21503, 0, 'Teldrassil - Food Crate (3719) - #3'),(49613, 21503, 0, 'Teldrassil - Water Barrel (3658) - #3'),
(49734, 21504, 0, 'Teldrassil - Food Crate (3719) - #4'),(88041, 21504, 0, 'Teldrassil - Water Barrel (3658) - #4'),
(49733, 21505, 0, 'Teldrassil - Food Crate (3719) - #5'),(88042, 21505, 0, 'Teldrassil - Water Barrel (3658) - #5'),
(88043, 21506, 0, 'Teldrassil - Food Crate (3719) - #6'),(49614, 21506, 0, 'Teldrassil - Water Barrel (3658) - #6'),
(88044, 21507, 0, 'Teldrassil - Food Crate (3719) - #7'),(49615, 21507, 0, 'Teldrassil - Water Barrel (3658) - #7'),
(49736, 21508, 0, 'Teldrassil - Food Crate (3719) - #8'),(88045, 21508, 0, 'Teldrassil - Water Barrel (3658) - #8'),
(49737, 21509, 0, 'Teldrassil - Food Crate (3719) - #9'),(88046, 21509, 0, 'Teldrassil - Water Barrel (3658) - #9'),
(88047, 21510, 0, 'Teldrassil - Food Crate (3719) - #10'),(49609, 21510, 0, 'Teldrassil - Water Barrel (3658) - #10'),
(49735, 21511, 0, 'Teldrassil - Food Crate (3719) - #11'),(88048, 21511, 0, 'Teldrassil - Water Barrel (3658) - #11'),
(88049, 21512, 0, 'Teldrassil - Food Crate (3719) - #12'),(49610, 21512, 0, 'Teldrassil - Water Barrel (3658) - #12'),
-- Durotar
(88050, 21551, 0, 'Durotar - Food Crate (3719) - #1'),(12498, 21551, 0, 'Durotar - Water Barrel (3658) - #1'),
(88051, 21552, 0, 'Durotar - Food Crate (3719) - #2'),(12550, 21552, 0, 'Durotar - Water Barrel (3658) - #2'),
(88052, 21553, 0, 'Durotar - Food Crate (3719) - #3'),(12393, 21553, 0, 'Durotar - Water Barrel (3658) - #3'),
(88053, 21554, 0, 'Durotar - Food Crate (3719) - #4'),(12391, 21554, 0, 'Durotar - Water Barrel (3658) - #4'),
(88054, 21555, 0, 'Durotar - Food Crate (3719) - #5'),(12394, 21555, 0, 'Durotar - Water Barrel (3658) - #5'),
(12553, 21556, 0, 'Durotar - Food Crate (3719) - #6'),(88055, 21556, 0, 'Durotar - Water Barrel (3658) - #6'),
(12501, 21557, 0, 'Durotar - Food Crate (3719) - #7'),(88056, 21557, 0, 'Durotar - Water Barrel (3658) - #7'),
(88057, 21558, 0, 'Durotar - Food Crate (3719) - #8'),(88058, 21558, 0, 'Durotar - Water Barrel (3658) - #8'),
(88059, 21559, 0, 'Durotar - Food Crate (3719) - #9'),(88060, 21559, 0, 'Durotar - Water Barrel (3658) - #9'),
(12350, 21560, 0, 'Durotar - Food Crate (3719) - #10'),(88061, 21560, 0, 'Durotar - Water Barrel (3658) - #10'),
(88062, 21561, 0, 'Durotar - Food Crate (3719) - #11'),(12351, 21561, 0, 'Durotar - Water Barrel (3658) - #11'),
(12346, 21562, 0, 'Durotar - Food Crate (3719) - #12'),(88063, 21562, 0, 'Durotar - Water Barrel (3658) - #12'),
(88064, 21563, 0, 'Durotar - Food Crate (3719) - #13'),(12551, 21563, 0, 'Durotar - Water Barrel (3658) - #13'),
(88065, 21564, 0, 'Durotar - Food Crate (3719) - #14'),(12397, 21564, 0, 'Durotar - Water Barrel (3658) - #14'),
(12602, 21565, 0, 'Durotar - Food Crate (3719) - #15'),(88066, 21565, 0, 'Durotar - Water Barrel (3658) - #15'),
(88067, 21566, 0, 'Durotar - Food Crate (3719) - #16'),(12395, 21566, 0, 'Durotar - Water Barrel (3658) - #16'),
(12502, 21567, 0, 'Durotar - Food Crate (3719) - #17'),(88068, 21567, 0, 'Durotar - Water Barrel (3658) - #17'),
(12549, 21568, 0, 'Durotar - Food Crate (3719) - #18'),(88069, 21568, 0, 'Durotar - Water Barrel (3658) - #18'),
(12505, 21569, 0, 'Durotar - Food Crate (3719) - #19'),(88070, 21569, 0, 'Durotar - Water Barrel (3658) - #19'),
(12392, 21570, 0, 'Durotar - Food Crate (3719) - #20'),(88071, 21570, 0, 'Durotar - Water Barrel (3658) - #20'),
-- Mulgore
(20529, 21601, 0, 'Mulgore - Food Crate (3719) - #1'),(88072, 21601, 0, 'Mulgore - Water Barrel (3658) - #1'),
(88073, 21602, 0, 'Mulgore - Food Crate (3719) - #2'),(18305, 21602, 0, 'Mulgore - Water Barrel (3658) - #2'),
(20532, 21603, 0, 'Mulgore - Food Crate (3719) - #3'),(88074, 21603, 0, 'Mulgore - Water Barrel (3658) - #3'),
(88075, 21604, 0, 'Mulgore - Food Crate (3719) - #4'),(18434, 21604, 0, 'Mulgore - Water Barrel (3658) - #4'),
(20527, 21605, 0, 'Mulgore - Food Crate (3719) - #5'),(88076, 21605, 0, 'Mulgore - Water Barrel (3658) - #5'),
(20528, 21606, 0, 'Mulgore - Food Crate (3719) - #6'),(88077, 21606, 0, 'Mulgore - Water Barrel (3658) - #6'),
(20530, 21607, 0, 'Mulgore - Food Crate (3719) - #7'),(88078, 21607, 0, 'Mulgore - Water Barrel (3658) - #7'),
(88079, 21608, 0, 'Mulgore - Food Crate (3719) - #8'),(18304, 21608, 0, 'Mulgore - Water Barrel (3658) - #8'),
(20526, 21609, 0, 'Mulgore - Food Crate (3719) - #9'),(88080, 21609, 0, 'Mulgore - Water Barrel (3658) - #9'),
(20525, 21610, 0, 'Mulgore - Food Crate (3719) - #10'),(88081, 21610, 0, 'Mulgore - Water Barrel (3658) - #10'),
(88082, 21611, 0, 'Mulgore - Food Crate (3719) - #11'),(18302, 21611, 0, 'Mulgore - Water Barrel (3658) - #11'),
(88083, 21612, 0, 'Mulgore - Food Crate (3719) - #12'),(18303, 21612, 0, 'Mulgore - Water Barrel (3658) - #12'),
(88084, 21613, 0, 'Mulgore - Food Crate (3719) - #13'),(18300, 21613, 0, 'Mulgore - Water Barrel (3658) - #13'),
(88085, 21614, 0, 'Mulgore - Food Crate (3719) - #14'),(18301, 21614, 0, 'Mulgore - Water Barrel (3658) - #14'),
(20531, 21615, 0, 'Mulgore - Food Crate (3719) - #15'),(88086, 21615, 0, 'Mulgore - Water Barrel (3658) - #15'),
-- Tirisfal Glades
(88087, 21651, 0, 'Tirisfal Glades - Food Crate (3719) - #1'),(45059, 21651, 0, 'Tirisfal Glades - Water Barrel (3658) - #1'),
(88088, 21652, 0, 'Tirisfal Glades - Food Crate (3719) - #2'),(45105, 21652, 0, 'Tirisfal Glades - Water Barrel (3658) - #2'),
(88089, 21653, 0, 'Tirisfal Glades - Food Crate (3719) - #3'),(45108, 21653, 0, 'Tirisfal Glades - Water Barrel (3658) - #3'),
(88090, 21654, 0, 'Tirisfal Glades - Food Crate (3719) - #4'),(45160, 21654, 0, 'Tirisfal Glades - Water Barrel (3658) - #4'),
(88091, 21655, 0, 'Tirisfal Glades - Food Crate (3719) - #5'),(45259, 21655, 0, 'Tirisfal Glades - Water Barrel (3658) - #5'),
(88092, 21656, 0, 'Tirisfal Glades - Food Crate (3719) - #6'),(45103, 21656, 0, 'Tirisfal Glades - Water Barrel (3658) - #6'),
(88093, 21657, 0, 'Tirisfal Glades - Food Crate (3719) - #7'),(45107, 21657, 0, 'Tirisfal Glades - Water Barrel (3658) - #7');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
