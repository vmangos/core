DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200110160742');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200110160742');
-- Add your query below.


-- Make Flame Buffet stack between casters.
UPDATE `spell_template` SET `customFlags` = `customFlags` | 1 WHERE `entry` IN (9574, 9658, 10452, 16168, 16536, 22433, 22713, 23341, 25651, 25668);

-- Make Sunder Armor stack between casters.
UPDATE `spell_template` SET `customFlags` = `customFlags` | 1 WHERE `entry` IN (7386, 7405, 8380, 11596, 11597, 11971, 13444, 15502, 15572, 16145, 21081, 24317, 25051, 27991);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
