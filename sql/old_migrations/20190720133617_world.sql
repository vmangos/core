DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190720133617');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190720133617');
-- Add your query below.


-- Prevent spawning zombies multiple times from Shallow Grave trap.
UPDATE `gameobject_template` SET `data4`=1 WHERE `entry`=128972;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
