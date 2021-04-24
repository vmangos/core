DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200514192359');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200514192359');
-- Add your query below.


-- Update Zealot Lor'Khan and Zealot Zath respawn time to match Thekal.
UPDATE `creature` SET `spawntimesecsmin`=259200, `spawntimesecsmax`=259200 WHERE `id` IN (11347, 11348);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
