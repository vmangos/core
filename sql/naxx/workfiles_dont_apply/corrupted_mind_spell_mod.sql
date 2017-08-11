-- Priest Corrupted Mind debuff. Default DBC has proc flags
-- 1) Successful spell hit (10 - 0x00000400)
-- 2) Successful spell cast (12 - 0x00001000)
-- 3) Successful cast positive spell (14 - 0x00004000)
-- 4) Successful damage from harmful spell cast (16 - 0x00010000),
-- so that the spell procs on Holy Nova, alongside the normal healing flags. 
-- (Since Holy Nova is technically two spells being cast simultaneously,
-- damage + healing).
-- This makes it a bit difficult to handle since it procs for non-healing
-- spells such as Smite as well. In our core, proc flag 10 is added to any
-- positive AoE spell, so it will already be handled without the additional
-- damage flags (12 and 16). We can safely remove them, and simply use 10 and 14,
-- the same as the other Corrupted Mind spells.

DELETE FROM `spell_mod` WHERE `id` = 29185;

INSERT INTO `spell_mod` (`id`, `procFlags`, `comment`) VALUES (29185, 17408, 'Corrupted Mind (Priest) - only proc on healing/cure spells');

-- Force Corrupted Mind to proc if flags match, required for spells such as 
-- Cure/Abolish Poison/Disease, Dispel, Cleanse, etc.
-- CURRENTLY MAKES IT PROC ON EVERY POSITIVE SPELL - DO NOT USE
-- INSERT INTO `spell_proc_event` (`entry`, `procEx`) VALUES (29185, 65536); -- Priest
-- INSERT INTO `spell_proc_event` (`entry`, `procEx`) VALUES (29194, 65536); -- Druid
-- INSERT INTO `spell_proc_event` (`entry`, `procEx`) VALUES (29196, 65536); -- Paladin
-- INSERT INTO `spell_proc_event` (`entry`, `procEx`) VALUES (29198, 65536); -- Shaman

