INSERT INTO `migrations` VALUES ('20170822114025');

-- Remove Corrupted Healing trigger implementation - cannot control HoT proc
UPDATE `spell_effect_mod` 
    SET `EffectApplyAuraName` = 112, `EffectMiscValue` = 3656, `EffectTriggerSpell` = 0
    WHERE `Id` = 23401;
