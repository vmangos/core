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

-- Add scriptname to Ouro scarab
UPDATE creature_template SET ScriptName = "npc_ouro_scarab" WHERE entry = 15718;

-- Ouro sandblast should be a debuff
DELETE FROM spell_mod where Id = 26102;
INSERT INTO spell_mod (Id, Custom, Comment) VALUES (26102, 2, "Ouro's sandblast should be negative");

-- Add scripted target for Despawn Base spell
DELETE FROM spell_script_target WHERE entry = 26594;
INSERT INTO spell_script_target (entry, type, targetEntry) VALUES (26594, 0, 180795);

-- Ouro base shouldn't be targettable by players and should despawn after sending animation on use
UPDATE gameobject_template SET data3 = 65536 * 1, data4 = 1, data5 = 1 WHERE entry = 180795;

-- Add scriptname to Ouro base
UPDATE gameobject_template SET scriptname = "go_sandworm_base" WHERE entry = 180795;
