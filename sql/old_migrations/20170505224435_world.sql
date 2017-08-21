INSERT INTO `migrations` VALUES ('20170505224435');

-- Earth's Grasp family mask
UPDATE spell_affect SET SpellFamilyMask = 4294967296 WHERE entry IN (16043,16130) AND effectId = 1;
