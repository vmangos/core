DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250217055128');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250217055128');
-- Add your query below.


-- Script for Hunter's Readiness.
UPDATE `spell_template` SET `script_name`='spell_hunter_readiness' WHERE `entry`=23989;

-- Script for Hunter's Refocus.
UPDATE `spell_template` SET `script_name`='spell_hunter_refocus' WHERE `entry`=24531;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
