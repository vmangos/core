DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260505180600');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260505180600');
-- Add your query below.


-- 5382:  Not (Target Has Done Quest 5382)
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (5382, 8, 5382, 0, 0, 0, 1);
-- 5383: Target Has Aura 3033 Index 0
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (5383, 1, 33031, 0, 0, 0, 0);

-- Quest Doctor Theolen Krastinov, the Butcher should only be available after listening to Eva Sarkhoff's gossip story.
UPDATE `gossip_menu_option` SET `condition_id`=5382 WHERE `menu_id`=3310 AND `id`=0;
UPDATE `gossip_menu_option` SET `action_script_id`=3303 WHERE `menu_id`=3303 AND `id`=0;
INSERT INTO `spell_mod` (`Id`, `procChance`, `procFlags`, `procCharges`, `DurationIndex`, `Category`, `CastingTimeIndex`, `StackAmount`, `SpellIconID`, `activeIconID`, `manaCost`, `Attributes`, `AttributesEx`, `AttributesEx2`, `AttributesEx3`, `AttributesEx4`, `Custom`, `InterruptFlags`, `AuraInterruptFlags`, `ChannelInterruptFlags`, `Dispel`, `Stances`, `StancesNot`, `SpellVisual`, `ManaCostPercentage`, `StartRecoveryCategory`, `StartRecoveryTime`, `MaxAffectedTargets`, `MaxTargetLevel`, `DmgClass`, `rangeIndex`, `RecoveryTime`, `CategoryRecoveryTime`, `SpellFamilyName`, `SpellFamilyFlags`, `Mechanic`, `EquippedItemClass`, `Comment`) VALUES (33031, 101, -1, -1, 21, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, 0, -1, -1, 'Enable Quest: Doctor Theolen Krastinov, the Butcher');
INSERT INTO `spell_effect_mod` (`Id`, `EffectIndex`, `Effect`, `EffectDieSides`, `EffectBaseDice`, `EffectDicePerLevel`, `EffectRealPointsPerLevel`, `EffectBasePoints`, `EffectAmplitude`, `EffectPointsPerComboPoint`, `EffectChainTarget`, `EffectMultipleValue`, `EffectMechanic`, `EffectImplicitTargetA`, `EffectImplicitTargetB`, `EffectRadiusIndex`, `EffectApplyAuraName`, `EffectItemType`, `EffectMiscValue`, `EffectTriggerSpell`, `Comment`) VALUES (33031, 0, 6, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, 4, -1, -1, -1, 'Enable Quest: Doctor Theolen Krastinov, the Butcher');
DELETE FROM `gossip_scripts` WHERE `id`=3303;
INSERT INTO `gossip_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(3303, 0, 0, 74, 33031, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eva Sarkhoff - Enable Quest Doctor Theolen Krastinov, the Butcher');
UPDATE `quest_template` SET `RequiredCondition`=5383 WHERE `entry`=5382;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
