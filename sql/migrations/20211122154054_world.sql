DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20211122154054');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20211122154054');
-- Add your query below.


UPDATE `pool_template` SET `description` = 'Lupos (521)' WHERE  `entry`=521;
UPDATE `pool_template` SET `description` = 'Darbel Montrose (2598)' WHERE  `entry`=2598;
UPDATE `pool_template` SET `description` = 'Zalas Witherbark (2605)' WHERE  `entry`=2605;
UPDATE `pool_template` SET `description` = 'Nimar the Slayer (2606)' WHERE  `entry`=2606;
UPDATE `pool_template` SET `description` = 'Prince Nazjak (2779)' WHERE  `entry`=2779;
UPDATE `pool_template` SET `description` = 'Broken Tooth (2850)' WHERE  `entry`=2850;
UPDATE `pool_template` SET `description` = 'Kernobee (7850)' WHERE  `entry`=9002;
UPDATE `pool_template` SET `description` = 'Lady Anacondra (10004)' WHERE  `entry`=10004;
UPDATE `pool_template` SET `description` = 'Lorgus Jett (12902)' WHERE  `entry`=12902;
UPDATE `pool_template` SET `description` = 'Araga (14222)' WHERE  `entry`=14222;
UPDATE `pool_template` SET `description` = 'Jimmy the Bleeder (14281)' WHERE  `entry`=14281;
UPDATE `pool_template` SET `description` = 'Hearthsinger Forresten (25468)' WHERE  `entry`=25468;
UPDATE `pool_template` SET `description` = 'Drogoth the Roamer (42939)' WHERE  `entry`=42939;
UPDATE `pool_template` SET `description` = 'Ripscale (43157)' WHERE  `entry`=43157;
UPDATE `pool_template` SET `description` = 'Burgle Eye (43517)' WHERE  `entry`=43517;
UPDATE `pool_template` SET `description` = 'The Abominable Greench (13602)' WHERE  `entry`=43525;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
