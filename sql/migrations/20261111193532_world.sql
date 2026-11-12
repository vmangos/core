DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20261111193532');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20261111193532');
-- Add your query below.


-- Rename Fixed Z cheat to Disable Gravity.
UPDATE `mangos_string` SET `content_default`='You set disable gravity mode to %s for %s.' WHERE `entry`=611;
UPDATE `mangos_string` SET `content_default`='Your disable gravity mode has been turned %s by %s.' WHERE `entry`=612;
UPDATE `mangos_string` SET `content_default`='DISABLE GRAVITY cheat is ON' WHERE `entry`=613;
UPDATE `mangos_string` SET `content_default`='DISABLE GRAVITY cheat is OFF' WHERE `entry`=614;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
