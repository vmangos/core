DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190530190952');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190530190952');
-- Add your query below.


-- These mobs are missing their walk speed.
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2;
UPDATE `creature_template` SET `speed_walk`=1.5 WHERE `entry`=7293;
UPDATE `creature_template` SET `speed_walk`=1.14 WHERE `entry`=10370;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11502;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12276;
UPDATE `creature_template` SET `speed_walk`=0.001 WHERE `entry`=14987;
UPDATE `creature_template` SET `speed_walk`=0.001 WHERE `entry`=15112;
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE `entry`=15729;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15803;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16103;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16143;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17255;
UPDATE `creature_template` SET `speed_walk`=0.001 WHERE `entry`=20005;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20006;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20009;
UPDATE `creature_template` SET `speed_walk`=0.001 WHERE `entry`=1000000;

-- These mobs are missing their run speed.
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=7293;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=10370;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=14987;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=15112;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=15729;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=15803;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=17255;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=20005;
UPDATE `creature_template` SET `speed_run`=2.28571 WHERE `entry`=20006;
UPDATE `creature_template` SET `speed_run`=1.29 WHERE `entry`=20009;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=1000000;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
