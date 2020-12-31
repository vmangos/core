DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200502202412');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200502202412');
-- Add your query below.


-- Add missing gameobject spawns in Feralas and Thousand Needles.
INSERT INTO gameobject (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES
 -- Rocket Car Rubble
(170089,19868,1,-5980.433,-3654.721,-58.74995,3.228859,0,0,-0.9990482,0.04361926,180,300,100,1), -- .go xyz -5980.433 -3654.721 -58.74995 1
 -- Rocket Car Rubble
(170090,19870,1,-5819.381,-3514.214,-58.35702,3.804818,0,0,-0.9455185,0.3255684,300,300,100,1), -- .go xyz -5819.381 -3514.214 -58.35702 1
 -- Rocket Car Rubble
(170091,19869,1,-5807.534,-3616.333,-59.8394,3.019413,0,0,0.9981346,0.06105176,300,300,100,1), -- .go xyz -5807.534 -3616.333 -59.8394 1
 -- Rocket Car Rubble
(170092,19871,1,-5640.918,-3576.673,-58.75002,4.625124,0,0,-0.737277,0.6755905,300,300,100,1), -- .go xyz -5640.918 -3576.673 -58.75002 1
 -- Rocket Car Rubble
(170093,19868,1,-5701.279,-3539.569,-59.85594,0.9250238,0,0,0.4461975,0.8949345,180,300,100,1), -- .go xyz -5701.279 -3539.569 -59.85594 1
 -- Rocket Car Rubble
(170094,19873,1,-5695.18,-3507.515,-58.06757,2.234018,0,0,0.8987932,0.4383728,300,300,100,1), -- .go xyz -5695.18 -3507.515 -58.06757 1
 -- Tin Vein
(170095,1732,1,-4727.462,-1295.195,-35.92619,3.211419,0,0,-0.9993906,0.03490613,45,90,100,1), -- .go xyz -4727.462 -1295.195 -35.92619 1
 -- Gordunni Trap
(170096,144050,1,-4037.494,-145.4888,123.2249,3.455756,0,0,-0.9876881,0.1564362,900,900,100,1), -- .go xyz -4037.494 -145.4888 123.2249 1
 -- Gordunni Trap
(170097,144050,1,-4035.342,-138.6416,121.7496,0.2268925,0,0,0.113203,0.9935719,900,900,100,1), -- .go xyz -4035.342 -138.6416 121.7496 1
 -- Stonescale Eel Swarm
(170098,180712,1,-4798.631,2316.71,0,0.03490625,0,0,0.01745224,0.9998477,1800,3600,100,1), -- .go xyz -4798.631 2316.71 0 1
 -- Floating Wreckage
(170099,180751,1,-4731.542,2379.842,0,0.157079,0,0,0.07845879,0.9969174,1800,1800,100,1), -- .go xyz -4731.542 2379.842 0 1
 -- Oily Blackmouth School
(170100,180750,1,-4153.145,2618.199,0,2.740162,0,0,0.9799242,0.1993704,1800,3600,100,1), -- .go xyz -4153.145 2618.199 0 1
 -- Stranglekelp
(170101,2045,1,-5043.807,3413.84,-4.433046,0.9599299,0,0,0.4617481,0.8870111,45,90,100,1), -- .go xyz -5043.807 3413.84 -4.433046 1
 -- Oily Blackmouth School
(170102,180750,1,-4295.149,2371.784,0,3.752462,0,0,-0.9537163,0.3007079,1800,3600,100,1), -- .go xyz -4295.149 2371.784 0 1
 -- Purple Lotus
(170103,142140,1,-5027.815,1298.001,90.75114,3.089183,0,0,0.9996567,0.02620165,45,90,100,1), -- .go xyz -5027.815 1298.001 90.75114 1
 -- Firefin Snapper School
(170104,180752,1,-4791.426,1995.787,0,1.151916,0,0,0.5446386,0.8386708,1800,1800,100,1), -- .go xyz -4791.426 1995.787 0 1
 -- Sungrass
(170105,142142,1,-4600.776,1828.188,88.96333,3.42085,0,0,-0.9902678,0.1391754,45,90,100,1), -- .go xyz -4600.776 1828.188 88.96333 1
 -- Sungrass
(170106,142142,1,-4396.301,598.6336,62.97324,1.762782,0,0,0.7716246,0.6360782,45,90,100,1), -- .go xyz -4396.301 598.6336 62.97324 1
 -- Khadgar's Whisker
(170107,2043,1,-4191.154,-295.6196,47.98726,3.752462,0,0,-0.9537163,0.3007079,45,90,100,1), -- .go xyz -4191.154 -295.6196 47.98726 1
 -- Sungrass
(170108,142142,1,-4488.836,-517.1157,13.12978,4.71239,0,0,-0.7071066,0.7071069,45,90,100,1), -- .go xyz -4488.836 -517.1157 13.12978 1
 -- Iron Deposit
(170109,1735,1,-5457.665,-2200.77,-57.57911,3.455756,0,0,-0.9876881,0.1564362,45,90,100,1), -- .go xyz -5457.665 -2200.77 -57.57911 1
 -- Rocket Car Rubble
(170110,19871,1,-5619.273,-3557.651,-58.75002,4.956738,0,0,-0.6156607,0.7880114,300,300,100,1), -- .go xyz -5619.273 -3557.651 -58.75002 1
 -- Rocket Car Rubble
(170111,19873,1,-5640.918,-3576.673,-58.75002,4.625124,0,0,-0.737277,0.6755905,300,300,100,1), -- .go xyz -5640.918 -3576.673 -58.75002 1
 -- Rocket Car Rubble
(170112,19872,1,-5642.042,-3523.452,-58.48676,4.904376,0,0,-0.6360779,0.7716249,300,300,100,1), -- .go xyz -5642.042 -3523.452 -58.48676 1
 -- Rocket Car Rubble
(170113,19868,1,-5857.967,-3578.884,-58.74997,4.136433,0,0,-0.8788166,0.4771597,180,300,100,1), -- .go xyz -5857.967 -3578.884 -58.74997 1
 -- Rocket Car Rubble
(170114,19868,1,-5807.534,-3616.333,-59.8394,3.019413,0,0,0.9981346,0.06105176,180,300,100,1), -- .go xyz -5807.534 -3616.333 -59.8394 1
 -- Rocket Car Rubble
(170115,19873,1,-5834.827,-3694.398,-58.74997,1.361356,0,0,0.6293201,0.7771462,300,300,100,1), -- .go xyz -5834.827 -3694.398 -58.74997 1
 -- Rocket Car Rubble
(170116,19868,1,-6436.917,-3811.532,-58.75005,4.782203,0,0,-0.6819983,0.7313538,180,300,100,1), -- .go xyz -6436.917 -3811.532 -58.75005 1
 -- Solid Chest
(170117,2852,1,-4604.497,-1285.008,-50.52379,2.757613,0,0,0.9816265,0.1908124,7200,7200,100,1); -- .go xyz -4604.497 -1285.008 -50.52379 1

UPDATE `gameobject` SET `patch_min`=9 WHERE `guid` IN (170098, 170100, 170104);
UPDATE `gameobject` SET `patch_min`=7 WHERE `guid` IN (170099, 170102);

INSERT INTO pool_template (`entry`, `max_limit`, `description`) VALUES
(9268, 1, "Rocket Car Rubble - Spawn 1");
INSERT INTO pool_gameobject (`guid`, `pool_entry`, `chance`, `description`) VALUES
(170091, 9268, 0, "Rocket Car Rubble - Spawn 1"),
(170114, 9268, 0, "Rocket Car Rubble - Spawn 1"),
(17059, 9268, 0, "Rocket Car Rubble - Spawn 1");

INSERT INTO pool_template (`entry`, `max_limit`, `description`) VALUES
(9269, 1, "Rocket Car Rubble - Spawn 2");
INSERT INTO pool_gameobject (`guid`, `pool_entry`, `chance`, `description`) VALUES
(170092, 9269, 0, "Rocket Car Rubble - Spawn 2"),
(170111, 9269, 0, "Rocket Car Rubble - Spawn 2"),
(17038, 9269, 0, "Rocket Car Rubble - Spawn 2");

INSERT INTO pool_template (`entry`, `max_limit`, `description`) VALUES
(9270, 1, "Rocket Car Rubble - Spawn 3");
INSERT INTO pool_gameobject (`guid`, `pool_entry`, `chance`, `description`) VALUES
(170093, 9270, 0, "Rocket Car Rubble - Spawn 3"),
(17058, 9270, 0, "Rocket Car Rubble - Spawn 3");

INSERT INTO pool_template (`entry`, `max_limit`, `description`) VALUES
(9271, 1, "Rocket Car Rubble - Spawn 4");
INSERT INTO pool_gameobject (`guid`, `pool_entry`, `chance`, `description`) VALUES
(170094, 9271, 0, "Rocket Car Rubble - Spawn 4"),
(17070, 9271, 0, "Rocket Car Rubble - Spawn 4");

INSERT INTO pool_template (`entry`, `max_limit`, `description`) VALUES
(9273, 1, "Rocket Car Rubble - Spawn 5");
INSERT INTO pool_gameobject (`guid`, `pool_entry`, `chance`, `description`) VALUES
(170110, 9273, 0, "Rocket Car Rubble - Spawn 5"),
(17049, 9273, 0, "Rocket Car Rubble - Spawn 5");

INSERT INTO pool_template (`entry`, `max_limit`, `description`) VALUES
(9274, 1, "Rocket Car Rubble - Spawn 6");
INSERT INTO pool_gameobject (`guid`, `pool_entry`, `chance`, `description`) VALUES
(170112, 9274, 0, "Rocket Car Rubble - Spawn 6"),
(17079, 9274, 0, "Rocket Car Rubble - Spawn 6");

INSERT INTO pool_gameobject (`guid`, `pool_entry`, `chance`, `description`) VALUES
(170095, 1131, 0, "Tin Vein");

INSERT INTO pool_gameobject (`guid`, `pool_entry`, `chance`, `description`, `patch_min`) VALUES
(170098, 68, 0, "Stonescale Eel Swarm", 9);

INSERT INTO pool_gameobject (`guid`, `pool_entry`, `chance`, `description`, `patch_min`) VALUES
(170099, 72, 0, "Floating Wreckage", 7);

INSERT INTO pool_gameobject (`guid`, `pool_entry`, `chance`, `description`, `patch_min`) VALUES
(170100, 47, 0, "Oily Blackmouth School", 9);

INSERT INTO pool_gameobject (`guid`, `pool_entry`, `chance`, `description`) VALUES
(170101, 1190, 0, "Stranglekelp");

INSERT INTO pool_gameobject (`guid`, `pool_entry`, `chance`, `description`, `patch_min`) VALUES
(170102, 242, 0, "Oily Blackmouth School", 7);

INSERT INTO pool_gameobject (`guid`, `pool_entry`, `chance`, `description`) VALUES
(170103, 1324, 0, "Purle Lotus");

INSERT INTO pool_gameobject (`guid`, `pool_entry`, `chance`, `description`, `patch_min`) VALUES
(170104, 245, 0, "Firefin Snapper School", 9);

INSERT INTO pool_gameobject (`guid`, `pool_entry`, `chance`, `description`) VALUES
(170105, 1192, 0, "Sungrass");

INSERT INTO pool_gameobject (`guid`, `pool_entry`, `chance`, `description`) VALUES
(170106, 1192, 0, "Sungrass");

INSERT INTO pool_gameobject (`guid`, `pool_entry`, `chance`, `description`) VALUES
(170107, 1189, 0, "Khadgars Whisker");

INSERT INTO pool_gameobject (`guid`, `pool_entry`, `chance`, `description`) VALUES
(170108, 1192, 0, "Sungrass");

INSERT INTO pool_gameobject (`guid`, `pool_entry`, `chance`, `description`) VALUES
(170109, 1196, 0, "Iron Deposit");


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
