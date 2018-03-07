DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171220073634');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171220073634');
-- Add your query below.

UPDATE `item_template` SET `spellppmRate_1` = 6.5 WHERE `entry` = 19019 AND `patch` = 4;
UPDATE `item_template` SET `spellppmRate_1` = 8 WHERE `entry` = 19019 and `patch` = 10;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
