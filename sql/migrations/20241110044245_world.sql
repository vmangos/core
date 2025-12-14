DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20241110044245');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20241110044245');
-- Add your query below.


-- Earthroot
-- Pool 1053: Herbs in Wailing Caverns
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(129, 1619, 43, -130.708, -129.07, -66.8246, 4.64258, 0, 0, -0.731354, 0.681998, 604800, 604800, 100, 1, 0, 10), -- Wailing Caverns
(132, 1619, 43, -88.9062, -261.777, -53.9114, 4.53786, 0, 0, -0.766044, 0.642789, 604800, 604800, 100, 1, 0, 10), -- Wailing Caverns
(135, 1619, 43, -121.701, 462.537, -72.2603, 3.64774, 0, 0, -0.968147, 0.250381, 604800, 604800, 100, 1, 0, 10); -- Wailing Caverns
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (129, 1053, 0, 'Earthroot', 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (132, 1053, 0, 'Earthroot', 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (135, 1053, 0, 'Earthroot', 0, 0, 10);

-- Briarthorn
-- Pool 2002: Herbs in Razorfen Kraul
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(136, 1621, 47, 2096.4, 1593.94, 80.5041, 6.19592, 0, 0, -0.0436192, 0.999048, 604800, 604800, 100, 1, 0, 10); -- Razorfen Kraul
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (136, 2002, 0, 'Briarthorn', 0, 0, 10);

-- Bruiseweed
-- Pool 1014: Herbs in Blackfathom Deeps
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(137, 1622, 48, -475.283, -89.9995, -38.4008, 2.23402, 0, 0, 0.898793, 0.438373, 604800, 604800, 100, 1, 0, 10); -- Blackfathom Deeps
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (137, 1014, 0, 'Bruiseweed', 0, 0, 10);

-- Kingsblood
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(154, 1624, 43, -1.81569, -82.4278, -66.416, 0.680677, 0, 0, 0.333806, 0.942642, 604800, 604800, 100, 1, 0, 10), -- Wailing Caverns
(155, 1624, 189, 1756.58, 1345.03, 19.7123, 0.174532, 0, 0, 0.0871553, 0.996195, 604800, 604800, 100, 1, 0, 10), -- Scarlet Monastery
(158, 1624, 189, 1839.61, 1377.49, 18.6989, 4.29351, 0, 0, -0.83867, 0.54464, 604800, 604800, 100, 1, 0, 10), -- Scarlet Monastery
(159, 1624, 189, 1813.73, 1274.33, 17.622, 4.41568, 0, 0, -0.803857, 0.594823, 604800, 604800, 100, 1, 0, 10); -- Scarlet Monastery
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (154, 1053, 0, 'Kingsblood', 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES (2252, 1, 'Herbs in Scarlet Monastery Graveyard', 0, 0, 0, 10);
REPLACE INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (11873, 2252, 0, 'Kingsblood / Grave Moss - Scarlet Monastery Graveyard', 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (155, 2252, 0, 'Kingsblood / Grave Moss - Scarlet Monastery Graveyard', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES (2252, 2262, 0, 'Kingsblood / Grave Moss - Scarlet Monastery Graveyard', 0);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES (2261, 1, 'Herbs in Scarlet Monastery Graveyard', 0, 0, 0, 10);
REPLACE INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (29159, 2261, 0, 'Kingsblood / Grave Moss - Scarlet Monastery Graveyard', 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (158, 2261, 0, 'Kingsblood / Grave Moss - Scarlet Monastery Graveyard', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES (2261, 2262, 0, 'Kingsblood / Grave Moss - Scarlet Monastery Graveyard', 0);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES (2254, 1, 'Herbs in Scarlet Monastery Graveyard', 0, 0, 0, 10);
REPLACE INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (68716, 2254, 0, 'Kingsblood / Grave Moss - Scarlet Monastery Graveyard', 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (159, 2254, 0, 'Kingsblood / Grave Moss - Scarlet Monastery Graveyard', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES (2254, 2262, 0, 'Kingsblood / Grave Moss - Scarlet Monastery Graveyard', 0);

-- Grave Moss
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(160, 1628, 189, 1840.29, 1347.77, 18.0907, 0, 0, 0, 0, 1, 604800, 604800, 100, 1, 0, 10); -- Scarlet Monastery
DELETE FROM `gameobject` WHERE `guid`=58407;
DELETE FROM `pool_gameobject` WHERE `guid`=58407;
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES (2255, 1, 'Herbs in Scarlet Monastery Graveyard', 0, 0, 0, 10);
REPLACE INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (1004, 2255, 0, 'Kingsblood / Grave Moss - Scarlet Monastery Graveyard', 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (160, 2255, 0, 'Kingsblood / Grave Moss - Scarlet Monastery Graveyard', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES (2255, 2262, 0, 'Kingsblood / Grave Moss - Scarlet Monastery Graveyard', 0);

-- Gold Vein
UPDATE `gameobject` SET `position_x`=-6599.25, `position_y`=-1432.17, `position_z`=167.379, `orientation`=2.37364, `rotation0`=0, `rotation1`=0, `rotation2`=0.927183, `rotation3`=0.374608 WHERE `guid`=38321;

-- Mithril Deposit
UPDATE `gameobject` SET `position_x`=-6473.71, `position_y`=-1195.53, `position_z`=183.154, `orientation`=1.29154, `rotation0`=0, `rotation1`=0, `rotation2`=0.601814, `rotation3`=0.798636 WHERE `guid`=38439;

-- Fadeleaf
-- Pool 1556: Herbs in Scarlet Monastery Armory
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(175, 2042, 189, 1701.49, -346.695, 18.0501, 1.16937, 0, 0, 0.551936, 0.833886, 604800, 604800, 100, 1, 0, 10); -- Scarlet Monastery (SPAWN)
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (175, 1556, 0, 'Fadeleaf', 0, 0, 10);

-- Stranglekelp
UPDATE `gameobject` SET `position_x`=-10819.2, `position_y`=-4388.06, `position_z`=-35.3, `orientation`=3.9619, `rotation0`=0, `rotation1`=0, `rotation2`=-0.91706, `rotation3`=0.39875 WHERE `guid`=50482;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(177, 2045, 48, -430.732, 88.3405, -67.4654, 3.4383, 0, 0, -0.989016, 0.147811, 604800, 604800, 100, 1, 0, 10), -- Blackfathom Deeps
(201, 2045, 349, -7.92984, -153.744, -206.915, 2.00713, 0, 0, 0.843391, 0.5373, 604800, 604800, 100, 1, 0, 10), -- Maraudon
(202, 2045, 349, -15.7328, -99.223, -207.312, 5.89921, 0, 0, -0.190808, 0.981627, 604800, 604800, 100, 1, 0, 10); -- Maraudon
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (177, 1014, 0, 'Stranglekelp', 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (201, 34902, 0, 'Stranglekelp', 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (202, 34902, 0, 'Stranglekelp', 0, 0, 10);
UPDATE `pool_template` SET `description`='Herbs in Maraudon' WHERE `entry`=34902 AND `patch_min`=0 AND `patch_max`=10;

-- Brightly Colored Egg
-- Event 28: Noblegarden
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(585, 113770, 1, 10687.7, 1851.84, 1324.58, 4.86947, 0, 0, -0.649447, 0.760406, 180, 180, 100, 1, 0, 10); -- Teldrassil
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (585, 28);

-- Blindweed
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(700, 142143, 349, 227.885, -42.8283, -131.01, 1.85005, 0, 0, 0.798635, 0.601815, 604800, 604800, 100, 1, 0, 10), -- Maraudon
(704, 142143, 349, 209.111, -181.189, -131.517, 5.11382, 0, 0, -0.551936, 0.833886, 604800, 604800, 100, 1, 0, 10), -- Maraudon
(705, 142143, 349, 258.941, 54.6936, -131.01, 1.01229, 0, 0, 0.484809, 0.87462, 604800, 604800, 100, 1, 0, 10), -- Maraudon
(706, 142143, 349, 277.265, -155.452, -111.292, 3.6652, 0, 0, -0.965925, 0.258821, 604800, 604800, 100, 1, 0, 10), -- Maraudon
(708, 142143, 349, 308.052, -88.2435, -131.01, 0.942477, 0, 0, 0.45399, 0.891007, 604800, 604800, 100, 1, 0, 10); -- Maraudon
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (700, 34902, 0, 'Blindweed', 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (704, 34902, 0, 'Blindweed', 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (705, 34902, 0, 'Blindweed', 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (706, 34902, 0, 'Blindweed', 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (708, 34902, 0, 'Blindweed', 0, 0, 10);

-- Ghost Mushroom
-- Pool 4291: Herbs in Dire Maul
-- Pool 34902: Ghost Mushroom Maraudon
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(709, 142144, 349, 1038.12, -295.058, -71.9666, 5.61996, 0, 0, -0.325567, 0.945519, 604800, 604800, 100, 1, 0, 10), -- Maraudon
(710, 142144, 349, 907.205, -184.284, -52.7166, 5.13127, 0, 0, -0.544639, 0.838671, 604800, 604800, 100, 1, 0, 10), -- Maraudon
(712, 142144, 349, 813.695, -151.817, -74.9203, 0.191985, 0, 0, 0.0958452, 0.995396, 604800, 604800, 100, 1, 0, 10), -- Maraudon
(713, 142144, 349, 828.923, -370.214, -58.7417, 2.74016, 0, 0, 0.979924, 0.19937, 604800, 604800, 100, 1, 0, 10), -- Maraudon
(714, 142144, 349, 329.721, -195.472, -59.8991, 3.38594, 0, 0, -0.992546, 0.12187, 604800, 604800, 100, 1, 0, 10), -- Maraudon
(715, 142144, 349, 782.738, -541.578, -33.9911, 1.74533, 0, 0, 0.766044, 0.642789, 604800, 604800, 100, 1, 0, 10), -- Maraudon
(716, 142144, 349, 163.341, -201.369, -171.862, 0.90757, 0, 0, 0.438371, 0.898794, 604800, 604800, 100, 1, 0, 10), -- Maraudon
(721, 142144, 429, -110.419, -419.615, -58.6047, 3.80482, 0, 0, -0.945518, 0.325568, 604800, 604800, 100, 1, 1, 10); -- Dire Maul
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (709, 34902, 0, 'Ghost Mushroom', 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (710, 34902, 0, 'Ghost Mushroom', 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (712, 34902, 0, 'Ghost Mushroom', 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (713, 34902, 0, 'Ghost Mushroom', 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (714, 34902, 0, 'Ghost Mushroom', 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (715, 34902, 0, 'Ghost Mushroom', 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (716, 34902, 0, 'Ghost Mushroom', 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (721, 4291, 0, 'Ghost Mushroom', 0, 1, 10);

-- Gromsblood
-- Pool 4291: Herbs in Dire Maul
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(722, 142145, 429, -9.27483, -432.866, -4.22212, 0.750491, 0, 0, 0.366501, 0.930418, 604800, 604800, 100, 1, 1, 10); -- Dire Maul
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (722, 4291, 0, 'Gromsblood', 0, 1, 10);

-- Venom Bottle
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(731, 142709, 0, -14.8472, -2789, 123.862, 4.2237, 0, 0, -0.857166, 0.51504, 180, 180, 100, 1, 0, 10); -- The Hinterlands

-- Venom Bottle
UPDATE `gameobject` SET `position_x`=-15.9653, `position_y`=-2789.68, `position_z`=123.862, `orientation`=3.14159, `rotation0`=0, `rotation1`=0, `rotation2`=-1, `rotation3`=0 WHERE `guid`=45992;

-- Gordunni Trap
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(733, 144050, 1, -4028.58, -152.553, 128.154, 1.27409, 0, 0, 0.594822, 0.803857, 900, 900, 100, 1, 0, 10); -- Feralas

-- Mailbox
UPDATE `gameobject` SET `id`=144130, `position_x`=-8797.43, `position_y`=1083.47, `position_z`=90.2079, `orientation`=5.4367, `rotation0`=0, `rotation1`=0, `rotation2`=-0.410718, `rotation3`=0.911762 WHERE `guid`=42900;

-- Anvil
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(739, 147043, 0, -4570.18, -1713.66, 510.347, 2.92342, 0, 0, 0.994056, 0.108872, 900, 900, 100, 1, 0, 10); -- Dun Morogh

-- Anvil
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(744, 147044, 0, -4570.34, -1710.76, 510.347, 1.83259, 0, 0, 0.793353, 0.608762, 900, 900, 100, 1, 0, 10); -- Dun Morogh

-- Anvil
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(745, 147045, 0, -4571.1, -1711.38, 510.347, 2.18166, 0, 0, 0.887011, 0.461749, 900, 900, 100, 1, 0, 10); -- Dun Morogh

-- Eternal Flame
UPDATE `gameobject` SET `position_x`=-435.975, `position_y`=249.375, `position_z`=-90.8275, `orientation`=1.22173, `rotation0`=0, `rotation1`=0, `rotation2`=0.573576, `rotation3`=0.819152 WHERE `guid`=47561;

-- Eternal Flame
UPDATE `gameobject` SET `position_x`=-498.729, `position_y`=250.433, `position_z`=-90.8275, `orientation`=3.17653, `rotation0`=0, `rotation1`=0, `rotation2`=-0.999847, `rotation3`=0.0174693 WHERE `guid`=47562;

-- Eternal Flame
UPDATE `gameobject` SET `position_x`=-498.091, `position_y`=302.458, `position_z`=-90.8275, `orientation`=3.07177, `rotation0`=0, `rotation1`=0, `rotation2`=0.999391, `rotation3`=0.0349061 WHERE `guid`=47563;

-- Eternal Flame
UPDATE `gameobject` SET `position_x`=-435.404, `position_y`=302.006, `position_z`=-90.8275, `orientation`=2.79252, `rotation0`=0, `rotation1`=0, `rotation2`=0.984807, `rotation3`=0.173652 WHERE `guid`=47564;

-- Fire Plume Ridge Hot Spot
UPDATE `gameobject` SET `position_x`=-7163.77, `position_y`=-1149.58, `position_z`=-264.945, `orientation`=3.29869, `rotation0`=0, `rotation1`=0, `rotation2`=-0.996917, `rotation3`=0.0784664 WHERE `guid`=17503;

-- Atal'ai Statue
UPDATE `gameobject` SET `position_x`=-444.448, `position_y`=136.106, `position_z`=-148.74, `orientation`=0.331611, `rotation0`=0, `rotation1`=0, `rotation2`=0.165047, `rotation3`=0.986286 WHERE `guid`=315032;
UPDATE `gameobject` SET `position_x`=-491.396, `position_y`=53.5787, `position_z`=-148.74, `orientation`=5.81195, `rotation0`=0, `rotation1`=0, `rotation2`=-0.233445, `rotation3`=0.97237 WHERE `guid`=315029;
UPDATE `gameobject` SET `position_x`=-490.969, `position_y`=135.714, `position_z`=-148.74, `orientation`=0.226892, `rotation0`=0, `rotation1`=0, `rotation2`=0.113203, `rotation3`=0.993572 WHERE `guid`=315026;
UPDATE `gameobject` SET `position_x`=-515.046, `position_y`=95.1471, `position_z`=-148.74, `orientation`=2.74016, `rotation0`=0, `rotation1`=0, `rotation2`=0.979924, `rotation3`=0.19937 WHERE `guid`=315020;
UPDATE `gameobject` SET `position_x`=-420.155, `position_y`=94.3731, `position_z`=-148.74, `orientation`=3.9619, `rotation0`=0, `rotation1`=0, `rotation2`=-0.91706, `rotation3`=0.39875 WHERE `guid`=315023;

-- Idol of Hakkar
UPDATE `gameobject` SET `position_x`=-476.269, `position_y`=94.412, `position_z`=-189.73, `orientation`=1.58825, `rotation0`=0, `rotation1`=0, `rotation2`=0.71325, `rotation3`=0.70091 WHERE `guid`=399337;

-- Atal'ai Light SMALL (DND)
UPDATE `gameobject` SET `position_x`=-515.68, `position_y`=95.1875, `position_z`=-148.74, `orientation`=6.14356, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0697556, `rotation3`=0.997564 WHERE `guid`=315000;
UPDATE `gameobject` SET `position_x`=-419.627, `position_y`=94.2566, `position_z`=-148.74, `orientation`=2.04204, `rotation0`=0, `rotation1`=0, `rotation2`=0.85264, `rotation3`=0.522499 WHERE `guid`=315001;
UPDATE `gameobject` SET `position_x`=-491.569, `position_y`=53.2322, `position_z`=-148.74, `orientation`=3.94445, `rotation0`=0, `rotation1`=0, `rotation2`=-0.920505, `rotation3`=0.390732 WHERE `guid`=315003;
UPDATE `gameobject` SET `position_x`=-443.952, `position_y`=136.128, `position_z`=-148.74, `orientation`=0.209439, `rotation0`=0, `rotation1`=0, `rotation2`=0.104528, `rotation3`=0.994522 WHERE `guid`=315004;

-- Atal'ai Light BIG (DND)
UPDATE `gameobject` SET `position_x`=-443.315, `position_y`=137.201, `position_z`=-173.656, `orientation`=0.209439, `rotation0`=0, `rotation1`=0, `rotation2`=0.104528, `rotation3`=0.994522 WHERE `guid`=315014;
UPDATE `gameobject` SET `position_x`=-491.682, `position_y`=52.1352, `position_z`=-173.66, `orientation`=3.85718, `rotation0`=0, `rotation1`=0, `rotation2`=-0.936671, `rotation3`=0.35021 WHERE `guid`=315013;
UPDATE `gameobject` SET `position_x`=-414.995, `position_y`=94.9034, `position_z`=-172.939, `orientation`=6.14356, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0697556, `rotation3`=0.997564 WHERE `guid`=315011;
UPDATE `gameobject` SET `position_x`=-442.858, `position_y`=52.5523, `position_z`=-173.662, `orientation`=2.04204, `rotation0`=0, `rotation1`=0, `rotation2`=0.85264, `rotation3`=0.522499 WHERE `guid`=315015;
UPDATE `gameobject` SET `position_x`=-516.554, `position_y`=94.296, `position_z`=-173.651, `orientation`=3.85718, `rotation0`=0, `rotation1`=0, `rotation2`=-0.936671, `rotation3`=0.35021 WHERE `guid`=315010;
UPDATE `gameobject` SET `position_x`=-492.192, `position_y`=137.129, `position_z`=-173.643, `orientation`=3.94445, `rotation0`=0, `rotation1`=0, `rotation2`=-0.920505, `rotation3`=0.390732 WHERE `guid`=315012;

-- DOOR1
UPDATE `gameobject` SET `position_x`=-518.381, `position_y`=276.621, `position_z`=-90.8977, `orientation`=3.14159, `rotation0`=0, `rotation1`=0, `rotation2`=-1, `rotation3`=0 WHERE `guid`=399321;

-- DOOR2
UPDATE `gameobject` SET `position_x`=-415.713, `position_y`=276.621, `position_z`=-90.8977, `orientation`=3.14159, `rotation0`=0, `rotation1`=0, `rotation2`=-1, `rotation3`=0 WHERE `guid`=399322;

-- AuctionNode
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(869, 152583, 1, -1257.84, 24.4141, 128.217, 2.88851, 0, 0, 0.992004, 0.126203, 180, 180, 100, 1, 0, 10); -- Thunder Bluff

-- Spawns in Dire Maul should not have patch 0.
UPDATE `gameobject` SET `patch_min`=1 WHERE `map`=429 && `patch_min` < 1;
UPDATE `pool_gameobject` SET `patch_min`=1 WHERE `patch_min` < 1 && `pool_entry` IN (1596, 4291, 4292, 4293, 4294, 4295, 4296, 4297, 4298, 4299, 4300, 4301, 4801, 4802, 4803, 4804, 4811, 4812, 4813, 4814, 4821, 4822, 4823, 4824);
UPDATE `pool_template` SET `patch_min`=1 WHERE `patch_min` < 1 && `entry` IN (1596, 4291, 4292, 4293, 4294, 4295, 4296, 4297, 4298, 4299, 4300, 4301, 4801, 4802, 4803, 4804, 4811, 4812, 4813, 4814, 4821, 4822, 4823, 4824);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
