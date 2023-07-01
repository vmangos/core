DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20221231090038');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20221231090038');
-- Add your query below.


-- Aura of the Blue Dragon
UPDATE `spell_proc_event` SET `procFlags`=0, `procEx`=524288 WHERE `entry`=23688;

-- Prevent periodic spells from triggering Aspect of the Cheetah or Pack.
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`, `build_min`) VALUES (5118, 0, 0, 0, 0, 0, 0, 131075, 0, 0, 0, 5086);
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`, `build_min`) VALUES (13159, 0, 0, 0, 0, 0, 0, 131075, 0, 0, 0, 5086);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
