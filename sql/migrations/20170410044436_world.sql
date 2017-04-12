INSERT INTO `migrations` VALUES ('20170410044436'); 

-- Fix Thundering Charm, Burning Charm and Cresting Charm
UPDATE `spell_effect_mod` SET `Effect`=1 WHERE `Id`=4131;
INSERT INTO `spell_effect_mod` (`Id`, `EffectIndex`, `Effect`, `EffectDieSides`, `EffectBaseDice`, `EffectDicePerLevel`, `EffectRealPointsPerLevel`, `EffectBasePoints`, `EffectAmplitude`, `EffectPointsPerComboPoint`, `EffectChainTarget`, `EffectMultipleValue`, `EffectMechanic`, `EffectImplicitTargetA`, `EffectImplicitTargetB`, `EffectRadiusIndex`, `EffectApplyAuraName`, `EffectItemType`, `EffectMiscValue`, `EffectTriggerSpell`, `Comment`) VALUES (4130, 0, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 38, 0, -1, -1, -1, 0, -1, 'Arathi Cresting Charm');
INSERT INTO `spell_effect_mod` (`Id`, `EffectIndex`, `Effect`, `EffectDieSides`, `EffectBaseDice`, `EffectDicePerLevel`, `EffectRealPointsPerLevel`, `EffectBasePoints`, `EffectAmplitude`, `EffectPointsPerComboPoint`, `EffectChainTarget`, `EffectMultipleValue`, `EffectMechanic`, `EffectImplicitTargetA`, `EffectImplicitTargetB`, `EffectRadiusIndex`, `EffectApplyAuraName`, `EffectItemType`, `EffectMiscValue`, `EffectTriggerSpell`, `Comment`) VALUES (4132, 0, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 38, 0, -1, -1, -1, 0, -1, 'Arathi Burning Charm');

-- Fix db errors. Targets are already defined in `spell_script_target`.
DELETE FROM `item_required_target` WHERE `entry` IN (4479, 4480, 4481);