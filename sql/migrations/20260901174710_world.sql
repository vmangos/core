DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260901174710');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260901174710');
-- Add your query below.

UPDATE `creature_template` SET `ai_name` = '' WHERE `entry` IN (2941,10042,10378);
DELETE FROM `creature_movement` WHERE `id` = 40706;

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
