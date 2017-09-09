-- Fate of Ramaladni 1% droprate
update creature_loot_template set ChanceOrQuestChance = -1 where Item = 22708;

-- Lightning totem chain lightning aura application timer
UPDATE `creature_ai_scripts` SET `event_type`=0, `event_param1`=2000, `event_param2`=2500 WHERE `id`=1638501;

-- Living Monstrosity lightning totem spawntimer
UPDATE `creature_ai_scripts` SET `event_param3`=10000, `event_param4`=15000 WHERE `id`=1602103;