DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20231118120957');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20231118120957');
-- Add your query below.


-- Add separate immunity flags column so we can move them out of extra flags.
ALTER TABLE `creature_template`
	ADD COLUMN `immunity_flags` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `school_immune_mask`;

-- Move CREATURE_FLAG_EXTRA_IMMUNE_AOE to CREATURE_IMMUNITY_AOE.
UPDATE `creature_template` SET `immunity_flags`=(`immunity_flags` | 1), `flags_extra`=(`flags_extra` & ~16384) WHERE (`flags_extra` & 16384);

-- Move CREATURE_FLAG_EXTRA_NOT_TAUNTABLE to CREATURE_IMMUNITY_TAUNT.
UPDATE `creature_template` SET `immunity_flags`=(`immunity_flags` | 2), `flags_extra`=(`flags_extra` & ~256) WHERE (`flags_extra` & 256);

-- Move MECHANIC_SLOW_CAST_SPEED to CREATURE_IMMUNITY_MOD_CAST_SPEED.
UPDATE `creature_template` SET `immunity_flags`=(`immunity_flags` | 8), `mechanic_immune_mask`=(`mechanic_immune_mask` & ~(1 << (31 - 1))) WHERE (`mechanic_immune_mask` & (1 << (31 - 1)));

-- Remove custom mechanic from spells.
UPDATE `spell_template` SET `mechanic`=0 WHERE `mechanic`=31;
UPDATE `spell_template` SET `effectMechanic1`=0 WHERE `effectMechanic1`=31;
UPDATE `spell_template` SET `effectMechanic2`=0 WHERE `effectMechanic2`=31;
UPDATE `spell_template` SET `effectMechanic3`=0 WHERE `effectMechanic3`=31;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
