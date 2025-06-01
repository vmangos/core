DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250418172108');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250418172108');
-- Add your query below.

-- Correct levelrange for Morbent Fel Pre 1.6

UPDATE `creature_template` SET `level_max`=35 WHERE  `entry`=1200 AND `patch`=0;

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
