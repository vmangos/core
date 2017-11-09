DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171108192712');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171108192712');
-- Add your query below.

UPDATE `creature` SET `position_y`='143.4118', `position_z`='-5.208041' WHERE `guid`='25607';

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
