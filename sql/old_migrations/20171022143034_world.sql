DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171022143034');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171022143034');
-- Add your query below.

-- AV mine layer no respawn
UPDATE `creature` SET `spawntimesecs`=432000 WHERE `guid`=1247068;
UPDATE `creature` SET `spawntimesecs`=432000 WHERE `guid`=1247067;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
