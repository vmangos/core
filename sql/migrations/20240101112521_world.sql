DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240101112521');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20240101112521');
-- Add your query below.


-- Make Empty Heavy Phial give an error on inventory full.
DELETE FROM `spell_scripts` WHERE `id`=11637;
DELETE FROM `spell_effect_mod` WHERE `id`=11637;

-- Make Bael'Gar's Fiery Essence give an error on inventory full.
DELETE FROM `spell_scripts` WHERE `id`=13982;
DELETE FROM `spell_effect_mod` WHERE `id`=13982;

-- Make Filling Empty Jar give an error on inventory full.
DELETE FROM `spell_scripts` WHERE `id`=15698;
DELETE FROM `spell_effect_mod` WHERE `Id`=15698;
INSERT INTO `spell_effect_mod` (`Id`, `EffectIndex`, `Effect`, `EffectDieSides`, `EffectBaseDice`, `EffectDicePerLevel`, `EffectRealPointsPerLevel`, `EffectBasePoints`, `EffectAmplitude`, `EffectPointsPerComboPoint`, `EffectChainTarget`, `EffectMultipleValue`, `EffectMechanic`, `EffectImplicitTargetA`, `EffectImplicitTargetB`, `EffectRadiusIndex`, `EffectApplyAuraName`, `EffectItemType`, `EffectMiscValue`, `EffectTriggerSpell`, `Comment`) VALUES (15698, 1, 3, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 38, 1, -1, -1, -1, 0, -1, 'Filling Empty Jar: Add Second Dummy Effect');

-- Make Filling Empty Jar give an error on inventory full.
DELETE FROM `spell_scripts` WHERE `id`=15699;
DELETE FROM `spell_effect_mod` WHERE `Id`=15699;
INSERT INTO `spell_effect_mod` (`Id`, `EffectIndex`, `Effect`, `EffectDieSides`, `EffectBaseDice`, `EffectDicePerLevel`, `EffectRealPointsPerLevel`, `EffectBasePoints`, `EffectAmplitude`, `EffectPointsPerComboPoint`, `EffectChainTarget`, `EffectMultipleValue`, `EffectMechanic`, `EffectImplicitTargetA`, `EffectImplicitTargetB`, `EffectRadiusIndex`, `EffectApplyAuraName`, `EffectItemType`, `EffectMiscValue`, `EffectTriggerSpell`, `Comment`) VALUES (15699, 1, 3, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 38, 1, -1, -1, -1, 0, -1, 'Filling Empty Jar: Add Second Dummy Effect');

-- Make Filling Empty Jar give an error on inventory full.
DELETE FROM `spell_scripts` WHERE `id`=15702;
INSERT INTO `spell_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(15702, 0, 0, 18, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Empty Pure Sample Jar - Despawn Creature');
DELETE FROM `spell_effect_mod` WHERE `Id`=15702;
INSERT INTO `spell_effect_mod` (`Id`, `EffectIndex`, `Effect`, `EffectDieSides`, `EffectBaseDice`, `EffectDicePerLevel`, `EffectRealPointsPerLevel`, `EffectBasePoints`, `EffectAmplitude`, `EffectPointsPerComboPoint`, `EffectChainTarget`, `EffectMultipleValue`, `EffectMechanic`, `EffectImplicitTargetA`, `EffectImplicitTargetB`, `EffectRadiusIndex`, `EffectApplyAuraName`, `EffectItemType`, `EffectMiscValue`, `EffectTriggerSpell`, `Comment`) VALUES (15702, 1, 77, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 38, 1, -1, -1, -1, 0, -1, 'Filling Empty Jar: Add Second Script Effect');

-- Make Soul Claim give an error on inventory full.
DELETE FROM `spell_scripts` WHERE `id`=17048;
DELETE FROM `spell_effect_mod` WHERE `id`=17048;

-- Make Plunging Blade into Onyxia give an error on inventory full.
DELETE FROM `spell_scripts` WHERE `id`=22906;
DELETE FROM `spell_effect_mod` WHERE `id`=22906;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
