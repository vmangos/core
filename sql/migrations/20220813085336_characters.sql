DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220813085336');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220813085336');
-- Add your query below.


-- Add spell crit to exported character stats table.
ALTER TABLE `character_stats`
	ADD COLUMN `spell_crit_chance` FLOAT NOT NULL DEFAULT '0' AFTER `ranged_crit_chance`;

-- Add bonus spell damage and healing to exported character stats table.
ALTER TABLE `character_stats`
	ADD COLUMN `spell_damage` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `ranged_attack_power`,
	ADD COLUMN `spell_healing` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `spell_damage`;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
