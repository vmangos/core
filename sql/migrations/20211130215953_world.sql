DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20211130215953');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20211130215953');
-- Add your query below.


-- Add support for spawn spells.
ALTER TABLE `creature_template`
	ADD COLUMN `spawn_spell_id` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Spell with effect 46 that will be cast immediately upon spawning. Creature will remain unattackable until the cast finishes.' AFTER `pet_spell_list_id`;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
