INSERT INTO migrations VALUES ('20170522204702');

DELETE FROM spell_proc_event WHERE entry=23688;
INSERT INTO spell_proc_event (entry, SchoolMask, SpellFamilyName, SpellFamilyMask0, SpellFamilyMask1, SpellFamilyMask2, procFlags, procEx, ppmRate, CustomChance, Cooldown) VALUES 
(23688, 0, 0, 0, 0, 0, 67108864, 65536, 0, 0, 0);
