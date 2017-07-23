
-- Fallout should do a lot more dmg (no exact sources, but videos show tanks dropping quite a bit)
UPDATE `creature_template` SET `mindmg`=5045, `maxdmg`=6115 WHERE `entry`=16290;

-- Giving grobbulus cloud creature a scriptname and make it invisible and give it a proper level so the cloud spell dosent resist. and faction
UPDATE `creature_template` SET `ScriptName`="boss_grobbulus_cloud", `unit_class`='1', `unit_flags` = 33587968, `minlevel`='63', `maxlevel`='63', `faction_A`='20', `faction_H`='20' WHERE `entry`=16363;

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