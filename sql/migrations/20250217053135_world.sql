DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250217053135');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250217053135');
-- Add your query below.


-- Script for Hunter's Wyvern Sting.
UPDATE `spell_template` SET `script_name`='spell_hunter_wyvern_sting' WHERE `entry` IN (19386, 24132, 24133) && `build` >= 4695;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
