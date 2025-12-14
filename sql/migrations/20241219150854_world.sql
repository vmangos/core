DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20241219150854');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20241219150854');
-- Add your query below.


-- Remove Double Mail Vest from Mithril Lockbox.
DELETE FROM `reference_loot_template` WHERE `entry`=2061;
DELETE FROM `item_loot_template` WHERE `item`=2061;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
