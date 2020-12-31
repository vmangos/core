DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200405010434');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200405010434');
-- Add your query below.


-- Vectus, Marduk Blackpool and Scholomance Student are non hostile by default.
UPDATE `creature_template` SET `faction`=15 WHERE `entry` IN (10432, 10433, 10475);

-- Torek and Splintertree Raider are faction 83 by default and change to 1174 when escort quest starts.
UPDATE `creature_template` SET `faction`=83 WHERE `entry` IN (12858, 12859);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
