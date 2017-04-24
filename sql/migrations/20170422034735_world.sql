INSERT INTO `migrations` VALUES ('20170422034735');

-- Aura of the Blue Dragon proc on every mana based spell cast
UPDATE spell_proc_event SET procFlags=67108864, procEx=65536 WHERE entry=23688;
