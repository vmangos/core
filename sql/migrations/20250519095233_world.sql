DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250519095233');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250519095233');
-- Add your query below.


-- Remove triggered flag from goblin bombs.
UPDATE `item_template` SET `extra_flags`=0 WHERE `entry` IN (4403, 10577);
UPDATE `spell_template` SET `script_name`='spell_instant_cast' WHERE `entry` IN (4067, 13237);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
