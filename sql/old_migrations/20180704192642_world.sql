DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180704192642');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180704192642');
-- Add your query below.

UPDATE `item_template` SET `spellid_1`='15280' WHERE `entry`=17076 AND `patch`=0;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
