DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240824124902');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20240824124902');
-- Add your query below.

-- Savannah Huntress: Remove UNIT_STAND_STATE_SLEEP for creatures with random movement
DELETE FROM `creature_addon` WHERE `guid` IN (14119,14117,14116,14108);

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
