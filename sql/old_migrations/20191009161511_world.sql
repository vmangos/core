DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20191009161511');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20191009161511');
-- Add your query below.


-- Correct beast family for all creatures.
UPDATE `creature_template` SET `beast_family`=0 WHERE `entry`=356;
UPDATE `creature_template` SET `beast_family`=0 WHERE `entry`=359;
UPDATE `creature_template` SET `beast_family`=0 WHERE `entry`=2044;
UPDATE `creature_template` SET `beast_family`=0 WHERE `entry`=2671;
UPDATE `creature_template` SET `beast_family`=0 WHERE `entry`=2673;
UPDATE `creature_template` SET `beast_family`=0 WHERE `entry`=3625;
UPDATE `creature_template` SET `beast_family`=0 WHERE `entry`=4277;
UPDATE `creature_template` SET `beast_family`=0 WHERE `entry`=4627;
UPDATE `creature_template` SET `beast_family`=0 WHERE `entry`=16372;
UPDATE `creature_template` SET `beast_family`=0 WHERE `entry`=5764;
UPDATE `creature_template` SET `beast_family`=0 WHERE `entry`=5781;
UPDATE `creature_template` SET `beast_family`=0 WHERE `entry`=16377;
UPDATE `creature_template` SET `beast_family`=0 WHERE `entry`=16371;
UPDATE `creature_template` SET `beast_family`=0 WHERE `entry`=16779;
UPDATE `creature_template` SET `beast_family`=0 WHERE `entry`=7376;
UPDATE `creature_template` SET `beast_family`=0 WHERE `entry`=8437;
UPDATE `creature_template` SET `beast_family`=0 WHERE `entry`=9521;
UPDATE `creature_template` SET `beast_family`=0 WHERE `entry`=10657;
UPDATE `creature_template` SET `beast_family`=2 WHERE `entry`=10992;
UPDATE `creature_template` SET `beast_family`=0 WHERE `entry`=11836;
UPDATE `creature_template` SET `beast_family`=0 WHERE `entry`=12397;
UPDATE `creature_template` SET `beast_family`=26 WHERE `entry`=14283;
UPDATE `creature_template` SET `beast_family`=24 WHERE `entry`=14750;
UPDATE `creature_template` SET `beast_family`=3 WHERE `entry`=15041;
UPDATE `creature_template` SET `beast_family`=0 WHERE `entry`=16446;
UPDATE `creature_template` SET `beast_family`=0 WHERE `entry`=16036;
UPDATE `creature_template` SET `beast_family`=0 WHERE `entry`=5407;
UPDATE `creature_template` SET `beast_family`=0 WHERE `entry`=10985;
UPDATE `creature_template` SET `beast_family`=0 WHERE `entry`=3573;
UPDATE `creature_template` SET `beast_family`=0 WHERE `entry`=5879;
UPDATE `creature_template` SET `beast_family`=0 WHERE `entry`=5929;
UPDATE `creature_template` SET `beast_family`=0 WHERE `entry`=6112;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
