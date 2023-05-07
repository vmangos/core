DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230507034435');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230507034435');
-- Add your query below.


-- Use correct rune numbers in Dragonspire Hall, UBRS
UPDATE `gameobject` SET `id`='175198' WHERE `guid`=200003;
UPDATE `gameobject` SET `id`='175196' WHERE `guid`=200002;
UPDATE `gameobject` SET `id`='175194' WHERE `guid`=200001;
UPDATE `gameobject` SET `id`='175200' WHERE `guid`=200004;
UPDATE `gameobject` SET `id`='175195' WHERE `guid`=200007;
UPDATE `gameobject` SET `id`='175197' WHERE `guid`=200006;
UPDATE `gameobject` SET `id`='175199' WHERE `guid`=200005;
-- Fix position of the runes
UPDATE `gameobject` SET `position_x`=215.157, `position_y`=-334.733, `position_z`=76.8124, `orientation`=3.92699, `rotation2`=-0.92388, `rotation3`=0.382683 WHERE `id`=175198;
UPDATE `gameobject` SET `position_x`=228.803, `position_y`=-301.542, `position_z`=76.8812, `orientation`=4.71239, `rotation2`=-0.707107, `rotation3`=0.707107 WHERE `id`=175196;
UPDATE `gameobject` SET `position_z`=76.8603 WHERE `id`=175194;
UPDATE `gameobject` SET `position_x`=155.321, `position_y`=-286.074, `position_z`=70.8763, `orientation`=0, `rotation2`=0, `rotation3`=1 WHERE `id`=175200;
UPDATE `gameobject` SET `position_x`=124.779, `position_y`=-298.037, `position_z`=70.8526, `orientation`=0.785397, `rotation2`=0.382683, `rotation3`=0.92388 WHERE `id`=175195;
UPDATE `gameobject` SET `position_x`=125.358, `position_y`=-340.465, `position_z`=70.8752, `orientation`=2.35619, `rotation2`=0.92388, `rotation3`=0.382683 WHERE `id`=175197;
UPDATE `gameobject` SET `position_x`=155.334, `position_y`=-353.045, `position_z`=70.8337, `orientation`=3.14159, `rotation2`=-1, `rotation3`=0 WHERE `id`=175199;

-- Fix Emberseer In door
UPDATE `gameobject` SET `position_x`=216.443, `position_y`=-286.135, `position_z`=76.9406, `orientation`=3.14159, `rotation2`=0, `rotation3`=-1 WHERE `id`=175244;
-- Use correct runes in Emberseers room
UPDATE `gameobject` SET `id`='175270' WHERE `guid`=397208;
UPDATE `gameobject` SET `id`='175268' WHERE `guid`=397210;
UPDATE `gameobject` SET `id`='175266' WHERE `guid`=397215;
UPDATE `gameobject` SET `id`='175267' WHERE `guid`=397218;
UPDATE `gameobject` SET `id`='175269' WHERE `guid`=397219;
UPDATE `gameobject` SET `id`='175271' WHERE `guid`=397220;
UPDATE `gameobject` SET `id`='175272' WHERE `guid`=397203;

-- Fix Emberseer altar position
UPDATE `gameobject` SET `position_x`=144.445, `position_y`=-280.941, `position_z`=91.5476, `orientation`=1.58825, `rotation2`=0.71325, `rotation3`=0.70091 WHERE `id`=175706;
-- Fix Emberseer Out door
UPDATE `gameobject` SET `position_x`=113.751, `position_y`=-258.945, `position_z`=91.5603, `orientation`=0, `rotation2`=0, `rotation3`=1 WHERE `id`=175153;
-- Fix position of runes in Emberseer room
UPDATE `gameobject` SET `position_x`=162.443, `position_y`=-258.904, `position_z`=91.4701, `orientation`=0, `rotation2`=0, `rotation3`=1 WHERE `id`=175270;
UPDATE `gameobject` SET `position_x`=162.466, `position_y`=-240.765, `position_z`=91.4688, `orientation`=0, `rotation2`=0, `rotation3`=1 WHERE `id`=175268;
UPDATE `gameobject` SET `position_x`=144.375, `position_y`=-240.826, `position_z`=91.4713, `orientation`=0, `rotation2`=0, `rotation3`=1 WHERE `id`=175266;
UPDATE `gameobject` SET `position_x`=126.354, `position_y`=-240.77, `position_z`=91.4701, `orientation`=0, `rotation2`=0, `rotation3`=1 WHERE `id`=175267;
UPDATE `gameobject` SET `position_x`=126.295, `position_y`=-258.732, `position_z`=91.4701, `orientation`=0, `rotation2`=0, `rotation3`=1 WHERE `id`=175269;
UPDATE `gameobject` SET `position_x`=126.402, `position_y`=-276.79, `position_z`=91.4701, `orientation`=0, `rotation2`=0, `rotation3`=1 WHERE `id`=175271;
UPDATE `gameobject` SET `position_x`=162.401, `position_y`=-276.824, `position_z`=91.4701, `orientation`=0, `rotation2`=0, `rotation3`=1 WHERE `id`=175272;

-- Spawn missing door to Emberseer
-- Already scripted, object was just missing previously
INSERT INTO `gameobject` VALUES (260284, 175705, 229, 175.127, -258.945, 91.5603, 0, 0, 0, 0, 1, 25, 25, 100, 0, 0, 0, 0, 10);

-- Spawn missing Bonfire
INSERT INTO `gameobject` VALUES (260285, 136957, 229, 117.454, -254.291, 91.5711, 2.72271, 0, 0, 0.978148, 0.207912, 25, 25, 100, 1, 0, 0, 0, 10);
INSERT INTO `gameobject` VALUES (260286, 136959, 229, 125.656, -280.808, 91.5711, 2.72271, 0, 0, 0.978148, 0.207912, 25, 25, 100, 1, 0, 0, 0, 10);
-- Correct entries for bonfires in Dragonspire Hall, UBRS
UPDATE `gameobject` SET `id`='136966' WHERE `guid`=170017;
UPDATE `gameobject` SET `id`='136965' WHERE `guid`=170016;
UPDATE `gameobject` SET `position_x`=229.028, `position_y`=-307.81, `position_z`=76.9668, `orientation`=2.72271, `rotation2`=0.978148, `rotation3`=0.207912 WHERE `id`=136966;
UPDATE `gameobject` SET `position_x`=215.773, `position_y`=-341.663, `position_z`=76.8611, `orientation`=1.92859, `rotation2`=0.821647, `rotation3`=0.569997 WHERE `id`=136965;
-- Correct bonfire entries at the beast
UPDATE `gameobject` SET `id`='176447' WHERE `guid`=397180;
UPDATE `gameobject` SET `id`='176448' WHERE `guid`=397184;
UPDATE `gameobject` SET `id`='176449' WHERE `guid`=397191;
UPDATE `gameobject` SET `id`='176452' WHERE `guid`=397186;
UPDATE `gameobject` SET `id`='176450' WHERE `guid`=397185;
UPDATE `gameobject` SET `id`='176451' WHERE `guid`=397182;
UPDATE `gameobject` SET `position_x`=35.2499, `position_y`=-505.634, `position_z`=110.914, `orientation`=3.14444, `rotation0`=0.00822973, `rotation1`=-0.0190172, `rotation2`=-0.999784, `rotation3`=0.00126859 WHERE `id`=176447;
UPDATE `gameobject` SET `position_x`=31.283, `position_y`=-505.634, `position_z`=110.914, `orientation`=1.57142, `rotation0`=0.00762796, `rotation1`=0.0192661, `rotation2`=0.707066, `rotation3`=0.706844 WHERE `id`=176448;
UPDATE `gameobject` SET `position_x`=27.4453, `position_y`=-505.634, `position_z`=110.914, `orientation`=6.02201, `rotation0`=0.0199299, `rotation1`=0.00567627, `rotation2`=-0.130342, `rotation3`=0.991252 WHERE `id`=176449;
UPDATE `gameobject` SET `position_x`=24.542, `position_y`=-504.736, `position_z`=110.914, `orientation`=3.92762, `rotation0`=0.0148807, `rotation1`=-0.0144205, `rotation2`=-0.92362, `rotation3`=0.382748 WHERE `id`=176452;
UPDATE `gameobject` SET `position_x`=21.5668, `position_y`=-506.581, `position_z`=110.914, `orientation`=4.71302, `rotation0`=0.0192666, `rotation1`=-0.00762749, `rotation2`=-0.706843, `rotation3`=0.707067 WHERE `id`=176450;
UPDATE `gameobject` SET `position_x`=18.0824, `position_y`=-505.634, `position_z`=110.914, `orientation`=3.14444, `rotation0`=0.00822973, `rotation1`=-0.0190172, `rotation2`=-0.999784, `rotation3`=0.00126859 WHERE `id`=176451;

-- Correct bonfire entry in Hordemar City
UPDATE `gameobject` SET `id`='176438' WHERE `guid`=3998306;
UPDATE `gameobject` SET `position_x`=-23.2051, `position_y`=-410.609, `position_z`=-18.8984, `orientation`=3.14159, `rotation2`=-1, `rotation3`=0 WHERE `id`=176438;

-- Spawn bonfires in the Rockery
INSERT INTO `gameobject` VALUES (260287, 136962, 229, 106.177, -265.953, 91.5711, 4.81711, 0, 0, -0.66913, 0.743145, 25, 25, 100, 1, 0, 0, 0, 10);
INSERT INTO `gameobject` VALUES (260288, 136963, 229, 107.69, -253.095, 91.5711, 2.72271, 0, 0, 0.978148, 0.207912, 25, 25, 100, 1, 0, 0, 0, 10);

-- Drakkisath's Brand position
UPDATE `gameobject` SET `position_x`=41.663, `position_y`=-286.199, `position_z`=110.96, `orientation`=3.49067, `rotation2`=-0.984807, `rotation3`=0.173652 WHERE `id`=179880;

-- Move Blackrock Stadium second gate to correct position, already scripted
-- No longer possible to bypass Blackrock Stadium
UPDATE `gameobject` SET `position_x`=92.9595, `position_y`=-435.59, `position_z`=110.954, `orientation`=4.71239, `rotation2`=-0.707107, `rotation3`=0.707107 WHERE `id`=175186;
-- Add missing gate for Blackrock Stadium, already scripted
-- Now possible to enter Blackrock Stadium without jumping from balcony
INSERT INTO `gameobject` VALUES (258806, 164726, 229, 108.036, -420.331, 110.954, 3.14159, 0, 0, 0, -1, 25, 25, 100, 0, 0, 0, 0, 10);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
