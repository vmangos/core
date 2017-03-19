-- Replace Ouro by it's spawner
UPDATE creature SET id = 15957 WHERE id = 15517;

-- Give AI to Ouro spawner
UPDATE creature_template SET ScriptName = "npc_ouro_spawner" WHERE entry = 15957;

-- Give invisible model to Ouro spawner
UPDATE creature_template SET modelid_1 = 11686 WHERE entry = 15957;
UPDATE creature SET modelid = 11686 WHERE id = 15957;

-- Give AI to Ouro dirt mound
UPDATE creature_template SET ScriptName = "npc_dirt_mound" WHERE entry = 15712;

-- Corect faction for Ouro dirt mound
UPDATE creature_template SET faction_H = 14, faction_A = 14 WHERE entry = 15712;

-- Correct level for Ouro dirt mound
UPDATE creature_template SET minlevel = 63, maxlevel = 63 WHERE entry = 15712;

-- Ouro dirt mound are not targettable
UPDATE creature_template SET unit_flags = unit_flags | 33554432 WHERE entry = 15712;

-- cmangos unit flags Ouro spawner TOD : search flags name
UPDATE creature_template SET unit_flags = unit_flags | 33587200 WHERE entry = 15957;

-- Ouro trigger is not targettable
UPDATE creature_template SET unit_flags = unit_flags | 33554432 WHERE entry = 15717;
