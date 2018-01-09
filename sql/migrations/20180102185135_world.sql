DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180102185135');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180102185135');
-- Add your query below.

UPDATE `item_template` SET `spellcategory_1` = 79 WHERE `entry` = 3386;
UPDATE `item_template` SET `spellcategorycooldown_1` = 3000 WHERE `entry` = 3386;
UPDATE `item_template` SET `spellcooldown_1` = 0 WHERE `entry` = 3386;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
