
-- Fallout should do a lot more dmg (no exact sources, but videos show tanks dropping quite a bit)
UPDATE `creature_template` SET `mindmg`=5045, `maxdmg`=6115 WHERE `entry`=16290;

-- Giving grobbulus cloud creature a scriptname and make it invisible and give it a proper level so the cloud spell dosent resist. and faction
UPDATE `creature_template` SET `ScriptName`="boss_grobbulus_cloud", `unit_class`='1', `unit_flags` = 33587968, `minlevel`='63', `maxlevel`='63' WHERE `entry`=16363;

UPDATE `creature_template` SET `scale`=1.8, `MovementType`=2 WHERE `entry`=15931;

REPLACE INTO spell_target_position (id, target_map, target_position_x, target_position_y, target_position_z, target_orientation) VALUES
(28280, 533, 3125.44, -3309.74, 293.251, 3.14929);

DELETE FROM creature_movement_scripts where id = 1593101;
INSERT INTO creature_movement_scripts (id, delay, command, datalong, comments) VALUES
(1593101, 1, 15, 28280, "cast summon sewage slime");
INSERT INTO creature_movement_scripts (id, delay, command, datalong, comments) VALUES
(1593101, 3, 15, 28280, "cast summon sewage slime");
INSERT INTO creature_movement_scripts (id, delay, command, datalong, comments) VALUES
(1593101, 5, 15, 28280, "cast summon sewage slime");

UPDATE creature set MovementType=2, currentWaypoint=5 where id = 15931;

-- make sewage slimes that grobbulus spawn move randomly
UPDATE `creature_template` SET `MovementType`=1 WHERE `entry`=16375;


UPDATE `creature_template` SET `AIName`='EventAI', `flags_extra`=4096 WHERE `entry`=16290;
REPLACE INTO `creature_ai_scripts`
(`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`)
VALUES
(1629001, 16290, 11, 0, 100, 0, 0, 0, 0, 0, 11, 28362, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 'Fallout Slime cast Disease Cloud on self on spawn');