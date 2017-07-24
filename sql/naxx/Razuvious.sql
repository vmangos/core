-- Razuvious should follow waypoints
-- UPDATE creature SET MovementType = 2 WHERE id = 16061;

-- Razuvious adds (deathknight understudy)
DELETE FROM creature_template_addon WHERE entry = 16803;
INSERT INTO creature_template_addon (entry, mount, bytes1, b2_0_sheath, b2_1_flags, emote, moveflags, auras)
VALUE (16803, 0, 0, 0, 0, 333, 0, 18950);
UPDATE creature_template SET spell1 = 29060 WHERE entry = 16803;

-- Razu adds equipment
UPDATE `creature_template` SET `equipment_id` = 16803 where `entry` = 16803;
DELETE FROM `creature_equip_template` where entry = 16803;
INSERT INTO `creature_equip_template` (entry, equipentry1, equipentry2, equipentry3) VALUES (16803, 2180, 23356, 0);

-- removing razu adds from creature table. Spawned by script
delete from creature where id = 16803;

-- razu adds given eventai to "attack" the training dummies out of combat
UPDATE `creature_template` SET `AIName`='EventAI', `ScriptName`='' WHERE `entry`=16803;
DELETE FROM `creature_ai_scripts` where id = 1680301;
INSERT INTO `creature_ai_scripts`
(`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`)
VALUES
(1680301, 16803, 1, 0, 100, 1, 0, 5000, 5000, 10000, 5, 36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Deathknight Understudy attack emote');

DELETE FROM `creature_ai_scripts` where id = 1680302;
INSERT INTO `creature_ai_scripts`
(`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`)
VALUES
(1680302, 16803, 4, 0, 100, 0, 0, 0, 0, 0, 39, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Deathknight Understudiy calls for help on aggro');