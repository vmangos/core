DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260317185656');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260317185656');
-- Add your query below.


-- Scourge Archer should be immune to players.
UPDATE `creature_template` SET `static_flags1`=292 WHERE `entry`=14489;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
