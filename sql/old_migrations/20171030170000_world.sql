DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171030170000');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171030170000');
-- Add your query below.

UPDATE `quest_template` SET `RewRepValue1` = '25' WHERE `entry` IN (5218,5221,5224,5227);

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
