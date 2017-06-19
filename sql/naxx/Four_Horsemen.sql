UPDATE creature_template SET faction_a = 21, faction_h = 21, scale = 0, unit_flags = 33554432, dynamicflags = 0 WHERE entry BETWEEN 16775 AND 16778;

UPDATE creature_template SET scriptname = "boss_highlord_mograine" WHERE entry = 16775;
UPDATE creature_template SET scriptname = "boss_lady_blaumeux" WHERE entry = 16776;
UPDATE creature_template SET scriptname = "boss_thane_korthazz" WHERE entry = 16778;
UPDATE creature_template SET scriptname = "boss_sir_zeliek" WHERE entry = 16777;
