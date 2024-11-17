DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20241117202208');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20241117202208');
-- Add your query below.

-- Moss Covered Feet - add SPELL_ATTR_EX_AURA_UNIQUE
INSERT INTO `spell_mod` (`Id`, `procChance`, `procFlags`, `procCharges`, `DurationIndex`, `Category`, `CastingTimeIndex`, `StackAmount`, `SpellIconID`, `activeIconID`, `manaCost`, `Attributes`, `AttributesEx`, `AttributesEx2`, `AttributesEx3`, `AttributesEx4`, `Custom`, `InterruptFlags`, `AuraInterruptFlags`, `ChannelInterruptFlags`, `Dispel`, `Stances`, `StancesNot`, `SpellVisual`, `ManaCostPercentage`, `StartRecoveryCategory`, `StartRecoveryTime`, `MaxAffectedTargets`, `MaxTargetLevel`, `DmgClass`, `rangeIndex`, `RecoveryTime`, `CategoryRecoveryTime`, `SpellFamilyName`, `SpellFamilyFlags`, `Mechanic`, `EquippedItemClass`, `Comment`) VALUES
(6870, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 67110928, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, 'Moss Covered Feet - Add unique aura flag');

-- Golemagg - add missing auras
-- 13879 Magma Splash - Golemagg splashes magma at his attackers, dealing Fire damage over time and reducing their armor. This ability can stack.
-- 20556 Golemagg's Trust - Golemagg's Core Ragers will deal increased damage and have 50% increased attack speed if tanked too close to Golemagg.
-- 18943 Double Attack - Proc chance: 50%, 3s cooldown
UPDATE `creature_template` SET `auras` = "13879 20556 18943" WHERE `entry` = 11988;

DELETE FROM `script_texts` WHERE `entry` = -1409002; -- %s refuses to die while its master is in trouble. (2) -> 7865

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
