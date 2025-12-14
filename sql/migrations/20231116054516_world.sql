DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20231116054516');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20231116054516');
-- Add your query below.


ALTER TABLE `spell_proc_event`
	DROP PRIMARY KEY,
	ADD PRIMARY KEY (`entry`, `build_min`, `build_max`);

/*
World of Warcraft Client Patch 1.10.0 (2006-03-28)
- If a paladin avoids damage with Divine Shield, Eye for an Eye will
  not react.
*/
-- Eye for an Eye should proc from absorbed crits too.
DELETE FROM `spell_proc_event` WHERE `entry`=9799;
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`, `build_min`, `build_max`) VALUES (9799, 0, 0, 0, 0, 0, 131072, 1282, 0, 0, 0, 5086, 5086);
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`, `build_min`, `build_max`) VALUES (9799, 0, 0, 0, 0, 0, 0, 1026, 0, 0, 0, 5302, 5875);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
