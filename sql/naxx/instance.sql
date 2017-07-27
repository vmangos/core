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