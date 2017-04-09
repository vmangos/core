INSERT INTO `migrations` VALUES ('20170331035126');

-- Stratholme postbox script
UPDATE gameobject_template SET ScriptName = 'go_stratholme_postbox' WHERE entry IN (176346,176352,176353,176350,176351,176349);