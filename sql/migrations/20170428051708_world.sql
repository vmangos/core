INSERT INTO `migrations` VALUES ('20170428051708');

-- Summoning Portal click animation
UPDATE gameobject_template SET data2 = 23017 WHERE entry = 36727;
