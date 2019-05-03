DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190503045304');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190503045304');
-- Add your query below.


-- Add dummy spell to item.
UPDATE `item_template` SET `spellid_1`=18282 WHERE `entry`=77757;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
