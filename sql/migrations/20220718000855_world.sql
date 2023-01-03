DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220718000855');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220718000855');
-- Add your query below.


-- Restore old period for Grom'Gol Base Camp to Undercity transport.
UPDATE `transports` SET `period`=333044 WHERE `entry`=176495;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
