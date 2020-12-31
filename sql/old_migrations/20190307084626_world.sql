DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190307084626');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190307084626');
-- Add your query below.


-- Add flag to mail stationary items.
UPDATE `item_template` SET `extra_flags`=`extra_flags`+8 WHERE `entry` IN (8164, 9311, 18154, 21140, 22058);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
