DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180102015424');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180102015424');
-- Add your query below.

-- Give enough mana to Crushridge Mage 37-38 elite entry 2255
UPDATE `creature_template` SET `minmana`='2861', `maxmana`='2975' WHERE `entry`='2255';

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
