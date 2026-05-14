DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260514000111');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260514000111');
-- Add your query below.


ALTER TABLE `spell_threat`
	CHANGE COLUMN `Threat` `threat` FLOAT NOT NULL DEFAULT '0' COMMENT 'flat threat bonus' AFTER `entry`,
	ADD COLUMN `inverse_effect_mask` TINYINT UNSIGNED NOT NULL DEFAULT '0' COMMENT 'mask for effect indexes to which flat threat bonus does not apply' AFTER `multiplier`,
	DROP COLUMN `ap_bonus`;

UPDATE `spell_threat` SET `inverse_effect_mask`=1 WHERE `entry`=126;
UPDATE `spell_threat` SET `inverse_effect_mask`=1 WHERE `entry`=6196;
UPDATE `spell_threat` SET `inverse_effect_mask`=2 WHERE `entry`=22812;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
