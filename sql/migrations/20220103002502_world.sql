DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220103002502');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220103002502');
-- Add your query below.


-- Add priority field to scripts to allow defining order of execution of commands with same delay.
ALTER TABLE `creature_ai_scripts`
	ADD COLUMN `priority` TINYINT UNSIGNED NOT NULL DEFAULT '0' AFTER `delay`;
ALTER TABLE `creature_movement_scripts`
	ADD COLUMN `priority` TINYINT UNSIGNED NOT NULL DEFAULT '0' AFTER `delay`;
ALTER TABLE `creature_spells_scripts`
	ADD COLUMN `priority` TINYINT UNSIGNED NOT NULL DEFAULT '0' AFTER `delay`;
ALTER TABLE `event_scripts`
	ADD COLUMN `priority` TINYINT UNSIGNED NOT NULL DEFAULT '0' AFTER `delay`;
ALTER TABLE `generic_scripts`
	ADD COLUMN `priority` TINYINT UNSIGNED NOT NULL DEFAULT '0' AFTER `delay`;
ALTER TABLE `gossip_scripts`
	ADD COLUMN `priority` TINYINT UNSIGNED NOT NULL DEFAULT '0' AFTER `delay`;
ALTER TABLE `gameobject_scripts`
	ADD COLUMN `priority` TINYINT UNSIGNED NOT NULL DEFAULT '0' AFTER `delay`;
ALTER TABLE `spell_scripts`
	ADD COLUMN `priority` TINYINT UNSIGNED NOT NULL DEFAULT '0' AFTER `delay`;
ALTER TABLE `quest_end_scripts`
	ADD COLUMN `priority` TINYINT UNSIGNED NOT NULL DEFAULT '0' AFTER `delay`;
ALTER TABLE `quest_start_scripts`
	ADD COLUMN `priority` TINYINT UNSIGNED NOT NULL DEFAULT '0' AFTER `delay`;

-- Grand Inquisitor Isillien remove unit flags before starting attack.
UPDATE `creature_ai_scripts` SET `priority`=1 WHERE `id`=184002 && `command`=26;
-- Crimson Elite remove unit flags before starting attack.
UPDATE `creature_ai_scripts` SET `priority`=1 WHERE `id`=1212801 && `command`=26;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
