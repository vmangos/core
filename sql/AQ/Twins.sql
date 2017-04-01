
-- Moved the masters eye up in the air and turned it around to face the emperors. Script will turn it towards players
UPDATE `creature` SET `position_z`='-102.44', `orientation`='4.896' WHERE `guid`='88072';

-- Added ScriptName, made unit non-attackable and experimented with some other flags for floating, but they should be back to what they were.
UPDATE `creature_template`  SET `unit_flags`=(2) , `AIName`='EventAI', `MovementType` = '0',`InhabitType` = '3', `ScriptName`='mob_masters_eye' WHERE `entry`='15963';

DELETE FROM spell_mod WHERE Id = 800;
INSERT INTO spell_mod (`Id`, `DurationIndex`,`Comment`) VALUES ('800', '65','Spell twins teleport stun 1.5sec');

UPDATE creature_template SET speed_run=2.14286 WHERE entry=15275;
UPDATE creature_template SET speed_run=2.14286 WHERE entry=15276;
