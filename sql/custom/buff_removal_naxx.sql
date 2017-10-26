-- Aura removal on entering naxxramas, disabled by default
DELETE FROM `instance_buff_removal` where mapId = 533;
insert into `instance_buff_removal` (mapId, auraId, enabled, flags, comment) 
VALUES
(533, 22888, 0, 0, "Naxxramas - Rallying Cry"),
(533, 16609, 0, 0, "Naxxramas - Warchief's blessing"),
(533, 24425, 0, 0, "Naxxramas - Spirit of Zandalar"),
(533, 26393, 0, 0, "Naxxramas - Elune's Blessing"),
(533, 15366, 0, 0, "Naxxramas - Songflower Serenade"),
(533, 22818, 0, 0, "Naxxramas - Mol'dar's Moxie (15% stam)"),
(533, 22820, 0, 0, "Naxxramas - Slip'kik's Savvy (3% spellcrit)"),
(533, 22817, 0, 0, "Naxxramas - Fengus' Ferocity (200 AP)"),
(533, 20707, 0, 0, "Naxxramas - Soulstone"),
(533, 20765, 0, 0, "Naxxramas - Soulstone"),
(533, 20764, 0, 0, "Naxxramas - Soulstone"),
(533, 20762, 0, 0, "Naxxramas - Soulstone"),
(533, 20763, 0, 0, "Naxxramas - Soulstone"),
(533, 28681, 0, 0, "Naxxramas - Soul Revival (Scourge Invasion Buff)"),

(533, 23735, 0, 0, "Sayge's Dark Fortune of Strength"),
(533, 23736, 0, 0, "Sayge's Dark Fortune of Agility"),
(533, 23737, 0, 0, "Sayge's Dark Fortune of Stamina"),
(533, 23738, 0, 0, "Sayge's Dark Fortune of Spirit"),
(533, 23766, 0, 0, "Sayge's Dark Fortune of Intelligence"),
(533, 23767, 0, 0, "Sayge's Dark Fortune of Armor"),
(533, 23768, 0, 0, "Sayge's Dark Fortune of Damage"),
(533, 23769, 0, 0, "Sayge's Dark Fortune of Resistance"),

(533, 1038,  1, 2, "Blessing of Salvation"),
(533, 25895, 0, 2, "Greater Blessing of Salvation"),

(533, 19740, 0, 2, "Blessing of Might (R1)"),
(533, 19834, 0, 2, "Blessing of Might (R2)"),
(533, 19835, 0, 2, "Blessing of Might (R3)"),
(533, 19836, 0, 2, "Blessing of Might (R4)"),
(533, 19837, 0, 2, "Blessing of Might (R5)"),
(533, 19838, 0, 2, "Blessing of Might (R6)"),
(533, 25291, 0, 2, "Blessing of Might (R7)"),
(533, 25782, 0, 2, "Greater Blessing of Might (R1)"),
(533, 25916, 0, 2, "Greater Blessing of Might (R2)"),

(533, 20911, 0, 2, "Blessing of Sanctuary (R1)"),
(533, 20912, 0, 2, "Blessing of Sanctuary (R2)"),
(533, 20913, 0, 2, "Blessing of Sanctuary (R3)"),
(533, 20914, 0, 2, "Blessing of Sanctuary (R4)"),
(533, 25899, 0, 2, "Greater Blessing of Sanctuary (R1)"),

(533, 19742, 0, 2, "Blessing of Wisdom (R1)"),
(533, 19850, 0, 2, "Blessing of Wisdom (R2)"),
(533, 19852, 0, 2, "Blessing of Wisdom (R3)"),
(533, 19853, 0, 2, "Blessing of Wisdom (R4)"),
(533, 19854, 0, 2, "Blessing of Wisdom (R5)"),
(533, 25290, 0, 2, "Blessing of Wisdom (R6)"),
(533, 25894, 0, 2, "Greater Blessing of Wisdom (R1)"),
(533, 25918, 0, 2, "Greater Blessing of Wisdom (R1)"),

(533, 20217, 0, 2, "Blessing of Kings (R1)"),
(533, 25898, 0, 2, "Greater Blessing of Kings (R1)");