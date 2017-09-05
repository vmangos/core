INSERT INTO migrations VALUES ('20170829201808');

-- Druid T3
REPLACE INTO spell_mod (Id, SpellFamilyName, Comment) VALUES (28743, 0, 'Druid T3 4/8: Dreamwalker');

-- Warlock T3
REPLACE INTO spell_effect_mod (Id, EffectIndex, Effect, EffectDieSides, EffectBaseDice, EffectDicePerLevel, EffectRealPointsPerLevel, EffectBasePoints, EffectAmplitude, EffectPointsPerComboPoint, EffectChainTarget, EffectMultipleValue, EffectMechanic, EffectImplicitTargetA, EffectImplicitTargetB, EffectRadiusIndex, EffectApplyAuraName, EffectItemType, EffectMiscValue, EffectTriggerSpell, Comment)
VALUES (28831, 0, 6, -1, -1, -1, -1, 10, -1, -1, -1, -1, -1, 1, 0, -1, 109, -1, 100, 28839, 'Warlock T3 2/8 - Vampirism');

-- Hunter T3
REPLACE INTO spell_effect_mod (Id, Effect, EffectBasePoints, EffectImplicitTargetA, EffectImplicitTargetB, EffectApplyAuraName, EffectMiscValue, Comment) 
VALUES (28757, 6, 50, 5, 0, 99, 0, 'Hunter T3: Pet AP');
REPLACE INTO spell_effect_mod (Id, EffectIndex, Effect, EffectBasePoints, EffectImplicitTargetA, EffectImplicitTargetB, EffectApplyAuraName, EffectMiscValue, Comment) 
VALUES (28756, 1, 6, 50, 1, 0, 124, 0, 'Hunter T3: Ranged AP');
REPLACE INTO spell_effect_mod (Id, EffectIndex, Effect, EffectBasePoints, EffectImplicitTargetA, EffectImplicitTargetB, EffectApplyAuraName, EffectMiscValue, Comment) 
VALUES (28756, 2, 6, 50, 1, 0, 99, 0, 'Hunter T3: Melee AP');

DELETE FROM spell_pet_auras WHERE spell=28757;


-- Misplaced Servo Arm
REPLACE INTO spell_bonus_data (entry, comments) VALUES (29151, 'Misplaced Servo Arm - No coeff');

-- Paladin T3
UPDATE spell_proc_event SET SpellFamilyMask0=3221250048, SpellFamilyMask1=3221250048, SpellFamilyMask2=3221250048 WHERE entry=28789;

-- Warlock & Hunter T1 / T2
UPDATE spell_effect_mod SET EffectApplyAuraName=22, Comment='5/8 T1 Hunter : +40 All Resist pet' WHERE Id=21925 AND EffectIndex=1;
UPDATE spell_effect_mod SET EffectApplyAuraName=22, Comment='5/8 T2 Hunter : +60 All Resist pet' WHERE Id=21927 AND EffectIndex=1;
UPDATE spell_effect_mod SET EffectApplyAuraName=22, Comment='5/8 T1 Demonic Ally: +100 All Resist pet' WHERE Id=21740 AND EffectIndex=1;
UPDATE spell_effect_mod SET EffectApplyAuraName=22, Comment='5/8 T2 Demonic Ally: +130 All Resist pet' WHERE Id=21921 AND EffectIndex=1;
