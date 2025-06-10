DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250516013643');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250516013643');
-- Add your query below.


-- Delete custom creature Vam.
DELETE FROM `creature_template` WHERE `entry`=15547;
DELETE FROM `creature_onkill_reputation` WHERE `creature_id`=15547;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
