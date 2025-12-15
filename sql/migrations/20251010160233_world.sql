DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20251010160233');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20251010160233');
-- Add your query below.


-- Add missing icon name field to gameobjects. It was added in 1.12.
ALTER TABLE `gameobject_template`
	ADD COLUMN `icon` VARCHAR(100) NOT NULL DEFAULT '' AFTER `name`;

-- Add missing icons to Silithyst Mound and Silithyst Geyser.
UPDATE `gameobject_template` SET `icon`='PVP' WHERE `entry` IN (181597, 181598);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
