DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180914172420');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180914172420');
-- Add your query below.


-- Add build column to spell group tables.
ALTER TABLE `spell_group`
	ADD COLUMN `build_min` SMALLINT(4) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Minimum game client build to load this entry' AFTER `spell_id`,
	ADD COLUMN `build_max` SMALLINT(4) UNSIGNED NOT NULL DEFAULT '5875' COMMENT 'Maximum game client build to load this entry' AFTER `build_min`;
ALTER TABLE `spell_group_stack_rules`
	ADD COLUMN `build` SMALLINT(4) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Game client build in which this exact stacking rule was added' AFTER `group_id`,
	DROP PRIMARY KEY,
	ADD PRIMARY KEY (`group_id`, `build`);


-- World of Warcraft Client Patch 1.11.0 (2006-06-20)
--  "Arcane Power: This ability will no longer stack with Power Infusion. 
--   If you gain both at the same time, Arcane Power will take precedence."
-- World of Warcraft Client Patch 1.10.2 (2006-05-02)
--  "Arcane Power: This aura will no longer stack with Power Infusion."
UPDATE `spell_group` SET `build_min`=5302 WHERE `group_id`=1063;
UPDATE `spell_group_stack_rules` SET `build`=5302 WHERE `group_id`=1063;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
