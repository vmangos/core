DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240329131510');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20240329131510');
-- Add your query below.

-- Set QUEST_METHOD_DISABLED flag for 2358 Horns of Nez'ra
UPDATE `quest_template` SET `Method`=1 WHERE `entry`=2358 AND `patch`=0;

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
