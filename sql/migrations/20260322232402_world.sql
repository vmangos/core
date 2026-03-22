DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260322232402');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260322232402');
-- Add your query below.

UPDATE `creature_template` SET `subname`=NULL WHERE `entry`=10540 AND `patch`=0;

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
