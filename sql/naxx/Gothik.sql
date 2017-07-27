/*
-- Delete creature involved in Gothik event
DELETE FROM creature WHERE guid BETWEEN 127618 AND 127630;
DELETE FROM creature WHERE id BETWEEN 16124 AND 16127;
DELETE FROM creature WHERE id BETWEEN 16148 AND 16150;

-- Spawn Gothik triggers
INSERT INTO creature (guid, id, map, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES
(127618, 16137, 533, 0, 0, 2692.16, -3430.75, 268.646, 1.6057, 3600, 0, 0, 42, 0, 0, 0),
(127619, 16137, 533, 0, 0, 2733.46, -3349.39, 267.768, 1.78024, 3600, 0, 0, 42, 0, 0, 0),
(127620, 16137, 533, 0, 0, 2739.99, -3321.73, 284.232, 2.82743, 3600, 0, 0, 42, 0, 0, 0),
(127621, 16137, 533, 0, 0, 2692.21, -3428.78, 268.646, 1.48353, 3600, 0, 0, 42, 0, 0, 0),
(127622, 16137, 533, 0, 0, 2739.99, -3399.78, 284.295, 6.10865, 3600, 0, 0, 42, 0, 0, 0),
(127623, 16137, 533, 0, 0, 2714.56, -3430.61, 268.646, 1.41372, 3600, 0, 0, 42, 0, 0, 0),
(127624, 16137, 533, 0, 0, 2683.89, -3304.21, 267.768, 2.49582, 3600, 0, 0, 42, 0, 0, 0),
(127625, 16137, 533, 0, 0, 2669.58, -3428.86, 268.646, 1.37881, 3600, 0, 0, 42, 0, 0, 0),
(127626, 16137, 533, 0, 0, 2700.27, -3322.35, 267.768, 3.52556, 3600, 0, 0, 42, 0, 0, 0),
(127627, 16137, 533, 0, 0, 2643.73, -3399.68, 284.183, 6.0912, 3600, 0, 0, 42, 0, 0, 0),
(127628, 16137, 533, 0, 0, 2664.87, -3340.75, 267.767, 5.93412, 3600, 0, 0, 42, 0, 0, 0),
(127629, 16137, 533, 0, 0, 2725.82, -3309.57, 267.769, 2.82743, 3600, 0, 0, 42, 0, 0, 0),
(127630, 16137, 533, 0, 0, 2643.73, -3321.73, 284.233, 6.19592, 3600, 0, 0, 42, 0, 0, 0);
*/
-- Faction for Gothik event creatures
UPDATE creature_template SET faction_H = 20, faction_A = 20 WHERE entry BETWEEN 16124 AND 16127 OR entry BETWEEN 16148 AND 16150;

-- Invisibility of Gothik triggers
UPDATE creature_template SET modelid_1=11686, modelid_2=0, scriptname = "spell_anchor" WHERE entry = 16137;

-- Gothik spell script target
DELETE FROM spell_script_target WHERE entry IN (27892, 27928,27935, 27893, 27929, 27936, 27915, 27931, 27937);
INSERT INTO spell_script_target (entry, type, targetEntry) VALUES
(27892, 1, 16137),
(27893, 1, 16137),
(27928, 1, 16137),
(27929, 1, 16137),
(27935, 1, 16137),
(27936, 1, 16137);
