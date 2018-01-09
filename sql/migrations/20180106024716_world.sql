DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180106024716');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180106024716');
-- Add your query below.

UPDATE `item_template` SET `spellid_1` = 13669 WHERE `entry` = 16866 AND `patch` = 3;
UPDATE `item_template` SET `spellid_2` = 13390 WHERE `entry` = 16866 AND `patch` = 3;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
