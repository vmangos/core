DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20170929190759');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20170929190759');
-- Add your query below.


ALTER TABLE `item_instance`
	CHANGE COLUMN `text` `text` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `durability`;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
