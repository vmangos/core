DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180218164903');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180218164903');
-- Add your query below.

ALTER TABLE `autobroadcast` CHANGE COLUMN `commentaire` `comments` VARCHAR(255) NULL DEFAULT NULL AFTER `stringId`;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
