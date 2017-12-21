DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171202085405');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171202085405');
-- Add your query below.

UPDATE `spell_proc_event` SET `procFlags` = 69632 WHERE `entry` = 11213;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
