DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260820165456');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260820165456');
-- Add your query below.


-- Use default display id scales for Trick - Critter.
UPDATE `creature_template` SET `display_scale1`=0, `display_scale2`=0, `display_scale3`=0, `display_scale4`=0 WHERE `entry`=15219;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
