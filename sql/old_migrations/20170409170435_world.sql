INSERT INTO `migrations` VALUES ('20170409170435');

-- Add the passive attribute to weapon enchants
DELETE FROM spell_mod WHERE Id IN (22755,9784,9782,16624);
INSERT INTO spell_mod (Id, Attributes, `Comment`) VALUES (22755, 327888, 'Elemental Sharpening Stone - Passive');
INSERT INTO spell_mod (Id, Attributes, `Comment`) VALUES (9784, 268435520, 'Iron Shield Spike - Passive');
INSERT INTO spell_mod (Id, Attributes, `Comment`) VALUES (9782, 268435520, 'Mithril Shield Spike - Passive');
INSERT INTO spell_mod (Id, Attributes, `Comment`) VALUES (16624, 268435520, 'Thorium Shield Spike - Passive');
