DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240212124141');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20240212124141');
-- Add your query below.


-- Do not remove Amorous auras on evade.
UPDATE `spell_template` SET `customFlags` = (`customFlags` | 1024) WHERE `entry` IN (26870, 27742, 26869);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
