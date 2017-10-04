INSERT INTO migrations VALUES ('20170918013446');

REPLACE INTO creature_ai_scripts (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
 (1220601, 12206, 4, 0, 100, 0, 0, 0, 0, 0, 49, 1, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 'Primordial Behemoth - Enable Dynamic Movement and Prevent Melee on Aggro'),
 (1220602, 12206, 9, 0, 100, 1, 5, 30, 2300, 3900, 11, 21071, 0, 0, 40, 2, 0, 0, 0, 0, 0, 0, 'Primordial Behemoth - Cast Boulder and Set Ranged Weapon Model'),
 (1220603, 12206, 9, 0, 100, 1, 9, 80, 1000, 1000, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Primordial Behemoth - Enable Dynamic Movement at 9-80 Yards'),
 (1220604, 12206, 9, 0, 100, 1, 0, 8, 1000, 1000, 49, 0, 0, 0, 20, 1, 0, 0, 40, 1, 0, 0, 'Primordial Behemoth - Disable Dynamic Movement and Enable Melee and Set Melee Weapon Model at 0-8 Yards'),
 (1220605, 12206, 9, 0, 100, 1, 0, 8, 8000, 13000, 11, 5568, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Primordial Behemoth - Cast Trample'),
 (1220606, 12206, 7, 0, 100, 0, 0, 0, 0, 0, 40, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Primordial Behemoth - Set Melee Weapon Model on Evade');
UPDATE creature_template SET AIName='EventAI', ScriptName='' WHERE entry=12206;
