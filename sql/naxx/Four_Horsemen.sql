UPDATE creature_template SET faction_a = 21, faction_h = 21, scale = 0, unit_flags = 33554432, dynamicflags = 0 WHERE entry BETWEEN 16775 AND 16778;

UPDATE creature_template SET scriptname = "boss_highlord_mograine" WHERE entry = 16775;
UPDATE creature_template SET scriptname = "boss_lady_blaumeux" WHERE entry = 16776;
UPDATE creature_template SET scriptname = "boss_thane_korthazz" WHERE entry = 16778;
UPDATE creature_template SET scriptname = "boss_sir_zeliek" WHERE entry = 16777;

-- chest loot
DELETE FROM gameobject_loot_template where entry = 181366;
INSERT INTO gameobject_loot_template (entry, item, ChanceOrQuestChance, groupid, mincountOrRef, maxcount, condition_id) VALUES
('181366', '12002', '100', '1', '-12002', '2', '0'),
('181366', '22691', '0',   '2', '1',      '1', '0'),
('181366', '22726', '30',  '0', '1',      '1', '0'),
('181366', '22809', '0',   '2', '1',      '1', '0'),
('181366', '22811', '0',   '2', '1',      '1', '0'),
('181366', '23025', '0',   '2', '1',      '1', '0'),
('181366', '23027', '0',   '2', '1',      '1', '0'),
('181366', '23071', '0',   '2', '1',      '1', '0');

UPDATE `creature_template` SET `faction_A`=20, `faction_H`=20, `mindmg`=0, `maxdmg`=0, `unit_flags`=33554438, `AIName`='EventAI', `MovementType`=0, `flags_extra`=2050 WHERE `entry`=16697;

REPLACE INTO `creature_ai_scripts`
(`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`)
VALUES
(1669701, 16697, 1, 0, 100, 1, 1000, 1000, 1000, 1000, 11, 28865, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 'Void Zone cast Consumption');
