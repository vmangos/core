DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180204073550');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180204073550');
-- Add your query below.


ALTER TABLE `creature_movement_scripts`
	ADD COLUMN `condition_id` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `o`;
ALTER TABLE `creature_spells_scripts`
	ADD COLUMN `condition_id` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `o`;
ALTER TABLE `gossip_scripts`
	ADD COLUMN `condition_id` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `o`;
ALTER TABLE `gameobject_scripts`
	ADD COLUMN `condition_id` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `o`;
ALTER TABLE `event_scripts`
	ADD COLUMN `condition_id` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `o`;
ALTER TABLE `spell_scripts`
	ADD COLUMN `condition_id` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `o`;
ALTER TABLE `quest_end_scripts`
	ADD COLUMN `condition_id` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `o`;
ALTER TABLE `quest_start_scripts`
	ADD COLUMN `condition_id` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `o`;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
