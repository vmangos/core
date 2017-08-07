INSERT INTO `migrations` VALUES ('20170511153343');

-- fix decrease aggro range debuffs should not set target in combat
INSERT INTO `spell_mod` (`Id`, `AttributesEx3`, `Comment`) VALUES ('453', '131072', 'Mind Soothe (Rank 1) SPELL_ATTR_EX3_NO_INITIAL_AGGRO');
INSERT INTO `spell_mod` (`Id`, `AttributesEx3`, `Comment`) VALUES ('8192', '131072', 'Mind Soothe (Rank 2) SPELL_ATTR_EX3_NO_INITIAL_AGGRO');
INSERT INTO `spell_mod` (`Id`, `AttributesEx3`, `Comment`) VALUES ('10953', '131072', 'Mind Soothe (Rank 3) SPELL_ATTR_EX3_NO_INITIAL_AGGRO');
INSERT INTO `spell_mod` (`Id`, `AttributesEx3`, `Comment`) VALUES ('2908', '131072', 'Soothe Animal (Rank 1) SPELL_ATTR_EX3_NO_INITIAL_AGGRO');
INSERT INTO `spell_mod` (`Id`, `AttributesEx3`, `Comment`) VALUES ('8955', '131072', 'Soothe Animal (Rank 2) SPELL_ATTR_EX3_NO_INITIAL_AGGRO');
INSERT INTO `spell_mod` (`Id`, `AttributesEx3`, `Comment`) VALUES ('9901', '131072', 'Soothe Animal (Rank 3) SPELL_ATTR_EX3_NO_INITIAL_AGGRO');
