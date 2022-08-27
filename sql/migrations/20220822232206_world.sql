DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220822232206');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220822232206');
-- Add your query below.


-- Assign money loot to gameobjects based on sniffs.
UPDATE `gameobject_template` SET `mingold`=5, `maxgold`=11 WHERE `entry`=19021;
UPDATE `gameobject_template` SET `mingold`=10, `maxgold`=20 WHERE `entry`=2843;
UPDATE `gameobject_template` SET `mingold`=14, `maxgold`=20 WHERE `entry`=179487;
UPDATE `gameobject_template` SET `mingold`=18, `maxgold`=129 WHERE `entry`=128308;
UPDATE `gameobject_template` SET `mingold`=20, `maxgold`=131 WHERE `entry`=128403;
UPDATE `gameobject_template` SET `mingold`=30, `maxgold`=75 WHERE `entry`=106319;
UPDATE `gameobject_template` SET `mingold`=60, `maxgold`=119 WHERE `entry`=2849;
UPDATE `gameobject_template` SET `mingold`=101, `maxgold`=103 WHERE `entry`=111095;
UPDATE `gameobject_template` SET `mingold`=121, `maxgold`=208 WHERE `entry`=2850;
UPDATE `gameobject_template` SET `mingold`=145, `maxgold`=269 WHERE `entry`=2852;
UPDATE `gameobject_template` SET `mingold`=162, `maxgold`=315 WHERE `entry`=2855;
UPDATE `gameobject_template` SET `mingold`=171, `maxgold`=240 WHERE `entry`=75293;
UPDATE `gameobject_template` SET `mingold`=205, `maxgold`=385 WHERE `entry`=2857;
UPDATE `gameobject_template` SET `mingold`=211, `maxgold`=211 WHERE `entry`=4096;
UPDATE `gameobject_template` SET `mingold`=242, `maxgold`=242 WHERE `entry`=105581;
UPDATE `gameobject_template` SET `mingold`=245, `maxgold`=360 WHERE `entry`=75298;
UPDATE `gameobject_template` SET `mingold`=267, `maxgold`=267 WHERE `entry`=105570;
UPDATE `gameobject_template` SET `mingold`=381, `maxgold`=395 WHERE `entry`=75299;
UPDATE `gameobject_template` SET `mingold`=388, `maxgold`=388 WHERE `entry`=74448;
UPDATE `gameobject_template` SET `mingold`=401, `maxgold`=791 WHERE `entry`=4149;
UPDATE `gameobject_template` SET `mingold`=568, `maxgold`=777 WHERE `entry`=75300;
UPDATE `gameobject_template` SET `mingold`=816, `maxgold`=1594 WHERE `entry`=153454;
UPDATE `gameobject_template` SET `mingold`=980, `maxgold`=1461 WHERE `entry`=153453;
UPDATE `gameobject_template` SET `mingold`=1628, `maxgold`=2366 WHERE `entry`=153464;
UPDATE `gameobject_template` SET `mingold`=1879, `maxgold`=1879 WHERE `entry`=153469;
UPDATE `gameobject_template` SET `mingold`=8751, `maxgold`=8751 WHERE `entry`=179697;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
