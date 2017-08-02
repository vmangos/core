-- todo: set spawntimesecs of all bosses to 604800

-- script added to anub'rekhans door so we can do anubs welcome msg in onUse for the door
UPDATE `gameobject_template` SET `ScriptName`='go_anub_door' WHERE `entry`='181126';

-- Give Anub'rekhan gate GO_FLAG_NO_INTERACT flag. It's opened by instance script
UPDATE `gameobject_template` SET `flags` = `flags`| 16 WHERE `entry`='181195';

-- give AreaTrigger outside Faerlina scriptname
DELETE FROM `scripted_areatrigger` where entry = 4115;
INSERT INTO `scripted_areatrigger` (`entry`, `ScriptName`) VALUES ('4115', 'at_naxxramas');

-- Give Faerlina web GO_FLAG_NO_INTERACT flag. It's opened by instance script
UPDATE `gameobject_template` SET `flags` = `flags`| 16 WHERE `entry`='181235';

-- give maexxna outer web gate GO_FLAG_NO_INTERACT flag. It's opened by instance script
UPDATE `gameobject_template` SET `flags` = `flags`| 16 WHERE `entry`='181209';

-- give maexxna inner web gate GO_FLAG_NO_INTERACT flag. It's toggled by instance script
UPDATE `gameobject_template` SET `flags` = `flags`| 16, `size`=1.1 WHERE `entry`='181197';

-- Give teleport spell used by portals from end of a wing to center of naxx its target possition (portal to sapphiron)
DELETE FROM `spell_target_position` where id = 28444;
INSERT INTO `spell_target_position` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`) VALUES ('28444', '533', '3005.8', '-3434.3', '294', '0');

-- Remove the areatrigger to teleport from center of naxx to sapphiron from areatrigger_teleport, 
-- and add it to scripted_areatrigger instead so we can have a script that checks the required
-- bosses area dead for the trigger to work.
DELETE FROM `areatrigger_teleport` where id = 4156;
DELETE FROM `scripted_areatrigger` where entry = 4156;
INSERT INTO `scripted_areatrigger` (`entry`, `ScriptName`) VALUES ('4156', 'at_naxxramas');

-- thaddius entrance areatrigger
DELETE FROM `scripted_areatrigger` where entry = 4113;
INSERT INTO `scripted_areatrigger` (`entry`, `ScriptName`) VALUES ('4113', 'at_naxxramas');

-- add Mr. Bigglesworth
-- set movement type to random 
UPDATE `creature_template` SET `MovementType`=1 WHERE `entry`=16998;
/*
DELETE FROM `creature` where id = 16998;
INSERT INTO `creature` (`guid`,`id`,`map`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`,`spawnFlags`) 
VALUES (533001,16998,533,0,0,3005.8,-3434.81,304.196,5.38862,604800,50,0,37000,0,0,1,0);
*/


-- Acid Volley stack with self
DELETE FROM spell_mod where Id = 29325;
INSERT INTO `spell_mod` (`Id`, `procChance`, `procFlags`, `procCharges`, `DurationIndex`, `Category`, `CastingTimeIndex`, `StackAmount`, `SpellIconID`, `activeIconID`, `manaCost`, `Attributes`, `AttributesEx`, `AttributesEx2`, `AttributesEx3`, `AttributesEx4`, `Custom`, `InterruptFlags`, `AuraInterruptFlags`, `ChannelInterruptFlags`, `Dispel`, `Stances`, `StancesNot`, `SpellVisual`, `ManaCostPercentage`, `StartRecoveryCategory`, `StartRecoveryTime`, `MaxAffectedTargets`, `MaxTargetLevel`, `DmgClass`, `rangeIndex`, `RecoveryTime`, `CategoryRecoveryTime`, `SpellFamilyName`, `SpellFamilyFlags`, `Mechanic`, `Comment`) 
VALUES ('29325', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '0', '-1', 'Acid Volley stack with self');


DELETE FROM spell_mod where Id = 28413;
INSERT INTO `spell_mod` (`Id`, `procChance`, `procFlags`, `procCharges`, `DurationIndex`, `Category`, `CastingTimeIndex`, `StackAmount`, `SpellIconID`, `activeIconID`, `manaCost`, `Attributes`, `AttributesEx`, `AttributesEx2`, `AttributesEx3`, `AttributesEx4`, `Custom`, `InterruptFlags`, `AuraInterruptFlags`, `ChannelInterruptFlags`, `Dispel`, `Stances`, `StancesNot`, `SpellVisual`, `ManaCostPercentage`, `StartRecoveryCategory`, `StartRecoveryTime`, `MaxAffectedTargets`, `MaxTargetLevel`, `DmgClass`, `rangeIndex`, `RecoveryTime`, `CategoryRecoveryTime`, `SpellFamilyName`, `SpellFamilyFlags`, `Mechanic`, `Comment`) 
VALUES ('28413', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '0', '-1', 'Aura of Agony stack with self');

-- remove NULL as subname of Larva, and fix scale
UPDATE `creature_template` SET `subname`='', `scale`='0.2' WHERE `entry`=16068;
-- remove NULL as subname of Maggot, and fix scale
UPDATE `creature_template` SET `subname`='', `scale`='0.2' WHERE `entry`=16030;





-- Below are updates for Necro Knight Guardians. Note it's the same AI as for regular Necro Knights.
-- Setting randomly fire, arcane or frost phase on pull.
-- adjusted timers for each ability to reflect that it now only uses 2/6 abilities at a time.

REPLACE INTO `creature_ai_scripts`
(`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`)
VALUES
(1645207, 16452, 4, 0, 100, 0, 0, 0, 0, 0, 30, 1, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 'Necro Knight Guardian set phase on pull');

UPDATE `creature_ai_scripts` SET `event_inverse_phase_mask`=-5 WHERE `id`=1645206;
UPDATE `creature_ai_scripts` SET `event_inverse_phase_mask`=-9 WHERE `id`=1645205;
UPDATE `creature_ai_scripts` SET `event_inverse_phase_mask`=-9 WHERE `id`=1645204;
UPDATE `creature_ai_scripts` SET `event_inverse_phase_mask`=-3 WHERE `id`=1645201;
UPDATE `creature_ai_scripts` SET `event_inverse_phase_mask`=-3 WHERE `id`=1645202;
UPDATE `creature_ai_scripts` SET `event_inverse_phase_mask`=-5 WHERE `id`=1645203;

UPDATE `creature_ai_scripts` SET `event_param1`=5500, `event_param2`=5500, `event_param3`=7000,  `event_param4`=7000, `action1_param1`=29207 WHERE `id`=1645205;
UPDATE `creature_ai_scripts` SET `event_param1`=6000, `event_param2`=6000, `event_param3`=7000,  `event_param4`=7000  WHERE `id`=1645204;
UPDATE `creature_ai_scripts` SET `event_param1`=4000, `event_param2`=4000, `event_param3`=8000,  `event_param4`=10000 WHERE `id`=1645201;
UPDATE `creature_ai_scripts` SET `event_param1`=7000, `event_param2`=7000, `event_param3`=8000,  `event_param4`=10000 WHERE `id`=1645202;
UPDATE `creature_ai_scripts` SET `event_param1`=3000, `event_param2`=3000, `event_param3`=10000, `event_param4`=10000 WHERE `id`=1645203;
UPDATE `creature_ai_scripts` SET `event_param1`=3500, `event_param2`=3500, `event_param3`=10000, `event_param4`=10000 WHERE `id`=1645206;

-- death knight vindicator, increase frequency of aura of agony and death coil hit maintank
UPDATE `creature_ai_scripts` SET `action1_param2`=1 WHERE `id`=1645103;
UPDATE `creature_ai_scripts` SET `event_param2`=2500, `event_param3`=6000, `event_param4`=6000 WHERE `id`=1645101;

-- updating a bunch of creatures faction which were previously 21 or other incorrect factions
UPDATE creature_template SET faction_A=20, faction_H=20 where entry in(
16419,
16474,
16286,
16447,
16243,
16244,
16168,
15954,
16297,
16037,
16034,
15936,
16011,
16446,
16057,
16056,
16017,
16018,
16024,
16028,
16025,
15931,
15932,
15975,
15976,
15977,
15974,
16453,
15956,
16194,
16163,
16215,
16216,
16165,
16146,
16145,
16164,
16154,
16158,
16156,
16193,
16167,
16157,
16061,
16067,
16060,
15928,
15952,
16861,
15953,
15981,
15980,
15978,
16020,
16022,
16021,
16211,
16029,
16064,
16065,
16063,
16062,
15989,
16451,
16452,
16368,
15990,
16449,
16448,
15979,
15929,
15930,
16027,
16124,
16125,
16126,
16127,
16142,
16148,
16149,
16150,
16236,
16290,
16360,
16363,
16375,
16385,
16427,
16428,
16429,
16441,
16505,
16506,
16573,
16698,
16803,
16981,
16982,
16983,
16984);

update creature_template set speed_walk = 0.8 where entry in (16447, 16244, 16011, 16021, 16243);
update creature_template set speed_walk = 1.5 where entry in (15931, 16158,16290,16365,16368,16381,16446,16448,16449,16451,16452,16453);
update creature_template set speed_walk = 1.65 where entry in (15928, 15929,15930,15952,15989,16062,16063,16064,16065);
update creature_template set speed_run = 1.65 where entry in (16062,16063,16064,16065);
update creature_template set speed_walk = 1.6 where entry = 16061;
update creature_template set speed_walk = 1.28 where entry in (16145,16146,16156,16193);
update creature_template set speed_walk = 2, speed_run = 1.71429 where entry = 16028;
update creature_template set speed_walk = 0.4, speed_run = 0.4 where entry = 16142;
update creature_template set speed_walk = 2 where entry = 16168;


-- Portal of naxxxramas to EventAI
UPDATE `creature_template` SET `AIName`='EventAI' WHERE `entry`=16420;

-- Portal of naxxramas casts Portal of Shadow on itself on spawn, which triggers a spawn of a ghost every 10 sec
DELETE FROM `creature_ai_scripts` where id = 1642001;
INSERT INTO `creature_ai_scripts`
(`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`)
VALUES
(1642001, 16420, 11, 0, 100, 0, 0, 0, 0, 0, 11, 28384, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 'Cast portal of naxxramas on self');


-- Spirit of Naxxramas given script and correct faction
UPDATE `creature_template` SET `AIName`='', `ScriptName`='spirit_of_naxxramas_ai', `minhealth`=150000, `maxhealth`=150000 WHERE `entry`=16449;

-- Ghost of Naxxramas 
UPDATE `creature_template` SET `minlevel`=61, `maxlevel`=61, `armor`=3200, `mindmg`=1500, `maxdmg`=2200, `attackpower`=320, `dmg_multiplier`=1, `type`=6, `MovementType`=1, `speed_walk`='0.5', `speed_run`='0.5', `AIName`='EventAI' WHERE `entry`=16419;

-- ghost of naxxramas zone combat pulse on spawn
DELETE FROM `creature_ai_scripts` where id = 1641901;
INSERT INTO `creature_ai_scripts`
(`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`)
VALUES
(1641901, 16419, 11, 0, 100, 0, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'ghost of naxxramas zone combat pulse on spawn');

-- ghost of naxxramas suecide if in combat for more than 30 sec
DELETE FROM `creature_ai_scripts` where id = 1641902;
INSERT INTO `creature_ai_scripts`
(`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`)
VALUES
(1641902, 16419, 0, 0, 100, 0, 30000, 30000, 0, 0, 37, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'ghost of naxxramas suecide');


-- plagued gargoyle switch from eventAI to script. Immmune to pmuch everything
UPDATE `creature_template` SET `AIName`='', `MechanicImmuneMask`=1073725439, `ScriptName`='naxxramas_gargoyle_ai' WHERE `entry`=16446;


-- Plagued Ghoul cleave
DELETE FROM `creature_ai_scripts` where id = 1644704;
INSERT INTO `creature_ai_scripts`
(`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`)
VALUES
(1644704, 16447, 0, 0, 100, 1, 0, 0, 7000, 8000, 11, 26350, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Plagued Ghoul cleave');

-- necropolis acolyte updates
UPDATE `creature_ai_scripts` SET `event_param1`=500, `event_param2`=500, `event_param3`=6000, `event_param4`=6000 WHERE `id`=1636801;
DELETE FROM `creature_ai_scripts` where id = 1636802;

INSERT INTO `creature_ai_scripts`
(`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`)
VALUES
(1636802, 16368, 0, 0, 100, 1, 2500, 2500, 6000, 6000, 11, 27646, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Necropolis Acolyte shadow bolt volley');

-- plagued ghoul immunities
UPDATE `creature_template` SET `MechanicImmuneMask`=13109328 WHERE `entry`=16447;

REPLACE INTO `creature_ai_scripts`
(`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`)
VALUES
(1644801, 16448, 0, 0, 100, 1, 6000, 8000, 8000, 10000, 11, 30121, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Plagued Deathhound forceful howl');
-- Plagued deathhound ai
UPDATE `creature_template` SET `minhealth`=93736, `maxhealth`=93736, `maxmana`=0, `scale`=2.5, `AIName`='EventAI' WHERE `entry`=16448;