-- Fate of Ramaladni 1% droprate
update creature_loot_template set ChanceOrQuestChance = -1 where Item = 22708;

-- Lightning totem chain lightning aura application timer
UPDATE `creature_ai_scripts` SET `event_type`=0, `event_param1`=2000, `event_param2`=2500 WHERE `id`=1638501;

-- Living Monstrosity lightning totem spawntimer
UPDATE `creature_ai_scripts` SET `event_param3`=10000, `event_param4`=15000 WHERE `id`=1602103;

-- Unholy Axe mortal strike on target instead of self
UPDATE `creature_ai_scripts` SET `action1_param2`=1 WHERE `id`=1619402;

-- Make the shadow/ice guard repetable
UPDATE `quest_template` SET `SpecialFlags`='1' WHERE `entry`='9211';
UPDATE `quest_template` SET `SpecialFlags`='1' WHERE `entry`='9213';

-- Aura removal on entering naxxramas
DELETE FROM `instance_buff_removal` where mapId = 533;
insert into `instance_buff_removal` (mapId, auraId, enabled, flags, comment) 
VALUES
(533, 22888, 1, 0, "Naxxramas - Rallying Cry"),
(533, 16609, 1, 0, "Naxxramas - Warchief's blessing"),
(533, 24425, 1, 0, "Naxxramas - Spirit of Zandalar"),
(533, 26393, 1, 0, "Naxxramas - Elune's Blessing"),
(533, 15366, 1, 0, "Naxxramas - Songflower Serenade"),
(533, 22818, 1, 0, "Naxxramas - Mol'dar's Moxie (15% stam)"),
(533, 22820, 1, 0, "Naxxramas - Slip'kik's Savvy (3% spellcrit)"),
(533, 22817, 1, 0, "Naxxramas - Fengus' Ferocity (200 AP)"),
(533, 20707, 1, 0, "Naxxramas - Soulstone"),
(533, 20765, 1, 0, "Naxxramas - Soulstone"),
(533, 20764, 1, 0, "Naxxramas - Soulstone"),
(533, 20762, 1, 0, "Naxxramas - Soulstone"),
(533, 20763, 1, 0, "Naxxramas - Soulstone"),
(533, 28681, 1, 0, "Naxxramas - Soul Revival (Scourge Invasion Buff)"),

(533, 23735, 1, 0, "Sayge's Dark Fortune of Strength"),
(533, 23736, 1, 0, "Sayge's Dark Fortune of Agility"),
(533, 23737, 1, 0, "Sayge's Dark Fortune of Stamina"),
(533, 23738, 1, 0, "Sayge's Dark Fortune of Spirit"),
(533, 23766, 1, 0, "Sayge's Dark Fortune of Intelligence"),
(533, 23767, 1, 0, "Sayge's Dark Fortune of Armor"),
(533, 23768, 1, 0, "Sayge's Dark Fortune of Damage"),
(533, 23769, 1, 0, "Sayge's Dark Fortune of Resistance"),

(533, 1038,  1, 2, "Blessing of Salvation"),
(533, 25895, 1, 2, "Greater Blessing of Salvation"),

(533, 19740, 1, 2, "Blessing of Might (R1)"),
(533, 19834, 1, 2, "Blessing of Might (R2)"),
(533, 19835, 1, 2, "Blessing of Might (R3)"),
(533, 19836, 1, 2, "Blessing of Might (R4)"),
(533, 19837, 1, 2, "Blessing of Might (R5)"),
(533, 19838, 1, 2, "Blessing of Might (R6)"),
(533, 25291, 1, 2, "Blessing of Might (R7)"),
(533, 25782, 1, 2, "Greater Blessing of Might (R1)"),
(533, 25916, 1, 2, "Greater Blessing of Might (R2)"),

(533, 20911, 1, 2, "Blessing of Sanctuary (R1)"),
(533, 20912, 1, 2, "Blessing of Sanctuary (R2)"),
(533, 20913, 1, 2, "Blessing of Sanctuary (R3)"),
(533, 20914, 1, 2, "Blessing of Sanctuary (R4)"),
(533, 25899, 1, 2, "Greater Blessing of Sanctuary (R1)"),

(533, 19742, 1, 2, "Blessing of Wisdom (R1)"),
(533, 19850, 1, 2, "Blessing of Wisdom (R2)"),
(533, 19852, 1, 2, "Blessing of Wisdom (R3)"),
(533, 19853, 1, 2, "Blessing of Wisdom (R4)"),
(533, 19854, 1, 2, "Blessing of Wisdom (R5)"),
(533, 25290, 1, 2, "Blessing of Wisdom (R6)"),
(533, 25894, 1, 2, "Greater Blessing of Wisdom (R1)"),
(533, 25918, 1, 2, "Greater Blessing of Wisdom (R1)"),

(533, 20217, 1, 2, "Blessing of Kings (R1)"),
(533, 25898, 1, 2, "Greater Blessing of Kings (R1)");