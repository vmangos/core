DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200530130429');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200530130429');
-- Add your query below.


-- Remove non blizzlike Black Lotus spawns.
DELETE FROM `pool_template` WHERE `entry`=1335;
DELETE FROM `pool_gameobject` WHERE `pool_entry`=1335;
DELETE FROM `pool_gameobject` WHERE `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id`=176589 && `guid` NOT IN (3998078, 3998081, 3998084, 3998085, 3998087, 3998088, 3998089, 3998090, 3998091, 3998092, 3998143, 3998144, 3998148, 3998149, 3998152, 3998153, 3998156, 3998157, 3998176, 3998187, 3998193, 3998194, 3998197, 3998202, 3998203, 3998204, 3998205, 3998206, 3998221, 3998224, 3998244, 3998245, 3998246, 3998248, 3998249, 3998250, 3998251, 3998252, 3998253, 3998254));
DELETE FROM `gameobject` WHERE `id`=176589 && `guid` NOT IN (3998078, 3998081, 3998084, 3998085, 3998087, 3998088, 3998089, 3998090, 3998091, 3998092, 3998143, 3998144, 3998148, 3998149, 3998152, 3998153, 3998156, 3998157, 3998176, 3998187, 3998193, 3998194, 3998197, 3998202, 3998203, 3998204, 3998205, 3998206, 3998221, 3998224, 3998244, 3998245, 3998246, 3998248, 3998249, 3998250, 3998251, 3998252, 3998253, 3998254);

-- Remove flags.
UPDATE `pool_gameobject` SET `flags`=0 WHERE `guid` IN (3998078, 3998081, 3998084, 3998085, 3998087, 3998088, 3998089, 3998090, 3998091, 3998092, 3998143, 3998144, 3998148, 3998149, 3998152, 3998153, 3998156, 3998157, 3998176, 3998187, 3998193, 3998194, 3998197, 3998202, 3998203, 3998204, 3998205, 3998206, 3998221, 3998224, 3998244, 3998245, 3998246, 3998248, 3998249, 3998250, 3998251, 3998252, 3998253, 3998254);

-- Silithus
UPDATE `gameobject` SET `position_x`=-6503.459, `position_y`=1821.451, `position_z`=3.628 WHERE `guid`=3998078;
UPDATE `gameobject` SET `position_x`=-7046.275, `position_y`=1135.971, `position_z`=5.381 WHERE `guid`=3998081;
UPDATE `gameobject` SET `position_x`=-7202.797, `position_y`=342.116, `position_z`=39.658 WHERE `guid`=3998084;
UPDATE `gameobject` SET `position_x`=-7126.821, `position_y`=742.405, `position_z`=10.661 WHERE `guid`=3998085;
UPDATE `gameobject` SET `position_x`=-7893.396, `position_y`=374.002, `position_z`=-38.107 WHERE `guid`=3998087;
UPDATE `gameobject` SET `position_x`=-7933.843, `position_y`=1167.590, `position_z`=2.253 WHERE `guid`=3998088;
UPDATE `gameobject` SET `position_x`=-8079.081, `position_y`=955.209, `position_z`=51.852 WHERE `guid`=3998089;
UPDATE `gameobject` SET `position_x`=-7924.166, `position_y`=1851.909, `position_z`=5.441 WHERE `guid`=3998090;
UPDATE `gameobject` SET `position_x`=-7367.635, `position_y`=1204.644, `position_z`=-1.235 WHERE `guid`=3998091;
UPDATE `gameobject` SET `position_x`=-7319.465, `position_y`=1641.686, `position_z`=-31.032 WHERE `guid`=3998092;

-- Eastern Plaguelands
UPDATE `gameobject` SET `position_x`=2598.645, `position_y`=-5515.229, `position_z`=158.735 WHERE `guid`=3998143;
UPDATE `gameobject` SET `position_x`=3004.212, `position_y`=-4925.841, `position_z`=103.860 WHERE `guid`=3998144;
UPDATE `gameobject` SET `position_x`=3151.037, `position_y`=-3726.771, `position_z`=133.603 WHERE `guid`=3998148;
UPDATE `gameobject` SET `position_x`=3032.343, `position_y`=-3219.785, `position_z`=146.509 WHERE `guid`=3998149;
UPDATE `gameobject` SET `position_x`=2054.866, `position_y`=-4496.927, `position_z`=74.723 WHERE `guid`=3998152;
UPDATE `gameobject` SET `position_x`=1661.880, `position_y`=-5587.400, `position_z`=101.912 WHERE `guid`=3998153;
UPDATE `gameobject` SET `position_x`=1604.082, `position_y`=-3252.367, `position_z`=86.589 WHERE `guid`=3998156;
UPDATE `gameobject` SET `position_x`=2494.083, `position_y`=-3831.592, `position_z`=179.246 WHERE `guid`=3998157;
UPDATE `gameobject` SET `position_x`=2514.067, `position_y`=-5150.637, `position_z`=74.152 WHERE `guid`=3998176;
UPDATE `gameobject` SET `position_x`=2920.716, `position_y`=-3691.815, `position_z`=114.765 WHERE `guid`=3998187;

-- Winterspring
UPDATE `gameobject` SET `position_x`=6569.668, `position_y`=-5107.470, `position_z`=770.536 WHERE `guid`=3998193;
UPDATE `gameobject` SET `position_x`=6800.048, `position_y`=-5163.950, `position_z`=733.760 WHERE `guid`=3998194;
UPDATE `gameobject` SET `position_x`=8089.144, `position_y`=-3824.404, `position_z`=696.441 WHERE `guid`=3998197;
UPDATE `gameobject` SET `position_x`=6626.889, `position_y`=-4028.380, `position_z`=660.008 WHERE `guid`=3998202;
UPDATE `gameobject` SET `position_x`=6189.889, `position_y`=-4408.297, `position_z`=670.791 WHERE `guid`=3998203;
UPDATE `gameobject` SET `position_x`=5687.547, `position_y`=-4513.686, `position_z`=765.079 WHERE `guid`=3998204;
UPDATE `gameobject` SET `position_x`=5489.206, `position_y`=-4935.936, `position_z`=854.791 WHERE `guid`=3998205;
UPDATE `gameobject` SET `position_x`=5038.893, `position_y`=-4860.597, `position_z`=874.446 WHERE `guid`=3998206;
UPDATE `gameobject` SET `position_x`=6440.067, `position_y`=-3168.576, `position_z`=572.558 WHERE `guid`=3998221;
UPDATE `gameobject` SET `position_x`=6852.803, `position_y`=-2499.037, `position_z`=562.208 WHERE `guid`=3998224;

-- Burning Steppes
UPDATE `gameobject` SET `position_x`=-8240.036, `position_y`=-1760.804, `position_z`=146.609 WHERE `guid`=3998244;
UPDATE `gameobject` SET `position_x`=-8233.903, `position_y`=-1955.147, `position_z`=143.781 WHERE `guid`=3998245;
UPDATE `gameobject` SET `position_x`=-8235.749, `position_y`=-1190.465, `position_z`=142.556 WHERE `guid`=3998246;
UPDATE `gameobject` SET `position_x`=-7941.258, `position_y`=-877.766, `position_z`=129.779 WHERE `guid`=3998248;
UPDATE `gameobject` SET `position_x`=-7622.644, `position_y`=-708.244, `position_z`=182.917 WHERE `guid`=3998249;
UPDATE `gameobject` SET `position_x`=-7990.535, `position_y`=-1306.056, `position_z`=133.762 WHERE `guid`=3998250;
UPDATE `gameobject` SET `position_x`=-7704.629, `position_y`=-1527.916, `position_z`=132.998 WHERE `guid`=3998251;
UPDATE `gameobject` SET `position_x`=-7752.025, `position_y`=-2119.128, `position_z`=133.439 WHERE `guid`=3998252;
UPDATE `gameobject` SET `position_x`=-7957.851, `position_y`=-2506.252, `position_z`=133.923 WHERE `guid`=3998253;
UPDATE `gameobject` SET `position_x`=-7773.808, `position_y`=-2697.771, `position_z`=173.821 WHERE `guid`=3998254;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
