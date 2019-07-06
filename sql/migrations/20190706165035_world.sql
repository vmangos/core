DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190706165035');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190706165035');
-- Add your query below.


-- Remove player controlled flag from Nathanos Blightcaller and his pets.
UPDATE `creature_template` SET `unit_flags`=4160 WHERE `entry` IN (11885, 11878, 12208);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
