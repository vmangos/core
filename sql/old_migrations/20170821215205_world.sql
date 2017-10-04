INSERT INTO `migrations` VALUES ('20170821215205');

-- Fix to Screech startup error
DELETE FROM spell_threat WHERE entry IN (24423,24577,24578,24579);
REPLACE INTO spell_effect_mod (Id, EffectIndex, Effect, EffectBasePoints, EffectImplicitTargetA, EffectImplicitTargetB, EffectRadiusIndex, Comment) VALUES 
(24423, 2, 63, 25, 22, 15, 8, 'Screech R1 Threat'),
(24577, 2, 63, 67, 22, 15, 8, 'Screech R2 Threat'),
(24578, 2, 63, 152, 22, 15, 8, 'Screech R3 Threat'),
(24579, 2, 63, 188, 22, 15, 8, 'Screech R4 Threat');
