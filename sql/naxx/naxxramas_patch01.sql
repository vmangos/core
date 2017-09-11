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
insert into `instance_buff_removal` (mapId, auraId, enabled, comment) 
VALUES
(533, 22888, 1, "Naxxramas - Rallying Cry"),
(533, 16609, 1, "Naxxramas - Warchief's blessing"),
(533, 24425, 1, "Naxxramas - Spirit of Zandalar"),
(533, 26393, 1, "Naxxramas - Elune's Blessing"),
(533, 15366, 1, "Naxxramas - Songflower Serenade"),
(533, 22818, 1, "Naxxramas - Mol'dar's Moxie (15% stam)"),
(533, 22820, 1, "Naxxramas - Slip'kik's Savvy (3% spellcrit)"),
(533, 22817, 1, "Naxxramas - Fengus' Ferocity (200 AP)"),
(533, 20707, 1, "Naxxramas - Soulstone"),
(533, 20765, 1, "Naxxramas - Soulstone"),
(533, 20764, 1, "Naxxramas - Soulstone"),
(533, 20762, 1, "Naxxramas - Soulstone"),
(533, 20763, 1, "Naxxramas - Soulstone"),
(533, 28681, 1, "Naxxramas - Soul Revival (Scourge Invasion Buff)");