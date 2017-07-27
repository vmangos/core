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

-- his adds changed to EventAI
/*
16126 unrelenting rider
16125 unrelenting death knight
16124 unrelenting trainee

16148 spectral death knight
16149 spectral horse
16150 spectral rider 
16127 spectral trainee
*/

UPDATE `creature_template` SET `equipment_id` = 16125 where `entry` = 16125;
UPDATE `creature_template` SET `equipment_id` = 16148 where `entry` = 16148;
UPDATE `creature_template` SET `equipment_id` = 16126 where `entry` = 16126;
DELETE FROM `creature_equip_template` where entry in (16125, 16148, 16126);
INSERT INTO `creature_equip_template` (entry, equipentry1, equipentry2, equipentry3) VALUES 
(16125, 13504, 23356, 0),
(16148, 13504, 23356, 0),
(16126, 12949, 0,     0);

UPDATE `creature_template` SET `AIName`='EventAI', `ScriptName`='' WHERE `entry` in (16124,16125,16126, 16148, 16149, 16150, 16127);

DELETE FROM `creature_ai_scripts` where creature_id in (16124, 16125, 16126, 16127, 16148, 16149, 16150);
INSERT INTO `creature_ai_scripts`
(`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`)
VALUES
(1612401, 16124, 0, 0, 100, 1, 0,    0,    15500, 15500, 11, 30285, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Unrelenting Trainee Eagle Claw'),
(1612402, 16124, 0, 0, 100, 1, 5000, 6000, 8000,  10000, 11, 20276, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Unrelenting Trainee Knockdown'),

(1612501, 16125, 0, 0, 100, 1, 5000, 8000, 12000, 15000, 11, 27577, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Unrelenting Death Knight intercept random hostile'),
(1612502, 16125, 0, 0, 100, 1, 1000, 2000, 15500, 15500, 11, 27825, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Unrelenting Death Knight Shadow Mark'),

(1612601, 16126, 11,0, 100, 0,   0,    0,     0,     0,  11, 27987, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 'Unrelenting Rider Unholy Aura on spawn'),
(1612602, 16126, 0, 0, 100, 1, 1000, 2000,  5000,  6000, 11, 27831, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Unrelenting Rider cast Shadow Bolt Volley'),

(1612701, 16127, 0, 0, 100, 1, 1000, 1500,  3000,  4000, 11, 27989, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Spectral Trainee Arcane Explosion'),
(1612702, 16127, 0, 0, 100, 1, 3000, 3000, 10000, 11000, 11, 27990, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Spectral Trainee fear random'),

(1614801, 16148, 0, 0, 100, 1, 1000, 3000,  5000,  6000, 11, 27991, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Spectral Death Knight Sunder Armor'),
(1614802, 16148, 0, 0, 100, 1, 5000, 1000, 10000, 12000, 11, 27992, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Spectral Death Knight Mana Burn'),

(1614901, 16149, 0, 0, 100, 1, 2000, 5000, 30500, 30500, 11, 27993, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Spectral Horse cast Stomp'),

(1615001, 16150, 0, 0, 100, 1, 3001, 5000, 10000, 12000, 11, 27994, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Spectral Rider life drain on random hostile'),
(1615002, 16150, 0, 0, 100, 1, 1000, 3000,  8000, 10000, 11, 27994, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Spectral Rider Unholy Frenzy'),
(1615003, 16150, 11,0, 100, 0,   0,    0,     0,     0,  11, 27987, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 'Unrelenting Rider Unholy Aura on spawn');

-- unrelenting trainee
UPDATE `creature_template` SET `mindmg`=700, `maxdmg`=1000 WHERE `entry`=16124;
-- unrelenting death knight
UPDATE `creature_template` SET `mindmg`=3000, `maxdmg`=3500 WHERE `entry`=16125;
-- unrelenting rider
UPDATE `creature_template` SET `mindmg`=4000, `maxdmg`=4500 WHERE `entry`=16126;
-- spectral rider
UPDATE `creature_template` SET `mindmg`=4000, `maxdmg`=4500 WHERE `entry`=16150;
-- spectral death knight
UPDATE `creature_template` SET `mindmg`=4000, `maxdmg`=4500 WHERE `entry`=16148;
-- spectral horse
UPDATE `creature_template` SET `mindmg`=5000, `maxdmg`=5500 WHERE `entry`=16149;

-- spectral death knight hp
UPDATE `creature_template` SET `minhealth`=19000, `maxhealth`=19500 where `entry`=16148;
-- spectral trainee hp
UPDATE `creature_template` SET `minhealth`=6000, `maxhealth`=7000 WHERE `entry`=16127;

