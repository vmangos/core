DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180709163429');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180709163429');
-- Add your query below.

UPDATE `item_template` SET `spellppmRate_1` = 2 WHERE `entry` = 19334;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
