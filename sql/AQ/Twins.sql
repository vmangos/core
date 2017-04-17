
-- Moved the masters eye up in the air and turned it around to face the emperors. Script will turn it towards players
UPDATE `creature` SET `position_z`='-102.44', `orientation`='4.896' WHERE `guid`='88072';

-- Added ScriptName, made unit non-attackable and experimented with some other flags for floating, but they should be back to what they were.
UPDATE `creature_template`  SET `unit_flags`=(2) , `AIName`='EventAI', `MovementType` = '0',`InhabitType` = '3', `ScriptName`='mob_masters_eye' WHERE `entry`='15963';


DELETE FROM spell_mod WHERE Id = 800;
INSERT INTO spell_mod (`Id`, `DurationIndex`,`Comment`) VALUES ('800', '39','Spell twins teleport stun 2 sec');

-- Increased their runspeed. No idea exactly what it should be, but absolutely more than their default one
UPDATE creature_template SET speed_run=1.8 WHERE entry=15275;
UPDATE creature_template SET speed_run=1.8 WHERE entry=15276;

	-- 15761	0.558	2	2	0	0
	-- 15778	7.1	10	2	0	0
UPDATE creature_model_info SET `bounding_radius`='1.2', `combat_reach`='6' WHERE `modelid`='15761';
UPDATE creature_model_info SET `bounding_radius`='1.2', `combat_reach`='6' WHERE `modelid`='15778';


-- scripted ai for bugs on twins to robustify resetting
UPDATE creature_template SET `ScriptName`='mob_twins_bug' WHERE `entry`='15317';
UPDATE creature_template SET `ScriptName`='mob_twins_bug' WHERE `entry`='15316';

-- creating creature_equip_template entry for Vek'lors scepter
DELETE FROM creature_equip_template WHERE entry = 16000;
INSERT INTO creature_equip_template (entry, equipentry1) VALUES (16000, 21796);

-- Giving Vek'lor the scepter equip template
UPDATE creature_template SET equipment_id=16000 WHERE entry=15276;

-- making emperors immune to disarm
UPDATE creature_template SET MechanicImmuneMask = (MechanicImmuneMask | 4) WHERE entry = 15275;
UPDATE creature_template SET MechanicImmuneMask = (MechanicImmuneMask | 4) WHERE entry = 15276;