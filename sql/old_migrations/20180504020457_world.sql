DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180504020457');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180504020457');
-- Add your query below.


-- Spells whose first effect increases cast time.
UPDATE `spell_template` SET `effectMechanic1`=32 WHERE `ID` IN (1714, 3603, 5704, 5760, 6069, 8140, 8272, 8692, 11398, 11719, 12255, 12889, 13338, 14538, 15470, 17331, 19365, 25195, 25810);

-- Spells whose second effect increases cast time.
UPDATE `spell_template` SET `effectMechanic2`=32 WHERE `ID` IN (7102, 7103, 10651, 10653, 22642, 23153);

-- Spells whose third effect increases cast time.
UPDATE `spell_template` SET `effectMechanic3`=32 WHERE `ID` IN (7127, 22247, 22909, 24415);

-- World of Warcraft Client Patch 1.12.0 (2006-08-22)
-- Curse of Tongues: This spell will no longer debuff the target if they are immune to the spellcast slowing effect
UPDATE `spell_template` SET `Mechanic`=32 WHERE `ID` IN (1714, 11719, 12889, 13338, 15470, 25195);

-- All raid bosses are immune to slowing cast speeds except The Prophet Skeram.
UPDATE `creature_template` SET `MechanicImmuneMask`=`MechanicImmuneMask`+2147483648 WHERE (`rank`=3) && (`entry` != 15263);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
