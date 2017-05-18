INSERT INTO `migrations` VALUES ('20170518014257');

-- Buru Egg Explosion target B
DELETE FROM spell_effect_mod WHERE Id=19593 AND EffectIndex=0;
INSERT INTO spell_effect_mod (Id, EffectImplicitTargetB, Comment) VALUES (19593, 15, 'Buru Egg Explosion - Select all enemies in area');
