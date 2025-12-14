DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250321173801');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250321173801');
-- Add your query below.

-- Yeh'kinya Tanaris
DELETE FROM `script_texts` WHERE `entry` = -1108998; -- 10457: Blood and souls for Hakkar!  HAHAHAH!
DELETE FROM `script_texts` WHERE `entry` = -1108999; -- 10456: It is true, $n.  The wheels of doom now turn, inevitably, toward the true return of Hakkar!

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
