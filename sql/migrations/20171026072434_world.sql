DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171026072434');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171026072434');
-- Add your query below.

-- -------------------------------
-- 
-- NAXXRAMAS CREATURES, BOSS TEXTS, GAMEOBJECTS
-- 
-- Creature linking, immunities, some creature scripts
-- Many creature and gobj attribute adjustments
--
-- -------------------------------

-- Removing all creatures, their groups and links and movement where the creature exists in naxx
DELETE FROM creature_movement_template where entry in (select id from creature where map = 533);
DELETE FROM creature_movement where id in (select guid from creature where map = 533);
DELETE FROM creature_groups where leaderGUID in (select guid from creature where map = 533);
DELETE FROM creature_linking where guid in (select guid from creature where map = 533);
DELETE FROM creature where map = 533;



-- make the flying naxxramas thing visible from faaar away
update gameobject set visibilitymod = 1000 where id = 181056;


/*
* General naxx stuff
*/ 

REPLACE INTO script_texts (entry, content_default, type, language, emote, comment)
VALUES
(-1999913, "%s spits on $N", 2, 0, 0, "spit on target");

update quest_template set PrevQuestId = 9121 where entry = 9033; -- echoes of war requires 9121

UPDATE `creature_template` SET `npcflag`=3, `ScriptName`='mob_craftsman_omarion' WHERE `entry`=16365;

-- quest "The only song i know..." requires quest "Echoes of war" completed
update quest_template set PrevQuestId = 9033 where entry = 9232;

-- The remaining craft quests require quest "Omarion's Handbook" completed
update quest_template set PrevQuestId = 9233 where entry in (
9234,
9235,
9236,
9237,
9238,
9239,
9240,
9241,
9242,
9243,
9244,
9245,
9246);

REPLACE INTO `npc_text` (`ID`, `text0_0`, `text0_1`, `lang0`, `prob0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `text1_0`, `text1_1`, `lang1`, `prob1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, 
`em1_5`, `text2_0`, `text2_1`, `lang2`, `prob2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `text3_0`, `text3_1`, `lang3`, `prob3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `text4_0`, 
`text4_1`, `lang4`, `prob4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `text5_0`, `text5_1`, `lang5`, `prob5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `text6_0`, `text6_1`, `lang6`,
 `prob6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `text7_0`, `text7_1`, `lang7`, `prob7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`) 
 VALUES
(8508, 'Perhaps I can teach you something...','', 0, 1, 6, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0);

-- Make Necropolis acolyte only use male gender (female gender is 16161), as this was the case in retail vanilla
update creature_model_info set modelid_other_gender = 0 where modelid = 16160;
-- Same thing for death knight captains (though both are male, just different haircolor)
update creature_model_info set modelid_other_gender = 0 where modelid = 16513;

-- moving the naxxramas flying gobj outside naxx to... naxx
update gameobject set position_x = 3132, position_y = -3731, position_z = 139 where id = 181056;

DELETE FROM `spell_mod` where Id in (28800);
INSERT INTO `spell_mod` (`Id`, `procChance`, `procFlags`, `procCharges`, `DurationIndex`, `Category`, `CastingTimeIndex`, `StackAmount`, `SpellIconID`, `activeIconID`, `manaCost`, `Attributes`, `AttributesEx`,
`AttributesEx2`, `AttributesEx3`, `AttributesEx4`, `Custom`, `InterruptFlags`, `AuraInterruptFlags`, `ChannelInterruptFlags`, `Dispel`, `Stances`, `StancesNot`, `SpellVisual`, `ManaCostPercentage`, 
`StartRecoveryCategory`, `StartRecoveryTime`, `MaxAffectedTargets`, `MaxTargetLevel`, `DmgClass`, `rangeIndex`, `RecoveryTime`, `CategoryRecoveryTime`, `SpellFamilyName`, `SpellFamilyFlags`, `Mechanic`, `Comment`) 
VALUES 
('28800', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1 ', '4', '-1', '-1', '0', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '0', '-1', 'World of Thawing ignore los');

update quest_template set RequiredClasses = 8 where entry = 9078; -- Bonescythe Legplates should require class rogue


DELETE FROM `spell_mod` where Id in (30122, 29422, 28369, 30075);
INSERT INTO `spell_mod` (`Id`, `procChance`, `procFlags`, `procCharges`, `DurationIndex`, `Category`, `CastingTimeIndex`, `StackAmount`, `SpellIconID`, `activeIconID`, `manaCost`, `Attributes`, `AttributesEx`,
`AttributesEx2`, `AttributesEx3`, `AttributesEx4`, `Custom`, `InterruptFlags`, `AuraInterruptFlags`, `ChannelInterruptFlags`, `Dispel`, `Stances`, `StancesNot`, `SpellVisual`, `ManaCostPercentage`, 
`StartRecoveryCategory`, `StartRecoveryTime`, `MaxAffectedTargets`, `MaxTargetLevel`, `DmgClass`, `rangeIndex`, `RecoveryTime`, `CategoryRecoveryTime`, `SpellFamilyName`, `SpellFamilyFlags`, `Mechanic`, `Comment`) 
VALUES 
('30122', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '268435592 ', '-1', '-1', '-1', '0', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '0', '-1', 'No channeled_2 flag on Plague Cloud'),
('29422', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '268435456 ', '-1', '-1', '-1', '0', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '0', '-1', 'No channeled_2 flag on KelThuzad CHannel'),
('28369', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '0 ', '-1', '-1', '-1', '0', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '0', '-1', 'No channeled_1 flag on Gas'),
('30075', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '268435456 ', '-1', '-1', '-1', '0', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '0', '-1', 'No channeled_1 flag on Gas');

-- give AreaTrigger outside Faerlina scriptname
DELETE FROM `scripted_areatrigger` where entry = 4115;
INSERT INTO `scripted_areatrigger` (`entry`, `ScriptName`) VALUES ('4115', 'at_naxxramas');

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
-- set movement type to waypoint, set faction friendly or something
UPDATE `creature_template` SET `MovementType`=2, `faction_A`=31, `faction_H`=31 WHERE `entry`=16998;


-- Acid Volley and zombie chow infected wounds stack with self
DELETE FROM spell_mod where Id in (29325, 29306, 28832, 28833, 28834, 28835, 28836);
INSERT INTO `spell_mod` (`Id`, `procChance`, `procFlags`, `procCharges`, `DurationIndex`, `Category`, `CastingTimeIndex`, `StackAmount`, `SpellIconID`, `activeIconID`, `manaCost`, `Attributes`, `AttributesEx`, `AttributesEx2`, `AttributesEx3`, `AttributesEx4`, `Custom`, `InterruptFlags`, `AuraInterruptFlags`, `ChannelInterruptFlags`, `Dispel`, `Stances`, `StancesNot`, `SpellVisual`, `ManaCostPercentage`, `StartRecoveryCategory`, `StartRecoveryTime`, `MaxAffectedTargets`, `MaxTargetLevel`, `DmgClass`, `rangeIndex`, `RecoveryTime`, `CategoryRecoveryTime`, `SpellFamilyName`, `SpellFamilyFlags`, `Mechanic`, `Comment`) 
VALUES 
('29325', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '0', '-1', 'Acid Volley stack with self'),
('29306', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '0', '-1', 'Infected Wounds stack with self'),
('28832', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '1', '1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '0', '-1', 'Mark of Korthazz stack with self and ignore resist'),
('28833', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '1', '1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '0', '-1', 'Mark of Blaumeux stack with self and ignore resist'),
('28834', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '1', '1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '0', '-1', 'Mark of Mograine stack with self and ignore resist'),
('28835', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '1', '1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '0', '-1', 'Mark of Zeliek stack with self and ignore resist'),
('28836', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '1', '0', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '0', '-1', '4HM Mark ignore resist');


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

DELETE FROM `creature_ai_scripts` where id = 1645207;
INSERT INTO `creature_ai_scripts`
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

UPDATE `creature_template` SET `mindmg`=2045, `maxdmg`=2704 WHERE `entry`=16452;

-- death knight vindicator, increase frequency of aura of agony and death coil hit maintank
UPDATE `creature_ai_scripts` SET `action1_param2`=1 WHERE `id`=1645103;
UPDATE `creature_ai_scripts` SET `event_param2`=2500, `event_param3`=6000, `event_param4`=6000 WHERE `id`=1645101;
UPDATE `creature_template` SET `minhealth`=163859, `maxhealth`=163859, `mindmg`=3500, `maxdmg`=4162 WHERE `entry`=16451;

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
16984,
16036,
16129);

update creature_template set speed_walk = 0.8 where entry in (16447, 16244, 16011, 16021, 16243);
update creature_template set speed_walk = 1.5 where entry in (15931, 16158,16290,16365,16368,16381,16446,16448,16449,16451,16452,16453);
update creature_template set speed_walk = 1.65 where entry in (15928, 15929,15930,15952,15989,16062,16063,16064,16065);
update creature_template set speed_run = 1.65 where entry in (16062,16063,16064,16065);
update creature_template set speed_walk = 1.6 where entry = 16061;
update creature_template set speed_walk = 1.28 where entry in (16145,16146,16156,16193);
update creature_template set speed_walk = 2, speed_run = 1.71429 where entry = 16028;
update creature_template set speed_walk = 0.4, speed_run = 0.4 where entry = 16142;
update creature_template set speed_walk = 2 where entry = 16168;
update creature_template set speed_run = 1.28 where entry in (16163,16861,16451);

-- Portal of naxxxramas to EventAI
UPDATE `creature_template` SET `AIName`='EventAI' WHERE `entry`=16420;

DELETE FROM `creature_ai_scripts` where id in (1642001, 1641901, 1641902, 1644704, 1636802, 1644801);
INSERT INTO `creature_ai_scripts`
(`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`)
VALUES
(1642001, 16420, 11, 0, 100, 0, 0, 0, 0, 0, 11, 28384, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 'Cast portal of naxxramas on self'),
(1641901, 16419, 11, 0, 100, 0, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'ghost of naxxramas zone combat pulse on spawn'),
(1641902, 16419, 0, 0, 100, 0, 30000, 30000, 0, 0, 37, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'ghost of naxxramas suecide'),
(1644704, 16447, 0, 0, 100, 1, 0, 0, 7000, 8000, 11, 26350, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Plagued Ghoul cleave'),
(1636802, 16368, 0, 0, 100, 1, 2500, 2500, 6000, 6000, 11, 27646, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Necropolis Acolyte shadow bolt volley'),
(1644801, 16448, 0, 0, 100, 1, 6000, 8000, 8000, 10000, 11, 30121, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Plagued Deathhound forceful howl');

-- Plagued Ghoul
UPDATE `creature_template` SET `mindmg`=2778, `maxdmg`=3683 WHERE `entry`=16447;

-- Spirit of Naxxramas given script and correct faction
UPDATE `creature_template` SET `AIName`='', `ScriptName`='spirit_of_naxxramas_ai', `minhealth`=150000, `maxhealth`=150000,`mindmg`=4100, `maxdmg`=5100 WHERE `entry`=16449;

-- Ghost of Naxxramas 
UPDATE `creature_template` SET `minlevel`=61, `maxlevel`=61, `armor`=3200, `mindmg`=1500, `maxdmg`=2200, `attackpower`=320, `dmg_multiplier`=1, `type`=6, `MovementType`=1, `speed_walk`='0.5', `speed_run`='0.5', `AIName`='EventAI' WHERE `entry`=16419;

-- plagued gargoyle switch from eventAI to script. Immmune to pmuch everything
UPDATE `creature_template` SET `AIName`='', `ScriptName`='naxxramas_gargoyle_ai',`speed_run`=1.5, `mindmg`=3695, `maxdmg`=4889  WHERE `entry`=16446;

-- necropolis acolyte updates
UPDATE `creature_ai_scripts` SET `event_param1`=500, `event_param2`=500, `event_param3`=6000, `event_param4`=6000 WHERE `id`=1636801;

-- Necropolis Acolyte HP and dmg
UPDATE `creature_template` SET `minhealth`=110197, `maxhealth`=110197, `mindmg`='2400', `maxdmg`='3900' WHERE `entry`=16368;

-- Plagued deathhound ai
UPDATE `creature_template` SET `minhealth`=93736, `maxhealth`=93736, `maxmana`=93736, `scale`=2.5, `AIName`='EventAI' WHERE `entry`=16448;

-- Infectious Ghoul
UPDATE `creature_template` SET `mindmg`=2778, `maxdmg`=3683 WHERE `entry`=16244;

-- Archmage Tarsis gossip stuff
DELETE FROM gossip_menu where entry between 8400 and 8409;
INSERT INTO gossip_menu (entry, text_id, condition_id) VALUES
(8400, 8517, 0),
(8401, 8518, 0),
(8402, 8519, 0),
(8403, 8520, 0),
(8404, 8521, 0),
(8405, 8522, 0),
(8406, 8523, 0),
(8407, 8529, 0),
(8408, 8530, 0),
(8409, 8531, 0);
DELETE FROM gossip_menu_option where menu_id  between 8400 and 8409;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('8400', '0', '0', 'What are you talking about, mage?', '1', '1', '8401', '0', '0', '0', '0', NULL, '0'),
('8401', '0', '0', 'Why have you done such horrible things?', '1', '1', '8402', '0', '0', '0', '0', NULL, '0'),
('8402', '0', '0', 'I still do not understand.', '1', '1', '8403', '0', '0', '0', '0', NULL, '0'),
('8403', '0', '0', 'You are talking nonsense, mage.', '1', '1', '8404', '0', '0', '0', '0', NULL, '0'),
('8404', '0', '0', 'What staff?', '1', '1', '8405', '0', '0', '0', '0', NULL, '0'),
('8405', '0', '0', 'You said you would have it back. What does that mean?', '1', '1', '8406', '0', '0', '0', '0', NULL, '0'),
('8406', '0', '0', 'What happened to the staff?', '1', '1', '8407', '0', '0', '0', '0', NULL, '0'),
('8407', '0', '0', 'So what has led you to Naxxramas?', '1', '1', '8408', '0', '0', '0', '0', NULL, '0'),
('8408', '0', '0', 'So Kel\'Thuzad holds all of the pieces?', '1', '1', '8409', '0', '0', '0', '0', NULL, '0');
UPDATE `creature_template` SET `gossip_menu_id`=8400, `npcflag`=1, `ScriptName`='npc_archmage_tarsis' WHERE `entry`=16381;
UPDATE `npc_text` SET `em0_1`='13' WHERE `ID`='8517';

-- Some trash loot is faction specific, paladin/shaman gear
UPDATE `creature_loot_template` SET `condition_id` = 2 WHERE `item` IN (23663, 23664, 23665);
UPDATE `creature_loot_template` SET `condition_id` = 3 WHERE `item` IN (23666, 23667, 23668);

UPDATE `reference_loot_template` SET `condition_id` = 2 WHERE `item` = 23065;
UPDATE `reference_loot_template` SET `condition_id` = 3 WHERE `item` = 23066;

/* 
* constructwing
*/ 
 
-- Living Poison (froggers) speed fix
UPDATE `creature_template` SET `speed_walk`='0.375', `speed_run`='0.375' WHERE `entry`=16027;
-- Living Poison hitbox so it dosent trigger further away than the explode spell range
update creature_model_info set bounding_radius = 1, combat_reach = 1 where modelid = 12349;
UPDATE `creature_ai_scripts` SET `event_param2`=3.5 WHERE `id`=1602701;

-- Embalming slime moves at 50% movementspeed
UPDATE `creature_template` SET `speed_walk`='0.5', `speed_run`='0.5', `minhealth`=14619, `maxhealth`=14619 WHERE `entry`=16024;
-- embalming slime faster embalming cloud
UPDATE `creature_ai_scripts` SET `event_param3`=2000, `event_param4`=3000 WHERE `id`=1602401;

-- Lightning Totem (summoned by Living Monstrosity) no movement
UPDATE `creature_template` SET `speed_walk`='0.00001', `speed_run`='0.00001', `mindmg`=0, `maxdmg`=0, `unit_flags`=0, `type`=10, `MovementType`=0 WHERE `entry`=16385;
-- toxic tunnel creature lvl 60 and script
UPDATE `creature_template` SET `minlevel`=60, `maxlevel`=60, `AIName`='', `ScriptName`='toxic_tunnel_ai' WHERE `entry`=16400;
-- bile sludge damage increase
UPDATE `creature_template` SET `mindmg`=1500, `maxdmg`=2000, `minhealth`=35000, `maxhealth`=35000  WHERE `entry`=16142;
-- Stitched giants were named stitched spewer in vanilla
UPDATE `creature_template` SET `name`='Stitched Spewer' WHERE `entry`=16025;

-- Stitched Spewer AI changes:

DELETE FROM creature_ai_scripts where creature_id = 16025;
INSERT INTO `creature_ai_scripts`
(`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`)
VALUES
(1602501, 16025, 0, 0, 100, 3, 0, 0, 5000, 10000, 11, 28311, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Stitched Spewer - Casts Slime Bolt'),
(1602502, 16025, 0, 0, 100, 3, 5000, 5000, 6000, 6000, 11, 28318, 5, 0, 0, 0, 1, 0, 0, 0, 0, 0, 'Stitched Spewer - Casts Slime Shoot'),
(1602503, 16025, 0, 0, 100, 1, 3000, 4000, 8000, 10000, 11, 28405, 1, 0, 13, -95, 1, 0, 0, 0, 0, 0, 'Stitched Spewer knockback with threat reduction');


-- sludge belcher HP
UPDATE `creature_template` SET `minhealth`=248189, `maxhealth`=248189 WHERE `entry`=16029;
DELETE FROM `creature_ai_scripts` WHERE id in (1638501,1638502,1601703,1601704,1602902,1614202, 1602903,1602402);
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) 
VALUES
(1638501, 16385, 11, 0, 100, 0, 0, 0, 0, 0, 11, 28298, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 'Lightning Totem aura on spawn'),
(1638502, 16385, 7, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lightning totem despawn on evade'),
(1601703, 16017, 11, 0, 100, 1, 0, 0, 0, 0, 11, 27793, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Patchwork Golem disease cloud on spawn'),
(1601704, 16017, 12, 0, 100, 1, 19, 0, 4000, 5000, 11, 7160, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Patchwork Golem Execute'),
(1602902, 16029, 0, 0, 100, 1, 5000, 5000, 10000, 10000, 11, 27889, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sludge Belcher summon Bile Sludge'),
-- (1614202, 16142, 1, 0, 100, 1, 30000, 30000, 30000, 30000, 41, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'bile sludge despawn after 30 sec ooc'),
(1602903, 16029, 11, 0, 100, 0, 0, 0, 0, 0, 11, 28362, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sludge belcher disease cloud on spawn'),
(1602402, 16024, 10, 0, 100, 1, 0, 40, 0, 0, 11, 28033, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Embalming Slime aggro all in los');

-- Bile retcher also reset threat when casting bile retcher slam
UPDATE `creature_ai_scripts` SET `action2_type`=14, `action2_param1`=-100 WHERE `id`=1601801;

-- Patchwork Golem correct War stomp spell
UPDATE `creature_ai_scripts` SET `action1_param1`=28725, `event_param3`=10000 WHERE `id`=1601701;
-- Patchwork Golem slightly reduced frequency on 360 cleave
UPDATE `creature_ai_scripts` SET `event_param3`=8000, `event_param4`=15000, `action1_param3`=0 WHERE `id`=1601702;
UPDATE `creature_ai_scripts` SET `event_param1`=3000, `event_param2`=4000, `event_param3`=7000, `event_param4`=10000 WHERE `id`=1602103;
-- Bile Sludges cast clone on a timer rather than 15%
UPDATE `creature_ai_scripts` SET `event_type`=0, `event_flags`=1, `event_param1`=10000, `event_param2`=10000, `event_param3`=10000, `event_param4`=10000 WHERE `id`=1614201;

-- Patchwork golem
UPDATE `creature_template` SET `mindmg`=3968, `maxdmg`=5261, `baseattacktime`=1480,`minhealth`=87532, `maxhealth`=87532 WHERE `entry`=16017;
-- bile retcher
UPDATE `creature_template` SET `mindmg`=3704, `maxdmg`=4911, `baseattacktime`=1480,`minhealth`=187197, `maxhealth`=187197 WHERE `entry`=16018;
-- Sludge Belcher
UPDATE `creature_template` SET `mindmg`=3776, `maxdmg`=5009, `baseattacktime`=1480,`minhealth`=195189, `maxhealth`=195189 WHERE `entry`=16029;
-- Stitched Spewer
UPDATE `creature_template` SET `mindmg`=4119, `maxdmg`=5462, `baseattacktime`=1480,`minhealth`=217197, `maxhealth`=217197 WHERE `entry`=16025;

DELETE FROM `spell_effect_mod` where Id in (28310);
INSERT INTO `spell_effect_mod` (`Id`, `EffectIndex`, `Effect`, `EffectDieSides`, `EffectBaseDice`, `EffectDicePerLevel`, `EffectRealPointsPerLevel`, `EffectBasePoints`, `EffectAmplitude`, `EffectPointsPerComboPoint`,
`EffectChainTarget`, `EffectMultipleValue`, `EffectMechanic`, `EffectImplicitTargetA`, `EffectImplicitTargetB`, `EffectRadiusIndex`, `EffectApplyAuraName`, `EffectItemType`, `EffectMiscValue`, `EffectTriggerSpell`, `Comment`)
VALUES 
('28310', '0', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '5', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', 'Surgical Assistant Mind Flay Chain damage');

REPLACE INTO `spell_mod` (`Id`, `procChance`, `procFlags`, `procCharges`, `DurationIndex`, `Category`, `CastingTimeIndex`, `StackAmount`, `SpellIconID`, `activeIconID`, `manaCost`, `Attributes`, `AttributesEx`, `AttributesEx2`, `AttributesEx3`, `AttributesEx4`, `Custom`, `InterruptFlags`, `AuraInterruptFlags`, `ChannelInterruptFlags`, `Dispel`, `Stances`, `StancesNot`, `SpellVisual`, `ManaCostPercentage`, `StartRecoveryCategory`, `StartRecoveryTime`, `MaxAffectedTargets`, `MaxTargetLevel`, `DmgClass`, `rangeIndex`, `RecoveryTime`, `CategoryRecoveryTime`, `SpellFamilyName`, `SpellFamilyFlags`, `Mechanic`, `Comment`) 
VALUES ('27890', '-1', '-1', '-1', '5', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '0', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '0', '-1', 'Clone (bile sludge) given despawntimer');

-- Living Monstrosity damage
UPDATE `creature_template` SET `mindmg`='3575', `maxdmg`='4105' WHERE `entry`=16021;


/* 
* deathknight wing
*/ 

UPDATE `creature_template` SET `name`='Skeletal Steed' WHERE `entry`=16067;
DELETE FROM `creature_ai_scripts` where id = 1606702;
INSERT INTO `creature_ai_scripts`
(`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`)
VALUES
(1606702, 16067, 0, 0, 100, 1, 0, 0, 10000, 10000, 11, 27577, 4, 0, 14, -100, 0, 0, 0, 0, 0, 0, 'Skeletal Steed Intercept random  and reset threat');

-- Death Knight fear targets hostile, not self. Also not on pull, but a while later. -- https://youtu.be/VrykhhdPfc4?t=4m37s
UPDATE `creature_ai_scripts` SET `event_param1`=10000, `event_param2`=12000, `action1_param2`=1 WHERE `id`=1614601;


-- death knight captain spam casts whirlwind (different spell than was originally) 15ec after pull, instead (could be hp based too) https://youtu.be/VrykhhdPfc4?t=4m51s
UPDATE `creature_ai_scripts` SET `event_type`=0, `event_param1`=15000, `event_param2`=15000, `event_param3`=15000, `event_param4`=20000, `action1_param1`=28333, `action1_param2`=1 WHERE `id`=1614501;


-- Death knight captain increased dmg, but reduced attackspeed and ai
UPDATE `creature_template` SET `mindmg`=3500, `maxdmg`=4250, `baseattacktime`=2500, `AIName`='EventAI', `ScriptName`='' WHERE `entry`=16145;

-- names, really...
UPDATE `creature_template` SET `name`='Deathknight Captain' WHERE `entry`=16145;
UPDATE `creature_template` SET `name`='Deathknight' WHERE `entry`=16146;
UPDATE `creature_template` SET `name`='Spectral Deathknight' WHERE `entry`=16148;
UPDATE `creature_template` SET `name`='Deathknight Cavalier' WHERE `entry`=16163;
UPDATE `creature_template` SET `name`='Deathknight Understudy' WHERE `entry`=16803;
UPDATE `creature_template` SET `name`='Unrelenting Deathknight' WHERE `entry`=16125;

-- deathknights offhand is a shield, not a mount like it was
UPDATE `creature_template` SET `equipment_id` = 16146 where `entry` = 16146;
DELETE FROM `creature_equip_template` where entry = 16146;
INSERT INTO `creature_equip_template` (entry, equipentry1, equipentry2, equipentry3) VALUES (16146, 2179, 6176, 0);

-- scale of death lord and deathknight cavalier update (cavalier was too big, death lord too small)
UPDATE `creature_template` SET `scale` = 1.8 where `entry` IN (16861, 16861);

-- death lords had 0 dmg
UPDATE `creature_template` SET `minhealth`=163859, `maxhealth`=163859, `mindmg`=3406, `maxdmg`=4793 WHERE `entry`=16861;

-- Death lord and death knight cavalier deathcoil hits current tank
UPDATE `creature_ai_scripts` SET `action1_param2`=1 WHERE `id`=1686103;
UPDATE `creature_ai_scripts` SET `action1_param2`=1 WHERE `id`=1616303;

-- death lord and death knight cavalier curse of agony event slightly randomized to more easily stack with group when not spread
-- death lord has higher frequency of aura of agony
UPDATE `creature_ai_scripts` SET `event_param2`=2500, `event_param3`=3000, `event_param4`=3000 WHERE `id`=1686101;
UPDATE `creature_ai_scripts` SET `event_param2`=2500, `event_param3`=6000, `event_param4`=6000  WHERE `id`=1616301;

-- death knight cavalier
UPDATE `creature_template` SET `mindmg`=3219, `maxdmg`=4231 WHERE `entry`=16163;

-- Touched Warriors periodically wipe aggro 
UPDATE `creature_template` SET `AIName`='EventAI' WHERE `entry`=16156;
UPDATE `creature_template` SET `minhealth`=24990, `maxhealth`=24999, `AIName`='EventAI', scale=1.6 WHERE `entry`=16157;
UPDATE `creature_template` SET `AIName`='EventAI' WHERE `entry`=16158;
DELETE FROM `creature_ai_scripts` where id in (1615601, 1615701, 1615801);
INSERT INTO `creature_ai_scripts`
(`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`)
VALUES
(1615601, 16156, 0, 0, 100, 1, 5000, 5000, 5000, 5000, 14, -100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dark Touched Warrior periodically wipe aggro'),
(1615701, 16157, 0, 0, 100, 1, 2000, 3000, 3000, 4000, 14, -100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Doom Touched Warrior periodically aggro wipe'),
(1615801, 16158, 0, 0, 100, 1, 2000, 3000, 3000, 4000, 14, -100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Touched Warrior periodically aggro wipe');

-- Death Knight raise dead  
DELETE FROM `creature_ai_scripts` where id in (1614603, 1614604);
INSERT INTO `creature_ai_scripts`
(`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`)
VALUES
(1614603, 16146, 0, 0, 100, 1, 5000, 5000, 10000, 20000, 11, 28353, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Knight raise dead'),
(1614604, 16146, 11, 0, 100, 0, 0, 0, 0, 0, 11, 13589, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Deathknight haste aura');

-- use SPELL_EFFECT_APPLY_AREA_AURA_FRIEND  for Haste Aura, it actually works in our core unlike SPELL_EFFECT_APPLY_AREA_AURA_PARTY
 REPLACE INTO spell_effect_mod (Id, EffectIndex, Effect, EffectDieSides, EffectBaseDice, EffectDicePerLevel, EffectRealPointsPerLevel, EffectBasePoints, EffectAmplitude, EffectPointsPerComboPoint, EffectChainTarget, EffectMultipleValue, EffectMechanic, EffectImplicitTargetA, EffectImplicitTargetB, EffectRadiusIndex, EffectApplyAuraName, EffectItemType, EffectMiscValue, EffectTriggerSpell, Comment) VALUES 
 (13589, 0, 128, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 'Haste Aura');


UPDATE `creature_template` SET `flags_extra`=4096 WHERE `entry`=16146; -- keep positive auras on death

-- Death knight frequency of intimidating shout reduced
UPDATE `creature_ai_scripts` SET `event_param3`=14000, `event_param4`=18000 WHERE `id`=1614601;

-- Creatures that the spell Raise Dead can target
-- todo: no idea which creatures should be "ressable", other than other death knights should not be.
DELETE FROM `spell_script_target` where entry = 28353;
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`) 
VALUES
(28353, 2, 16165),
(28353, 2, 16167),
(28353, 2, 16154),
(28353, 2, 16193),
(28353, 2, 16156),
(28353, 2, 16157);  


-- unholy weapons
DELETE FROM creature_equip_template where entry in (16194, 16215, 16216);
INSERT into creature_equip_template (entry, equipentry1, equipentry2, equipentry3) VALUES
(16194, 11342, 0, 0),
(16215, 12959, 0, 0),
(16216, 13222, 13222, 0);

-- unholy weapns equipment id
UPDATE `creature_template` SET `unit_flags`=32768, `equipment_id`=16194, MovementType=1, `AIName`='EventAI',`baseattacktime`=2000, `mindmg`=3230, `maxdmg`=4284 WHERE entry=16194;
UPDATE `creature_template` SET `unit_flags`=32768, `equipment_id`=16215, MovementType=1, `AIName`='EventAI',`baseattacktime`=2000, `mindmg`=2500, `maxdmg`=3200 WHERE entry=16215;
UPDATE `creature_template` SET `unit_flags`=32768, `equipment_id`=16216, MovementType=1, `AIName`='EventAI',`baseattacktime`=1600, `mindmg`=2900, `maxdmg`=3700 WHERE entry=16216;

REPLACE INTO `creature_ai_scripts`
(`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`)
VALUES
(1621501, 16215, 0, 0, 100, 1, 4000, 4000, 15000, 15000, 11, 28450, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Unholy staff Arcane Explosion'),
(1621502, 16215, 0, 0, 100, 1, 8000, 8000, 15000, 15000, 11, 29848, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Unholy staff polymorph'),
(1621503, 16215, 0, 0, 100, 1, 12000, 12000, 15000, 15000, 11, 29849, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'unholy staff frost nova'),
(1619401, 16194, 0, 0, 100, 1, 4000, 4000, 15000, 15000, 11, 29852, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'unholy axe whirlwind'),
(1619402, 16194, 0, 0, 100, 1, 6000, 6000, 7000, 8000, 11, 16856, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'unholy axe Mortal Strike'),
(1621601, 16216, 0, 0, 100, 1, 4000, 4000, 8000, 8000, 11, 3391, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'unholy swords trash'),
(1621602, 16216, 0, 0, 100, 1, 2000, 2000, 8000, 8000, 11, 15284, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'unholy swords cleave');

-- giving shade of naxxramas same script as spirit of naxxramas
UPDATE `creature_template` SET `AIName`='', `ScriptName`='spirit_of_naxxramas_ai',`minhealth`=150000, `maxhealth`=150000, `mindmg`=4100, `maxdmg`=5100 WHERE `entry`=16164;


UPDATE `creature_template` SET `equipment_id`= 16861 where `entry` = 16861;
DELETE FROM `creature_equip_template` where entry = 16861;
INSERT INTO `creature_equip_template` (entry, equipentry1, equipentry2, equipentry3) VALUES (16861, 22738, 0, 0);

-- RP stuff for deathknight packs
DELETE FROM creature_movement_scripts where id in(1614601, 1614602, 1614603, 1614604);
insert into creature_movement_scripts (id, delay, command, datalong, datalong2, datalong3, datalong4, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(1614601,   0,     1,        19,        16157,      10,        0,         0,          0,    0,            0,    0,  0,  0,  0,  0,  "Doom Touched warrior chicken"),
(1614601,   1,     1,        36,        16145,      10,        0,         0,          0,    0,            0,    0,  0,  0,  0,  0,  "Deathknight captain attacks"),
(1614601,   2,     1,        43,        0,           0,        0,         0,          0,    0,            0,    0,  0,  0,  0,  0,  "Deathknight parries"),
(1614601,   5,     1,        1,         16145,      10,        0,         0,          0,    0,            0,    0,  0,  0,  0,  0,  "Deathknight captain talks"),
(1614601,   7,     1,        36,        16145,      10,        0,         0,          0,    0,            0,    0,  0,  0,  0,  0,  "Deathknight captain attacks"),
(1614601,   8,     1,        43,        0,           0,        0,         0,          0,    0,            0,    0,  0,  0,  0,  0,  "Deathknight parries"),
(1614601,   10,    1,        15,        16156,      10,        0,         0,          0,    0,            0,    0,  0,  0,  0,  0,  "Dark Touched warrior roar"),
(1614601,   14,    1,        60,        16145,      10,        0,         0,          0,    0,            0,    0,  0,  0,  0,  0,  "Deathknight captain kicks"),
(1614601,   15,    1,        43,        0,           0,        0,         0,          0,    0,            0,    0,  0,  0,  0,  0,  "Deathknight parries"),
(1614601,   17,    1,        36,        16145,      10,        0,         0,          0,    0,            0,    0,  0,  0,  0,  0,  "Deathknight captain attacks"),
(1614601,   18,    1,        43,        0,           0,        0,         0,          0,    0,            0,    0,  0,  0,  0,  0,  "Deathknight parries"),
(1614601,   20,    1,        5,         16145,      10,        0,         0,          0,    0,            0,    0,  0,  0,  0,  0,  "Deathknight captain shouts"),
(1614601,   22,    1,        36,        16145,      10,        0,         0,          0,    0,            0,    0,  0,  0,  0,  0,  "Deathknight captain attacks"),
(1614601,   23,    1,        21,        16157,      10,        0,         0,          0,    0,            0,    0,  0,  0,  0,  0,  "Doom Touched warrior applaude"),
(1614601,   23,    1,        43,        0,           0,        0,         0,          0,    0,            0,    0,  0,  0,  0,  0,  "Deathknight parries"),
(1614601,   26,    1,        60,        16145,      10,        0,         0,          0,    0,            0,    0,  0,  0,  0,  0,  "Deathknight captain kicks"),
(1614601,   27,    1,        36,        0,           0,        0,         0,          0,    0,            0,    0,  0,  0,  0,  0,  "Deathknight attacks"),
(1614602,   0,     1,        333,       16146,      88435,     0,         16,         0,    0,            0,    0,  0,  0,  0,  0,  "Deathknight buddy attack stance"),
(1614602,   0,     1,        333,       0,           0,        0,         0,          0,    0,            0,    0,  0,  0,  0,  0,  "Deathknight attack stance"),
(1614602,   1,     1,        22,        16145,      12,        0,         0,          53,   25,           25,   25, 0,  0,  0,  0,  "Deathknight Captain shout"),
(1614602,   3,     1,        36,        16146,      88435,     0,         16,         54,   0,            0,    0,  0,  0,  0,  0,  "Deathknight buddy attacks combat dummy"),
(1614602,   5,     1,        36,            0,       0,        0,         0,          35,   36,           38,   54, 0,  0,  0,  0,  "Deathknight attacks combat dummy"),
(1614602,   12,    1,        36,        16146,      88435,     0,         16,         0,    0,            0,    0,  0,  0,  0,  0,  "Deathknight buddy attacks combat dummy"),
(1614602,   13,    1,        36,            0,       0,        0,         0,          0,    0,            0,    0,  0,  0,  0,  0,  "Deathknight attacks combat dummy"),
(1614602,   20,    1,        36,            0,       0,        0,         0,          54,   0,            0,    0,  0,  0,  0,  0,  "Deathknight attacks combat dummy"),
(1614602,   21,    1,        36,        16146,      88435,     0,         16,         35,   36,           38,   54, 0,  0,  0,  0,  "Deathknight buddy attacks combat dummy"),
(1614603,   0,     1,        333,       16146,      88437,     0,         16,         0,    0,            0,    0,  0,  0,  0,  0,  "Deathknight buddy attack stance"),
(1614603,   0,     1,        333,       0,           0,        0,         0,          0,    0,            0,    0,  0,  0,  0,  0,  "Deathknight attack stance"),
(1614603,   3,     1,        36,        16146,      88437,     0,         16,         54,   0,            0,    0,  0,  0,  0,  0,  "Deathknight buddy attacks combat dummy"),
(1614603,   5,     1,        36,            0,       0,        0,         0,          35,   36,           38,   54, 0,  0,  0,  0,  "Deathknight attacks combat dummy"),
(1614603,   10,    1,        22,        16145,      12,        0,         0,          53,   25,           25,   25, 0,  0,  0,  0,  "Deathknight Captain shout"),
(1614603,   12,    1,        36,        16146,      88437,     0,         16,         0,    0,            0,    0,  0,  0,  0,  0,  "Deathknight buddy attacks combat dummy"),
(1614603,   13,    1,        36,            0,       0,        0,         0,          0,    0,            0,    0,  0,  0,  0,  0,  "Deathknight attacks combat dummy"),
(1614603,   20,    1,        36,            0,       0,        0,         0,          54,   0,            0,    0,  0,  0,  0,  0,  "Deathknight attacks combat dummy"),
(1614603,   21,    1,        36,        16146,      88437,     0,         16,         35,   36,           38,   54, 0,  0,  0,  0,  "Deathknight buddy attacks combat dummy"),                 
(1614604,   0,     1,        333,       16146,      88438,     0,         16,         0,    0,            0,    0,  0,  0,  0,  0,  "Deathknight buddy attack stance"),
(1614604,   0,     1,        333,       0,           0,        0,         0,          0,    0,            0,    0,  0,  0,  0,  0,  "Deathknight attack stance"),
(1614604,   2,     1,        36,        16146,      88438,     0,         16,         54,   0,            0,    0,  0,  0,  0,  0,  "Deathknight buddy attacks combat dummy"),
(1614604,   4,     1,        36,            0,       0,        0,         0,          35,   36,           38,   54, 0,  0,  0,  0,  "Deathknight attacks combat dummy"),
(1614604,   11,    1,        36,        16146,      88438,     0,         16,         0,    0,            0,    0,  0,  0,  0,  0,  "Deathknight buddy attacks combat dummy"),
(1614604,   12,    1,        36,            0,       0,        0,         0,          0,    0,            0,    0,  0,  0,  0,  0,  "Deathknight attacks combat dummy"),
(1614604,   16,    1,        22,        16145,      12,        0,         0,          53,   25,           25,   25, 0,  0,  0,  0,  "Deathknight Captain shout"),
(1614604,   18,    1,        36,            0,       0,        0,         0,          54,   0,            0,    0,  0,  0,  0,  0,  "Deathknight attacks combat dummy"),
(1614604,   20,    1,        36,        16146,      88438,     0,         16,         35,   36,           38,   54, 0,  0,  0,  0,  "Deathknight buddy attacks combat dummy");

-- Below are updates for Necro Knights.
-- Setting randomly fire, arcane or frost phase on pull.
-- adjusted timers for each ability to reflect that it now only uses 2/6 abilities at a time.
DELETE FROM `creature_ai_scripts` where id = 1616507;
INSERT INTO `creature_ai_scripts`
(`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`)
VALUES
(1616507, 16165, 4, 0, 100, 0, 0, 0, 0, 0, 30, 1, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 'Necro Knight set phase on pull');

UPDATE `creature_ai_scripts` SET `event_inverse_phase_mask`=-5 WHERE `id`=1616506;
UPDATE `creature_ai_scripts` SET `event_inverse_phase_mask`=-9 WHERE `id`=1616505;
UPDATE `creature_ai_scripts` SET `event_inverse_phase_mask`=-9 WHERE `id`=1616504;
UPDATE `creature_ai_scripts` SET `event_inverse_phase_mask`=-3 WHERE `id`=1616501;
UPDATE `creature_ai_scripts` SET `event_inverse_phase_mask`=-3 WHERE `id`=1616502;
UPDATE `creature_ai_scripts` SET `event_inverse_phase_mask`=-5 WHERE `id`=1616503;

UPDATE `creature_ai_scripts` SET `event_param1`=5500, `event_param2`=5500, `event_param3`=7000, `event_param4`=7000, `action1_param1`=29207 WHERE `id`=1616505;
UPDATE `creature_ai_scripts` SET `event_param1`=6000, `event_param2`=6000, `event_param3`=7000, `event_param4`=7000 WHERE `id`=1616504;
UPDATE `creature_ai_scripts` SET `event_param1`=4000, `event_param2`=4000, `event_param3`=8000, `event_param4`=10000 WHERE `id`=1616501;
UPDATE `creature_ai_scripts` SET `event_param1`=7000, `event_param2`=7000, `event_param3`=8000, `event_param4`=10000 WHERE `id`=1616502;
UPDATE `creature_ai_scripts` SET `event_param1`=3000, `event_param2`=3000, `event_param3`=10000, `event_param4`=10000 WHERE `id`=1616503;
UPDATE `creature_ai_scripts` SET `event_param1`=3500, `event_param2`=3500, `event_param3`=10000, `event_param4`=10000 WHERE `id`=1616506;


DELETE FROM `creature_ai_scripts` where id = 1639001;
INSERT INTO `creature_ai_scripts`
(`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`)
VALUES
(1639001, 16390, 0, 0, 100, 0, 0, 0, 4000, 6000, 14, -100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Deathchill servant periodic threat reset');

-- risen squire is called risen deathknight
UPDATE `creature_template` SET `name`='Risen Deathknight' WHERE `entry`=16154;

-- dark touched warriors are equipped with a bucket
delete from creature_equip_template_raw where entry = 1447;
UPDATE `creature_template` SET `equipment_id`=16156 WHERE `entry`=16156;
DELETE FROM creature_equip_template where entry = 16156;
INSERT into creature_equip_template (entry, equipentry1, equipentry2, equipentry3) VALUES
(16156, 12801, 0, 0);

-- dark touched warriors got a script to do custom running towards horses
UPDATE `creature_template` SET `AIName`='', `equipment_id`=16156, `ScriptName`='dark_touched_warriorAI' WHERE `entry`=16156;

-- give AreaTrigger at start of DK wing script name
DELETE FROM `scripted_areatrigger` where entry = 4117;
INSERT INTO `scripted_areatrigger` (`entry`, `ScriptName`) VALUES ('4117', 'at_naxxramas');

-- deathknight vindicator faster aura of agony
UPDATE `creature_ai_scripts` SET `event_param3`=4000, `event_param4`=4000, `action1_param2`=0 WHERE `id`=1645101;

UPDATE `creature_template` SET `minhealth`=24260, `maxhealth`=24260, `maxdmg`=3415 WHERE `entry`=16154; -- risen deathkngiht
UPDATE `creature_template` SET `minhealth`=24372, `maxhealth`=24372, `maxdmg`=3415 WHERE `entry`=16156; -- dark touched warrior
UPDATE `creature_template` SET `minhealth`=24997, `maxhealth`=24997, `maxdmg`=2600 WHERE `entry`=16157; -- doom touched warrior
UPDATE `creature_template` SET `minhealth`=24734, `maxhealth`=24734, `maxdmg`=3415 WHERE `entry`=16158; -- death touched warrior





/*
* spiderwing
*/

-- Venom Stalker Poson charge repeats every 10-20 sec, and targets a random hostile, not current tank
UPDATE `creature_ai_scripts` SET `event_flags`=3, `event_param3`=8000, `event_param4`=12000, `action1_param2`=4 WHERE `id`=1597601;

-- Poisonous Skitterer scale reduced, increased movementspeed
UPDATE `creature_template` SET `scale`='0.5', `speed_run`='1.75', `speed_walk`='3.5' WHERE `entry`=15977;

-- naxxramas acolyte arcane explosion spell changed to one with 1.5sec cast time, and timers randomized slightly 
UPDATE `creature_ai_scripts` SET `event_param1`=7000, `event_param2`=7000, `event_param3`=7000, `event_param4`=9000, `action1_param1`=30096 WHERE `id`=1598101;

-- naxxramas acolyte shadowbolt timer randomized more and changed spell
UPDATE `creature_ai_scripts` SET `event_param1`=1800, `event_param2`=2000, `event_param3`=7000, `event_param4`=9000, `action1_param1`=28448 WHERE `id`=1598102;

UPDATE `creature_template` SET `mindmg`=2178, `maxdmg`=3317, `armor`=3891 WHERE `entry` in (15980, 15981);

-- tomb horror 
UPDATE `creature_template` SET `minhealth`=140105, `maxhealth`=140105, `mindmg`='3050', `maxdmg`='3680' WHERE `entry`=15979;

-- carrion spinners dmg increase
UPDATE `creature_template` SET `mindmg`='3000', `maxdmg`='3500' WHERE `entry`=15975;

-- Necro stalker poison charge now targets random person and repeats every 8-12s
UPDATE `creature_ai_scripts` SET `event_flags`=3, `event_param3`=8000, `event_param4`=12000, `action1_param2`=4 WHERE `id`=1645301;

-- replace crypt reaver with tomb horror after faerlina
update creature SET id = 15979, modelid = 15942 where guid = 5061270;

UPDATE `creature_template` SET `scale`='2.3' WHERE `entry`=15976;
UPDATE `creature_template` SET `scale`='2.5',`minhealth`='138165', `maxhealth`='138165',`mindmg`=3050, `maxdmg`=3680 WHERE `entry`=16453;

-- dummy creature used to perform the rp stuff happening with naxx acolytes and cultists at faerlina
DELETE FROM `creature_template` WHERE `entry` = 533004;
INSERT INTO `creature_template` 
(`entry`, `KillCredit1`, `KillCredit2`, `modelid_1`, `modelid_2`, `modelid_3`, `modelid_4`, `name`, `subname`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`,
`npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`,
`trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`,
`spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Civilian`, `RacialLeader`, `RegenHealth`, `equipment_id`, `trainer_id`, `vendor_id`, `MechanicImmuneMask`, `SchoolImmuneMask`, `flags_extra`, `ScriptName`) 
VALUES 
('533004', '0', '0', '11686', '0', '0', '0', "Faerlina RP", 'NULL', '0', '63', '63', '5000', '5000', '0', '0', '7', '20', '20', '0', '1.2', '1.1486', '1', '0', '0', '0', '0', '0', '1', '2000', '2000', '1', '33587968', '0', '0', '0', '0', '0', '0', '1', '1', '0', '10', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '3', '0', '0', '1', '0', '0', '0', '0', '0', '0', "mob_faerlina_rp");

-- Crypt Reaver
UPDATE `creature_template` SET `AIName`='EventAI', `ScriptName`='' WHERE `entry`=15978;
DELETE FROM `creature_ai_scripts` where id in (1597801, 1597802, 1597803,1602403);
INSERT INTO `creature_ai_scripts`
(`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`)
VALUES
(1597801, 15978, 0, 0, 100, 1, 5000, 5000, 6000, 7000, 11, 26350, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crypt Reaver Cleave'),
(1597803, 15978, 10, 0, 100, 1, 0, 40, 0, 0, 11, 28033, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crypt reaver increased aggro range'),
(1597802, 15978, 2, 0, 100, 1, 50, 50, 300000, 300000, 11, 28371, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crypt Reaver Frenzy');

/*
* Plaguewing
*/

-- Stoneskin gargoyle switch from eventAI to script. Immune to pmuch everything
UPDATE `creature_template` SET `AIName`='', `ScriptName`='naxxramas_gargoyle_ai',`speed_run`=1.5, `armor`=4096, `mindmg`=3547, `maxdmg`=4693  WHERE `entry`=16168;

-- Plague Slime switch from eventAI to script
UPDATE `creature_template` SET `AIName`='', `ScriptName`='naxxramas_plague_slime_ai' WHERE `entry`=16243;

-- Plague slime creating creature_template entries for all 4 colors
DELETE FROM `creature_template` where entry in (16243, 16783, 16784, 16785);
INSERT INTO `creature_template` (`entry`,`KillCredit1`,`KillCredit2`,`modelid_1`,`modelid_2`,`modelid_3`,`modelid_4`,`name`,`subname`,`gossip_menu_id`,`minlevel`,`maxlevel`,`minhealth`,`maxhealth`,`minmana`,`maxmana`,`armor`,
`faction_A`,`faction_H`,`npcflag`,`speed_walk`,`speed_run`,`scale`,`rank`,`mindmg`,`maxdmg`,`dmgschool`,`attackpower`,`dmg_multiplier`,`baseattacktime`,`rangeattacktime`,`unit_class`,`unit_flags`,`dynamicflags`,`family`,
`trainer_type`,`trainer_spell`,`trainer_class`,`trainer_race`,`minrangedmg`,`maxrangedmg`,`rangedattackpower`,`type`,`type_flags`,`lootid`,`pickpocketloot`,`skinloot`,`resistance1`,`resistance2`,`resistance3`,`resistance4`,
`resistance5`,`resistance6`,`spell1`,`spell2`,`spell3`,`spell4`,`PetSpellDataId`,`mingold`,`maxgold`,`AIName`,`MovementType`,`InhabitType`,`Civilian`,`RacialLeader`,`RegenHealth`,`equipment_id`,`trainer_id`,`vendor_id`,
`MechanicImmuneMask`,`SchoolImmuneMask`,`flags_extra`,`ScriptName`) 
VALUES 
/* black (shadow) */
(16243,0,0,11140,0,0,0,'Plague Slime','',0,61,61,140943,140943,0,0,4091,20,20,0,1,0.35,2,1,9000,11000,0,278,1,1150,1265,0,0,0,0,0,0,0,0,172.1,240.07,100,10,8,16243,0,0,0,5,5,5,5,5,0,0,0,0,0,6051,7906,'',0,3,0,0,1,0,0,0,0,32,0,'naxxramas_plague_slime_ai'),
/*blue (frost) */
(16783,0,0,11139,0,0,0,'Plague Slime','',0,61,61,140943,140943,0,0,4091,20,20,0,1,0.35,2,1,9000,11000,0,278,1,1150,1265,0,0,0,0,0,0,0,0,172.1,240.07,100,10,8,16243,0,0,0,5,5,5,5,5,0,0,0,0,0,6051,7906,'',0,3,0,0,1,0,0,0,0,16,0,'naxxramas_plague_slime_ai'),
/*red (fire) */
(16784,0,0,11138,0,0,0,'Plague Slime','',0,61,61,140943,140943,0,0,4091,20,20,0,1,0.35,2,1,9000,11000,0,278,1,1150,1265,0,0,0,0,0,0,0,0,172.1,240.07,100,10,8,16243,0,0,0,5,5,5,5,5,0,0,0,0,0,6051,7906,'',0,3,0,0,1,0,0,0,0,4,0,'naxxramas_plague_slime_ai'),
/*green (nature) */
(16785,0,0,11137,0,0,0,'Plague Slime','',0,61,61,140943,140943,0,0,4091,20,20,0,1,0.35,2,1,9000,11000,0,278,1,1150,1265,0,0,0,0,0,0,0,0,172.1,240.07,100,10,8,16243,0,0,0,5,5,5,5,5,0,0,0,0,0,6051,7906,'',0,3,0,0,1,0,0,0,0,8,0,'naxxramas_plague_slime_ai');

-- plagued bat putrid bite much higher frequency
UPDATE `creature_ai_scripts` SET `event_param1`=4000, `event_param2`=5000, `event_param3`=4000, `event_param4`=5000, `action1_param2`=1 WHERE `id`=1603701;
-- plagued bat same hp as frenzied bat
UPDATE `creature_template` SET `minhealth`=10283, `maxhealth`=10283 WHERE `entry`=16037;

-- Putrid Bite stack with self
REPLACE INTO `spell_mod` (`Id`, `procChance`, `procFlags`, `procCharges`, `DurationIndex`, `Category`, `CastingTimeIndex`, `StackAmount`, `SpellIconID`, `activeIconID`, `manaCost`, `Attributes`, `AttributesEx`, `AttributesEx2`, `AttributesEx3`, `AttributesEx4`, `Custom`, `InterruptFlags`, `AuraInterruptFlags`, `ChannelInterruptFlags`, `Dispel`, `Stances`, `StancesNot`, `SpellVisual`, `ManaCostPercentage`, `StartRecoveryCategory`, `StartRecoveryTime`, `MaxAffectedTargets`, `MaxTargetLevel`, `DmgClass`, `rangeIndex`, `RecoveryTime`, `CategoryRecoveryTime`, `SpellFamilyName`, `SpellFamilyFlags`, `Mechanic`, `Comment`) 
VALUES ('30113', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '0', '-1', 'Putrid Bite stack with self');
    
-- frenzied bat targets random hostile and repeats less frequently
UPDATE `creature_ai_scripts` SET `event_flags`=3, `event_param1`=500, `event_param2`=1000, `event_param3`=5000, `event_param4`=10000, `action1_param2`=4 WHERE `id`=1603601;

REPLACE INTO spell_effect_mod (Id, EffectIndex, Effect, EffectDieSides, EffectBaseDice, EffectDicePerLevel, EffectRealPointsPerLevel, EffectBasePoints, EffectAmplitude, EffectPointsPerComboPoint, EffectChainTarget, EffectMultipleValue, EffectMechanic, EffectImplicitTargetA, EffectImplicitTargetB, EffectRadiusIndex, EffectApplyAuraName, EffectItemType, EffectMiscValue, EffectTriggerSpell, Comment) VALUES 
(30080, 2, 6, -1, -1, -1, -1, 1, -1, -1, 1, -1, -1, 3, 0, 13, 42, -1, 0, 30080, 'Retching Plague'),
(30081, 2, 6, -1, -1, -1, -1, 1, -1, -1, 1, -1, -1, 3, 0, 13, 42, -1, 0, 30080, 'Retching Plague');

/*
 * Anub'Rekhan
 */
-- Increasing anubs attackspeed from 2.4 to 2.0
UPDATE `creature_template` SET `baseattacktime`=2000 WHERE `entry`=15956;

-- corpse scarabs dmg reduced
UPDATE `creature_template` SET `mindmg`=200, `maxdmg`=300, `speed_walk`=3, `speed_run`=1.5, `MovementType`=2, `ScriptName`='' WHERE `entry`=16698;

-- giving corrpse scarabs an AI to do patrolling
UPDATE `creature_template` SET `ScriptName`='' WHERE `entry`=16698;

-- we need a dummy creature named Anub'Rekhan to use for casting impale to avoid the visual bug WHERE impale is always cast towards maintank
-- super ugly ninjaing the mob_plague_cloud AI for this creature as well, as it does the same, aka nothing.
DELETE FROM `creature_template` WHERE `entry` = 533003;
INSERT INTO `creature_template` (`entry`, `KillCredit1`, `KillCredit2`, `modelid_1`, `modelid_2`, `modelid_3`, `modelid_4`, `name`, `subname`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Civilian`, `RacialLeader`, `RegenHealth`, `equipment_id`, `trainer_id`, `vendor_id`, `MechanicImmuneMask`, `SchoolImmuneMask`, `flags_extra`, `ScriptName`) VALUES
('533003', '0', '0', '11686', '0', '0', '0', "Anub'Rekhan", 'NULL', '0', '63', '63', '5000', '5000', '0', '0', '7', '20', '20', '0', '1.2', '1.1486', '1', '0', '0', '0', '0', '0', '1', '2000', '2000', '1', '33587968', '0', '0', '0', '0', '0', '0', '1', '1', '0', '10', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '3', '0', '0', '1', '0', '0', '0', '0', '0', '0', "mob_plague_cloud");

DELETE FROM creature_movement_template  WHERE entry = 16698;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z) VALUES
(16698, 1, 3203.53,  -3475.68, 287.06),
(16698, 2, 3173.12,  -3478.96, 287.12),
(16698, 3, 3130.50,  -3511.49, 287.07),
(16698, 4, 3086.07,  -3509.39, 287.08),
(16698, 5, 3068.29,  -3538.47, 287.08),
(16698, 6, 3100.69,  -3574.87, 287.08),
(16698, 7, 3138.66,  -3550.26, 287.08),
(16698, 8, 3132.69,  -3511.14, 287.07),
(16698, 9, 3173.12,  -3478.96, 287.12),
(16698, 10, 3203.53, -3475.68, 287.06),
(16698, 11, 3233.81, -3488.35, 287.08),
(16698, 12, 3259.52, -3512.41, 287.08),
(16698, 13, 3287.53, -3513.52, 287.08),
(16698, 14, 3311.63, -3490.15, 287.08),
(16698, 15, 3309.49, -3454.61, 287.08),
(16698, 16, 3267.45, -3435.48, 287.08),
(16698, 17, 3232.18, -3470.62, 287.08);

/*
* Four Horsemen
*/

UPDATE creature_template SET faction_a = 20, faction_h = 20, scale = 0, unit_flags = 33554432, dynamicflags = 0 WHERE entry BETWEEN 16775 AND 16778;
UPDATE creature_template SET scale = 0 WHERE entry BETWEEN 16062 AND 16065;
UPDATE creature_template SET scriptname = "boss_highlord_mograine" WHERE entry = 16775;
UPDATE creature_template SET scriptname = "boss_lady_blaumeux" WHERE entry = 16776;
UPDATE creature_template SET scriptname = "boss_thane_korthazz" WHERE entry = 16778;
UPDATE creature_template SET scriptname = "boss_sir_zeliek" WHERE entry = 16777;

UPDATE `creature_template` SET `mindmg`=2745, `maxdmg`=3640 WHERE `entry`=16064;
UPDATE `creature_template` SET `mindmg`=3844, `maxdmg`=5096 WHERE `entry`=16065;
UPDATE `creature_template` SET `mindmg`=2636, `maxdmg`=3494 WHERE `entry`=16062;
UPDATE `creature_template` SET `mindmg`=3844, `maxdmg`=5096 WHERE `entry`=16063;

-- chest loot
DELETE FROM gameobject_loot_template where entry = 181366;
INSERT INTO gameobject_loot_template (entry, item, ChanceOrQuestChance, groupid, mincountOrRef, maxcount, condition_id) VALUES
('181366', '12002', '100', '1', '-12002', '2', '0'),
('181366', '22691', '0',   '2', '1',      '1', '0'),
('181366', '22726', '30',  '0', '1',      '1', '0'),
('181366', '22809', '0',   '2', '1',      '1', '0'),
('181366', '22811', '0',   '2', '1',      '1', '0'),
('181366', '23025', '0',   '2', '1',      '1', '0'),
('181366', '23027', '0',   '2', '1',      '1', '0'),
('181366', '23071', '0',   '2', '1',      '1', '0');

UPDATE `creature_template` SET `minlevel`=63, `maxlevel`=63 , `faction_A`=20, `faction_H`=20, `mindmg`=0, `maxdmg`=0, `unit_flags`=33554438, `AIName`='EventAI', `MovementType`=0, `flags_extra`=2050 WHERE `entry`=16697;

REPLACE INTO `creature_ai_scripts`
(`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`)
VALUES
(1669701, 16697, 1, 0, 100, 1, 1000, 1000, 500, 500, 11, 28865, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 'Void Zone cast Consumption');





/*
* Gluth
*/

UPDATE `creature_template` SET `minhealth`=1665500, `maxhealth`=1665500, `mindmg`=3954, `maxdmg`=5241 WHERE `entry`=15932;

-- Zombie chow health from 52k to 122k (wowwiki states they still have 6104 hp at 5% after decimate)
UPDATE `creature_template` SET `minhealth`='122080', `maxhealth`='122080', `ScriptName`='mob_zombie_chow' WHERE `entry`='16360';

-- makes decimate ignore armor
DELETE FROM spell_mod where id = 28375;
INSERT INTO `spell_mod` (`Id`, `procChance`, `procFlags`, `procCharges`, `DurationIndex`, `Category`, `CastingTimeIndex`, `StackAmount`, `SpellIconID`, `activeIconID`, `manaCost`, `Attributes`, `AttributesEx`, `AttributesEx2`, `AttributesEx3`, `AttributesEx4`, `Custom`, `InterruptFlags`, `AuraInterruptFlags`, `ChannelInterruptFlags`, `Dispel`, `Stances`, `StancesNot`, `SpellVisual`, `ManaCostPercentage`, `StartRecoveryCategory`, `StartRecoveryTime`, `MaxAffectedTargets`, `MaxTargetLevel`, `DmgClass`, `rangeIndex`, `RecoveryTime`, `CategoryRecoveryTime`, `SpellFamilyName`, `SpellFamilyFlags`, `Mechanic`, `Comment`) 
VALUES ('28375', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '32', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '0', '-1', 'Gluth decimate ignores armor');

-- Gluth slightly larger hitbox
UPDATE `creature_model_info` SET `combat_reach`='6' WHERE `modelid` = 16064;

-- replace old manual infected wound spell with the version which triggers on successfull melee attack
DELETE FROM `creature_ai_scripts` where id = 1636001;
INSERT INTO `creature_ai_scripts`
(`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`)
VALUES
(1636001, 16360, 11, 0, 100, 1, 0, 0, 0, 0, 11, 29307, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 'Zombie Chow cast infected wound on self on spawn');








/*
* Gothik
*/
UPDATE `creature_template` SET `mindmg`=2811, `maxdmg`=3721 WHERE `entry`=16060;

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
(1612501, 16125, 0, 0, 100, 1, 5000, 8000, 12000, 15000, 11, 27577, 4, 0, 14, -100, 0, 0, 0, 0, 0, 0, 'Unrelenting Death Knight intercept random hostile and reset threat'),
(1612502, 16125, 0, 0, 100, 1, 1000, 2000, 10500, 15500, 11, 27825, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Unrelenting Death Knight Shadow Mark'),
(1612601, 16126, 11,0, 100, 0,   0,    0,     0,     0,  11, 27987, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 'Unrelenting Rider Unholy Aura on spawn'),
(1612602, 16126, 0, 0, 100, 1, 1000, 2000,  5000,  6000, 11, 27831, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Unrelenting Rider cast Shadow Bolt Volley'),
(1612701, 16127, 0, 0, 100, 1, 1000, 1500,  3000,  4000, 11, 27989, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Spectral Trainee Arcane Explosion'),
(1612702, 16127, 0, 0, 100, 1, 3000, 3000, 10000, 11000, 11, 27990, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Spectral Trainee fear random'),
(1614801, 16148, 0, 0, 100, 1, 1000, 3000,  5000,  6000, 11, 27991, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Spectral Death Knight Sunder Armor'),
(1614803, 16148, 0, 0, 100, 1, 10000, 20000, 15000, 20000, 11, 28333, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Spectral Death Knight whirlwind'),
(1614802, 16148, 0, 0, 100, 1, 5000, 10000, 10000, 12000, 11, 27992, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Spectral Death Knight Mana Burn'),
(1614901, 16149, 0, 0, 100, 1, 2000, 5000, 30500, 30500, 11, 27993, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Spectral Horse cast Stomp'),
(1615001, 16150, 0, 0, 100, 1, 3001, 5000, 10000, 12000, 11, 27994, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Spectral Rider life drain on random hostile'),
(1615002, 16150, 16, 0, 100, 1, 27995, 30,  5000, 10000, 11, 27995, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Spectral Rider Unholy Frenzy on friendly'),
(1615003, 16150, 11,0, 100, 0,   0,    0,     0,     0,  11, 27987, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 'Unrelenting Rider Unholy Aura on spawn');


-- unrelenting trainee
UPDATE `creature_template` SET `mindmg`=700, `maxdmg`=1000 WHERE `entry`=16124;
-- unrelenting death knight
UPDATE `creature_template` SET `mindmg`=3000, `maxdmg`=3500 WHERE `entry`=16125;
-- unrelenting rider
UPDATE `creature_template` SET `mindmg`=4000, `maxdmg`=4500 WHERE `entry`=16126;

-- spectral trainee hp
UPDATE `creature_template` SET `minhealth`=6000, `maxhealth`=7000, `SchoolImmuneMask`=124, `scale`=1 WHERE `entry`=16127;
-- spectral rider
UPDATE `creature_template` SET `mindmg`=4000, `maxdmg`=4500, `SchoolImmuneMask`=124 WHERE `entry`=16150;
-- spectral death knight
UPDATE `creature_template` SET `mindmg`=4000, `maxdmg`=4500, `SchoolImmuneMask`=124, `minhealth`=19000, `maxhealth`=19500 WHERE `entry`=16148;
-- spectral horse
UPDATE `creature_template` SET `mindmg`=5000, `maxdmg`=5500, `SchoolImmuneMask`=124 WHERE `entry`=16149;


-- gothiks HP
UPDATE creature_template set minhealth = 399750, maxhealth = 399750 where entry = 16060; 








/*
* Faerlina 
*/

-- Set her base attackspeed to 2.5sec, based on https://www.youtube.com/watch?v=pVjB7pCX3XM
-- but increase it again to 1.75 because its too easy to survive enrage phase without dispelling :/
UPDATE `creature_template` SET `baseattacktime`=1750,`speed_run`='1.4', `mindmg`=5492, `maxdmg`=7281 WHERE `entry`=15953;

-- give Worshippers widows embrace and eventAI
UPDATE `creature_template` SET `spell1`=28732, `AIName`='EventAI' , `minhealth`=88040, `maxhealth`=88040, `mindmg`=3194, `maxdmg`=4215 WHERE `entry`=16506;

-- follower has aoe silence spell and eventAI
UPDATE `creature_template` SET `spell1`=29943, `AIName`='EventAI', `mindmg`=4562, `maxdmg`=6022 WHERE `entry`=16505;


-- follower eventAI entry for periodically casting aoe silence
DELETE FROM `creature_ai_scripts` where id = 1650501;
INSERT INTO `creature_ai_scripts`
(`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`)
VALUES
(1650501, 16505, 0, 0, 100, 1, 8000, 12000, 10000, 15000, 11, 29943, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'naxxramas follower aoe silence');

-- follower eventAI for periodically charging random target
DELETE FROM `creature_ai_scripts` where id in (1650502, 1650503, 1650601);
INSERT INTO `creature_ai_scripts`
(`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`)
VALUES
(1650502, 16505, 0, 0, 100, 1, 8000, 10000, 10000, 15000, 11, 25821, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'naxxramas follower charge random'),
(1650503, 16505, 4, 0, 100, 0, 0, 0, 0, 0, 39, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'naxxramas follower call for help on pull'),
(1650601, 16506, 4, 0, 100, 0, 0, 0, 0, 0, 39, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'naxxramas worshipper call for help on pull');







/*
* Grobbulus
*/

-- Fallout should do a lot more dmg (no exact sources, but videos show tanks dropping quite a bit)
UPDATE `creature_template` SET `mindmg`=5045, `maxdmg`=6115 WHERE `entry`=16290;

-- Giving grobbulus cloud creature a scriptname and make it invisible and give it a proper level so the cloud spell dosent resist. and faction
UPDATE `creature_template` SET `ScriptName`="boss_grobbulus_cloud", `unit_class`='1', `unit_flags` = 33587968, `minlevel`='63', `maxlevel`='63' WHERE `entry`=16363;

UPDATE `creature_template` SET `scale`=1.8, `MovementType`=2, `minhealth`=2165150, `maxhealth`=2165150, `mindmg`=4393, `maxdmg`=5824 WHERE `entry`=15931;

DELETE FROM spell_target_position where id = 28280;
INSERT INTO spell_target_position (id, target_map, target_position_x, target_position_y, target_position_z, target_orientation) VALUES
(28280, 533, 3125.44, -3309.74, 293.251, 3.14929);

DELETE FROM creature_movement_scripts where id = 1593101;
INSERT INTO creature_movement_scripts (id, delay, command, datalong, comments) VALUES
(1593101, 1, 15, 28280, "cast summon sewage slime");
INSERT INTO creature_movement_scripts (id, delay, command, datalong, comments) VALUES
(1593101, 3, 15, 28280, "cast summon sewage slime");
INSERT INTO creature_movement_scripts (id, delay, command, datalong, comments) VALUES
(1593101, 5, 15, 28280, "cast summon sewage slime");

UPDATE creature set MovementType=2, currentWaypoint=5 where id = 15931;

-- make sewage slimes that grobbulus spawn move randomly and keep positive auras on evade
UPDATE `creature_template` SET `MovementType`=1, `flags_extra`=4096 WHERE `entry`=16375;
DELETE FROM `creature_ai_scripts` where id = 1637502;
INSERT INTO `creature_ai_scripts`
(`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`)
VALUES
(1637502, 16375, 11, 0, 100, 0, 0, 0, 0, 0, 11, 28362, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 'sewage slime cast disease cloud on spawn');

UPDATE `creature_template` SET `AIName`='EventAI' WHERE `entry`=16290;

DELETE FROM `creature_ai_scripts` where id = 1629001;
INSERT INTO `creature_ai_scripts`
(`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`)
VALUES
(1629001, 16290, 11, 0, 100, 0, 0, 0, 0, 0, 11, 28362, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 'Fallout Slime cast Disease Cloud on self on spawn');








/*
* Heigan
*/

-- Creating a creature that will be the caster of the eruption. Looking at vanilla combatlogs it seems when players are hit it says "Plague fissure eruption hits you for xxxx"
-- Since we cant have the GOs themself do the cast, we need this creature to be the caster.
-- Same for Plague Cloud creature which will be casting the plague cloud in the gauntlet room
DELETE FROM `creature_template` WHERE `entry` IN (533001, 533002);
INSERT INTO `creature_template` 
(`entry`, `KillCredit1`, `KillCredit2`, `modelid_1`, `modelid_2`, `modelid_3`, `modelid_4`, `name`, `subname`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Civilian`, `RacialLeader`, `RegenHealth`, `equipment_id`, `trainer_id`, `vendor_id`, `MechanicImmuneMask`, `SchoolImmuneMask`, `flags_extra`, `ScriptName`) 
VALUES 
('533001', '0', '0', '11686', '0', '0', '0', 'Plague Fissure', 'NULL', '0', '63', '63', '5000', '5000', '0', '0', '7', '20', '20', '0', '1.2', '1.1486', '1', '0', '0', '0', '0', '0', '1', '2000', '2000', '1', '33587968', '0', '0', '0', '0', '0', '0', '1', '1', '0', '10', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '3', '0', '0', '1', '0', '0', '0', '0', '0', '0', ""),
('533002', '0', '0', '11686', '0', '0', '0', 'Plague Cloud', 'NULL', '0', '63', '63', '5000', '5000', '0', '0', '7', '20', '20', '0', '1.2', '1.1486', '1', '0', '0', '0', '0', '0', '1', '2000', '2000', '1', '33587968', '0', '0', '0', '0', '0', '0', '1', '1', '0', '10', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '3', '0', '0', '1', '0', '0', '0', '0', '0', '0', "mob_plague_cloud");

-- Rotting maggots in heigans gauntlet. 
-- Should be elite, does around 700-900 in an AQ geared hunter, and move randomly around in its area
-- need a script to properly control its evading
UPDATE `creature_template` SET `speed_walk`=0.55, `speed_run`=0.63, `rank`=1, `mindmg`=1425, `maxdmg`=1722, `MovementType`=1, `ScriptName`='mob_rotting_maggot',`baseattacktime`='3000', `rangeattacktime`='3000' WHERE `entry`=16057;

-- Diseased maggots pretty much the same, but less melee dmg as they use a spell
UPDATE `creature_template` SET `speed_walk`=0.55, `speed_run`=0.63, `rank`=1, `mindmg`=700, `maxdmg`=900, `MovementType`=1, `ScriptName`='mob_diseased_maggot'  WHERE `entry`=16056;

-- Allowing rotting maggtots and diseased maggots to randomly patrol within a 15yd radius, and respawn after 1 minute
UPDATE creature SET spawndist = 15, spawntimesecs = 60, MovementType = 1 WHERE id IN (16056, 16057);

-- Replacing half the rotting maggots with Diseased Maggots
update creature set id = 16056, modelid = 15978 where guid in (88233, 88235, 88237, 88239, 88241, 88243, 88245, 88247, 88249, 88251, 88253, 88255, 88257, 88259);

-- Heigan should have a slightly larger hitbox judging from videos
UPDATE `creature_model_info` SET `bounding_radius`='1', `combat_reach`='5' WHERE `modelid`='16309';

-- Eye stalks should have "around 500 hp" according to original vanilla guides. Corrected faction, and unitflag DISABLE_MOVE
UPDATE `creature_template` SET `minhealth`=500, `maxhealth`=500, `unit_flags`=4, `AIName` = "", `ScriptName`='mob_eye_stalk' WHERE `entry`=16236;

-- eye stalks cast spell "root anybody forever" instead of disabling combat movement, which isent working at all.
-- also added an event which recasts it on itself after evade

-- eye stalks no longer eventai
DELETE FROM `creature_ai_scripts` where id IN (1623601,1623602, 1623603);

UPDATE `creature_template` SET `minhealth`=1832050, `maxhealth`=1832050, `mindmg`=5491, `maxdmg`=7280 WHERE `entry`=15936;






/*
* Kel'Thuzad
*/


-- KT updates
UPDATE `creature_template` SET `minhealth`=3198000, `maxhealth`=3198000, `mindmg`=6389, `maxdmg`=8458 WHERE `entry`=15990;
UPDATE creature_model_info set combat_reach = 9 where modelid = 15945;

-- unstoppable abomination. Stun/shackle immune?
UPDATE `creature_template` SET `mindmg`=8000, `maxdmg`=10000, `speed_walk`='0.7', `speed_run`='0.8', `ScriptName`='unstoppable_abomination_ai', `unit_flags`=0 /*256passive*/ WHERE `entry`=16428;

-- soldier of the frozen wastes. Should not be shackle immune
UPDATE `creature_template` SET `minhealth`=2012, `maxhealth`=2012, `speed_walk`='0.35', `speed_run`='0.35',`ScriptName`='soldier_frozen_wastes_ai', `unit_flags`=0/*256passive*/ WHERE `entry`=16427;

-- soul weaver. 
UPDATE `creature_template` SET `ScriptName`='soul_weaver_ai', `speed_walk`='0.1', `speed_run`='0.114286', `unit_flags`=0 /*256passive*/  WHERE `entry`=16429;

-- guardian of icecrown. 
UPDATE `creature_template` SET `minhealth`='3150000', `maxhealth`='3150000', `speed_run`='1.42858', rank=1, scale=0.7, `mindmg`=4558, `maxdmg`=5359, `ScriptName`='mob_guardian_icecrownAI' WHERE `entry`=16441;
UPDATE `creature_model_info` SET bounding_radius = 1.2, combat_reach = 3 where modelid = 16586;

-- frost blast not resistable hack, cant find any evidence of it being binary or partially resistable
-- Mortal Wound stack with self
DELETE FROM spell_mod where Id in (29879, 28467);
INSERT INTO `spell_mod` (`Id`, `procChance`, `procFlags`, `procCharges`, `DurationIndex`, `Category`, `CastingTimeIndex`, `StackAmount`, `SpellIconID`, `activeIconID`, `manaCost`, `Attributes`, `AttributesEx`, `AttributesEx2`, `AttributesEx3`, `AttributesEx4`,
`Custom`, `InterruptFlags`, `AuraInterruptFlags`, `ChannelInterruptFlags`, `Dispel`, `Stances`, `StancesNot`, `SpellVisual`, `ManaCostPercentage`, `StartRecoveryCategory`, `StartRecoveryTime`, `MaxAffectedTargets`, `MaxTargetLevel`, `DmgClass`, `rangeIndex`,
`RecoveryTime`, `CategoryRecoveryTime`, `SpellFamilyName`, `SpellFamilyFlags`, `Mechanic`, `Comment`) 
VALUES 
('29879', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '1', '0', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '0', '-1', 'Kel\'thuzad Frost blast not resistable'),
('28467', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '0', '-1', 'Mortal Wound stack with self');

-- giving shadow fissure creature script
UPDATE `creature_template` SET `AIName`='', `ScriptName`='mob_shadow_fissure', `minlevel`='63', `maxlevel`='63', `scale`=2 WHERE `entry`=16129;








/*
* Loatheb
*/
-- Spores correct faction, hp, movement speed
UPDATE creature_template SET minhealth=563, maxhealth=563, speed_walk = 0.5, speed_run=0.5, AIName="EventAI" where entry = 16286;

-- spore cast Fungal Blooms on death
DELETE FROM `creature_ai_scripts` where id = 1628601;
INSERT INTO `creature_ai_scripts`
(`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`)
VALUES
(1628601, 16286, 6, 0, 100, 0, 0, 0, 0, 0, 11, 29232, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 'Spore cast Fungal Blooms on death');

-- Loatheb slightly larger hitbox
UPDATE `creature_model_info` SET `combat_reach`='5' WHERE `modelid` = 16110;


UPDATE `creature_template` SET `minhealth`=5329600, `maxhealth`=5329600, `mindmg`=5491, `maxdmg`=7280,`armor`=5491 WHERE `entry`=16011;





/*
* Maexxna
*/

-- dmg/hp/armor source: http://www.kurai.com/wow/naxx/maexxna.jpg
-- Due to the ease at which you can skip aoe web during enrage phase, we use regular armor values 
UPDATE `creature_template` SET `minhealth`=1498950, `maxhealth`=1498950, `armor`=4691, /*`armor`=3731*/ `mindmg`=5491, `maxdmg`=7281, `speed_run`='1.65',`baseattacktime`=2000 WHERE `entry`=15952;

-- give web-wrap correct faction
UPDATE `creature_template` SET faction_A = 16, faction_H = 16 WHERE entry = 16486;

-- adding invisible man creature_template. Used by maexxnas web-wrap logic. Was missing in db.
 DELETE from `creature_template` where entry = 17286;
 insert into `creature_template` (entry, modelid_1, name) values(17286, 15435, "Invisible Man");
 
 /* Spiderlings:
 had spells 28741 (poison shock) and 28776 (necrotic poison). These are maexxna spells, not spiderling spells.
 corrected faction
 hp corection based on http://imgur.com/a/wxlbI from this video: https://www.youtube.com/watch?v=rHZPMqAOJAY
 Had generic_spell_ai as scriptname, not needed with no spells.
 attackspeed set to 0.5sec and dmg increased slightly (120-180dmg hits on leather druid in videos)
 */
 Update `creature_template` SET spell1 = 0, spell2 = 0, faction_A = 16, faction_H = 16, minhealth = 4175, maxhealth = 4175, ScriptName = "", `baseattacktime`=500, `mindmg`=194, `maxdmg`=250 where entry = 17055;
 
 -- maexxna hitbox update
UPDATE `creature_model_info` SET `bounding_radius`='10', `combat_reach`='13' WHERE `modelid`='15928';









/*
* Noth
*/

-- Noth HP update
UPDATE `creature_template` SET `minhealth`=1665500, `maxhealth`=1665500, `mindmg`=5491, `maxdmg`=7280 WHERE `entry`=15954;

DELETE FROM `creature_ai_scripts` where id IN(
1698101,
1698301,
1698302,
1698401,
1698201
);

INSERT INTO `creature_ai_scripts`
(`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`)
VALUES
(1698101, 16981, 0, 0, 100, 1, 3000, 3000, 8000, 10000, 11, 19712, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Plagued Guardian arcane explosion'), -- unsure if correct. Does right dmg, has huge range and casttime which matches videos
(1698301, 16983, 0, 0, 100, 1, 1000, 4000, 8000, 8500,  11, 30138, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Plagued Champion shadow shock'), -- Same as wotlk, should be right, matches in dmg on videos
(1698302, 16983, 0, 0, 100, 1, 0,    1000, 4000, 5000,  11, 13737, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Plagued Champion mortal strike'), -- MS used by eventAI hits for about 1-1.3k, which is a bit higher for some unknown reason. Using 130% MS which is the lowest % i found
(1698401, 16984, 0, 0, 100, 1, 1000, 4000, 7000, 8000,  11, 20691, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Plagued Warrior cleave'), -- 15496 is used by wotlk version of this mob, might be more correct but who knows
(1698201, 16982, 0, 0, 100, 1, 1000, 4000, 6500, 7000,  11, 17547, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Plagued Construct Mortal Strike'); -- dungeon journal

-- Plagued champion shadow shock should be cast even while shackled according to
-- https://web.archive.org/web/20070224095002/http://www.worldofraids.com:80/v2/?page=Nboss&wing=plague&mob=8
-- so giving the action flags: triggered and force cast
UPDATE `creature_ai_scripts` SET `action1_param3`=6 WHERE `id`=1698301;

-- Making sure the 3 Plagued creatures above are of eventai type
-- Making them elite
-- Updating damage values. Plagued champion matches with vanilla videos. Rest are unchecked.
UPDATE `creature_template` SET `AIName`='EventAI', `rank`=1, `mindmg`=1953, `maxdmg`=2382 WHERE `entry`=16981;
UPDATE `creature_template` SET `AIName`='EventAI', `rank`=1, `mindmg`=4000, `maxdmg`=4500 WHERE `entry`=16982;
UPDATE `creature_template` SET `AIName`='EventAI', `rank`=1, `mindmg`=3000, `maxdmg`=3612 WHERE `entry`=16983;
UPDATE `creature_template` SET `AIName`='EventAI', `rank`=1, `mindmg`=2500, `maxdmg`=3012 WHERE `entry`=16984;

-- Giving Plagued Warrior and Champion their weps
UPDATE `creature_template` SET `equipment_id` = 16984 where `entry` = 16984;
UPDATE `creature_template` SET `equipment_id` = 16983 where `entry` = 16983;
DELETE FROM `creature_equip_template` where entry IN (16983, 16984);
INSERT INTO `creature_equip_template` (entry, equipentry1, equipentry2, equipentry3) 
VALUES 
(16984, 12285, 0, 0),
(16983, 4991, 0, 0);







/*
* Patchwerk
*/

-- increased patcwerks movementspeed slightly
UPDATE `creature_template` SET `speed_walk`='1.5', `speed_run`='1.5', `baseattacktime`=1500, `minhealth`=3997200, `maxhealth`=3997200, `mindmg`=8319, `maxdmg`=8923,`armor`=5491 WHERE `entry`=16028;

-- patchwerk slightly larger hitbox
UPDATE `creature_model_info` SET `combat_reach`='5' WHERE modelid = 16174;







/*
* Razuvious
*/

-- Razuvious adds (deathknight understudy)
DELETE FROM creature_template_addon WHERE entry = 16803;
INSERT INTO creature_template_addon (entry, mount, bytes1, b2_0_sheath, b2_1_flags, emote, moveflags, auras)
VALUE (16803, 0, 0, 0, 0, 333, 0, 18950);
UPDATE creature_template SET spell1 = 29060 WHERE entry = 16803;
UPDATE `creature_template` SET `mindmg`=3100, `maxdmg`=4000 WHERE `entry`=16803;

-- Razu adds equipment
UPDATE `creature_template` SET `equipment_id` = 16803 where `entry` = 16803;
DELETE FROM `creature_equip_template` where entry = 16803;
INSERT INTO `creature_equip_template` (entry, equipentry1, equipentry2, equipentry3) VALUES (16803, 2180, 23356, 0);

-- removing razu adds from creature table. Spawned by script
delete from creature where id = 16803;

-- scale of combat dummies
UPDATE `creature_template` SET `scale`='1.5' WHERE `entry`=16211;


-- removing understudy EventAI scripts
UPDATE `creature_template` SET `AIName`='', `ScriptName`='deathknight_understudy_ai' WHERE `entry`=16803;
DELETE FROM `creature_ai_scripts` where id = 1680301;
DELETE FROM `creature_ai_scripts` where id = 1680302;

UPDATE `creature_template` SET `minhealth`=1998600, `maxhealth`=1998600, `mindmg`=17299, `maxdmg`=22933, `speed_run`='1.5' WHERE `entry`=16061;






/*
* Sapphiron
*/

-- sapphiron hitbox update
UPDATE `creature_model_info` SET `bounding_radius`='10', `combat_reach`='20' WHERE `modelid`='16033';

UPDATE `creature_template` SET `minhealth`=3164450, `maxhealth`=3164450, `mindmg`=6919, `maxdmg`=9173, `SchoolImmuneMask`=16 WHERE `entry`=15989;

-- wing buffet crature
DELETE FROM `creature_template` WHERE `entry` = 17025;
INSERT INTO `creature_template` 
(`entry`, `KillCredit1`, `KillCredit2`, `modelid_1`, `modelid_2`, `modelid_3`, `modelid_4`, `name`, `subname`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`,
`faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`,
`dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`,
`resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`,
`Civilian`, `RacialLeader`, `RegenHealth`, `equipment_id`, `trainer_id`, `vendor_id`, `MechanicImmuneMask`, `SchoolImmuneMask`, `flags_extra`, `ScriptName`) 
VALUES 
('17025', '0', '0', '15880', '0', '0', '0', "Sapphiron's Wing buffet", 'NULL', '0', '63', '63', '5000', '5000', '0', '0', '7', '35', '35', '0', '1.2', '1.1486', '2.5', '0', '0', '0', '0', '0', '1', '2000', '2000', '1', '33587968', '0', '0', '0', '0', '0', '0', '1', '1', '0', '10', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '3', '0', '0', '1', '0', '0', '0', '0', '0', '0', 'npc_sapphiron_wing_buffet');

-- sapphirons blizzard no longer eventai. Giving it a script.
UPDATE `creature_template` SET `AIName`=0, `ScriptName`='npc_sapphiron_blizzard', `minlevel`=63, `maxlevel`=63, `speed_walk`='0.80', `speed_run`='0.80', `unit_flags`=33554434 WHERE `entry`=16474;

DELETE FROM `spell_effect_mod` where Id in (28531);
INSERT INTO `spell_effect_mod` (`Id`, `EffectIndex`, `Effect`, `EffectDieSides`, `EffectBaseDice`, `EffectDicePerLevel`, `EffectRealPointsPerLevel`, `EffectBasePoints`, `EffectAmplitude`, `EffectPointsPerComboPoint`,
`EffectChainTarget`, `EffectMultipleValue`, `EffectMechanic`, `EffectImplicitTargetA`, `EffectImplicitTargetB`, `EffectRadiusIndex`, `EffectApplyAuraName`, `EffectItemType`, `EffectMiscValue`, `EffectTriggerSpell`, `Comment`)
VALUES 
('28531', '0', '-1', '-1', '-1', '-1', '-1', '-1', '2000', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', 'Sapphiron Frost Aura tick every 2 sec');

DELETE FROM `spell_mod` where Id in (28531, 28529, 30132, 29318);
INSERT INTO `spell_mod` (`Id`, `procChance`, `procFlags`, `procCharges`, `DurationIndex`, `Category`, `CastingTimeIndex`, `StackAmount`, `SpellIconID`, `activeIconID`, `manaCost`, `Attributes`, `AttributesEx`,
`AttributesEx2`, `AttributesEx3`, `AttributesEx4`, `Custom`, `InterruptFlags`, `AuraInterruptFlags`, `ChannelInterruptFlags`, `Dispel`, `Stances`, `StancesNot`, `SpellVisual`, `ManaCostPercentage`, 
`StartRecoveryCategory`, `StartRecoveryTime`, `MaxAffectedTargets`, `MaxTargetLevel`, `DmgClass`, `rangeIndex`, `RecoveryTime`, `CategoryRecoveryTime`, `SpellFamilyName`, `SpellFamilyFlags`, `Mechanic`, `Comment`) 
VALUES 
('28531', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '0', '-1', '-1', '-1', '-1', '0', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '0', '-1', 'Sapphiron Frost Aura not unnaffected by invulnerability'),
('28529', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '536870912', '-1', '-1', '-1', '-1', '0', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '0', '-1', 'Sapphiron Frost Aura trigger unaffected by invulnerability');

-- ice blocks used on sapphiron should be generic gobjs
update gameobject_template set type=5, data2=0 where entry = 181247;







/*
* Thaddius
*/

UPDATE `creature_template` SET `ScriptName`='boss_feugen' WHERE `entry`=15930;

-- Adding tesla coil. Values from cmangos classic db
DELETE FROM `creature_template` WHERE entry = 16218;
INSERT INTO `creature_template` 
(`entry`, `KillCredit1`, `KillCredit2`, `modelid_1`, `modelid_2`, `modelid_3`, `modelid_4`, `name`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`,
 `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`,
 `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`,
 `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Civilian`, `RacialLeader`, `RegenHealth`, `equipment_id`, `trainer_id`, `vendor_id`, `MechanicImmuneMask`, `SchoolImmuneMask`,
 `flags_extra`, `ScriptName`) 
VALUES 
('16218', '0', '0', '13069', '0', '0', '0', 'Tesla Coil', '0', '60', '60', '17010', '17010', '0', '0', '9729', '14', '14', '0', '1.125', '1.14286', '1', '0', '422', '586', '0', '642', '1', '2000', '2000', '1', '33554688',
 '0', '0', '0', '0', '0', '0', '345', '509', '103', '10', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '',
 '1', -- movement type random
 '4', -- inhabittype always flying
 '0', '0', '3', '0', '0', '0', '1', '0', '0', 'npc_tesla_coil');

-- Stalagg attackspeed to 2sec
UPDATE `creature_template` SET `baseattacktime` = 2000 WHERE entry = 15929;

-- Feugen attackspeed to 2sec
UPDATE `creature_template` SET `baseattacktime` = 2000, `mindmg`=6178, `maxdmg`=8190 WHERE entry = 15930;

-- The shock spell used by tesla coil creatures on thaddius needs explisit target
DELETE FROM `spell_script_target` where entry = 28159;
INSERT INTO `spell_script_target` (`entry`,`type`,`targetEntry`) VALUES (28159, 1, 15928);

-- Positive and negative charges modified to display as debuff
DELETE FROM `spell_mod` WHERE Id IN(29659, 29660);
INSERT INTO `spell_mod` 
(`Id`, `procChance`, `procFlags`, `procCharges`, `DurationIndex`, `Category`, `CastingTimeIndex`, `StackAmount`, `SpellIconID`, `activeIconID`, `manaCost`, `Attributes`, `AttributesEx`, `AttributesEx2`, `AttributesEx3`, `AttributesEx4`, `Custom`, `InterruptFlags`, `AuraInterruptFlags`, `ChannelInterruptFlags`, `Dispel`, `Stances`, `StancesNot`, `SpellVisual`, `ManaCostPercentage`, `StartRecoveryCategory`, `StartRecoveryTime`, `MaxAffectedTargets`, `MaxTargetLevel`, `DmgClass`, `rangeIndex`, `RecoveryTime`, `CategoryRecoveryTime`, `SpellFamilyName`, `SpellFamilyFlags`, `Mechanic`, `Comment`) 
VALUES 
('29660 ', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '2', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '0', '-1', 'Thaddius Negative Charge is debuff'),
('29659', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '2', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '0', '-1', 'Thaddius Positive Charge is debuff');

-- much bigger hitbox on thaddius' model
UPDATE `creature_model_info` SET `bounding_radius`='10', `combat_reach`='10' WHERE `modelid`='16137';

UPDATE `creature_template` SET `minhealth`=6662000, `maxhealth`=6662000, `mindmg`=5491, `maxdmg`=7280,`armor`=5491 WHERE `entry`=15928;








/*
* Spell Target Possitions for Naxx
*/

DELETE FROM `spell_target_position` where target_map = 533;
INSERT INTO `spell_target_position` (`id`,`target_map`,`target_position_x`,`target_position_y`,`target_position_z`,`target_orientation`)
VALUES 
(29273,533,3498.28,-5349.9,144.968,1.31324),
(28444,533,3005.8,-3434.3,294,0),
(29237,533,3005.8,-3434.3,294,0),
(29318,533,3493.45,-5375.38,138.168,0),
(72617,533,3498.22,-5349.36,144.969,1.32679),
(72613,533,3005.51,-3434.64,304.195,5.81041),

(28026,533,2692.00,-3399.27,267.686,1.54487),
(28025,533,2692.65,-3321.06,267.684,4.70454),

(30211,533,2793.86,-3707.38,276.64,2.32),
(29268,533,2646.93,-3470.95,262.427,5.51363),
(29256,533,2669.42,-3463.75,262.63,5.07774),
(29239,533,2706.78,-3461.59,262.517,4.00358),
(29226,533,2722.29,-3514.68,262.431,2.87018),
(29267,533,2711.72,-3458.56,262.384,4.02864),
(29262,533,2726.13,-3534.64,262.31,2.60314),
(29258,533,2722.03,-3514.3,262.354,2.84269),
(29257,533,2724.82,-3466.21,262.622,3.85584),
(29255,533,2704.22,-3461.86,262.546,4.37027),
(29238,533,2684.95,-3457.55,262.578,4.62159),
(29227,533,2663.92,-3464.7,262.574,5.15958),
(29225,533,2651.09,-3464.07,262.112,5.45017),
(29224,533,2646.55,-3471.47,262.413,5.43839),
(29217,533,2642.34,-3485.28,262.273,6.17666),
(29249,533,2722.42,-3514.74,262.467,3.09084),
(29248,533,2704.13,-3462.44,262.403,4.31236),
(29247,533,2648.83,-3467.3,262.399,5.46297),
(29216,533,2631.37,-3529.68,274.04,0),
(29231,533,2684.8,-3502.52,261.31,0),
(28280,533,3125.44,-3309.74,293.251,3.14929);








/*
* Gameobjectseeeeee
*/

-- Data exported from Trinitycore Database

-- deletes all gobs in map 533 (naxx) from gameobject table
DELETE FROM gameobject where map = 533;

-- Using guid 533xxx for GObs in naxx to keep it structured. 533 is map-id, so makes some kind of sense at least.
SET @OGUID:=533000;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `spawnFlags`) VALUES

(@OGUID+8  , 181126, 533, 3202.67, -3475.94, 287.034, 3.14159, 0, 0, 1, 0.00000126759, 180, 100, 1,                     0), -- anub door
(@OGUID+12 , 181195, 533, 3143.96, -3572.22, 287.097, 2.35619, 0, 0, 0.923879, 0.382686, 180, 100, 1,                   1), -- anub gate
(@OGUID+202, 194022, 533, 3121.47, -3791.07, 273.915, 3.14159, 0, 0, 1, 0.00000126759, 180, 100, 1,                     1), -- post faerlina gate
(@OGUID+13 , 181197, 533, 3452.74, -3863.67, 308.341, 3.14159, 0, 0, 1, 0.00000126759, 180, 100, 0,                     1), -- Maexxna - Inner Web Door
(@OGUID+20 , 181209, 533, 3427.56, -3846.01, 310.369, 0.001245, 0, 0, 0.0006225, 1, 180, 100, 1,                        1), -- maexxna outer web door

(@OGUID+2  , 181119, 533, 2587.96, -3017.17, 241.304, 3.14159, 0, 0, 1, 0.00000126759, 180, 100, 1,                     1), -- 4hm entrance

(@OGUID+3  , 181120, 533, 3339.16, -3100.64, 296.813, 3.14159, 0, 0, 1, 0.00000126759, 180, 100, 1,                     1), -- gluth exit door
(@OGUID+4  , 181121, 533, 3421.86, -3017.51, 295.615, 3.14159, 0, 0, 1, 0.00000126759, 180, 100, 1,                     1), -- thaddius entrance door

(@OGUID+5  , 181123, 533, 3317.97, -3254.35, 293.346, -1.5708, 0, 0, -0.707108, 0.707106, 180, 100, 1,              1), -- grobbbulus entrance/open on patchwerk dead

(@OGUID+6  , 181124, 533, 2750.49, -3384.36, 267.341, 0,       0, 0, 0,         1,     180, 100, 1,                 1), -- gothik entrance/open on razuv dead
(@OGUID+7  , 181125, 533, 2633.84, -3336.82, 267.084, 0,       0, 0, 0,         1,     180, 100, 1,                 1), -- gothik exit/open on gothik dead
(@OGUID+11 , 181170, 533, 2692.07, -3360.78, 267.504, 3.14159, 0, 0, 1, 0.00000126759, 180, 100, 0,                     1), -- gothik combat gate


(@OGUID+14 , 181198, 533, 2963.16, -3476.83, 297.596, -2.35619, 0, 0, -0.923879, 0.382686, 180, 0, 0,               1), -- plague wing entrance, not used
(@OGUID+15 , 181199, 533, 2847.43, -3489.47, 297.839, 3.14159, 0, 0, 1, 0.00000126759, 180, 100, 0,                     1), -- plague wing entrance #2 not used

(@OGUID+35 , 181241, 533, 2909.69, -3947.28, 273.553, 3.14159, 0, 0, 1, 0.00000126759, 180, 100, 0,                     1), -- loatheb entrance door
(@OGUID+47 , 181496, 533, 2909.69, -3818.45, 273.553, 3.14159, 0, 0, 1, 0.00000126759, 180, 100, 0,                     1), -- heigan exit door


(@OGUID+0  , 175369, 533, 3185.48, -4039.1, 107.792, 3.12412, 0, 0, 0.999962, 0.00873622, 180, 0, 1,                1),
(@OGUID+1  , 175370, 533, 3271.52, -4064.31, 108.435, -2.8536, 0, 0, -0.98965, 0.143499, 180, 0, 1,                 1),
(@OGUID+9  , 181168, 533, 2924.01, -3286.47, 305.366, -2.35619, 0, 0, -0.923879, 0.382686, 180, 0, 1,               1),
(@OGUID+10 , 181169, 533, 2907.85, -3270.72, 305.366, -2.35619, 0, 0, -0.923879, 0.382686, 180, 0, 1,               1),
(@OGUID+16 , 181200, 533, 2737.66, -3489.72, 262.095, 3.14159, 0, 0, 1, 0.00000126759, 180, 100, 0,                     1), -- noth entrance
(@OGUID+17 , 181201, 533, 2684.28, -3559.36, 261.913, 1.5708, 0, 0, 0.707108, 0.707106, 180, 100, 1,                    1),
(@OGUID+18 , 181202, 533, 2822.93, -3685.3, 273.541, 3.14159, 0, 0, 1, 0.00000126759, 180, 0, 1,                    1),
-- (@OGUID+19 , 181203, 533, 2771.5, -3737.34, 273.596, -1.5708, 0, 0, -0.707108, 0.707106, 180, 0, 1,              1), -- not used heigan door
(@OGUID+21 , 181210, 533, 2991.71, -3420.18, 300.972, 3.14159, 0, 0, 1, 0.00000126759, 180, 0, 1,                   1),
(@OGUID+22 , 181211, 533, 2991.58, -3448.51, 300.972, 3.14159, 0, 0, 1, 0.00000126759, 180, 0, 1,                   1),
(@OGUID+23 , 181212, 533, 3020.08, -3448.65, 300.972, 3.14159, 0, 0, 1, 0.00000126759, 180, 0, 1,                   1),
(@OGUID+24 , 181213, 533, 3019.93, -3420.31, 300.972, 3.14159, 0, 0, 1, 0.00000126759, 180, 0, 1,                   1),
(@OGUID+25 , 181225, 533, 3536.81, -5158.41, 142.862, -1.77151, 0, 0, -0.774393, 0.632705, 604800, 100, 0,          1),
(@OGUID+26 , 181228, 533, 3635.35, -5090.29, 142.983, 4.52682, 0, 0, -0.774392, 0.632706, 25, 100, 0,               1),
(@OGUID+27 , 181229, 533, 3005.78, -3434.36, 300.328, 3.14159, 0, 0, 1, 0.00000126759, 180, 0, 1,                   1),
(@OGUID+28 , 181230, 533, 2493.02, -2921.78, 241.193, 3.14159, 0, 0, 1, 0.00000126759, 180, 0, 1,                   1),
(@OGUID+29 , 181231, 533, 2909, -4025.02, 273.475, 3.14159, 0, 0, 1, 0.00000126759, 180, 0, 1,                      1),
(@OGUID+30 , 181232, 533, 3539.02, -2936.82, 302.476, 3.14159, 0, 0, 1, 0.00000126759, 180, 0, 1,                   1),
(@OGUID+31 , 181233, 533, 3465.16, -3940.45, 308.788, 0.441179, -0.305481, 0.637715, 0.305481, 0.637716, 180, 0, 1, 1),
(@OGUID+32 , 181234, 533, 2904.86, -3286.11, 298.527, -0.785397, 0, 0, -0.382683, 0.92388, 180, 0, 1,               1),
(@OGUID+33 , 181235, 533, 3318.65, -3695.85, 259.094, 3.14159, 0, 0, 1, 0.00000126759, 180, 0, 0,                   1),
(@OGUID+34 , 181240, 533, 2908.99, -4044.1, 273.726, -1.5708, 0, 0, -0.707108, 0.707106, 180, 0, 1,                 1),

(@OGUID+36 , 181242, 533, 2859.62, -3997.85, 273.297, 1.5708, 0, 0, 0.707108, 0.707106, 180, 0, 1,                  1),
(@OGUID+37 , 181243, 533, 2959.33, -3997.85, 273.297, 1.5708, 0, 0, 0.707108, 0.707106, 180, 0, 1,                  1),
(@OGUID+38 , 181356, 533, 3522.56, -5236.76, 137.626, 4.4855, 0, 0, 0.782607, -0.622516, 0, 0, 0,                   1),
(@OGUID+39 , 181366, 533, 2516.59, -2946.82, 245.552, 5.48034, 0, 0, 0.390728, -0.920506, -604800, 100, 1,          1),
(@OGUID+40 , 181402, 533, 3732.66, -5026.17, 152.72, 4.39633, 0, 0, -0.774392, 0.632706, 25, 0, 1,                  1),
(@OGUID+41 , 181403, 533, 3784.17, -5062.08, 152.57, 3.5934, 0, 0, -0.957571, 0.288197, 25, 0, 1,                   1),
(@OGUID+42 , 181404, 533, 3760.24, -5175.26, 152.571, 2.13021, 0, 0, 0.869888, 0.493249, 25, 0, 1,                  1),
(@OGUID+43 , 181405, 533, 3698.6, -5187.07, 152.72, 1.3436, 0, 0, 0.614915, 0.788593, 25, 0, 1,                     1),
-- (@OGUID+44 , 181444, 533, 3716.38, -5106.47, 141.29, 3.31536, 0, 0, -0.681998, 0.731354, 25, 0, 1,                   1),
(@OGUID+45 , 181477, 533, 3527.94, -2952.26, 318.898, 3.14159, 0, 0, 1, 0.00000126759, 0, 0, 0,                     1),
(@OGUID+46 , 181478, 533, 3487.32, -2911.38, 318.898, 3.14159, 0, 0, 1, 0.00000126759, 0, 0, 0,                     1),

-- plague fizures
(@OGUID+48 , 181510, 533, 2787.25, -3654.13, 274.317, 3.5343, 0, 0, 0.980784, -0.195094, 0, 0, 1,                   0),
(@OGUID+49 , 181511, 533, 2782.4, -3660.4, 274.315, 2.11089, 0, 0, 0.87012, 0.492841, 0, 0, 1,                      0),
(@OGUID+50 , 181512, 533, 2778.43, -3651.31, 274.317, 3.5406, 0, 0, 0.980165, -0.198183, 0, 0, 1,                   0),
(@OGUID+51 , 181512, 533, 2778.43, -3651.31, 274.317, 3.5406, 0, 0, 0.980165, -0.198183, 0, 0, 1,                   0),
(@OGUID+52 , 181512, 533, 2778.43, -3651.31, 274.317, 3.5406, 0, 0, 0.980165, -0.198183, 0, 0, 1,                   0),
(@OGUID+53 , 181513, 533, 2774.3, -3660.66, 274.317, 6.09925, 0, 0, 0.0918381, -0.995774, 0, 0, 1,                  0),
(@OGUID+54 , 181514, 533, 2757.84, -3659.56, 274.317, 1.97116, 0, 0, 0.833593, 0.55238, 0, 0, 1,                    0),
(@OGUID+55 , 181514, 533, 2757.84, -3659.56, 274.317, 1.97116, 0, 0, 0.833593, 0.55238, 0, 0, 1,                    0),
(@OGUID+56 , 181514, 533, 2757.84, -3659.56, 274.317, 1.97116, 0, 0, 0.833593, 0.55238, 0, 0, 1,                    0),
(@OGUID+57 , 181515, 533, 2755.24, -3649.9, 274.317, 3.39684, 0, 0, 0.991867, -0.127278, 0, 0, 1,                   0),
(@OGUID+58 , 181515, 533, 2755.24, -3649.9, 274.317, 3.39684, 0, 0, 0.991867, -0.127278, 0, 0, 1,                   0),
(@OGUID+59 , 181516, 533, 2763.55, -3654.04, 274.317, 3.39923, 0, 0, 0.991714, -0.128463, 0, 0, 1,                  0),
(@OGUID+60 , 181516, 533, 2763.55, -3654.04, 274.317, 3.39923, 0, 0, 0.991714, -0.128463, 0, 0, 1,                  0),
(@OGUID+61 , 181516, 533, 2763.55, -3654.04, 274.317, 3.39923, 0, 0, 0.991714, -0.128463, 0, 0, 1,                  0),
(@OGUID+62 , 181517, 533, 2793.24, -3664.13, 274.317, 0.635802, 0, 0, 0.312573, 0.949894, 0, 0, 1,                  0),
(@OGUID+63 , 181518, 533, 2802.51, -3664.73, 274.317, 0.635802, 0, 0, 0.312573, 0.949894, 0, 0, 1,                  0),
(@OGUID+64 , 181519, 533, 2812, -3671.98, 274.073, 5.80987, 0, 0, 0.234455, -0.972127, 0, 0, 1,                     0),
(@OGUID+65 , 181520, 533, 2810.56, -3680.58, 274.317, 3.18673, 0, 0, 0.999745, -0.0225667, 0, 0, 1,                 0),
(@OGUID+66 , 181520, 533, 2810.56, -3680.58, 274.317, 3.18673, 0, 0, 0.999745, -0.0225667, 0, 0, 1,                 0),
(@OGUID+67 , 181521, 533, 2800.15, -3682.71, 274.352, 1.03882, 0, 0, 0.496368, 0.868112, 0, 0, 1,                   0),
(@OGUID+68 , 181521, 533, 2800.15, -3682.71, 274.352, 1.03882, 0, 0, 0.496368, 0.868112, 0, 0, 1,                   0),
(@OGUID+69 , 181522, 533, 2805.96, -3691.67, 274.317, 4.43437, 0, 0, 0.798264, -0.602308, 0, 0, 1,                  0),
(@OGUID+70 , 181523, 533, 2795.81, -3677.56, 274.073, 2.85315, 0, 0, 0.989618, 0.143722, 0, 0, 1,                   0),
(@OGUID+71 , 181523, 533, 2795.81, -3677.56, 274.073, 2.85315, 0, 0, 0.989618, 0.143722, 0, 0, 1,                   0),
(@OGUID+72 , 181524, 533, 2792.33, -3684.13, 274.317, 4.97616, 0, 0, 0.607979, -0.793953, 0, 0, 1,                  0),
(@OGUID+73 , 181524, 533, 2792.33, -3684.13, 274.317, 4.97616, 0, 0, 0.607979, -0.793953, 0, 0, 1,                  0),
(@OGUID+74 , 181525, 533, 2783.36, -3688.36, 274.385, 3.16132, 0, 0, 0.999951, -0.0098635, 0, 0, 1,                 0),
(@OGUID+75 , 181526, 533, 2781.56, -3671, 274.352, 3.15363, 0, 0, 0.999982, -0.00601865, 0, 0, 1,                   0),
(@OGUID+76 , 181527, 533, 2777.41, -3677.64, 274.387, 0.79134, 0, 0, 0.385427, 0.922739, 0, 0, 1,                   0),
(@OGUID+77 , 181527, 533, 2777.41, -3677.64, 274.387, 0.79134, 0, 0, 0.385427, 0.922739, 0, 0, 1,                   0),
(@OGUID+78 , 181528, 533, 2769.25, -3671.42, 274.422, 5.85918, 0, 0, 0.210418, -0.977611, 0, 0, 1,                  0),
(@OGUID+79 , 181528, 533, 2769.25, -3671.42, 274.422, 5.85918, 0, 0, 0.210418, -0.977611, 0, 0, 1,                  0),
(@OGUID+80 , 181528, 533, 2769.25, -3671.42, 274.422, 5.85918, 0, 0, 0.210418, -0.977611, 0, 0, 1,                  0),
(@OGUID+81 , 181529, 533, 2763.33, -3680.53, 274.352, 3.14638, 0, 0, 0.999997, -0.00239364, 0, 0, 1,                0),
(@OGUID+82 , 181529, 533, 2763.33, -3680.53, 274.352, 3.14638, 0, 0, 0.999997, -0.00239364, 0, 0, 1,                0),
(@OGUID+83 , 181529, 533, 2763.33, -3680.53, 274.352, 3.14638, 0, 0, 0.999997, -0.00239364, 0, 0, 1,                0),
(@OGUID+84 , 181530, 533, 2758.16, -3667.13, 274.352, 3.13883, 0, 0, 0.999999, 0.00138135, 0, 0, 1,                 0),
(@OGUID+85 , 181530, 533, 2758.16, -3667.13, 274.352, 3.13883, 0, 0, 0.999999, 0.00138135, 0, 0, 1,                 0),
(@OGUID+86 , 181531, 533, 2749.33, -3662.21, 274.352, 3.63687, 0, 0, 0.969494, -0.245115, 0, 0, 1,                  0),
(@OGUID+87 , 181531, 533, 2749.33, -3662.21, 274.352, 3.63687, 0, 0, 0.969494, -0.245115, 0, 0, 1,                  0),
(@OGUID+88 , 181532, 533, 2743.09, -3671.32, 274.317, 2.46425, 0, 0, 0.943197, 0.332234, 0, 0, 1,                   0),
(@OGUID+89 , 181532, 533, 2743.09, -3671.32, 274.317, 2.46425, 0, 0, 0.943197, 0.332234, 0, 0, 1,                   0),
(@OGUID+90 , 181532, 533, 2743.09, -3671.32, 274.317, 2.46425, 0, 0, 0.943197, 0.332234, 0, 0, 1,                   0),
(@OGUID+91 , 181532, 533, 2743.09, -3671.32, 274.317, 2.46425, 0, 0, 0.943197, 0.332234, 0, 0, 1,                   0),
(@OGUID+92 , 181533, 533, 2754.01, -3673.77, 274.387, 0.79134, 0, 0, 0.385427, 0.922739, 0, 0, 1,                   0),
(@OGUID+93 , 181533, 533, 2754.01, -3673.77, 274.387, 0.79134, 0, 0, 0.385427, 0.922739, 0, 0, 1,                   0),
(@OGUID+94 , 181533, 533, 2754.01, -3673.77, 274.387, 0.79134, 0, 0, 0.385427, 0.922739, 0, 0, 1,                   0),
(@OGUID+95 , 181533, 533, 2754.01, -3673.77, 274.387, 0.79134, 0, 0, 0.385427, 0.922739, 0, 0, 1,                   0),
(@OGUID+96 , 181534, 533, 2737.17, -3675.17, 274.317, 4.36965, 0, 0, 0.817334, -0.576165, 0, 0, 1,                  0),
(@OGUID+97 , 181534, 533, 2737.17, -3675.17, 274.317, 4.36965, 0, 0, 0.817334, -0.576165, 0, 0, 1,                  0),
(@OGUID+98 , 181534, 533, 2737.17, -3675.17, 274.317, 4.36965, 0, 0, 0.817334, -0.576165, 0, 0, 1,                  0),
(@OGUID+99 , 181535, 533, 2747.13, -3684.35, 274.352, 3.13243, 0, 0, 0.99999, 0.00458127, 0, 0, 1,                  0),
(@OGUID+100, 181535, 533, 2747.13, -3684.35, 274.352, 3.13243, 0, 0, 0.99999, 0.00458127, 0, 0, 1,                  0),
(@OGUID+101, 181536, 533, 2740.49, -3692.13, 274.387, 0.792787, 0, 0, 0.386094, 0.922459, 0, 0, 1,                  0),
(@OGUID+102, 181536, 533, 2740.49, -3692.13, 274.387, 0.792787, 0, 0, 0.386094, 0.922459, 0, 0, 1,                  0),
(@OGUID+103, 181537, 533, 2738.4, -3703.13, 274.385, 5.74611, 0, 0, 0.265322, -0.96416, 0, 0, 1,                    0),
(@OGUID+104, 181538, 533, 2752.93, -3706.52, 274.317, 1.04784, 0, 0, 0.500278, 0.865865, 0, 0, 1,                   0),
(@OGUID+105, 181539, 533, 2746.13, -3700.19, 274.317, 5.49328, 0, 0, 0.384765, -0.923015, 0, 0, 1,                  0),
(@OGUID+106, 181540, 533, 2752.92, -3693.02, 274.317, 4.09989, 0, 0, 0.887388, -0.461024, 0, 0, 1,                  0),
(@OGUID+107, 181541, 533, 2760.58, -3688.31, 274.387, 0.412781, 0, 0, 0.204928, 0.978777, 0, 0, 1,                  0),
(@OGUID+108, 181541, 533, 2760.58, -3688.31, 274.387, 0.412781, 0, 0, 0.204928, 0.978777, 0, 0, 1,                  0),
(@OGUID+109, 181542, 533, 2764.29, -3698.09, 274.422, 5.4908, 0, 0, 0.385909, -0.922537, 0, 0, 1,                   0),
(@OGUID+110, 181543, 533, 2772.08, -3692.15, 274.352, 5.01885, 0, 0, 0.590895, -0.806749, 0, 0, 1,                  0),
(@OGUID+111, 181543, 533, 2772.08, -3692.15, 274.352, 5.01885, 0, 0, 0.590895, -0.806749, 0, 0, 1,                  0),
(@OGUID+112, 181544, 533, 2774.96, -3701.13, 274.317, 0.523547, 0, 0, 0.258794, 0.965933, 0, 0, 1,                  0),
(@OGUID+113, 181544, 533, 2774.96, -3701.13, 274.317, 0.523547, 0, 0, 0.258794, 0.965933, 0, 0, 1,                  0),
(@OGUID+114, 181545, 533, 2772.29, -3711.44, 274.422, 6.02243, 0, 0, 0.130009, -0.991513, 0, 0, 1,                  0),
(@OGUID+115, 181546, 533, 2761.82, -3711.92, 274.315, 3.96147, 0, 0, 0.917145, -0.398553, 0, 0, 1,                  0),
(@OGUID+116, 181547, 533, 2754.19, -3718.12, 274.317, 5.37036, 0, 0, 0.440731, -0.897639, 0, 0, 1,                  0),
(@OGUID+117, 181548, 533, 2765.76, -3718.73, 274.317, 4.80798, 0, 0, 0.672516, -0.740083, 0, 0, 1,                  0),
(@OGUID+118, 181549, 533, 2776.16, -3721.79, 274.387, 3.93737, 0, 0, 0.921881, -0.387473, 0, 0, 1,                  0),
(@OGUID+119, 181549, 533, 2776.16, -3721.79, 274.387, 3.93737, 0, 0, 0.921881, -0.387473, 0, 0, 1,                  0),
(@OGUID+120, 181550, 533, 2765.33, -3728.61, 274.315, 6.21795, 0, 0, 0.0326119, -0.999468, 0, 0, 1,                 0),
(@OGUID+121, 181551, 533, 2774.99, -3731.79, 274.387, 3.92792, 0, 0, 0.923702, -0.383113, 0, 0, 1,                  0),
(@OGUID+122, 181552, 533, 2784.17, -3724.73, 274.385, 1.05084, 0, 0, 0.501576, 0.865113, 0, 0, 1,                   0),
(@OGUID+123, 181552, 533, 2784.17, -3724.73, 274.385, 1.05084, 0, 0, 0.501576, 0.865113, 0, 0, 1,                   1),

(@OGUID+124, 181575, 533, 3465.18, -3940.4, 308.79, 2.44346, 0.241845, 0.664462, 0.664463, 0.241847, 7200, 255, 1,  1),
(@OGUID+125, 181576, 533, 3539.02, -2936.82, 302.476, 3.14159, 0, 0, 1, 0.00000126759, 7200, 255, 1,                1),
(@OGUID+126, 181577, 533, 2909, -4025.02, 273.475, 3.14159, 0, 0, 1, 0.00000126759, 180, 0, 1,                      1),
(@OGUID+127, 181578, 533, 2493.02, -2921.78, 241.193, 3.14159, 0, 0, 1, 0.00000126759, 7200, 255, 1,                1),
(@OGUID+128, 181640, 533, 3763.44, -5115.88, 146, 2.94, 0, 0, 0.994924, 0.100626, 25, 0, 1,                         1),
(@OGUID+129, 181676, 533, 2771.37, -3681.64, 273.667, -0.104719, 0, 0, -0.0523356, 0.99863, 180, 0, 1,              1),
(@OGUID+130, 181676, 533, 2753.28, -3643.09, 273.618, 0.436332, 0, 0, 0.216439, 0.976296, 180, 0, 1,                1),
(@OGUID+131, 181676, 533, 2766.39, -3642.32, 273.853, -2.77507, 0, 0, -0.983255, 0.182237, 180, 0, 1,               1),
(@OGUID+132, 181676, 533, 2779.17, -3684.18, 273.668, 2.67035, 0, 0, 0.972369, 0.233447, 180, 0, 1,                 1),
(@OGUID+133, 181676, 533, 2765.45, -3663.31, 273.667, -1.3439, 0, 0, -0.622513, 0.782609, 180, 0, 1,                1),
(@OGUID+134, 181676, 533, 2746.33, -3649.14, 273.621, -2.82743, 0, 0, -0.987688, 0.156436, 180, 0, 1,               1),
(@OGUID+135, 181676, 533, 2783.05, -3681.86, 273.67, -1.44862, 0, 0, -0.662619, 0.748957, 180, 0, 1,                1),
(@OGUID+136, 181676, 533, 2771.77, -3652.75, 273.658, -0.645772, 0, 0, -0.317305, 0.948324, 180, 0, 1,              1),
(@OGUID+137, 181676, 533, 2776.29, -3642.56, 273.965, 0.017452, 0, 0, 0.00872589, 0.999962, 180, 0, 1,              1),
(@OGUID+138, 181676, 533, 2746.2, -3658.67, 273.619, 3.00195, 0, 0, 0.997563, 0.0697646, 180, 0, 1,                 1),
(@OGUID+139, 181676, 533, 2771.85, -3665.62, 273.667, 3.10665, 0, 0, 0.999847, 0.0174704, 180, 0, 1,                1),
(@OGUID+140, 181676, 533, 2761.93, -3648.03, 273.626, -0.366518, 0, 0, -0.182235, 0.983255, 180, 0, 1,              1),
(@OGUID+141, 181676, 533, 2771.63, -3642.94, 274.379, -0.733038, 0, 0, -0.358368, 0.93358, 180, 0, 1,               1),
(@OGUID+142, 181676, 533, 2762.27, -3672.94, 273.667, -2.82743, 0, 0, -0.987688, 0.156436, 180, 0, 1,               1),
(@OGUID+143, 181676, 533, 2752.57, -3655.19, 273.626, 1.46608, 0, 0, 0.669132, 0.743144, 180, 0, 1,                 1),
(@OGUID+144, 181676, 533, 2782.95, -3641.68, 273.594, -0.872664, 0, 0, -0.422618, 0.906308, 180, 0, 1,              1),
(@OGUID+145, 181676, 533, 2759.67, -3641.1, 273.591, -0.645772, 0, 0, -0.317305, 0.948324, 180, 0, 1,               1),
(@OGUID+146, 181676, 533, 2752.82, -3666.02, 273.654, 2.58308, 0, 0, 0.961261, 0.275641, 180, 0, 1,                 1),
(@OGUID+147, 181677, 533, 2735.92, -3697.26, 273.65, 0.523598, 0, 0, 0.258819, 0.965926, 180, 0, 1,                 1),
(@OGUID+148, 181677, 533, 2778.21, -3694.98, 273.638, 0.663223, 0, 0, 0.325567, 0.945519, 180, 0, 1,                1),
(@OGUID+149, 181677, 533, 2747.86, -3676.92, 273.662, 0.296705, 0, 0, 0.147809, 0.989016, 180, 0, 1,                1),
(@OGUID+150, 181677, 533, 2745.5, -3666.69, 273.639, -1.55334, 0, 0, -0.700908, 0.713252, 180, 0, 1,                1),
(@OGUID+151, 181677, 533, 2755.71, -3682.96, 273.666, -1.27409, 0, 0, -0.594823, 0.803857, 180, 0, 1,               1),
(@OGUID+152, 181677, 533, 2768.83, -3701.38, 273.665, 1.51844, 0, 0, 0.688356, 0.725373, 180, 0, 1,                 1),
(@OGUID+153, 181677, 533, 2747.2, -3693.01, 273.666, -1.85005, 0, 0, -0.798636, 0.601815, 180, 0, 1,                1),
(@OGUID+154, 181677, 533, 2734.93, -3688.94, 273.628, -0.645772, 0, 0, -0.317305, 0.948324, 180, 0, 1,              1),
(@OGUID+155, 181677, 533, 2766.62, -3687.92, 273.664, -0.436332, 0, 0, -0.216439, 0.976296, 180, 0, 1,              1),
(@OGUID+156, 181677, 533, 2729.2, -3673.43, 273.621, -0.157079, 0, 0, -0.0784588, 0.996917, 180, 0, 1,              1),
(@OGUID+157, 181677, 533, 2729.52, -3697.78, 273.625, 0.104719, 0, 0, 0.0523356, 0.99863, 180, 0, 1,                1),
(@OGUID+158, 181677, 533, 2729.02, -3684.86, 274.373, -0.034906, 0, 0, -0.0174521, 0.999848, 180, 0, 1,             1),
(@OGUID+159, 181677, 533, 2734, -3663.36, 273.621, -1.91986, 0, 0, -0.819151, 0.573577, 180, 0, 1,                  1),
(@OGUID+160, 181677, 533, 2740.54, -3681.25, 273.644, 1.81514, 0, 0, 0.78801, 0.615662, 180, 0, 1,                  1),
(@OGUID+161, 181677, 533, 2761.62, -3693.18, 273.664, 2.60053, 0, 0, 0.963629, 0.267244, 180, 0, 1,                 1),
(@OGUID+162, 181678, 533, 2807.49, -3668.25, 273.644, -1.55334, 0, 0, -0.700908, 0.713252, 180, 0, 1,               1),
(@OGUID+163, 181678, 533, 2819.54, -3677.43, 273.638, 1.51844, 0, 0, 0.688356, 0.725373, 180, 0, 1,                 1),
(@OGUID+164, 181678, 533, 2808.35, -3685.41, 273.645, -1.27409, 0, 0, -0.594823, 0.803857, 180, 0, 1,               1),
(@OGUID+165, 181678, 533, 2802.32, -3659.69, 273.626, 1.46608, 0, 0, 0.669132, 0.743144, 180, 0, 1,                 1),
(@OGUID+166, 181678, 533, 2795.44, -3687.74, 273.622, -0.506145, 0, 0, -0.25038, 0.968148, 180, 0, 1,               1),
(@OGUID+167, 181678, 533, 2821.09, -3691.97, 275.804, 2.79252, 0, 0, 0.984807, 0.173652, 180, 0, 1,                 1),
(@OGUID+168, 181678, 533, 2818.81, -3672.17, 273.629, -1.3439, 0, 0, -0.622513, 0.782609, 180, 0, 1,                1),
(@OGUID+169, 181678, 533, 2787.77, -3674.88, 273.668, 0.296705, 0, 0, 0.147809, 0.989016, 180, 0, 1,                1),
(@OGUID+170, 181678, 533, 2793.97, -3656.83, 273.637, 0.663223, 0, 0, 0.325567, 0.945519, 180, 0, 1,                1),
(@OGUID+171, 181678, 533, 2789.24, -3668.48, 273.669, -0.366518, 0, 0, -0.182235, 0.983255, 180, 0, 1,              1),
(@OGUID+172, 181678, 533, 2793, -3646.92, 273.62, -0.95993, 0, 0, -0.461748, 0.887011, 180, 0, 1,                   1),
(@OGUID+173, 181678, 533, 2813.31, -3699.76, 273.621, -1.85005, 0, 0, -0.798636, 0.601815, 180, 0, 1,               1),
(@OGUID+174, 181678, 533, 2817.4, -3684.56, 273.623, -0.820303, 0, 0, -0.398748, 0.91706, 180, 0, 1,                1),
(@OGUID+175, 181678, 533, 2786.82, -3647.31, 273.635, -0.436332, 0, 0, -0.216439, 0.976296, 180, 0, 1,              1),
(@OGUID+176, 181678, 533, 2817.31, -3687.08, 273.621, 2.60053, 0, 0, 0.963629, 0.267244, 180, 0, 1,                 1),
(@OGUID+177, 181678, 533, 2803.58, -3675.67, 273.666, -2.80997, 0, 0, -0.986285, 0.165053, 180, 0, 1,               1),
(@OGUID+178, 181678, 533, 2815.57, -3697.73, 273.621, 0.994837, 0, 0, 0.477158, 0.878817, 180, 0, 1,                1),
(@OGUID+179, 181678, 533, 2811.57, -3663.93, 273.623, 3.00195, 0, 0, 0.997563, 0.0697646, 180, 0, 1,                1),
(@OGUID+180, 181678, 533, 2796.98, -3671.73, 273.669, 2.58308, 0, 0, 0.961261, 0.275641, 180, 0, 1,                 1),
(@OGUID+181, 181695, 533, 2749.96, -3724.48, 273.623, 0.645772, 0, 0, 0.317305, 0.948324, 180, 0, 1,                1),
(@OGUID+182, 181695, 533, 2745.57, -3720.84, 273.654, 1.8675, 0, 0, 0.803856, 0.594824, 180, 0, 1,                  1),
(@OGUID+183, 181695, 533, 2771.05, -3717.31, 273.67, -0.366518, 0, 0, -0.182235, 0.983255, 180, 0, 1,               1),
(@OGUID+184, 181695, 533, 2757.5, -3708.95, 273.668, -0.95993, 0, 0, -0.461748, 0.887011, 180, 0, 1,                1),
(@OGUID+185, 181695, 533, 2752.93, -3699.58, 273.667, 0.436332, 0, 0, 0.216439, 0.976296, 180, 0, 1,                1),
(@OGUID+186, 181695, 533, 2766.44, -3708.41, 273.667, -1.27409, 0, 0, -0.594823, 0.803857, 180, 0, 1,               1),
(@OGUID+187, 181695, 533, 2760.5, -3732.28, 273.632, -1.18682, 0, 0, -0.559191, 0.829039, 180, 0, 1,                1),
(@OGUID+188, 181695, 533, 2791.41, -3726.31, 273.622, 1.48353, 0, 0, 0.67559, 0.737277, 180, 0, 1,                  1),
(@OGUID+189, 181695, 533, 2787.4, -3731.16, 273.616, -1.09956, 0, 0, -0.5225, 0.852639, 180, 0, 1,                  1),
(@OGUID+190, 181695, 533, 2779.75, -3728.21, 273.644, 2.67035, 0, 0, 0.972369, 0.233447, 180, 0, 1,                 1),
(@OGUID+191, 181695, 533, 2771.59, -3736.93, 273.618, 1.48353, 0, 0, 0.67559, 0.737277, 180, 0, 1,                  1),
(@OGUID+192, 181695, 533, 2745.73, -3711.43, 273.621, 0.767944, 0, 0, 0.374606, 0.927184, 180, 0, 1,                1),
(@OGUID+193, 181695, 533, 2759.15, -3718.01, 273.669, -2.00713, 0, 0, -0.843392, 0.537299, 180, 0, 1,               1),
(@OGUID+194, 181695, 533, 2759.64, -3724.62, 273.66, 2.1293, 0, 0, 0.874619, 0.48481, 180, 0, 1,                    1),
(@OGUID+195, 181695, 533, 2771.05, -3727.31, 273.67, -0.436332, 0, 0, -0.216439, 0.976296, 180, 0, 1,               1),
(@OGUID+196, 181695, 533, 2737.57, -3710.51, 273.624, 2.96704, 0, 0, 0.996194, 0.0871655, 180, 0, 1,                1),
(@OGUID+197, 181695, 533, 2781.85, -3735.08, 273.62, 1.51844, 0, 0, 0.688356, 0.725373, 180, 0, 1,                  1),
(@OGUID+198, 181695, 533, 2731.62, -3706.18, 273.623, -2.77507, 0, 0, -0.983255, 0.182237, 180, 0, 1,               1),
(@OGUID+199, 181695, 533, 2755.07, -3728.92, 273.626, 0.523598, 0, 0, 0.258819, 0.965926, 180, 0, 1,                1),
(@OGUID+200, 181695, 533, 2781.35, -3720.31, 273.64, 2.67035, 0, 0, 0.972369, 0.233447, 180, 0, 1,                  1);


-- (@OGUID+201, 193426, 533, 2516.59, -2946.82, 245.552, 5.48034, 0, 0, 0.390728, -0.920506, -604800, 255, 1,           1);


DELETE FROM `gameobject_template` WHERE `entry` IN(
175369,
175370,
181119,
181120,
181121,
181123,
181124,
181125,
181126,
181168,
181169,
181170,
181195,
181197,
181198,
181199,
181200,
181201,
181202,
181203,
181209,
181210,
181211,
181212,
181213,
181225,
181228,
181229,
181230,
181231,
181232,
181233,
181234,
181235,
181240,
181241,
181242,
181243,
181356,
181366,
181402,
181403,
181404,
181405,
181444,
181477,
181478,
181496,
181510,
181511,
181512,
181513,
181514,
181515,
181516,
181517,
181518,
181519,
181520,
181521,
181522,
181523,
181524,
181525,
181526,
181527,
181528,
181529,
181530,
181531,
181532,
181533,
181534,
181535,
181536,
181537,
181538,
181539,
181540,
181541,
181542,
181543,
181544,
181545,
181546,
181547,
181548,
181549,
181550,
181551,
181552,
181575,
181576,
181577,
181578,
181640,
181676,
181677,
181678,
181695,
193426,
194022);


INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `ScriptName`) VALUES

-- these two are kindof pointless. They are the gates at strat entrance, so never visible for players in naxx. But i guess, for authenticity!
(175369, 0, 3614, 'Elders\' Square Service Entrance',   0, 34, 1, 0, 879, 3000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(175370, 0, 3614, 'Doodad_SmallPortcullis05',           0, 34, 1, 0, 0, 3000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),

/*
1 = in use (cant interact with the object)
2 = Makes chests/doors locked (requiring a key, spell, event to open)
4 = Untargetable
8 = Transport (Object can transport (elevator, boat, car))
16 = Player cant interact with the object.
32 = No despawn (never despawn, typically for doors, they just change state)
64 = Triggered (typically, summoned objects. Triggered by spell or other events)

32+2 
*/
-- doors                                               `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`,
(181126, 0, 6677, 'Anub\'Rekhan Door',                  0,         32,      1,      0,       86,      0,       0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181195, 0, 2451, 'Anub\'Rekhan Gate',                  0,         34,      0.54,   0,       86,      0,       0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),

(181235, 0, 6687, 'Grand Widow Faerlina - Wezb',        0,         48,      1,      1,       0,       0,       0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),

(194022, 0, 6677, 'Doodad_Nox_door_spider02',           0,         34,      1,      0,       86,      0,       0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181209, 0, 6688, 'Maexxna - Outer Web Door',           0,         48,      1,      0,       0,       0,       0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181197, 0, 6688, 'Maexxna - Inner Web Door',           0,         48,      1,      1,       0,       0,       0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
                                                                                                               
(181198, 0, 6689, 'Doodad_Nox_door_slime01',            0,         48,      0.79,   1,       0,       3000,    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181199, 0, 6689, 'Doodad_Nox_door_slime02',            0,         48,      1,      1,       0,       3000,    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
-- vacuum are gothik gates                                                                                     
(181124, 0, 6676, 'Vaccuum - Enter Gate',               0,         48,      0.82,   0,       0,       0,       0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181125, 0, 6676, 'Vaccuum - Exit Gate',                0,         48,      0.79,   0,       0,       0,       0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181170, 0, 6685, 'Vaccuum - Combat Gate',              0,         48,      1.05,   1,       0,       0,       0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181119, 0, 6672, 'Deathknight Door',                   0,         34,      1,      0,       86,      0,       0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
                                                                                                               
(181123, 0, 6676, 'Patchwork - Exit Door',              0,         48,      1,      0,       0,       0,       0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181120, 0, 6673, 'Gluth - Exit Door',                  0,         48,      1,      0,       0,       0,       0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181121, 0, 6674, 'Thaddius Door',                      0,         34,      1,      0,       86,      0,       0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
                                                                                                               
(181200, 0, 6689, 'Noth - Entry Door',                  0,         48,      1,      1,       0,       0,       0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181201, 0, 6689, 'Noth - Exit Door',                   0,         48,      1.15,   0,       0,       0,       0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181202, 0, 6689, 'Heigan the Unclean - Entry Door',    0,         48,      0.99,   0,       0,       0,       0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
-- (181203, 0, 6689, 'Heigan the Unclean - Exit Door',     0,         48,      1.02,   0,       0,       0,       0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181496, 0, 6675, 'Heigan - Exit Door',                 0,         48,      1,      1,       0,       0,       0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181241, 0, 6675, 'Loatheb - Entrance Door',            0,         48,      1,      0,       0,       0,       0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181240, 0, 6702, 'Loatheb Fight Door 01 (not used)',   0,         48,      1.71,   0,       0,       3000,    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181242, 0, 6675, 'Loatheb Fight Door 02 (not used)',   0,         48,      0.59,   0,       0,       3000,    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181243, 0, 6675, 'Loatheb Fight Door 03 (not used)',   0,         48,      0.59,   0,       0,       3000,    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
                                                                                                               
(181225, 0, 6695, 'Frostwyrm Waterfall Door',           0,         48,      1,      0,       0,       0,       0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181228, 0, 6675, 'KelThuzad Door',                     0,         48,      1,      0,       0,       0,       0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),


-- just visuals. Unknown if they should be targetable and clickable or not.
(181168, 10, 6684, 'Icebellow Furnace', 0, 0, 1, 0, 0, 0, 3000, 0, 0, 0, 0, 0, 0, 3, 1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181169, 10, 6684, 'Icebellow Furnace', 0, 0, 1, 0, 0, 0, 3000, 0, 0, 0, 0, 0, 0, 3, 1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181234, 8, 6701, 'Icebellow Anvil', 0, 0, 1, 1362, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),


-- The scattered remains of sapphiron when you first get to him.
(181356, 6, 6747, 'Sapphiron Birth', 0, 0, 1, 0, 63, 80, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),


-- which one is correct?
(181366, 3, 1387, 'Four Horsemen Chest', 0, 0, 1, 1634, 181366, 0, 1, 0, 0, 0, 0, 0, 60, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
-- (193426, 3, 1387, 'Four Horsemen Chest', 0, 0, 1, 1634, 25193, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),


-- we manually spawn this ingame instead
-- (181444, 1, 8093, 'Kel\'Thuzad Trigger', 0, 0, 1.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),

(181640, 7, 6690, 'Doodad_kelthuzad_throne02', 0, 48, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),

-- Thaddius. Not sure if they should be targetable 
(181477, 1, 6775, 'Doodad_nox_tesla05', 0, 48, 1.78, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181478, 1, 6775, 'Doodad_nox_tesla06', 0, 48, 1.78, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),

-- Heigan plague fissures
(181510, 6, 6785, 'Plague Fissure', 0, 0, 1, 0, 60, 0, 29371, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181511, 6, 6785, 'Plague Fissure', 0, 0, 1, 0, 60, 0, 29371, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181512, 6, 6785, 'Plague Fissure', 0, 0, 1, 0, 60, 0, 29371, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181513, 6, 6785, 'Plague Fissure', 0, 0, 1, 0, 60, 0, 29371, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181514, 6, 6785, 'Plague Fissure', 0, 0, 1, 0, 60, 0, 29371, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181515, 6, 6785, 'Plague Fissure', 0, 0, 1, 0, 60, 0, 29371, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181516, 6, 6785, 'Plague Fissure', 0, 0, 1, 0, 60, 0, 29371, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181517, 6, 6785, 'Plague Fissure', 0, 0, 1, 0, 60, 0, 29371, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181518, 6, 6785, 'Plague Fissure', 0, 0, 1, 0, 60, 0, 29371, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181519, 6, 6785, 'Plague Fissure', 0, 0, 1, 0, 60, 0, 29371, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181520, 6, 6785, 'Plague Fissure', 0, 0, 1, 0, 60, 0, 29371, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181521, 6, 6785, 'Plague Fissure', 0, 0, 1, 0, 60, 0, 29371, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181522, 6, 6785, 'Plague Fissure', 0, 0, 1, 0, 60, 0, 29371, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181523, 6, 6785, 'Plague Fissure', 0, 0, 1, 0, 60, 0, 29371, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181524, 6, 6785, 'Plague Fissure', 0, 0, 1, 0, 60, 0, 29371, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181525, 6, 6785, 'Plague Fissure', 0, 0, 1, 0, 60, 0, 29371, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181526, 6, 6785, 'Plague Fissure', 0, 0, 1, 0, 60, 0, 29371, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181527, 6, 6785, 'Plague Fissure', 0, 0, 1, 0, 60, 0, 29371, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181528, 6, 6785, 'Plague Fissure', 0, 0, 1, 0, 60, 0, 29371, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181529, 6, 6785, 'Plague Fissure', 0, 0, 1, 0, 60, 0, 29371, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181530, 6, 6785, 'Plague Fissure', 0, 0, 1, 0, 60, 0, 29371, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181531, 6, 6785, 'Plague Fissure', 0, 0, 1, 0, 60, 0, 29371, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181532, 6, 6785, 'Plague Fissure', 0, 0, 1, 0, 60, 0, 29371, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181533, 6, 6785, 'Plague Fissure', 0, 0, 1, 0, 60, 0, 29371, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181534, 6, 6785, 'Plague Fissure', 0, 0, 1, 0, 60, 0, 29371, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181535, 6, 6785, 'Plague Fissure', 0, 0, 1, 0, 60, 0, 29371, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181536, 6, 6785, 'Plague Fissure', 0, 0, 1, 0, 60, 0, 29371, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181537, 6, 6785, 'Plague Fissure', 0, 0, 1, 0, 60, 0, 29371, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181538, 6, 6785, 'Plague Fissure', 0, 0, 1, 0, 60, 0, 29371, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181539, 6, 6785, 'Plague Fissure', 0, 0, 1, 0, 60, 0, 29371, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181540, 6, 6785, 'Plague Fissure', 0, 0, 1, 0, 60, 0, 29371, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181541, 6, 6785, 'Plague Fissure', 0, 0, 1, 0, 60, 0, 29371, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181542, 6, 6785, 'Plague Fissure', 0, 0, 1, 0, 60, 0, 29371, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181543, 6, 6785, 'Plague Fissure', 0, 0, 1, 0, 60, 0, 29371, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181544, 6, 6785, 'Plague Fissure', 0, 0, 1, 0, 60, 0, 29371, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181545, 6, 6785, 'Plague Fissure', 0, 0, 1, 0, 60, 0, 29371, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181546, 6, 6785, 'Plague Fissure', 0, 0, 1, 0, 60, 0, 29371, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181547, 6, 6785, 'Plague Fissure', 0, 0, 1, 0, 60, 0, 29371, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181548, 6, 6785, 'Plague Fissure', 0, 0, 1, 0, 60, 0, 29371, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181549, 6, 6785, 'Plague Fissure', 0, 0, 1, 0, 60, 0, 29371, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181550, 6, 6785, 'Plague Fissure', 0, 0, 1, 0, 60, 0, 29371, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181551, 6, 6785, 'Plague Fissure', 0, 0, 1, 0, 60, 0, 29371, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181552, 6, 6785, 'Plague Fissure', 0, 0, 1, 0, 60, 0, 29371, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181676, 6, 1287, 'Plague Fissure', 0, 0, 1, 0, 60, 0, 29371, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),-- more fizzures, but grouped differently. Make sure there is no good reason for this
(181677, 6, 1287, 'Plague Fissure', 0, 0, 1, 0, 60, 0, 29371, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181678, 6, 1287, 'Plague Fissure', 0, 0, 1, 0, 60, 0, 29371, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181695, 6, 1287, 'Plague Fissure', 0, 0, 1, 0, 60, 0, 29371, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),

-- Also around KT's chamber.  Blocks the view out, seems to open at 40% 
(181402, 0, 6770, 'Doodad_kelthuzad_window_portal01',   0, 48, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181403, 0, 6770, 'Doodad_kelthuzad_window_portal02',   0, 48, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181404, 0, 6770, 'Doodad_kelthuzad_window_portal03',   0, 48, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181405, 0, 6770, 'Doodad_kelthuzad_window_portal04',   0, 48, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),

-- The eyes at the end bosses. Teleports us when boss is dead.
-- untargetable and no interract flags removed by script when boss is dead.
(181575, 10, 6787, 'Naxxramas Portal',                  0,   48,   1,  0,  0,  0, 0, 0, 0, 0, 0, 0, 0, 28444, 0,  0/*129*/, 0,  0,  0,  0,  0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181576, 10, 6788, 'Naxxramas Portal',                  0,   48,   1,  0,  0,  0, 0, 0, 0, 0, 0, 0, 0, 28444, 0,  0/*129*/, 0,  0,  0,  0,  0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181577, 10, 6789, 'Naxxramas Portal',                  0,   48,   1,  0,  0,  0, 0, 0, 0, 0, 0, 0, 0, 28444, 0,  0/*129*/, 0,  0,  0,  0,  0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181578, 10, 6790, 'Naxxramas Portal',                  0,   48,   1,  0,  0,  0, 0, 0, 0, 0, 0, 0, 0, 28444, 0,  0/*129*/, 0,  0,  0,  0,  0, 0, 0, 0, 0, 0, 0, 0, 0, ''),

-- the shiny stuff appearing on the eyes (portals) above, when killing endboss
(181230, 0, 6697, 'Deathknight Wing Eye Portal Boss',   0, 48, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181231, 0, 6698, 'Plague Wing Eye Portal Boss',        0, 48, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181232, 0, 6699, 'Abom Wing Eye Portal Boss',          0, 48, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181233, 0, 6700, 'Spider Wing Eye Portal Boss',        0, 48, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),

-- Shiny portals appearing when killing endbosses
(181210, 0, 6691, 'Deathknight Wing Eye Portal Ramp',   0, 48, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181211, 0, 6692, 'Plague Wing Eye Portal Ramp',        0, 48, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181212, 0, 6693, 'Spider Wing Eye Portal Ramp',        0, 48, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(181213, 0, 6694, 'Abom Wing Eye Portal Ramp',          0, 48, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),

-- portal to frostwyrm lair
(181229, 0, 6696, 'Portal', 0, 48, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

-- script added to anub'rekhans door so we can do anubs welcome msg in onUse for the door
UPDATE `gameobject_template` SET `ScriptName`='go_anub_door' WHERE `entry`='181126';










/*
* Scripttexts
*/


/*
script_texts found in scriptdev2 which are missing in our database.
*/
DELETE FROM `script_texts` WHERE entry in(
-1533134,
-1533135,
-1533136,
-1533137,
-1533138,
-1533139,
-1533140,
-1533141,
-1533142,
-1533143,
-1533144,
-1533145,
-1533146,
-1533147,
-1533148,
-1533149,
-1533150,
-1533151,
-1533152,
-1533153,
-1533154,
-1533155,
-1533156,
-1533157,
-1533158,
-1533159
);

INSERT INTO `script_texts` (`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`)
VALUES 
(-1533134,'A Guardian of Icecrown enters the fight!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'kelthuzad EMOTE_GUARDIAN'),
(-1533135,'%s strikes!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'kelthuzad EMOTE_PHASE2'),
(-1533136,'%s teleports and begins to channel a spell!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'heigan EMOTE_TELEPORT'),
(-1533137,'%s rushes to attack once more!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'heigan EMOTE_RETURN'),
(-1533138,'%s teleports into the fray!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'gothik EMOTE_TO_FRAY'),
(-1533139,'The central gate opens!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'gothik EMOTE_GATE'),
(-1533140,'Brazenly you have disregarded powers beyond your understanding.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'gothik SAY_SPEECH_2'),
(-1533141,'You have fought hard to invade the realm of the harvester.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'gothik SAY_SPEECH_3'),
(-1533142,'Now there is only one way out - to walk the lonely path of the damned.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'gothik SAY_SPEECH_4'),
(-1533143,'An aura of necrotic energy blocks all healing!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'Loatheb EMOTE_AURA_BLOCKING'),
(-1533144,'The power of Necrotic Aura begins to wane!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'Loatheb EMOTE_AURA_WANE'),
(-1533145,'The aura fades away, allowing healing once more!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'Loatheb EMOTE_AURA_FADING'),
(-1533146,'%s spins her web into a cocoon!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'maexxna EMOTE_SPIN_WEB'),
(-1533147,'Spiderlings appear on the web!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'maexxna EMOTE_SPIDERLING'),
(-1533148,'%s sprays strands of web everywhere!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'maexxna EMOTE_SPRAY'),
(-1533149,'%s loses its link!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'tesla_coil EMOTE_LOSING_LINK'),
(-1533150,'%s overloads!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'tesla_coil EMOTE_TESLA_OVERLOAD'),
(-1533151,'The polarity has shifted!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'thaddius EMOTE_POLARITY_SHIFT'),
(-1533152,'%s decimates all nearby flesh!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'gluth EMOTE_DECIMATE'),
(-1533153,'A %s joins the fight!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'crypt_guard EMOTE_CRYPT_GUARD'),
(-1533154,'%s begins to unleash an insect swarm!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'anubrekhan EMOTE_INSECT_SWARM'),
(-1533155,'Corpse Scarabs appear from a Crypt Guard\'s corpse!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'anubrekhan EMOTE_CORPSE_SCARABS'),
(-1533156,'%s casts Unyielding Pain on everyone!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'lady_blaumeux EMOTE_UNYIELDING_PAIN'),
(-1533157,'%s casts Condemation on everyone!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'sir_zeliek EMOTE_CONDEMATION'),
(-1533158,'%s injects you with a mutagen!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,5,0,0,'grobbulus EMOTE_INJECTION'),
(-1533159,'%s lets loose a triumphant shout.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'razuvious EMOTE_SHOUT');


-- KT taunts and cat dead should be zone-yells
UPDATE `script_texts` SET `type`='6' WHERE `entry`='-1533091';
UPDATE `script_texts` SET `type`='6' WHERE `entry`='-1533092';
UPDATE `script_texts` SET `type`='6' WHERE `entry`='-1533089';
UPDATE `script_texts` SET `type`='6' WHERE `entry`='-1533090';
UPDATE `script_texts` SET `type`='6' WHERE `entry`='-1533093';
UPDATE `script_texts` SET `type`='6' WHERE `entry`='-1533093';
UPDATE `script_texts` SET `type`='6' WHERE `entry`='-1533039';
UPDATE `script_texts` SET `type`='6' WHERE `entry`='-1533038';
UPDATE `script_texts` SET `type`='6' WHERE `entry`='-1533037';
UPDATE `script_texts` SET `type`='6' WHERE `entry`='-1533036';

-- dialogue between LK and KT must be zone-yells
UPDATE `script_texts` SET `type`='6' WHERE `entry`='-1533084';
UPDATE `script_texts` SET `type`='6' WHERE `entry`='-1533085';
UPDATE `script_texts` SET `type`='6' WHERE `entry`='-1533086';
UPDATE `script_texts` SET `type`='6' WHERE `entry`='-1533087';
UPDATE `script_texts` SET `type`='6' WHERE `entry`='-1533088';

-- fix incorrect sound ids
UPDATE `script_texts` SET `sound`='8822' WHERE `entry`='-1533092';
UPDATE `script_texts` SET `sound`='8823' WHERE `entry`='-1533093';

-- 4hm intro RP must be type zone-yells
UPDATE `script_texts` set type = 6 where entry in (-1533059, -1533045, -1533071, -1533046, -1533060, -1533053, -1533072);

-- DK wing intro RP must be zone-yells
UPDATE `script_texts` set type = 6 where entry in (-1533052, -1533061, -1533073, -1533047);

UPDATE `script_texts` SET `content_default`='Invaders! Cease this foolish venture at once! Turn away while you still can!' WHERE `entry`='-1533059';
UPDATE `script_texts` SET `content_default`='I\'ve heard about enough a\' yer snivelin\'. Shut your flytrap before I shut it for ye\'!' WHERE `entry`='-1533053';

-- https://youtu.be/VrykhhdPfc4?t=7m33s
UPDATE `script_texts` SET `content_default`='Sto-o-op! Make it stop!!' WHERE `entry`='-1533037';

-- all the in-combat script_texts for 4hm encounter are of type say
UPDATE `script_texts` SET `type`='0' WHERE `entry` in (
-1533056, 
-1533055, 
-1533070, 
-1533063, 
-1533048, 
-1533062, 
-1533049, 
-1533064, 
-1533057,
-1533069,
-1533068,
-1533067,
-1533066,
-1533065,
-1533058,
-1533054,
-1533051,
-1533050,
-1533044,
-1533074);

-- misc typo fixes for 4hm
UPDATE `script_texts` SET `content_default`='Forgive me.' WHERE `entry`='-1533063';
UPDATE `script_texts` SET `content_default`='Bow to the might of the Highlord!' WHERE `entry`='-1533070';
UPDATE `script_texts` SET `content_default`='I have no choice but to obey!' WHERE `entry`='-1533062';










/*
-- Query: select * from creature where map = 533
-- Date: 2017-08-12 14:09
*/
INSERT INTO `creature` (`guid`,`id`,`map`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`,`spawnFlags`) 
VALUES 
(2530565,533004,533,0,0,3377.1,-3668.19,259.083,5.03128,3520,0,0,5000,0,0,0,0),
(2530566,533004,533,0,0,3382.74,-3691.03,259.08,2.27847,3520,0,0,5000,0,0,0,0),
(2530567,533004,533,0,0,3351.51,-3687.79,259.076,1.57868,3520,0,0,5000,0,0,0,0),
(88264,16017,533,9760,0,3058.95,-3356.17,298.5,4.51,3520,0,0,87532,0,0,0,0),
(88261,16017,533,9760,0,3075.87,-3354.34,298.5,3.94,3520,0,0,87532,0,0,0,0),
(88263,16017,533,9760,0,3085.09,-3383.11,298.5,2.95,3520,0,0,87532,0,0,0,0),
(2530561,16447,533,0,0,2577.37,-3113.75,240.526,0.811481,3520,0,0,93736,0,0,0,0),
(2530560,16447,533,0,0,2570.38,-3106.55,240.526,0.71095,3520,0,0,93736,0,0,0,0),
(2530559,16448,533,0,0,2570.25,-3114.32,240.526,0.71095,3520,0,0,93736,75407,0,0,0),
(2530558,16448,533,0,0,2585.9,-3110.53,240.526,0.697599,3520,0,0,93736,16845,0,0,0),
(2530557,16448,533,0,0,2571.64,-3097.57,240.526,0.845254,3520,0,0,93736,91212,0,0,0),
(2530556,16447,533,0,0,2553.34,-3155.43,240.526,4.73298,3520,0,0,93736,0,0,0,0),
(2530555,16447,533,0,0,2561.05,-3155.27,240.526,4.73298,3520,0,0,93736,0,0,0,0),
(2530553,16448,533,0,0,2549.6,-3161.76,240.526,4.74083,3520,0,0,93736,66582,0,0,0),
(2530554,16448,533,0,0,2557.01,-3149.03,240.526,4.73298,3520,0,0,93736,47273,0,0,0),
(2530552,16448,533,0,0,2564.94,-3161.32,240.526,4.74083,3520,0,0,93736,24622,0,0,0),
(2530551,16447,533,0,0,2560.33,-3713.35,294.662,1.61886,3520,0,0,93736,0,0,0,0),
(2530550,16447,533,0,0,2552.1,-3713.75,294.662,1.61886,3520,0,0,93736,0,0,0,0),
(2530549,16448,533,0,0,2562.64,-3704.91,294.662,1.56389,3520,0,0,93736,51028,0,0,0),
(2530548,16448,533,0,0,2547.5,-3704.26,294.662,1.56389,3520,0,0,93736,87539,0,0,0),
(2530547,16448,533,0,0,2556.59,-3720.23,294.662,1.56389,3520,0,0,93736,27404,0,0,0),
(2530546,16447,533,0,0,2572.81,-3758.98,294.662,5.5058,3520,0,0,93736,0,0,0,0),
(2530545,16447,533,0,0,2577.37,-3754.34,294.662,5.5058,3520,0,0,93736,0,0,0,0),
(2530544,16448,533,0,0,2570.72,-3753.11,294.662,5.5058,3520,0,0,93736,25874,0,0,0),
(2530543,16448,533,0,0,2576.23,-3767.45,294.662,5.45475,3520,0,0,93736,35161,0,0,0),
(2530542,16448,533,0,0,2587.37,-3758.34,294.662,5.55842,3520,0,0,93736,86180,0,0,0),
(2530541,16447,533,0,0,2684.57,-3862.4,294.661,2.33436,3520,0,0,93736,0,0,0,0),
(2530540,16447,533,0,0,2678.59,-3868.12,294.661,2.33436,3520,0,0,93736,0,0,0,0),
(2530539,16448,533,0,0,2685.21,-3869.02,294.661,2.33436,3520,0,0,93736,68211,0,0,0),
(2530538,16448,533,0,0,2682.02,-3854.21,294.661,2.22048,3520,0,0,93736,70514,0,0,0),
(2530537,16448,533,0,0,2670.51,-3864.96,294.661,2.4184,3520,0,0,93736,54205,0,0,0),
(2530536,16447,533,0,0,2725.97,-3888.19,294.661,6.18831,3520,0,0,93736,0,0,0,0),
(2530535,16447,533,0,0,2726.86,-3878.86,294.661,6.18831,3520,0,0,93736,0,0,0,0),
(2530534,16448,533,0,0,2720.3,-3883.24,294.661,6.18831,3520,0,0,93736,47480,0,0,0),
(2530533,16448,533,0,0,2734.55,-3876.02,294.661,6.26686,3520,0,0,93736,62787,0,0,0),
(2530532,16448,533,0,0,2734.08,-3892.51,294.661,6.21973,3520,0,0,93736,77758,0,0,0),
(2530531,16447,533,0,0,3330.67,-3867.41,294.661,0.900231,3520,0,0,93736,0,0,0,0),
(2530530,16447,533,0,0,3325.61,-3862.11,294.661,0.919081,3520,0,0,93736,0,0,0,0),
(2530529,16448,533,0,0,3324.8,-3868.41,294.661,0.78949,3520,0,0,93736,24960,0,0,0),
(2530528,16448,533,0,0,3338.55,-3864.67,294.661,0.722732,3520,0,0,93736,42997,0,0,0),
(2530527,16448,533,0,0,3328.66,-3853.69,294.661,0.870387,3520,0,0,93736,46368,0,0,0),
(2530526,16447,533,0,0,3455.88,-3713.7,294.661,1.55525,3520,0,0,93736,0,0,0,0),
(2530525,16447,533,0,0,3445.83,-3713.54,294.661,1.55525,3520,0,0,93736,0,0,0,0),
(2530524,16448,533,0,0,3451.44,-3719.32,294.661,1.59059,3520,0,0,93736,90850,0,0,0),
(2530523,16448,533,0,0,3458.9,-3705.39,294.661,1.46885,3520,0,0,93736,57941,0,0,0),
(2530522,16448,533,0,0,3443.28,-3706.91,294.661,1.66128,3520,0,0,93736,86888,0,0,0),
(2530521,16447,533,0,0,3451.77,-3154.82,294.661,4.80836,3520,0,0,93736,0,0,0,0),
(2530520,16447,533,0,0,3460.57,-3153.97,294.661,4.80836,3520,0,0,93736,0,0,0,0),
(2530519,16448,533,0,0,3454.29,-3149.87,294.661,4.80836,3520,0,0,93736,85149,0,0,0),
(2530518,16448,533,0,0,3446.97,-3160.7,294.661,4.68348,3520,0,0,93736,71342,0,0,0),
(2530517,16448,533,0,0,3463.12,-3160.74,294.661,4.83114,3520,0,0,93736,89265,0,0,0),
(2530516,16447,533,0,0,3435.75,-3108.47,294.661,2.34535,3520,0,0,93736,0,0,0,0),
(2530515,16447,533,0,0,3431.51,-3112.62,294.661,2.34535,3520,0,0,93736,0,0,0,0),
(2530514,16448,533,0,0,3438.54,-3114.46,294.661,2.34535,3520,0,0,93736,56828,0,0,0),
(2530513,16448,533,0,0,3435.72,-3099.82,294.661,2.31,3520,0,0,93736,86079,0,0,0),
(2530512,16448,533,0,0,3422.65,-3112.46,294.661,2.43174,3520,0,0,93736,84442,0,0,0),
(2530511,16447,533,0,0,3326.62,-3010.81,294.661,5.64952,3520,0,0,93736,0,0,0,0),
(2530510,16447,533,0,0,3331.19,-3004.59,294.661,5.64952,3520,0,0,93736,0,0,0,0),
(2530509,16447,533,0,0,3283.97,-2993.19,294.661,3.2737,3520,0,0,93736,0,0,0,0),
(2530508,16447,533,0,0,3283.04,-2986.18,294.661,2.97839,3520,0,0,93736,0,0,0,0),
(2530507,16448,533,0,0,3277.43,-2981.57,294.661,2.96661,3520,0,0,93736,70236,0,0,0),
(2530506,16448,533,0,0,3276.54,-2996.63,294.661,3.17866,3520,0,0,93736,85855,0,0,0),
(2530505,16448,533,0,0,3291.35,-2989.68,294.661,3.08599,3520,0,0,93736,43094,0,0,0),
(2530504,16448,533,0,0,3325.34,-3004.1,294.661,5.53643,3520,0,0,93736,27644,0,0,0),
(2530503,16448,533,0,0,3329.98,-3016.61,294.661,5.28117,3520,0,0,93736,78675,0,0,0),
(2530502,16448,533,0,0,3339.16,-3006.27,294.661,5.7524,3520,0,0,93736,53235,0,0,0),
(2530486,16037,533,0,0,2891.05,-3679.87,281.648,5.46728,30,7,0,10283,12000,0,1,0),
(2530485,16036,533,0,0,2847.24,-3678.86,276.791,2.92652,30,7,0,10283,12000,0,1,0),
(2530483,16036,533,0,0,2866.7,-3612.02,266.021,1.42484,30,7,0,10283,12000,0,1,0),
(2530482,16036,533,0,0,2743.55,-3607.47,257.918,5.39424,30,7,0,10283,12000,0,1,0),
(2530481,16037,533,0,0,2745.93,-3596.44,257.483,0.3512,30,7,0,10283,12000,0,1,0),
(2530480,16036,533,0,0,2739,-3587.62,257.499,0.3512,30,7,0,10283,12000,0,1,0),
(2530477,16037,533,0,0,2907.51,-3615.78,277.038,6.08775,30,7,0,10283,12000,0,1,0),
(2530479,16036,533,0,0,2895.42,-3626.08,274.618,4.95914,30,7,0,10283,12000,0,1,0),
(2530478,16036,533,0,0,2913.7,-3622.04,277.826,6.08775,30,7,0,10283,12000,0,1,0),
(2530476,16036,533,0,0,2892.64,-3588.06,271.868,0.896274,30,7,0,10283,12000,0,1,0),
(2530475,16036,533,0,0,2860.86,-3591.32,263.68,1.55994,30,7,0,10283,12000,0,1,0),
(2530474,16037,533,0,0,2859.85,-3579.11,260.776,1.81676,30,7,0,10283,12000,0,1,0),
(2530484,16036,533,0,0,2759.19,-3623.76,254.49,3.01448,30,7,0,10283,12000,0,1,0),
(2530472,16036,533,0,0,2872.4,-3598.85,266.971,1.81676,30,7,0,10283,12000,0,1,0),
(2530470,16036,533,0,0,2878.3,-3683.07,281.421,4.32061,30,7,0,10283,12000,0,1,0),
(2530471,16037,533,0,0,2880.11,-3693.97,283.072,4.32061,30,7,0,10283,12000,0,1,0),
(2530467,16036,533,0,0,2847.86,-3644.1,268.416,1.59214,30,7,0,10283,12000,0,1,0),
(2530466,16036,533,0,0,2854.88,-3660.08,273.635,1.59214,30,7,0,10283,12000,0,1,0),
(2530314,16453,533,0,0,3219.65,-3887.2,282.044,0.0127262,3600,0,0,138165,0,0,2,1),
(2530310,16447,533,0,0,3098.96,-3851.26,267.594,3.16137,3600,0,0,93736,0,0,2,1),
(2530308,16447,533,0,0,3104.52,-3856.19,267.594,3.16137,3600,0,0,93736,0,0,0,0),
(2530307,16447,533,0,0,3104.42,-3851.16,267.595,3.16137,3600,0,0,93736,0,0,0,0),
(2530306,15980,533,0,0,3326.31,-3664.21,259.083,1.26072,3600,0,0,25824,58750,0,0,0),
(2530305,15981,533,0,0,3331.2,-3665.78,259.083,1.26072,3600,0,0,26274,58750,0,0,0),
(2530304,15980,533,0,0,3335.37,-3667.11,259.083,1.26072,3600,0,0,25824,58750,0,0,0),
(2530303,15981,533,0,0,3335.78,-3673.5,259.083,1.26072,3600,0,0,26274,58750,0,0,0),
(2530302,15980,533,0,0,3330.47,-3671.79,259.083,1.26072,3600,0,0,25824,58750,0,0,0),
(2530301,15981,533,0,0,3325.78,-3670.29,259.083,1.26072,3600,0,0,26274,58750,0,0,0),
(2530300,15980,533,0,0,3321.64,-3668.52,259.083,1.26072,3600,0,0,25824,58750,0,0,0),
(2530299,15981,533,0,0,3322.35,-3663.43,259.083,1.26072,3600,0,0,26274,58750,0,0,0),
(2530298,15981,533,0,0,3328.13,-3643.35,259.083,1.16646,3600,0,0,26274,58750,0,0,0),
(2530297,15980,533,0,0,3331.81,-3645.26,259.083,1.16646,3600,0,0,25824,58750,0,0,0),
(2530296,15981,533,0,0,3335.89,-3646.55,259.083,1.16646,3600,0,0,26274,58750,0,0,0),
(2530295,15980,533,0,0,3340.39,-3648.57,259.083,1.16646,3600,0,0,25824,58750,0,0,0),
(2530294,15981,533,0,0,3327.18,-3648.53,259.083,1.16646,3600,0,0,26274,58750,0,0,0),
(2530293,15980,533,0,0,3331.37,-3650.17,259.083,1.16646,3600,0,0,25824,58750,0,0,0),
(2530292,15981,533,0,0,3335.29,-3651.85,259.083,1.16646,3600,0,0,26274,58750,0,0,0),
(2530291,15980,533,0,0,3339.42,-3653.31,259.083,1.12719,3600,0,0,25824,58750,0,0,0),
(2530290,15980,533,0,0,3378.6,-3641.08,259.083,2.1168,3600,0,0,25824,58750,0,0,0),
(2530289,15981,533,0,0,3374.96,-3643.29,259.083,2.1168,3600,0,0,26274,58750,0,0,0),
(2530288,15980,533,0,0,3370.78,-3645.64,259.083,2.1168,3600,0,0,25824,58750,0,0,0),
(2530287,15981,533,0,0,3367.51,-3647.63,259.083,2.1168,3600,0,0,26274,58750,0,0,0),
(2530286,15980,533,0,0,3379.11,-3646.11,259.083,2.1168,3600,0,0,25824,58750,0,0,0),
(2530258,15977,533,0,0,3342.29,-3603.57,260.997,0.207331,3600,0,0,15415,50000,0,0,0),
(2530377,16022,533,0,0,3003.98,-3241.69,294.063,3.60046,3000,0,0,42290,0,0,0,0),
(2530378,16022,533,0,0,3004.4,-3245.77,294.063,2.70118,3000,0,0,42290,0,0,0,0),
(2530255,15977,533,0,0,3345.38,-3603.7,260.997,0.207331,3600,0,0,15415,50000,0,0,0),
(2530254,15977,533,0,0,3343.95,-3600.64,260.997,0.207331,3600,0,0,15415,50000,0,2,1),
(2530253,15977,533,0,0,3347.91,-3599.76,260.997,0.207331,3600,0,0,15415,50000,0,0,0),
(2530252,15977,533,0,0,3350.01,-3603.42,260.997,6.21484,3600,0,0,15415,50000,0,0,0),
(2530251,15977,533,0,0,3354.06,-3605.28,260.997,6.21484,3600,0,0,15415,50000,0,0,0),
(2530376,16022,533,0,0,3001.05,-3237.97,294.063,4.4644,3000,0,0,42290,0,0,0,0),
(2530239,15977,533,0,0,3109.98,-3585.57,287.079,4.83743,3600,0,0,15415,50000,0,0,0),
(2530238,15977,533,0,0,3118.49,-3582.32,287.08,1.23953,3600,0,0,15415,50000,0,0,0),
(2530242,15977,533,0,0,3104.77,-3568.63,287.078,3.08208,3600,0,0,15415,50000,0,0,0),
(2530243,15977,533,0,0,3115.26,-3590.39,287.081,1.71283,3600,0,0,15415,50000,0,0,0),
(2530248,15977,533,0,0,3349.74,-3595.89,260.997,6.21484,3600,0,0,15415,50000,0,0,0),
(2530247,15977,533,0,0,3344.81,-3597.41,260.997,6.21484,3600,0,0,15415,50000,0,0,0),
(2530246,15977,533,0,0,3109.41,-3577.96,287.08,2.45503,3600,0,0,15415,50000,0,0,0),
(2530245,15977,533,0,0,3116.56,-3576.39,287.08,2.53236,3600,0,0,15415,50000,0,0,0),
(2530241,15977,533,0,0,3102.9,-3575.09,287.078,6.21974,3600,0,0,15415,50000,0,0,0),
(2530240,15977,533,0,0,3099.58,-3580.98,287.079,1.00862,3600,0,0,15415,50000,0,0,0),
(2530222,16447,533,0,0,3319.86,-3863.95,294.659,2.84566,3600,0,0,93736,0,0,0,0),
(2530221,16447,533,0,0,3321.26,-3859.35,294.659,2.84566,3600,0,0,93736,0,0,0,0),
(2530220,16447,533,0,0,3315.78,-3857.88,294.659,3.11269,3600,0,0,93736,0,0,2,1),
(88859,16447,533,0,0,3327.84,-3905.96,294.66,3.57809,3520,0,0,93736,0,0,2,1),
(2530374,16021,533,0,0,2999.53,-3244.09,294.063,0.912029,3000,0,0,45467,0,0,0,0),
(128453,4075,533,0,0,2777.25,-3222.09,285.551,0.214748,3600,5,0,120,0,0,1,0),
(128452,4075,533,0,0,2860.95,-3077.39,273.736,4.0009,3600,5,0,120,0,0,1,0),
(128451,4075,533,0,0,2891.58,-3558.73,297.862,2.78446,3600,5,0,120,0,0,1,0),
(128450,4075,533,0,0,2952.48,-3505.97,298.279,3.96102,3600,5,0,120,0,0,1,0),
(128449,4075,533,0,0,2750.52,-3160.27,267.724,2.62969,3600,5,0,120,0,0,1,0),
(128448,4075,533,0,0,2943.52,-3160.81,273.787,3.86506,3600,5,0,120,0,0,1,0),
(128447,4075,533,0,0,2776.98,-3334.2,267.684,1.46036,3600,5,0,120,0,0,1,0),
(128446,4075,533,0,0,2872.69,-3151.1,273.787,2.90263,3600,5,0,120,0,0,1,0),
(128445,4075,533,0,0,2838.21,-3066.32,273.798,3.34716,3600,5,0,120,0,0,1,0),
(128442,4075,533,0,0,2699.33,-3085.07,267.685,0.023725,3600,5,0,120,0,0,1,0),
(128443,4075,533,0,0,2794.68,-3403.76,267.686,2.68793,3600,5,0,120,0,0,1,0),
(128444,4075,533,0,0,2752.63,-3207.8,267.566,2.53656,3600,5,0,120,0,0,1,0),
(128441,4075,533,0,0,2659.73,-3212.53,267.664,5.31375,3600,5,0,120,0,0,1,0),
(128440,4075,533,0,0,2852.78,-3219.24,273.787,5.08628,3600,5,0,120,0,0,1,0),
(128439,4075,533,0,0,2821.79,-3223.4,298.32,3.69071,3600,5,0,120,0,0,1,0),
(128438,4075,533,0,0,2903.89,-3218.66,273.787,2.37032,3600,5,0,120,0,0,1,0),
(128437,4075,533,0,0,2892.94,-3158.46,273.787,4.79605,3600,5,0,120,0,0,1,0),
(128436,4075,533,0,0,3009.89,-3255.94,294.146,4.11898,3600,0,0,120,0,0,0,0),
(128435,4075,533,0,0,3021.4,-3102.96,294.146,3.85718,3600,0,0,120,0,0,0,0),
(128434,4075,533,0,0,3020.6,-3108.74,294.151,4.74729,3600,0,0,120,0,0,0,0),
(128433,4075,533,0,0,3028.62,-3097.12,294.154,4.66003,3600,0,0,120,0,0,0,0),
(128432,4075,533,0,0,3027.04,-3098.89,294.153,3.31613,3600,0,0,120,0,0,0,0),
(128431,4075,533,0,0,3019.95,-3102.67,294.147,0.20944,3600,0,0,120,0,0,0,0),
(128430,4075,533,0,0,3026.8,-3095.25,294.152,0.610865,3600,0,0,120,0,0,0,0),
(128425,4075,533,0,0,2940.28,-3297.49,298.229,5.60251,3600,0,0,120,0,0,0,0),
(128426,4075,533,0,0,3023.22,-3105,294.147,2.80998,3600,0,0,120,0,0,0,0),
(128427,4075,533,0,0,3027.07,-3101.84,294.151,4.85202,3600,0,0,120,0,0,0,0),
(128428,4075,533,0,0,3024.52,-3102.71,294.148,5.46288,3600,0,0,120,0,0,0,0),
(128429,4075,533,0,0,3015.25,-3110.68,294.155,3.71755,3600,0,0,120,0,0,0,0),
(128424,4075,533,0,0,3088.22,-3065.31,294.157,2.30383,3600,0,0,120,0,0,0,0),
(128423,4075,533,0,0,3095.58,-3059.41,294.152,1.44862,3600,0,0,120,0,0,0,0),
(128422,4075,533,0,0,3085.19,-3058.58,294.148,0.20944,3600,0,0,120,0,0,0,0),
(128421,4075,533,0,0,3089.47,-3062.15,294.153,6.0912,3600,0,0,120,0,0,0,0),
(128420,4075,533,0,0,3097.6,-3063.46,294.158,3.83972,3600,0,0,120,0,0,0,0),
(128419,4075,533,0,0,3096.33,-3067.03,294.161,3.78736,3600,0,0,120,0,0,0,0),
(128418,4075,533,0,0,3091.66,-3065.17,294.158,3.78736,3600,0,0,120,0,0,0,0),
(128417,4075,533,0,0,3087.03,-3062.32,294.153,2.37365,3600,0,0,120,0,0,0,0),
(128416,4075,533,0,0,3084.76,-3063.93,294.154,3.59538,3600,0,0,120,0,0,0,0),
(128415,4075,533,0,0,3081.84,-3062.09,294.151,5.044,3600,0,0,120,0,0,0,0),
(128414,4075,533,0,0,2939.99,-3209.17,273.787,2.50452,3600,5,0,120,0,0,1,0),
(128413,4075,533,0,0,2752.13,-3228.54,267.567,1.37531,3600,5,0,120,0,0,1,0),
(128412,4075,533,0,0,2797.56,-3658.15,285.262,2.32129,3600,5,0,120,0,0,1,0),
(128411,4075,533,0,0,2933.28,-3531.7,298.418,4.11675,3600,5,0,120,0,0,1,0),
(128410,4075,533,0,0,2797.65,-3307.94,267.685,3.05083,3600,5,0,120,0,0,1,0),
(128409,4075,533,0,0,3347.26,-3319.77,292.678,3.15905,3600,0,0,120,0,0,0,0),
(128408,4075,533,0,0,2916.49,-3150.86,274.268,3.08401,3600,5,0,120,0,0,1,0),
(128407,4075,533,0,0,2635.35,-3522.12,261.93,3.63578,3600,5,0,120,0,0,1,0),
(128406,4075,533,0,0,2745.8,-3712.84,285.262,5.70723,3600,5,0,120,0,0,1,0),
(128405,4075,533,0,0,3190.75,-3375.17,292.678,2.44346,3600,0,0,120,0,0,0,0),
(128404,4075,533,0,0,3201.96,-3374.83,292.595,4.78349,3600,5,0,120,0,0,1,0),
(128403,4075,533,0,0,3192.33,-3357.58,292.678,2.63545,3600,0,0,120,0,0,0,0),
(128402,4075,533,0,0,3204.66,-3360.4,292.678,6.0912,3600,0,0,120,0,0,0,0),
(128401,4075,533,0,0,3194.27,-3351.64,292.678,0.488692,3600,0,0,120,0,0,0,0),
(128400,4075,533,0,0,3190.56,-3348.45,292.678,5.41052,3600,0,0,120,0,0,0,0),
(128399,4075,533,0,0,3196.74,-3356.55,292.678,0.244346,3600,0,0,120,0,0,0,0),
(128398,4075,533,0,0,3201.36,-3364.57,292.678,6.21337,3600,0,0,120,0,0,0,0),
(128397,4075,533,0,0,3201.14,-3368.57,292.678,1.18682,3600,0,0,120,0,0,0,0),
(128396,4075,533,0,0,3201.55,-3356.08,292.678,5.42797,3600,0,0,120,0,0,0,0),
(128395,4075,533,0,0,2773.42,-3160.4,298.147,4.59206,3600,5,0,120,0,0,1,0),
(128394,4075,533,0,0,3197.27,-3270.23,292.678,4.2237,3600,0,0,120,0,0,0,0),
(128393,4075,533,0,0,2939.08,-3489.07,297.823,2.24602,3600,5,0,120,0,0,1,0),
(128392,4075,533,0,0,2776.23,-3326.02,267.684,0.794321,3600,5,0,120,0,0,1,0),
(128391,4075,533,0,0,2798.77,-3391.96,267.685,2.36412,3600,5,0,120,0,0,1,0),
(128390,4075,533,0,0,2858.15,-3534.33,297.885,1.77236,3600,5,0,120,0,0,1,0),
(128389,4075,533,0,0,2948.95,-3163.86,274.504,0.000783,3600,5,0,120,0,0,1,0),
(128388,4075,533,0,0,2726.03,-3545.26,261.911,1.31996,3600,5,0,120,0,0,1,0),
(128387,4075,533,0,0,2828.36,-3279.32,298.099,0.719604,3600,5,0,120,0,0,1,0),
(128386,4075,533,0,0,2747.18,-3153.39,267.717,2.46168,3600,5,0,120,0,0,1,0),
(128385,4075,533,0,0,2659.89,-3220.11,267.679,5.28339,3600,5,0,120,0,0,1,0),
(128384,4075,533,0,0,2705.53,-3077.45,267.685,6.06152,3600,5,0,120,0,0,1,0),
(128383,4075,533,0,0,2865.47,-3217.4,274.658,0.301265,3600,5,0,120,0,0,1,0),
(128382,4075,533,0,0,3279.03,-3262.9,292.678,3.57792,3600,0,0,120,0,0,0,0),
(128381,4075,533,0,0,3343.55,-3292.74,292.678,3.71755,3600,0,0,120,0,0,0,0),
(128380,4075,533,0,0,2774.83,-3180.47,273.782,1.09138,3600,5,0,120,0,0,1,0),
(128379,4075,533,0,0,2753.39,-3217.74,267.569,2.01382,3600,5,0,120,0,0,1,0),
(128377,4075,533,0,0,3195.98,-3308.35,292.678,6.23082,3600,0,0,120,0,0,0,0),
(128378,4075,533,0,0,2690.28,-3260.72,267.738,0.596745,3600,5,0,120,0,0,1,0),
(128376,4075,533,0,0,2985.75,-3243.94,294.146,3.56047,3600,0,0,120,0,0,0,0),
(128375,4075,533,0,0,2892.38,-3469.16,297.863,3.14837,3600,5,0,120,0,0,1,0),
(128374,4075,533,0,0,2799.5,-3301.39,267.685,2.71451,3600,5,0,120,0,0,1,0),
(128373,4075,533,0,0,2871.23,-3364.54,298.146,1.52012,3600,5,0,120,0,0,1,0),
(128372,4075,533,0,0,2745.92,-3658.74,285.253,5.25344,3600,5,0,120,0,0,1,0),
(128371,4075,533,0,0,2931.33,-3221.42,273.787,4.48913,3600,5,0,120,0,0,1,0),
(128370,4075,533,0,0,2913.79,-3370.73,298.139,2.61752,3600,5,0,120,0,0,1,0),
(128369,4075,533,0,0,2791.8,-3207.55,273.819,0.161498,3600,5,0,120,0,0,1,0),
(128368,4075,533,0,0,2962.72,-3356.16,298.127,2.36018,3600,5,0,120,0,0,1,0),
(128367,4075,533,0,0,2790.74,-3154.29,298.148,6.07273,3600,5,0,120,0,0,1,0),
(128366,4075,533,0,0,2628.21,-3538.8,261.853,2.68703,3600,5,0,120,0,0,1,0),
(128365,4075,533,0,0,3254.77,-3263.22,292.678,2.87979,3600,0,0,120,0,0,0,0),
(128364,4075,533,0,0,2683.21,-3254.64,267.723,1.51289,3600,5,0,120,0,0,1,0),
(128363,4075,533,0,0,2861.21,-3468.68,297.871,4.17484,3600,5,0,120,0,0,1,0),
(128362,4075,533,0,0,2980.29,-3198.71,294.146,3.56047,3600,0,0,120,0,0,0,0),
(128361,4075,533,0,0,2821.19,-3210.31,298.291,0.612072,3600,5,0,120,0,0,1,0),
(128360,4075,533,0,0,2854.37,-3252.37,298.109,3.09705,3600,5,0,120,0,0,1,0),
(128359,4075,533,0,0,2779.72,-3402.66,267.686,0.077889,3600,5,0,120,0,0,1,0),
(128358,4075,533,0,0,2757.92,-3245.05,267.717,4.34936,3600,5,0,120,0,0,1,0),
(128357,4075,533,0,0,2798.81,-3397.75,267.685,2.03858,3600,5,0,120,0,0,1,0),
(128356,4075,533,0,0,3343.67,-3329.04,292.678,1.22173,3600,0,0,120,0,0,0,0),
(128355,4075,533,0,0,2850.01,-3069.62,273.745,3.45795,3600,5,0,120,0,0,1,0),
(128354,4075,533,0,0,2862.24,-3221.67,274.281,6.15288,3600,5,0,120,0,0,1,0),
(128350,16068,533,0,0,2884.94,-3598.44,269.901,1.45662,3600,5,0,8,0,0,1,0),
(128349,16068,533,0,0,2869.41,-3589.09,266.096,1.27594,3600,5,0,8,0,0,1,0),
(128348,16068,533,0,0,2875.86,-3705.54,284.832,3.04009,3600,5,0,8,0,0,1,0),
(128347,16068,533,0,0,2689.36,-3594.03,261.013,5.88405,3600,5,0,8,0,0,1,0),
(128346,16068,533,0,0,2704,-3600.04,260.803,1.0333,3600,5,0,8,0,0,1,0),
(128345,16068,533,0,0,2897.74,-3646.21,276.007,1.83488,3600,5,0,8,0,0,1,0),
(128344,16068,533,0,0,2790.42,-3585.39,253.704,1.4536,3600,5,0,8,0,0,1,0),
(128343,16068,533,0,0,2855.79,-3618.3,263.904,0.579871,3600,5,0,8,0,0,1,0),
(128342,16068,533,0,0,2895.52,-3572.9,272.322,2.09725,3600,5,0,8,0,0,1,0),
(128341,16068,533,0,0,2905.33,-3682.31,283.876,0.59482,3600,5,0,8,0,0,1,0),
(128340,16068,533,0,0,2896.11,-3656.78,277.51,0.313374,3600,5,0,8,0,0,1,0),
(128339,16068,533,0,0,2865.75,-3658.31,274.641,0.458959,3600,5,0,8,0,0,1,0),
(128338,16068,533,0,0,2811.54,-3576.31,253.609,4.81057,3600,5,0,8,0,0,1,0),
(128337,16068,533,0,0,2860.04,-3706.87,284.113,4.24212,3600,5,0,8,0,0,1,0),
(128336,16068,533,0,0,2861.03,-3648.37,272.216,3.87341,3600,5,0,8,0,0,1,0),
(128335,16068,533,0,0,2673.3,-3624.03,265.549,2.16559,3600,5,0,8,0,0,1,0),
(128334,16068,533,0,0,2877.12,-3691.8,282.437,4.89036,3600,5,0,8,0,0,1,0),
(128333,16068,533,0,0,2899.39,-3700.27,285.613,0.090022,3600,5,0,8,0,0,1,0),
(128332,16068,533,0,0,2912.48,-3586.57,274.36,1.10071,3600,5,0,8,0,0,1,0),
(128331,16068,533,0,0,2881.9,-3620.86,270.75,0.244238,3600,5,0,8,0,0,1,0),
(128330,16068,533,0,0,2879.9,-3650.04,274.982,0.10067,3600,5,0,8,0,0,1,0),
(128329,16068,533,0,0,2801.9,-3589.27,254.856,2.63119,3600,5,0,8,0,0,1,0),
(128328,16068,533,0,0,2734.93,-3597.33,258.319,0.807797,3600,5,0,8,0,0,1,0),
(128327,16068,533,0,0,2889.84,-3678.42,281.347,4.25105,3600,5,0,8,0,0,1,0),
(128326,16068,533,0,0,2773.29,-3616.7,254.731,2.82547,3600,5,0,8,0,0,1,0),
(128325,16068,533,0,0,2775.15,-3559.07,250.923,5.44874,3600,5,0,8,0,0,1,0),
(128324,16068,533,0,0,2894.29,-3618.93,273.603,2.11469,3600,5,0,8,0,0,1,0),
(128322,16068,533,0,0,2833.08,-3548.21,254.238,1.05746,3600,5,0,8,0,0,1,0),
(128323,16068,533,0,0,2765.66,-3581.11,255.935,3.78032,3600,5,0,8,0,0,1,0),
(128321,16068,533,0,0,2755.28,-3590.7,256.861,6.0064,3600,5,0,8,0,0,1,0),
(128320,16068,533,0,0,2862.42,-3671.69,276.904,1.73453,3600,5,0,8,0,0,1,0),
(128319,16068,533,0,0,2847.36,-3688.1,279.027,4.76567,3600,5,0,8,0,0,1,0),
(128170,16030,533,0,0,3301.85,-3270.85,292.678,0.10472,3600,0,0,8,0,0,0,0),
(128169,16030,533,0,0,3175.82,-3326.75,294.611,3.54302,3600,0,0,8,0,0,0,0),
(128168,16030,533,0,0,3322.63,-3226.65,294.146,3.50811,3600,0,0,8,0,0,0,0),
(128167,16030,533,0,0,3125.16,-3066.66,294.156,1.20428,3600,0,0,8,0,0,0,0),
(128166,16030,533,0,0,3179.1,-3313.12,294.618,3.12414,3600,0,0,8,0,0,0,0),
(128165,16030,533,0,0,3269.68,-3270.23,292.678,0.383972,3600,0,0,8,0,0,0,0),
(128164,16030,533,0,0,3012.85,-3148.56,294.159,5.37561,3600,0,0,8,0,0,0,0),
(128163,16030,533,0,0,3060.06,-3239.59,294.146,5.84685,3600,0,0,8,0,0,0,0),
(128162,16030,533,0,0,3115.43,-3264.77,294.531,3.57792,3600,0,0,8,0,0,0,0),
(128161,16030,533,0,0,3080.41,-3315.86,294.575,0.174533,3600,0,0,8,0,0,0,0),
(128160,16030,533,0,0,3075.48,-3318.7,294.58,0.942478,3600,0,0,8,0,0,0,0),
(128159,16030,533,0,0,3078.04,-3310.57,294.573,4.20624,3600,0,0,8,0,0,0,0),
(128158,16030,533,0,0,3071.26,-3314,294.571,2.93215,3600,0,0,8,0,0,0,0),
(128157,16030,533,0,0,3076.54,-3314.61,294.572,2.44346,3600,0,0,8,0,0,0,0),
(128156,16030,533,0,0,3248.11,-3348.84,292.678,4.27606,3600,0,0,8,0,0,0,0),
(128155,16030,533,0,0,3254.41,-3356.07,292.678,0.994838,3600,0,0,8,0,0,0,0),
(128154,16030,533,0,0,3254.5,-3347.45,292.678,0.610865,3600,0,0,8,0,0,0,0),
(128153,16030,533,0,0,3246.14,-3356.44,292.595,3.5914,3600,5,0,8,0,0,1,0),
(128152,16030,533,0,0,3251.99,-3351.52,292.678,2.75762,3600,0,0,8,0,0,0,0),
(128151,16030,533,0,0,3124.71,-3362.47,294.575,0.820305,3600,0,0,8,0,0,0,0),
(128150,16030,533,0,0,3122.03,-3366.45,294.581,3.14159,3600,0,0,8,0,0,0,0),
(128149,16030,533,0,0,3129.73,-3364.55,294.572,5.65487,3600,0,0,8,0,0,0,0),
(128148,16030,533,0,0,3128.58,-3369.78,294.568,1.91986,3600,0,0,8,0,0,0,0),
(128147,16030,533,0,0,3126.26,-3365.8,294.572,0.191986,3600,0,0,8,0,0,0,0),
(128146,16030,533,0,0,3103.34,-3292.8,294.599,2.9147,3600,0,0,8,0,0,0,0),
(128145,16030,533,0,0,3046.72,-3429.97,298.222,4.51829,3600,5,0,8,0,0,1,0),
(128144,16030,533,0,0,3008.69,-3402.87,298.218,3.6405,3600,5,0,8,0,0,1,0),
(128143,16030,533,0,0,2991.84,-3463.04,298.219,2.34906,3600,5,0,8,0,0,1,0),
(128142,16030,533,0,0,3038.89,-3474.74,298.216,4.69145,3600,5,0,8,0,0,1,0),
(128141,16030,533,0,0,3313.49,-3340.97,292.678,0.401426,3600,0,0,8,0,0,0,0),
(128139,16030,533,0,0,3315.06,-3348.81,292.678,3.05433,3600,0,0,8,0,0,0,0),
(128140,16030,533,0,0,3306.47,-3347.18,292.678,0.698132,3600,0,0,8,0,0,0,0),
(128138,16030,533,0,0,3320.82,-3342.62,292.678,1.0472,3600,0,0,8,0,0,0,0),
(128137,16030,533,0,0,3318,-3335.55,292.678,1.18682,3600,0,0,8,0,0,0,0),
(127981,15979,533,0,0,3224.83,-3802.96,274.032,2.30383,3600,0,0,97528,0,0,0,0),
(127982,15979,533,0,0,3138.52,-3778.58,274.032,5.18363,3600,0,0,96405,0,0,0,0),
(127741,14881,533,0,0,3172.87,-3593.79,280.306,4.62716,3600,5,0,64,0,0,1,0),
(127740,14881,533,0,0,2841.98,-3346.14,310.709,5.51024,3600,5,0,64,0,0,1,0),
(127739,14881,533,0,0,3222.88,-3455.11,287.077,2.76664,3600,0,0,64,0,0,0,0),
(127738,14881,533,0,0,3137.56,-3795.61,273.952,4.24697,3600,5,0,64,0,0,1,0),
(127737,14881,533,0,0,3229.92,-3468.46,287.076,1.09541,3600,5,0,64,0,0,1,0),
(127736,14881,533,0,0,3254.85,-3502.14,287.076,4.78578,3600,5,0,64,0,0,1,0),
(127735,14881,533,0,0,3342.3,-3644.27,259.085,6.22306,3600,5,0,64,0,0,1,0),
(127734,14881,533,0,0,3091.63,-3537.93,310.113,3.92356,3600,5,0,64,0,0,1,0),
(127733,14881,533,0,0,3230.74,-3666.8,287.057,3.64395,3600,5,0,64,0,0,1,0),
(127732,14881,533,0,0,3255.24,-3452.69,287.076,0.363795,3600,5,0,64,0,0,1,0),
(127731,14881,533,0,0,3123.39,-3511.76,287.312,4.39118,3600,5,0,64,0,0,1,0),
(127730,14881,533,0,0,3158.45,-3607.72,280.305,5.48026,3600,5,0,64,0,0,1,0),
(127729,14881,533,0,0,3226.91,-3686.06,300.899,1.59974,3600,5,0,64,0,0,1,0),
(127728,14881,533,0,0,3034.9,-3470.6,298.22,5.62082,3600,5,0,64,0,0,1,0),
(127727,14881,533,0,0,3384.41,-3651.55,282.512,1.75656,3600,5,0,64,0,0,1,0),
(127726,14881,533,0,0,2911.67,-3570.2,304.348,1.57032,3600,5,0,64,0,0,1,0),
(127725,14881,533,0,0,3185.17,-3792.45,273.951,4.2457,3600,5,0,64,0,0,1,0),
(127724,14881,533,0,0,2941.87,-3346.26,318.111,4.76577,3600,5,0,64,0,0,1,0),
(127723,14881,533,0,0,3162.43,-3789.12,273.95,6.02155,3600,5,0,64,0,0,1,0),
(127722,14881,533,0,0,3219.68,-3789.26,273.91,5.23516,3600,5,0,64,0,0,1,0),
(127721,14881,533,0,0,3313.28,-3671.11,281.972,3.86845,3600,5,0,64,0,0,1,0),
(127720,14881,533,0,0,3200.08,-3463.78,300.8,0.017622,3600,5,0,64,0,0,1,0),
(127719,14881,533,0,0,2769.76,-3180.84,300.031,1.56921,3600,5,0,64,0,0,1,0),
(127718,14881,533,0,0,3179.61,-3629.73,280.303,4.14412,3600,5,0,64,0,0,1,0),
(127717,14881,533,0,0,3198.91,-3614.88,280.305,3.95935,3600,5,0,64,0,0,1,0),
(127716,14881,533,0,0,3368.19,-3635.1,259.085,3.66266,3600,5,0,64,0,0,1,0),
(127715,14881,533,0,0,3294.54,-3489.41,287.077,0.288907,3600,5,0,64,0,0,1,0),
(127714,14881,533,0,0,2956.81,-3173.99,285.591,1.60566,3600,5,0,64,0,0,1,0),
(127713,14881,533,0,0,3087.85,-3521.07,287.079,5.39293,3600,5,0,64,0,0,1,0),
(127712,14881,533,0,0,3362.31,-3684.58,259.07,5.91014,3600,5,0,64,0,0,1,0),
(127711,14881,533,0,0,3164.67,-3498.03,300.916,3.90346,3600,5,0,64,0,0,1,0),
(127710,14881,533,0,0,3158.75,-3486.43,287.081,3.8418,3600,5,0,64,0,0,1,0),
(127709,14881,533,0,0,3074.22,-3555.82,287.076,2.91462,3600,5,0,64,0,0,1,0),
(127707,14881,533,0,0,3337.11,-3490.32,287.087,3.53,3600,0,0,64,0,0,0,0),
(127708,14881,533,0,0,3127.2,-3552.16,287.081,1.56623,3600,5,0,64,0,0,1,0),
(127706,14881,533,0,0,3287.81,-3450.87,287.077,3.4216,3600,5,0,64,0,0,1,0),
(89124,16449,533,0,0,2556.93,-3738.71,294.671,4.6661,3520,30,0,150000,0,0,1,0),
(89115,16449,533,0,0,2700.12,-3882.46,294.672,4.725,3520,30,0,150000,0,0,1,0),
(89106,16449,533,0,0,2556.38,-3528.95,267.604,4.64639,3520,30,0,150000,0,0,1,0),
(88968,16449,533,0,0,3102.75,-2985.11,267.603,4.7047,3520,30,0,150000,0,0,1,0),
(88959,16449,533,0,0,3310.4,-2989.6,294.672,4.6992,3520,30,0,150000,0,0,1,0),
(88950,16449,533,0,0,3453.59,-3128.38,294.671,4.74,3520,30,0,150000,0,0,1,0),
(88941,16449,533,0,0,3453.39,-3338.29,267.604,4.7137,3520,30,0,150000,0,0,1,0),
(88932,16449,533,0,0,2909.61,-2985.24,267.604,4.75792,3520,30,0,150000,0,0,1,0),
(88923,16448,533,0,0,2666.19,-3003.03,240.525,3.84295,3520,0,0,93736,18150,0,0,0),
(88922,16448,533,0,0,2682.5,-3003.54,240.525,3.91364,3520,0,0,93736,82516,0,0,0),
(88921,16448,533,0,0,2679.95,-3019.32,240.525,4.04087,3520,0,0,93736,19189,0,0,0),
(88920,16449,533,0,0,2699.83,-2984.99,240.536,4.7438,3520,30,0,150000,0,0,1,0),
(88898,16446,533,0,0,2532.05,-3256.1,259.026,1.48364,3520,0,0,252533,12000,0,2,0),
(88897,16449,533,0,0,2556.3,-3128.22,240.536,4.637,3520,30,0,150000,0,0,1,0),
(88888,16449,533,0,0,2556.06,-3338.6,267.604,4.70766,3520,30,0,150000,0,0,1,0),
(88875,16449,533,0,0,3453.54,-3530.66,267.594,1.9985,3520,30,0,150000,0,0,1,0),
(88870,16448,533,0,0,3434.28,-3770.84,294.661,3.83442,3520,0,0,93736,81606,0,0,0),
(88869,16448,533,0,0,3438.03,-3754.63,294.661,0.77765,3520,0,0,93736,93257,0,0,0),
(88868,16448,533,0,0,3421.77,-3755.75,294.661,3.83442,3520,0,0,93736,45992,0,0,0),
(88863,16449,533,0,0,3310,-3882.32,294.662,4.73124,3520,30,0,150000,0,0,1,0),
(2530372,16446,533,0,0,3274.58,-3884.12,294.662,3.12177,3000,0,0,252533,12000,0,2,0),
(88856,16446,533,0,0,3229.28,-3907.97,287.094,3.06744,3520,0,0,252533,12000,0,2,0),
(2530371,16446,533,0,0,3225.58,-3903.25,285.153,2.90185,3000,0,0,252533,12000,0,2,0),
(88854,16449,533,0,0,3453.53,-3739.18,294.662,1.97259,3520,30,0,150000,0,0,1,0),
(88853,16449,533,0,0,3101.95,-3883.86,267.594,3.08786,3520,30,0,150000,0,0,1,0),
(89137,16447,533,0,0,2883.05,-3878.94,268.142,4.63564,3520,0,0,93736,0,0,0,0),
(89136,16447,533,0,0,2880.14,-3877.78,268.142,4.63564,3520,0,0,93736,0,0,0,0),
(89135,16447,533,0,0,2879.15,-3882.11,268.142,4.63564,3520,0,0,93736,0,0,0,0),
(89134,16447,533,0,0,2882.27,-3882.45,268.142,4.61364,3520,0,0,93736,0,0,2,0),
(89133,16447,533,0,0,2932.53,-3878.58,268.142,4.87764,3520,0,0,93736,0,0,0,0),
(89132,16447,533,0,0,2930.19,-3878.49,268.142,4.96864,3520,0,0,93736,0,0,0,0),
(89131,16447,533,0,0,2936.49,-3883.08,268.142,4.74064,3520,0,0,93736,0,0,0,0),
(89130,16447,533,0,0,2933.09,-3883.06,268.132,4.74064,3520,0,0,93736,0,0,2,0),
(89123,16447,533,0,0,2532.42,-3735.18,294.671,4.5611,3520,0,0,93736,0,0,0,0),
(89122,16447,533,0,0,2529.5,-3734.01,294.671,4.5611,3520,0,0,93736,0,0,0,0),
(89121,16447,533,0,0,2528.51,-3738.34,294.671,4.5611,3520,0,0,93736,0,0,0,0),
(89120,16447,533,0,0,2531.64,-3738.69,294.671,4.5391,3520,0,0,93736,0,0,2,0),
(89119,16447,533,0,0,2581.9,-3734.81,294.671,4.8031,3520,0,0,93736,0,0,0,0),
(89118,16447,533,0,0,2579.55,-3734.73,294.671,4.8941,3520,0,0,93736,0,0,0,0),
(89117,16447,533,0,0,2585.85,-3739.31,294.671,4.6661,3520,0,0,93736,0,0,0,0),
(88850,16447,533,0,0,3106.67,-3910.21,267.594,3.53318,3520,0,0,93736,0,0,0,0),
(88849,16447,533,0,0,3106.93,-3914.09,267.594,3.20331,3520,0,0,93736,0,0,0,0),
(88851,16447,533,0,0,3100.49,-3911.09,267.594,3.08786,3520,0,0,93736,0,0,2,0),
(2530370,16447,533,0,0,3106.41,-3905.73,267.593,3.28064,3000,0,0,93736,0,0,0,0),
(2530373,16446,533,0,0,3278.43,-3879.55,294.662,3.19638,3000,0,0,252533,12000,0,0,0),
(88860,16447,533,0,0,3336.02,-3905.86,294.66,3.51526,3520,0,0,93736,0,0,0,0),
(88861,16447,533,0,0,3330.14,-3896.52,294.66,3.88832,3520,0,0,93736,0,0,0,0),
(88862,16447,533,0,0,3333.12,-3901.2,294.66,3.82156,3520,0,0,93736,0,0,2,0),
(88864,16447,533,0,0,3475.74,-3750.32,294.66,4.25686,3520,0,0,93736,0,0,0,0),
(88865,16447,533,0,0,3479.1,-3751.97,294.66,4.25686,3520,0,0,93736,0,0,0,0),
(88866,16447,533,0,0,3477,-3756.19,294.66,4.1689,3520,0,0,93736,0,0,0,0),
(88867,16447,533,0,0,3473.84,-3754.28,294.66,4.1689,3520,0,0,93736,0,0,2,0),
(88871,16447,533,0,0,3425.76,-3537.69,267.594,1.9773,3520,0,0,93736,0,0,0,0),
(88872,16447,533,0,0,3429.05,-3537.64,267.594,1.9553,3520,0,0,93736,0,0,0,0),
(88873,16447,533,0,0,3428.26,-3532.98,267.594,1.65685,3520,0,0,93736,0,0,2,0),
(88874,16447,533,0,0,3424.03,-3532.38,267.594,1.65685,3520,0,0,93736,0,0,0,0),
(88880,16447,533,0,0,2581.59,-3339.19,267.594,4.70766,3520,0,0,93736,0,0,2,0),
(88882,16447,533,0,0,2578.69,-3334.62,267.604,4.93566,3520,0,0,93736,0,0,0,0),
(88881,16447,533,0,0,2584.99,-3339.21,267.604,4.70766,3520,0,0,93736,0,0,0,0),
(88883,16447,533,0,0,2581.03,-3334.71,267.604,4.84466,3520,0,0,93736,0,0,0,0),
(88884,16447,533,0,0,2530.77,-3338.58,267.604,4.58066,3520,0,0,93736,0,0,2,0),
(88885,16447,533,0,0,2527.65,-3338.24,267.604,4.60266,3520,0,0,93736,0,0,2,0),
(88886,16447,533,0,0,2528.64,-3333.91,267.604,4.60266,3520,0,0,93736,0,0,0,0),
(88887,16447,533,0,0,2531.55,-3335.07,267.604,4.60266,3520,0,0,93736,0,0,0,0),
(88889,16447,533,0,0,2581.83,-3128.81,240.526,4.637,3520,0,0,93736,0,0,2,0),
(88890,16447,533,0,0,2585.23,-3128.83,240.536,4.637,3520,0,0,93736,0,0,0,0),
(88891,16447,533,0,0,2578.93,-3124.24,240.536,4.865,3520,0,0,93736,0,0,0,0),
(88892,16447,533,0,0,2581.27,-3124.33,240.536,4.774,3520,0,0,93736,0,0,0,0),
(88944,16447,533,0,0,3476.22,-3124.4,294.671,4.968,3520,0,0,93736,0,0,0,0),
(88943,16447,533,0,0,3482.52,-3128.99,294.671,4.74,3520,0,0,93736,0,0,0,0),
(88942,16447,533,0,0,3479.12,-3128.97,294.661,4.74,3520,0,0,93736,0,0,2,0),
(88940,16447,533,0,0,3428.88,-3334.76,267.604,4.6087,3520,0,0,93736,0,0,0,0),
(88939,16447,533,0,0,3425.97,-3333.6,267.604,4.6087,3520,0,0,93736,0,0,0,0),
(88938,16447,533,0,0,3424.98,-3337.93,267.604,4.6087,3520,0,0,93736,0,0,2,0),
(2530429,16447,533,0,0,2678.54,-3011.75,240.525,3.8406,3520,0,0,93736,0,0,0,0),
(88937,16447,533,0,0,3428.1,-3338.27,267.604,4.5867,3520,0,0,93736,0,0,2,0),
(88936,16447,533,0,0,3478.36,-3334.4,267.604,4.8507,3520,0,0,93736,0,0,0,0),
(88935,16447,533,0,0,3476.02,-3334.31,267.604,4.9417,3520,0,0,93736,0,0,0,0),
(88934,16447,533,0,0,3482.32,-3338.9,267.604,4.7137,3520,0,0,93736,0,0,0,0),
(88933,16447,533,0,0,3478.92,-3338.88,267.594,4.7137,3520,0,0,93736,0,0,2,0),
(88931,16447,533,0,0,2885.1,-2981.71,267.604,4.65292,3520,0,0,93736,0,0,0,0),
(88930,16447,533,0,0,2882.19,-2980.55,267.604,4.65292,3520,0,0,93736,0,0,0,0),
(88929,16447,533,0,0,2881.2,-2984.88,267.604,4.65292,3520,0,0,93736,0,0,2,0),
(88966,16447,533,0,0,3075.33,-2980.42,267.603,4.5997,3520,0,0,93736,0,0,0,0),
(88965,16447,533,0,0,3074.34,-2984.75,267.603,4.5997,3520,0,0,93736,0,0,2,0),
(88964,16447,533,0,0,3077.46,-2985.09,267.603,4.5777,3520,0,0,93736,0,0,2,0),
(88967,16447,533,0,0,3078.24,-2981.58,267.603,4.5997,3520,0,0,93736,0,0,0,0),
(88962,16447,533,0,0,3125.38,-2981.13,267.603,4.9327,3520,0,0,93736,0,0,0,0),
(88961,16447,533,0,0,3131.68,-2985.72,267.603,4.7047,3520,0,0,93736,0,0,0,0),
(88963,16447,533,0,0,3127.72,-2981.22,267.603,4.8417,3520,0,0,93736,0,0,0,0),
(88813,15990,533,0,0,3746.41,-5113.35,142.031,2.93162,604800,0,0,3198000,1572000,0,0,0),
(88811,16365,533,16129,0,2853.57,-3251.69,298.21,5.19,3520,0,0,19500,12000,0,0,0),
(88810,16452,533,2606,0,2852.16,-2982.05,267.68,3.09,3520,0,0,106651,108270,0,0,0),
(88809,16452,533,2606,0,2851.85,-2987.67,267.68,3.08,3520,0,0,105698,108270,0,0,0),
(88808,16451,533,10729,0,2849.82,-2984.93,267.68,3.18,3520,0,0,163859,25680,0,2,0),
(88807,16368,533,16160,0,2848.82,-2974.33,267.68,4.67,3520,0,0,110197,25680,0,0,0),
(88806,16368,533,0,0,2848.44,-2997.48,267.68,1.54,3520,0,0,110197,25680,0,0,1),
(88805,16368,533,16160,0,2760.94,-2974.27,240.62,4.66,3520,0,0,110197,25680,0,0,0),
(88804,16368,533,0,0,2760.22,-2997.4,240.62,1.52,3520,0,0,110197,25680,0,0,1),
(88803,16368,533,0,0,2667.75,-3039.93,240.62,2.36,3520,0,0,110197,25680,0,0,1),
(88802,16368,533,16160,0,2645.26,-3017.73,240.62,5.5,3520,0,0,110197,25680,0,0,0),
(88801,16368,533,16160,0,2588.19,-3074.64,240.62,5.5,3520,0,0,110197,25680,0,0,0),
(88800,16368,533,0,0,2610.66,-3097.48,240.62,2.32,3520,0,0,110197,25680,0,0,1),
(88799,16368,533,16160,0,2545.6,-3190.34,240.62,6.28,3520,0,0,110197,25680,0,0,0),
(88798,16368,533,0,0,2567.33,-3191.03,240.62,3.01,3520,0,0,110197,25680,0,0,1),
(88797,16452,533,2606,0,2554.02,-3280.62,267.68,1.6,3520,0,0,106818,108270,0,0,0),
(88796,16452,533,2606,0,2559.33,-3280.48,267.68,1.6,3520,0,0,108534,108270,0,0,0),
(88793,16368,533,0,0,2567.26,-3277.1,267.68,3.07,3520,0,0,110197,25680,0,0,1),
(88795,16451,533,10729,0,2556.46,-3279.11,267.68,1.6,3520,0,0,163859,25680,0,2,0),
(88794,16368,533,16160,0,2545.62,-3277.69,267.68,6.28,3520,0,0,110197,25680,0,0,0),
(88792,16368,533,0,0,3161.45,-3871.26,267.68,4.7,3520,0,0,110197,25680,0,0,1),
(88791,16368,533,16160,0,3161.44,-3894.13,267.68,1.57,3520,0,0,110197,25680,0,0,0),
(88790,16368,533,0,0,3249.18,-3871.99,294.75,4.7,3520,0,0,110197,25680,0,0,1),
(88789,16368,533,16160,0,3249.5,-3893.85,294.75,1.46,3520,0,0,110197,25680,0,0,0),
(88787,16368,533,16160,0,3361.64,-3847.58,294.75,2.39,3520,0,0,110197,25680,0,0,0),
(88788,16368,533,0,0,3345.1,-3831.41,294.75,5.57,3520,0,0,110197,25680,0,0,1),
(88786,16368,533,16160,0,3402,-3774.34,294.75,5.51,3520,0,0,110197,25680,0,0,0),
(88785,16368,533,16160,0,3417.87,-3790.86,294.75,2.31,3520,0,0,110197,25680,0,0,0),
(88784,16368,533,16160,0,3442.25,-3678.26,294.75,6.26,3520,0,0,110197,25680,0,0,0),
(88783,16368,533,16160,0,3464.63,-3678.14,294.75,3.13,3520,0,0,110197,25680,0,0,0),
(88782,16368,533,16160,0,3464.08,-3591.33,267.68,3.06,3520,0,0,110197,25680,0,0,0),
(88781,16368,533,16160,0,3442.34,-3591.87,267.68,6.28,3520,0,0,110197,25680,0,0,0),
(88780,16368,533,16160,0,3464.81,-3277.92,267.68,3.05,3520,0,0,110197,25680,0,0,0),
(88779,16368,533,16160,0,3442.96,-3277.98,267.68,6.28,3520,0,0,110197,25680,0,0,0),
(88778,16368,533,16160,0,3442.22,-3190.51,294.75,0,3520,0,0,110197,25680,0,0,0),
(88777,16368,533,16160,0,3464.44,-3189.61,294.75,3.2,3520,0,0,110197,25680,0,0,1),
(88776,16368,533,0,0,3418.62,-3077.67,294.75,3.87,3520,0,0,110197,25680,0,0,0),
(88775,16368,533,16160,0,3402.26,-3093.95,294.75,0.69,3520,0,0,110197,25680,0,0,0),
(88774,16368,533,16160,0,3345.57,-3036.7,294.75,0.74,3520,0,0,110197,25680,0,0,0),
(88773,16368,533,16160,0,3360.98,-3020.99,294.75,3.95,3520,0,0,110197,25680,0,0,0),
(88772,16368,533,16160,0,3249.15,-2974.47,294.75,4.63,3520,0,0,110197,25680,0,0,0),
(88771,16368,533,16160,0,3248.94,-2996.24,294.75,1.42,3520,0,0,110197,25680,0,0,0),
(88770,16368,533,16160,0,3161.57,-2996.53,267.68,1.54,3520,0,0,110197,25680,0,0,0),
(88769,16368,533,16160,0,3161.82,-2974.66,267.68,4.57,3520,0,0,110197,25680,0,0,0),
(88768,16452,533,2606,0,3251.4,-2988.49,294.75,3.17,3520,0,0,108584,108270,0,0,0),
(88767,16452,533,2606,0,3251.23,-2982.27,294.75,3.17,3520,0,0,108527,108270,0,0,0),
(88766,16451,533,0,0,3250.71,-2985.39,294.75,3.17,3520,0,0,163859,25680,0,2,0),
(88765,16452,533,2606,0,3455.85,-3187.64,294.75,4.68,3520,0,0,106882,108270,0,0,0),
(88764,16452,533,2606,0,3449.93,-3187.6,294.75,4.71,3520,0,0,107130,108270,0,0,0),
(88763,16451,533,0,0,3452.74,-3188.47,294.75,4.71,3520,0,0,163859,25680,0,2,0),
(88762,16452,533,2606,0,3456.05,-3680.37,294.75,1.58,3520,0,0,107750,108270,0,0,0),
(88760,16451,533,0,0,3453.17,-3679.64,294.75,1.55,3520,0,0,163859,25680,0,2,0),
(88761,16452,533,2606,0,3450.36,-3680.23,294.75,1.58,3520,0,0,108168,108270,0,0,0),
(2530375,16022,533,0,0,2995.88,-3239.01,294.063,5.4697,3000,0,0,42290,0,0,0,0),
(2530311,16453,533,0,0,3117.87,-3875,267.593,5.91656,3600,0,0,138165,0,0,0,0),
(2530312,16453,533,0,0,3115.11,-3882.19,267.593,5.91656,3600,0,0,138165,0,0,2,1),
(88756,15989,533,16033,0,3521.3,-5237.56,137.72,4.51,604800,0,0,3164450,0,0,0,0),
(88755,16062,533,16139,0,2519.95,-2947.47,245.64,5.43,604800,0,0,810000,0,0,0,0),
(88754,16063,533,16154,0,2524.45,-2944.71,245.64,5.46,604800,0,0,810000,0,0,0,0),
(88753,16065,533,16153,0,2516.24,-2951.57,245.64,5.53,604800,0,0,810000,60000,0,0,0),
(88752,16064,533,16155,0,2513.52,-2954.96,245.64,5.73,604800,0,0,810000,50000,0,0,0),
(2530395,16020,533,0,0,3028.73,-3149.77,294.075,1.8584,3000,0,0,49791,0,0,0,0),
(2530394,16020,533,0,0,3030.09,-3136.6,294.077,3.88237,3000,0,0,49791,0,0,0,0),
(2530393,16020,533,0,0,3033.33,-3144.36,294.076,2.96345,3000,0,0,49791,0,0,0,0),
(2530391,16022,533,0,0,3031.17,-3147.43,294.075,2.39954,3000,0,0,42290,0,0,0,0),
(2530392,16022,533,0,0,3032.44,-3140.35,294.076,3.35851,3000,0,0,42290,0,0,0,0),
(88736,16020,533,16063,0,2989.41,-3204.6,294.063,2.88648,4224,0,0,49791,0,0,0,0),
(88737,16020,533,16063,0,2984.55,-3209.64,294.15,1.43,4224,0,0,49791,0,0,0,0),
(2530389,16022,533,0,0,3020.7,-3147.52,294.078,0.699147,3000,0,0,42290,0,0,0,0),
(2530390,16022,533,0,0,3025.34,-3150.06,294.077,1.54345,3000,0,0,42290,0,0,0,0),
(88734,16020,533,16063,0,2981.2,-3194.21,294.063,4.44942,4224,0,0,49791,0,0,0,0),
(88735,16020,533,16063,0,2986.61,-3197.26,294.063,4.02531,4224,0,0,49791,0,0,0,0),
(2530388,16021,533,0,0,3025.7,-3142.29,294.078,5.74926,3000,0,0,45467,0,0,0,0),
(2530387,16022,533,0,0,2983.13,-3196.66,294.063,4.3591,3000,0,0,42290,0,0,0,0),
(88726,16017,533,9760,0,3012.18,-3186.19,294.064,6.00217,3520,3,0,87532,0,0,1,0),
(88727,16017,533,9760,0,3026.93,-3179.32,294.064,6.15045,3520,3,0,87532,0,0,1,0),
(2530385,16022,533,0,0,2986.49,-3206.79,294.063,2.41917,3000,0,0,42290,0,0,0,0),
(2530386,16022,533,0,0,2987.71,-3200.98,294.063,3.2242,3000,0,0,42290,0,0,0,0),
(88725,16017,533,9760,0,3021.23,-3190.64,294.063,2.26996,3520,3,0,87532,0,0,1,0),
(88724,16017,533,9760,0,3018.16,-3175.53,294.064,2.12136,3520,3,0,87532,0,0,1,0),
(88723,16018,533,0,0,3028.91,-3235.28,294.15,1.58,3520,0,0,187197,0,0,2,0),
(88722,16029,533,15962,0,3132.07,-3244.12,294.18,0.05,3520,0,0,195189,0,0,2,0),
(88721,16029,533,15962,0,3135.62,-3179.65,294.15,3.26,3520,0,0,195189,0,0,2,0),
(88720,16029,533,15962,0,3171.7,-3301.83,294.66,2.21,3520,0,0,195189,0,0,2,0),
(88719,16018,533,15958,0,3081.44,-3084.35,294.15,4.99,3520,0,0,187197,0,0,2,0),
(88718,16018,533,15958,0,3034.2,-3116.27,294.15,5.52,3520,0,0,187197,0,0,2,0),
(2530403,16022,533,0,0,3060.77,-3110.43,294.078,1.47355,3000,0,0,42290,0,0,0,0),
(2530383,16021,533,0,0,2981.4,-3202.53,294.063,0.0551154,3000,0,0,45467,0,0,0,0),
(88716,16022,533,836,0,3106.89,-3092.72,294.077,1.03923,3520,0,0,42290,0,0,0,0),
(88715,16022,533,836,0,3111.18,-3092.48,294.076,1.79321,3520,0,0,42290,0,0,0,0),
(88714,16022,533,836,0,3115.66,-3089.89,294.076,2.57861,3520,0,0,42290,0,0,0,0),
(88712,16020,533,16063,0,3119.63,-3085.93,294.078,2.92811,4224,0,0,49791,0,0,0,0),
(88711,16020,533,16063,0,3114.84,-3093.64,294.076,2.00527,4224,0,0,49791,0,0,0,0),
(88710,16020,533,16063,0,3109.07,-3094.98,294.075,1.56866,4224,0,0,49791,0,0,0,0),
(88709,16020,533,16063,0,3103.16,-3090.63,294.077,0.567988,4224,0,0,49791,0,0,0,0),
(2530384,16022,533,0,0,2981.28,-3207.92,294.063,1.3471,3000,0,0,42290,0,0,0,0),
(2530399,16020,533,0,0,3070.48,-3106.15,294.077,2.92261,3000,0,0,49791,0,0,0,0),
(2530400,16020,533,0,0,3063.42,-3112.82,294.076,1.64241,3000,0,0,49791,0,0,0,0),
(2530397,16021,533,0,0,3062.14,-3104.68,294.078,5.35342,3000,0,0,45467,0,0,0,0),
(2530401,16020,533,0,0,3057.3,-3110.72,294.077,0.848375,3000,0,0,49791,0,0,0,0),
(2530402,16022,533,0,0,3057.01,-3107.99,294.078,0.522434,3000,0,0,42290,0,0,0,0),
(2530398,16020,533,0,0,3067.99,-3100.56,294.078,3.70408,3000,0,0,49791,0,0,0,0),
(2530396,16020,533,0,0,3022.4,-3149.72,294.077,1.01409,3000,0,0,49791,0,0,0,0),
(533014,16211,533,16074,0,2779.97,-3115.92,267.768,2.16421,3600,0,0,42,0,0,0,0),
(533015,16211,533,16074,0,2860.08,-3187.86,298.234,3.08923,3600,0,0,42,0,0,0,0),
(533013,16211,533,16074,0,2814.28,-3154.13,298.229,4.76475,3600,0,0,42,0,0,0,0),
(533011,16211,533,16074,0,2835.89,-3215.61,298.344,1.01229,3600,0,0,42,0,0,0,0),
(533012,16211,533,16074,0,2756.07,-3113.2,267.768,0.890118,3600,0,0,42,0,0,0,0),
(533010,16211,533,16074,0,2784.04,-3086.38,267.768,3.92699,3600,0,0,42,0,0,0,0),
(533021,16211,533,16074,0,2859.65,-3180.16,298.237,3.24631,3600,0,0,42,0,0,0,0),
(88424,16145,533,0,1109,2889.75,-3260.82,298.146,3.99846,3520,0,0,94339,0,0,2,1),
(2530342,15975,533,0,0,3191.81,-3580.93,287.084,0.611764,3000,0,0,55905,0,0,0,0),
(2530379,16020,533,0,0,3006.11,-3243.52,294.063,3.23132,3000,0,0,49791,0,0,0,0),
(88676,16067,533,16937,0,2920.34,-3153.1,273.88,4.58,4224,0,0,29500,0,0,0,0),
(88675,16067,533,16937,0,2915.36,-3152.52,273.88,4.4,4224,0,0,29500,0,0,0,0),
(88674,16067,533,16937,0,2914.6,-3219.76,273.88,1.55,4224,0,0,29500,0,0,0,0),
(127628,16137,533,0,0,2664.87,-3340.75,267.767,5.93412,3600,0,0,17010,0,0,0,0),
(127619,16137,533,0,0,2733.46,-3349.39,267.768,1.78024,3600,0,0,17010,0,0,0,0),
(127618,16137,533,0,0,2692.16,-3430.75,268.646,1.6057,3600,0,0,17010,0,0,0,0),
(127620,16137,533,0,0,2739.99,-3321.73,284.232,2.82743,3600,0,0,17010,0,0,0,0),
(127621,16137,533,0,0,2692.21,-3428.78,268.646,1.48353,3600,0,0,17010,0,0,0,0),
(127622,16137,533,0,0,2739.99,-3399.78,284.295,6.10865,3600,0,0,17010,0,0,0,0),
(127623,16137,533,0,0,2714.56,-3430.61,268.646,1.41372,3600,0,0,17010,0,0,0,0),
(127624,16137,533,0,0,2683.89,-3304.21,267.768,2.49582,3600,0,0,17010,0,0,0,0),
(127625,16137,533,0,0,2669.58,-3428.86,268.646,1.37881,3600,0,0,17010,0,0,0,0),
(127626,16137,533,0,0,2700.27,-3322.35,267.768,3.52556,3600,0,0,17010,0,0,0,0),
(127627,16137,533,0,0,2643.73,-3399.68,284.183,6.0912,3600,0,0,17010,0,0,0,0),
(127629,16137,533,0,0,2725.82,-3309.57,267.769,2.82743,3600,0,0,17010,0,0,0,0),
(127630,16137,533,0,0,2643.73,-3321.73,284.233,6.19592,3600,0,0,17010,0,0,0,0),
(533016,16211,533,16074,0,2760.84,-3082.67,267.768,5.25344,3600,0,0,42,0,0,0,0),
(533017,16211,533,16074,0,2825.51,-3154.79,298.229,4.5204,3600,0,0,42,0,0,0,0),
(533018,16211,533,16074,0,2844.48,-3157.53,298.233,4.2237,3600,0,0,42,0,0,0,0),
(533019,16211,533,16074,0,2827.83,-3209.98,298.344,0.994838,3600,0,0,42,0,0,0,0),
(533020,16211,533,16074,0,2851.85,-3162.62,298.236,4.08407,3600,0,0,42,0,0,0,0),
(88651,15977,533,959,0,3305.08,-3717.73,267.84,4.18,3520,0,0,15415,50000,0,0,0),
(88650,15977,533,959,0,3310.87,-3723.75,267.88,3.77,3520,0,0,15415,50000,0,0,0),
(88649,15977,533,959,0,3293.78,-3727.1,269.81,3.64,3520,0,0,15415,50000,0,0,0),
(88648,15977,533,959,0,3295.11,-3722.44,269.6,3.25,3520,0,0,15415,50000,0,0,0),
(2530341,16453,533,0,0,3267.94,-3725.9,278.021,0.340248,3000,0,0,138165,0,0,2,1),
(2530340,16453,533,0,0,3270.59,-3732.98,277.629,0.340248,3000,0,0,138165,0,0,2,1),
(2530362,15977,533,0,0,3273,-3694.41,281.352,5.20732,3000,0,0,15415,50000,0,0,0),
(2530364,15977,533,0,0,3276.47,-3700.13,278.871,4.93479,3000,0,0,15415,50000,0,0,0),
(2530363,15977,533,0,0,3269.23,-3701.49,283.193,5.30942,3000,0,0,15415,50000,0,0,0),
(2530367,15977,533,0,0,3284.32,-3703.01,275.488,2.32884,3000,0,0,15415,50000,0,0,0),
(2530366,15977,533,0,0,3275.32,-3708.36,278.676,2.15448,3000,0,0,15415,50000,0,0,0),
(2530365,15977,533,0,0,3284.97,-3697.12,277.593,2.79458,3000,0,0,15415,50000,0,0,0),
(2530368,15977,533,0,0,3278.53,-3691.56,280.365,2.0563,3000,0,0,15415,50000,0,0,0),
(2530330,15974,533,0,0,3146.5,-3776.7,273.948,1.14606,3000,0,0,46361,0,0,0,0),
(2530329,15974,533,0,0,3139.52,-3787.93,273.947,4.77067,3000,0,0,46361,0,0,0,0),
(2530328,15974,533,0,0,3130.54,-3783.85,273.945,2.67366,3000,0,0,46361,0,0,0,0),
(2530327,15974,533,0,0,3216.92,-3805.44,273.95,3.93029,3000,0,0,46361,0,0,0,0),
(2530326,15974,533,0,0,3219.75,-3796.73,273.95,4.97094,3000,0,0,46361,0,0,0,0),
(2530335,15977,533,0,0,3231.45,-3684.91,287.083,5.95113,3000,0,0,15415,50000,0,0,0),
(2530337,15977,533,0,0,3246,-3683.32,287.085,2.27311,3000,0,0,15415,50000,0,0,0),
(2530336,15977,533,0,0,3248.53,-3686.31,286.34,3.43943,3000,0,0,15415,50000,0,0,0),
(88623,15974,533,15937,0,3150.08,-3783.27,274.13,0.39,3520,0,0,46361,0,0,0,0),
(2530324,15974,533,0,0,3233.43,-3796.14,273.808,5.5757,3000,0,0,46361,0,0,0,0),
(2530325,15974,533,0,0,3225.3,-3792.91,273.911,2.00214,3000,0,0,46361,0,0,0,0),
(2530339,15977,533,0,0,3235.35,-3690.11,287.077,1.01647,3000,0,0,15415,50000,0,0,0),
(2530338,15977,533,0,0,3237.57,-3684.9,287.083,2.27311,3000,0,0,15415,50000,0,0,0),
(2530333,15977,533,0,0,3246.53,-3691.97,287.075,0.395218,3000,0,0,15415,50000,0,0,0),
(2530332,15977,533,0,0,3243.68,-3696.81,287.07,0.395218,3000,0,0,15415,50000,0,0,0),
(2530331,15977,533,0,0,3235.82,-3695.8,287.071,1.15313,3000,0,0,15415,50000,0,0,0),
(2530334,15977,533,0,0,3241.48,-3689.89,287.076,2.75141,3000,0,0,15415,50000,0,0,0),
(88608,16453,533,0,0,3279.61,-3692.43,279.88,2.67838,3520,0,0,138165,0,0,2,1),
(88607,16453,533,0,0,3275.7,-3700.26,279.309,2.67838,3520,0,0,138165,0,0,0,0),
(2530468,16036,533,0,0,2911.48,-3666.9,279.017,5.66129,30,7,0,10283,12000,0,1,0),
(2530469,16036,533,0,0,2894.65,-3689.83,284.117,4.27349,30,7,0,10283,12000,0,1,0),
(2530462,16036,533,0,0,2842.7,-3612.57,260.847,5.31885,30,7,0,10283,12000,0,1,0),
(2530461,16037,533,0,0,2839.55,-3597.55,259.282,5.31885,30,7,0,10283,12000,0,1,0),
(2530447,16446,533,0,0,2840.38,-3865.81,267.592,3.60828,3520,0,0,252533,12000,0,2,0),
(2530446,16446,533,0,0,2836.25,-3860.16,267.592,3.92636,3520,0,0,252533,12000,0,0,0),
(2530445,16368,533,0,0,2848.73,-3893.98,267.593,1.55693,3520,0,0,110197,25680,0,0,0),
(2530444,16368,533,0,0,2848.69,-3871.11,267.593,4.65926,3520,0,0,110197,25680,0,0,0),
(2530443,16368,533,0,0,2761.01,-3894.24,294.661,1.60799,3520,0,0,110197,25680,0,0,0),
(2530442,16368,533,0,0,2761.23,-3871.79,294.661,4.73387,3520,0,0,110197,25680,0,0,0),
(2530441,16368,533,0,0,2649.39,-3846.53,294.662,0.708703,3520,0,0,110197,25680,0,0,0),
(2530437,16368,533,0,0,2568.42,-3678.37,294.661,3.15522,3520,0,0,110197,25680,0,0,0),
(2530438,16368,533,0,0,2592.02,-3790.53,294.661,0.767609,3520,0,0,110197,25680,0,0,0),
(2530439,16368,533,0,0,2608.05,-3774.81,294.661,3.92884,3520,0,0,110197,25680,0,0,0),
(2530440,16368,533,0,0,2664.78,-3831.53,294.662,3.84637,3520,0,0,110197,25680,0,0,0),
(2530436,16368,533,0,0,2544.96,-3678.58,294.661,6.21827,3520,0,0,110197,25680,0,0,0),
(2530435,16368,533,0,0,2544.88,-3590.65,267.594,6.23791,3520,0,0,110197,25680,0,0,0),
(2530323,15977,533,0,0,3210.13,-3645.67,287.075,3.99313,3000,0,0,15415,50000,0,2,0),
(2530322,15977,533,0,0,3214.47,-3644.68,287.07,3.99313,3000,0,0,15415,50000,0,0,0),
(2530320,15977,533,0,0,3214.2,-3635.41,285.064,4.21462,3000,0,0,15415,50000,0,0,0),
(2530321,15977,533,0,0,3217.52,-3641.77,287.07,3.99313,3000,0,0,15415,50000,0,0,0),
(2530350,15977,533,0,0,3308.06,-3724.94,267.991,2.84573,3000,0,0,15415,50000,0,0,0),
(2530318,15977,533,0,0,3216.24,-3637.86,286.596,3.93187,3000,0,0,15415,50000,0,0,0),
(2530317,15977,533,0,0,3214.1,-3639.46,286.409,3.93187,3000,0,0,15415,50000,0,0,0),
(2530316,15977,533,0,0,3215.19,-3641.19,287.075,3.93187,3000,0,0,15415,50000,0,0,0),
(2530315,15977,533,0,0,3212.91,-3642.57,287.063,3.93187,3000,0,0,15415,50000,0,0,0),
(2530353,15977,533,0,0,3311.24,-3717.84,266.959,4.1063,3000,0,0,15415,50000,0,0,0),
(2530351,15977,533,0,0,3301.82,-3727.42,268.785,2.86929,3000,0,0,15415,50000,0,0,0),
(2530352,15977,533,0,0,3300.99,-3721.11,268.343,2.99888,3000,0,0,15415,50000,0,0,0),
(2530349,15975,533,0,0,3162.97,-3643.82,287.095,2.09615,3000,0,0,55905,0,0,0,0),
(2530348,15975,533,0,0,3169.44,-3638.68,287.108,2.49671,3000,0,0,55905,0,0,0,0),
(88564,15975,533,15938,0,3142.07,-3636.8,287.081,0.559912,3520,0,0,55905,0,0,0,0),
(88563,15975,533,15938,0,3153.2,-3644.89,287.26,0.7,3520,0,0,55905,0,0,0,0),
(2530343,15975,533,0,0,3202.19,-3588.55,281.82,1.05159,3000,0,0,55905,0,0,0,0),
(88560,15975,533,15938,0,3204.55,-3572.21,287.083,0.225348,3520,0,0,55905,0,0,0,0),
(88559,15975,533,15938,0,3216.22,-3578.01,287.26,3.85,3520,0,0,55905,0,0,0,0),
(2530344,15975,533,0,0,3216.96,-3590.1,287.093,3.39836,3000,0,0,55905,0,0,0,0),
(2530347,15975,533,0,0,3156.62,-3630.86,282.938,0.674584,3000,0,0,55905,0,0,0,0),
(2530406,16021,533,0,0,3110.33,-3085.8,294.077,4.66384,3000,0,0,45467,0,0,0,0),
(2530407,16022,533,0,0,3103.41,-3086.52,294.078,6.17966,3000,0,0,42290,0,0,0,0),
(2530380,16020,533,0,0,3003.77,-3238.58,294.063,3.94604,3000,0,0,49791,0,0,0,0),
(2530382,16020,533,0,0,2992.98,-3240.69,294.063,5.63463,3000,0,0,49791,0,0,0,0),
(2530404,16022,533,0,0,3066.33,-3108.6,294.076,2.53384,3000,0,0,42290,0,0,0,0),
(2530405,16022,533,0,0,3068.01,-3103.3,294.078,3.39149,3000,0,0,42290,0,0,0,0),
(2530381,16020,533,0,0,2997.94,-3237.07,294.063,5.08879,3000,0,0,49791,0,0,0,0),
(2530244,15977,533,0,0,3104.63,-3585.25,287.078,2.81239,3600,0,0,15415,50000,0,0,0),
(2530346,15975,533,0,0,3144.9,-3628.55,287.088,1.97049,3000,0,0,55905,0,0,0,0),
(88543,15978,533,15941,0,3149.82,-3619.72,287.27,0.38,3520,0,0,140105,0,0,0,0),
(88541,15978,533,15941,0,3209.09,-3596.43,287.27,3.51,3520,0,0,140105,0,0,0,0),
(2530345,15975,533,0,0,3198.26,-3574.84,287.085,4.95344,3000,0,0,55905,0,0,0,0),
(2530283,15981,533,0,0,3367.71,-3652.44,259.083,2.14036,3600,0,0,26274,58750,0,0,0),
(2530265,15981,533,0,0,3352.49,-3685.48,259.078,1.71705,3600,0,0,26274,58750,0,0,0),
(2530273,15980,533,0,0,3386.73,-3690.53,259.078,2.26604,3600,0,0,25824,58750,0,0,0),
(2530272,15981,533,0,0,3382.87,-3693.75,259.08,2.26604,3600,0,0,26274,58750,0,0,0),
(2530271,15980,533,0,0,3378.5,-3697.39,259.081,2.26604,3600,0,0,25824,58750,0,0,0),
(2530270,15981,533,0,0,3382.6,-3689.13,259.081,2.24248,3600,0,0,26274,58750,0,0,0),
(2530269,15980,533,0,0,3378.33,-3692.53,259.081,2.24248,3600,0,0,25824,58750,0,0,0),
(2530268,15980,533,0,0,3386.94,-3685.78,259.079,2.3328,3600,0,0,25824,58750,0,0,0),
(2530267,15981,533,0,0,3374.32,-3696.3,259.082,2.21891,3600,0,0,26274,58750,0,0,0),
(2530266,15980,533,0,0,3357.9,-3684.92,259.08,1.68564,3600,0,0,25824,58750,0,0,0),
(2530274,15981,533,0,0,3390.84,-3687.1,259.075,2.26604,3600,0,0,26274,58750,0,0,0),
(2530275,15980,533,0,0,3370.25,-3669.45,259.082,1.99509,3600,0,0,25824,58750,0,0,0),
(2530276,15981,533,0,0,3370.75,-3674.46,259.082,1.91262,3600,0,0,26274,58750,0,0,0),
(2530277,15980,533,0,0,3383.8,-3668.86,259.082,2.08933,3600,0,0,25824,58750,0,0,0),
(2530278,15981,533,0,0,3384.43,-3664.46,259.082,1.99508,3600,0,0,26274,58750,0,0,0),
(2530279,15980,533,0,0,3379.93,-3665.65,259.082,1.99508,3600,0,0,25824,58750,0,0,0),
(2530282,15981,533,0,0,3379.44,-3670.63,259.082,1.99508,3600,0,0,26274,58750,0,0,0),
(2530281,15980,533,0,0,3374.76,-3672.74,259.082,1.99508,3600,0,0,25824,58750,0,0,0),
(2530280,15981,533,0,0,3374.83,-3667.38,259.082,1.99508,3600,0,0,26274,58750,0,0,0),
(2530285,15981,533,0,0,3374.93,-3648.49,259.083,2.1168,3600,0,0,26274,58750,0,0,0),
(2530284,15980,533,0,0,3371.56,-3650.54,259.083,2.1168,3600,0,0,25824,58750,0,0,0),
(2530562,533004,533,0,0,3329.07,-3668.74,259.081,1.05716,3520,0,0,5000,0,0,0,0),
(2530563,533004,533,0,0,3333.89,-3648.71,259.083,1.1946,3520,0,0,5000,0,0,0,0),
(2530259,15980,533,0,0,3344.7,-3690.97,259.083,1.48143,3600,0,0,25824,58750,0,0,0),
(2530260,15981,533,0,0,3359.77,-3690.24,259.079,1.68171,3600,0,0,26274,58750,0,0,0),
(2530261,15981,533,0,0,3349.95,-3690.49,259.077,1.53248,3600,0,0,26274,58750,0,0,0),
(2530262,15980,533,0,0,3354.99,-3690.12,259.075,1.55212,3600,0,0,25824,58750,0,0,0),
(2530264,15980,533,0,0,3347.15,-3686.17,259.082,1.5207,3600,0,0,25824,58750,0,0,0),
(2530263,15981,533,0,0,3342.57,-3686.82,259.085,1.5207,3600,0,0,26274,58750,0,0,0),
(127631,16400,533,11686,0,3223.02,-3218.73,316.371,0.760995,3600,10,0,17010,0,0,1,0),
(127632,16400,533,11686,0,3208.17,-3234.59,315.457,0.742117,3600,10,0,17010,0,0,1,0),
(533000,16861,533,0,16861,2932.14,-3187.84,273.371,3.13828,3000,0,0,163859,12430,0,2,1),
(88496,15953,533,15940,0,3353.16,-3620.63,261.18,4.76,604800,0,0,1312027,0,0,0,0),
(533001,16998,533,0,0,3005.8,-3434.81,304.196,5.38862,21600,50,0,37000,0,0,2,0),
(88483,15952,533,15928,0,3503.04,-3919.22,297.6,2.16,604800,0,0,1498950,0,0,0,0),
(88480,15928,533,16137,0,3513.84,-2926.55,302.914,4.13643,604800,0,0,6662000,40000,0,0,0),
(88479,16060,533,16279,0,2642.2,-3388.39,285.6,0,604800,0,0,399750,262000,0,0,0),
(2530409,16165,533,0,1451,2797.4,-3390.99,267.685,1.85808,3000,0,0,38763,105750,0,0,0),
(2530411,16145,533,0,1109,2790.74,-3403.59,267.685,2.43143,3000,0,0,94339,0,0,0,0),
(88475,16145,533,16513,0,2797,-3398.33,267.86,2.37,3520,0,0,94339,0,0,0,0),
(88474,16163,533,0,1258,2785.81,-3374.48,267.86,1.56,4224,0,0,113517,12430,0,0,0),
(88473,16163,533,0,1258,2791.79,-3374.53,267.86,1.55,4224,0,0,113517,12430,0,2,0),
(88472,16165,533,11396,0,2791.23,-3265.32,267.813,2.6171,3520,0,0,38763,105750,0,0,0),
(88471,16165,533,11396,0,2782.13,-3278.02,267.813,2.51971,3520,0,0,38763,105750,0,0,0),
(88470,16164,533,14703,0,2786.36,-3271.89,267.99,2.57,3520,0,0,150000,22000,0,0,0),
(88469,16067,533,16937,0,2918.86,-3220.45,273.97,1.58,4224,0,0,29500,0,0,0,0),
(88467,16067,533,16937,0,2877.32,-3153.33,273.97,4.69,4224,0,0,29500,0,0,0,0),
(88468,16067,533,16937,0,2952.34,-3199.06,273.97,3.07,4224,0,0,29500,0,0,0,0),
(88466,16163,533,0,1258,2922.86,-3171.58,273.372,3.08722,4224,0,0,113517,12430,0,0,1),
(88465,16163,533,0,1258,2922.9,-3202.79,273.372,3.18933,4224,0,0,113517,12430,0,0,1),
(88460,16061,533,16582,0,2755.56,-3098.04,267.86,6.27,604800,0,0,1998600,0,0,2,0),
(2530465,16036,533,0,0,2895.02,-3649.39,276.352,5.31885,30,7,0,10283,12000,0,1,0),
(2530432,16447,533,0,0,2731.5,-2984.48,240.525,6.26198,3520,0,0,93736,0,0,0,0),
(88457,16158,533,16533,0,2795.27,-3159.02,273.97,4.47,3520,0,0,48478,12000,0,0,0),
(88456,16156,533,16534,0,2858.83,-3129.66,273.787,4.73594,3520,0,0,24372,12000,0,0,0),
(88455,16154,533,0,525,2852.05,-3139.9,273.804,0.329851,3520,0,0,24260,0,0,0,0),
(88454,16154,533,0,525,2862.17,-3147.76,273.789,1.70273,3520,0,0,24260,0,0,0,0),
(88453,16157,533,16528,0,2813.48,-3133.52,273.99,4.25,3520,0,0,24998,0,0,0,0),
(88452,16156,533,16534,0,2818.17,-3142.82,273.98,2.7,3520,0,0,24372,12000,0,0,0),
(88450,16158,533,16533,0,2790.82,-3182.31,273.97,1.38,3520,0,0,24734,12000,0,0,0),
(88451,16156,533,16534,0,2807.78,-3146.75,273.96,1.25,3520,0,0,24372,12000,0,0,0),
(88449,16158,533,16533,0,2803.58,-3173.22,273.97,2.85,3520,0,0,24734,12000,0,0,0),
(88448,16163,533,10729,0,2810.07,-3140.06,273.97,6.1,4224,0,0,113517,12430,0,0,0),
(88447,16163,533,10729,0,2793.06,-3169.94,273.97,6.16,4224,0,0,113517,12430,0,0,0),
(88446,16157,533,16528,0,2792.61,-3170.52,298.33,0.96,3520,0,0,24997,0,0,0,0),
(88445,16145,533,16513,0,2793.21,-3165.56,298.33,0.17,3520,0,0,94339,0,0,0,0),
(88444,16146,533,16508,0,2799.66,-3166,298.147,3.11147,3520,0,0,74748,0,0,2,0),
(88443,16158,533,16533,0,2797.93,-3172.65,298.146,1.78363,3520,0,0,24734,12000,0,0,0),
(88442,16158,533,16533,0,2807.7,-3178.99,298.33,6.1,3520,0,0,24734,12000,0,0,0),
(88441,16158,533,16533,0,2809.91,-3172.91,298.33,5.88,3520,0,0,24734,12000,0,0,0),
(88440,16146,533,16508,0,2812.05,-3177.41,298.33,6.01,3520,0,0,74748,0,0,2,0),
(88435,16146,533,16508,0,2837.67,-3213.93,298.254,3.86494,3520,0,0,74748,0,0,0,0),
(88436,16146,533,16508,0,2857.09,-3180.16,298.153,0.024496,3520,0,0,74748,0,0,2,0),
(88437,16146,533,16508,0,2857.79,-3187.66,298.152,6.22821,3520,0,0,74748,0,0,0,0),
(88438,16146,533,16508,0,2814.19,-3158.02,298.146,1.49618,3520,0,0,74748,0,0,0,0),
(88439,16146,533,16508,0,2825.19,-3157.38,298.146,1.3861,3520,0,0,74748,0,0,2,0),
(88434,16146,533,16508,0,2829.04,-3208.18,298.252,4.10672,3520,0,0,74748,0,0,2,0),
(88433,16145,533,16513,0,2821.8,-3164.15,298.146,1.88115,3520,0,0,94339,0,0,0,0),
(88432,16145,533,16513,0,2849.62,-3181.18,298.152,5.91889,3520,0,0,94339,0,0,0,0),
(88431,16145,533,16513,0,2837.16,-3206.54,298.24,4.13133,3520,0,0,94339,0,0,0,0),
(88430,16146,533,16508,0,2872.69,-3202.18,298.146,5.80789,3520,0,0,74748,0,0,2,0),
(88429,16145,533,16513,0,2880.29,-3206.22,298.33,2.68,3520,0,0,94339,0,0,0,0),
(88428,16157,533,16528,0,2879.88,-3198.33,298.33,4.04,3520,0,0,24997,0,0,0,0),
(88427,16156,533,16534,0,2872.29,-3210,298.33,0.97,3520,0,0,24372,12000,0,0,0),
(88426,16165,533,11396,0,2840.57,-3267.43,299.13,5.44,3520,0,0,38763,105750,0,0,0),
(88425,16145,533,0,1109,2886.46,-3257.89,298.146,3.98276,3520,0,0,94339,0,0,2,1),
(88423,16146,533,16508,0,2881.58,-3314.07,298.32,0.58,3520,0,0,74748,0,0,0,0),
(88422,16167,533,14706,0,2835.91,-3307.22,298.33,0.53,3520,0,0,43759,0,0,2,0),
(88421,16167,533,14706,0,2829.27,-3314.37,299.31,1.52,3520,15,0,43759,0,0,1,0),
(88420,16167,533,14706,0,2829.71,-3322.54,300.01,2.2,3520,15,0,43759,0,0,1,0),
(88419,16167,533,14706,0,2837.3,-3333.04,300.45,2.96,3520,15,0,43759,0,0,1,0),
(88418,16167,533,14706,0,2843.76,-3333.93,298.5,0.62,3520,0,0,43759,0,0,2,0),
(88417,16164,533,14703,0,2837.08,-3273.82,298.27,5.57,3520,0,0,150000,22000,0,0,0),
(88416,16164,533,14703,0,2847.2,-3263.39,298.27,5.43,3520,0,0,150000,22000,0,0,0),
(88415,16145,533,16513,0,2879.33,-3244.43,298.33,4.73,3520,0,0,94339,0,0,0,0),
(88414,16146,533,16508,0,2870.98,-3249.05,298.33,4.73,3520,0,0,74748,0,0,0,0),
(88413,16146,533,16508,0,2883.29,-3249.09,298.33,4.75,3520,0,0,74748,0,0,0,0),
(88412,16145,533,16513,0,2874.52,-3244.96,298.33,4.71,3520,0,0,94339,0,0,0,0),
(88411,16193,533,11404,0,2900.49,-3273.64,298.73,4.14,3520,0,0,49192,0,0,2,0),
(88410,16193,533,11404,0,2909.05,-3276.42,298.33,1.31,3520,0,0,49192,0,0,2,0),
(88409,16193,533,11404,0,2914.95,-3289.51,298.73,4.13,3520,15,0,49192,0,0,1,0),
(88408,16193,533,11404,0,2923.87,-3292.03,298.33,1.13,3520,15,0,49192,0,0,1,0),
(88407,16164,533,14703,0,2903.97,-3293.77,298.73,3.96,3520,0,0,150000,22000,0,2,0),
(88406,16156,533,16534,0,2887.81,-3315.24,298.32,2.19,3520,0,0,24372,12000,0,0,0),
(88405,16158,533,16533,0,2888.83,-3308.23,298.32,3.84,3520,0,0,24734,12000,0,0,0),
(88404,16145,533,16513,0,2881.37,-3306.94,298.32,5.41,3520,0,0,94339,0,0,0,0),
(88402,16154,533,16927,0,2922.28,-3378.29,298.31,0.78,3520,0,0,24260,0,0,0,0),
(88403,16154,533,16927,0,2928.1,-3385.22,298.31,0.8,3520,0,0,24260,0,0,0,0),
(88401,16154,533,16927,0,2951.66,-3348.27,298.31,4.03,3520,0,0,24260,0,0,0,0),
(88400,16154,533,16927,0,2958.77,-3356.05,298.31,3.94,3520,0,0,24260,0,0,0,0),
(88399,16165,533,11396,0,2915.22,-3346.51,298.32,5.48,3520,0,0,38763,105750,0,0,0),
(88398,16165,533,11396,0,2920.14,-3342.24,298.32,5.41,3520,0,0,38763,105750,0,0,0),
(88397,16164,533,0,0,2919.12,-3346.21,298.32,5.34,3520,0,0,150000,22000,0,2,1),
(88396,16145,533,16513,0,2936.02,-3350.4,298.32,5.28,3520,0,0,94339,0,0,0,0),
(88395,16145,533,16513,0,2923.5,-3363.32,298.32,5.77,3520,0,0,94339,0,0,0,0),
(88394,16146,533,16508,0,2956.29,-3351.25,299.18,3.9,3520,0,0,74748,0,0,0,0),
(88393,16146,533,16508,0,2924.34,-3383,299.18,0.77,3520,0,0,74748,0,0,0,0),
(127633,16400,533,11686,0,3178.61,-3263.67,316.428,0.783571,3600,10,0,17010,0,0,1,0),
(127634,16400,533,11686,0,3217.32,-3224.75,316.058,0.825181,3600,10,0,17010,0,0,1,0),
(127635,16400,533,11686,0,3190.63,-3252.56,315.568,3.91208,3600,10,0,17010,0,0,1,0),
(127636,16400,533,11686,0,3237.07,-3207.6,317.365,3.95566,3600,10,0,17010,0,0,1,0),
(127637,16400,533,11686,0,3246.76,-3193.86,317.33,3.83134,3600,10,0,17010,0,0,1,0),
(127795,16194,533,0,16194,2681.25,-3215.83,267.611,5.46288,3600,0,0,113289,12000,0,2,0),
(2530410,16165,533,0,1451,2791.04,-3394.88,267.685,2.21151,3000,0,0,38763,105750,0,0,0),
(127796,16194,533,0,0,2712.35,-3127.26,267.554,2.65744,3600,0,0,113289,12000,0,0,0),
(127824,16216,533,0,0,2708.13,-3174.65,267.605,0.418879,3600,0,0,94033,12000,0,0,0),
(127823,16216,533,0,16216,2731.77,-3230.92,267.679,4.46872,3600,0,0,94033,12000,0,2,0),
(2530413,16163,533,0,1258,2830.94,-3219.21,273.787,1.47104,3000,0,0,113517,12430,0,0,0),
(2530414,16163,533,0,1258,2823.65,-3218.48,273.787,1.47104,3000,0,0,113517,12430,0,2,1),
(2530408,16215,533,0,16215,2664.57,-3170.19,267.627,3.3401,3000,0,0,88252,12000,0,0,0),
(127819,16215,533,0,16215,2667.47,-3173,267.604,4.13059,3600,0,0,88252,12000,0,2,0),
(127818,16215,533,0,0,2691.04,-3216.55,267.605,0.942478,3600,0,0,88252,12000,0,0,0),
(2530412,16163,533,0,1258,2862.19,-3137.6,273.788,3.11252,3000,0,0,113517,12430,0,0,0),
(127799,16194,533,0,16194,2724.37,-3219.95,267.605,0.261799,3600,0,0,113289,12000,0,0,0),
(127798,16194,533,0,16194,2712.7,-3180.11,267.605,1.69297,3600,0,0,113289,12000,0,2,0),
(127797,16194,533,0,16194,2718.03,-3135.9,267.522,4.42918,3600,0,0,113289,12000,0,2,0),
(2530313,16453,533,0,0,3219.89,-3878.45,282.17,0.0598501,3600,0,0,138165,0,0,0,0),
(89116,16447,533,0,0,2582.46,-3739.29,294.661,4.6661,3520,0,0,93736,0,0,2,0),
(89114,16447,533,0,0,2675.61,-3878.93,294.672,4.62,3520,0,0,93736,0,0,0,0),
(89113,16447,533,0,0,2672.7,-3877.77,294.672,4.62,3520,0,0,93736,0,0,0,0),
(89112,16447,533,0,0,2671.71,-3882.1,294.672,4.62,3520,0,0,93736,0,0,2,0),
(89111,16447,533,0,0,2674.83,-3882.44,294.672,4.598,3520,0,0,93736,0,0,2,0),
(89110,16447,533,0,0,2725.09,-3878.57,294.672,4.862,3520,0,0,93736,0,0,0,0),
(89109,16447,533,0,0,2722.75,-3878.48,294.672,4.953,3520,0,0,93736,0,0,0,0),
(89108,16447,533,0,0,2729.05,-3883.07,294.672,4.725,3520,0,0,93736,0,0,0,0),
(89107,16447,533,0,0,2725.65,-3883.05,294.662,4.725,3520,0,0,93736,0,0,2,0),
(89105,16447,533,0,0,2531.87,-3525.42,267.604,4.54139,3520,0,0,93736,0,0,0,0),
(89104,16447,533,0,0,2528.96,-3524.26,267.604,4.54139,3520,0,0,93736,0,0,0,0),
(89103,16447,533,0,0,2527.97,-3528.59,267.604,4.54139,3520,0,0,93736,0,0,0,0),
(89102,16447,533,0,0,2531.09,-3528.93,267.604,4.51939,3520,0,0,93736,0,0,2,0),
(89101,16447,533,0,0,2581.35,-3525.06,267.604,4.78339,3520,0,0,93736,0,0,0,0),
(89100,16447,533,0,0,2579.01,-3524.97,267.604,4.87439,3520,0,0,93736,0,0,0,0),
(89099,16447,533,0,0,2585.31,-3529.56,267.604,4.64639,3520,0,0,93736,0,0,0,0),
(88337,15974,533,15937,0,3154.91,-3546.39,287.08,3.24472,3520,0,0,46361,0,0,0,0),
(88338,15974,533,15937,0,3186.57,-3468.14,287.076,3.26751,3520,0,0,46361,0,0,0,0),
(88339,15974,533,15937,0,3187.43,-3486.19,287.076,2.98083,3520,0,0,46361,0,0,0,0),
(88340,15975,533,15938,0,3178.56,-3486.45,287.085,3.31463,3520,0,0,55905,0,0,0,0),
(88341,15975,533,15938,0,3176.37,-3474.63,287.25,2.02,3520,0,0,55905,0,0,0,0),
(88342,15975,533,15938,0,3174.45,-3466.13,286.987,3.31856,3520,0,0,55905,0,0,0,0),
(88343,15976,533,15939,0,3190.09,-3475.76,287.25,3.77,3520,0,0,92095,0,0,0,0),
(2530359,15977,533,0,0,3170.47,-3483.04,287.107,3.71167,3000,0,0,15415,50000,0,0,0),
(2530564,533004,533,0,0,3372.36,-3646.51,259.083,5.21585,3520,0,0,5000,0,0,0,0),
(88346,15956,533,15931,0,3316.47,-3476.23,287.26,3.18,604800,0,0,1500000,0,0,0,0),
(89098,16447,533,0,0,2581.91,-3529.54,267.594,4.64639,3520,0,0,93736,0,0,2,0),
(88335,15974,533,15937,0,3066.17,-3529.62,287.26,1.07,3520,0,0,46361,0,0,0,0),
(88336,15974,533,15937,0,3158.51,-3534.17,287.077,2.89914,3520,0,0,46361,0,0,0,0),
(88334,15974,533,15937,0,3060.65,-3545,287.076,5.92921,3520,0,0,46361,0,0,0,0),
(2530369,15977,533,0,0,3278.88,-3704.04,277.426,5.53011,3000,0,0,15415,50000,0,0,0),
(2530361,15977,533,0,0,3157.42,-3489.73,287.075,3.71167,3000,0,0,15415,50000,0,2,0),
(2530360,15977,533,0,0,3166.83,-3484.2,287.048,3.5703,3000,0,0,15415,50000,0,0,0),
(88329,15977,533,959,0,3101.67,-3489.3,287.26,1.36,3520,0,0,15415,50000,0,0,0),
(2530355,15977,533,0,0,3164.15,-3475.4,287.089,3.9198,3000,0,0,15415,50000,0,0,0),
(2530354,15977,533,0,0,3167.14,-3478.6,287.132,3.82162,3000,0,0,15415,50000,0,0,0),
(2530358,15977,533,0,0,3167.49,-3488.14,287.087,3.78235,3000,0,0,15415,50000,0,0,0),
(2530357,15977,533,0,0,3163.11,-3483.25,287.087,3.86089,3000,0,0,15415,50000,0,0,0),
(88322,15977,533,959,0,3109.29,-3499.39,287.25,5.35,3520,0,0,15415,50000,0,0,0),
(88321,15977,533,959,0,3106.9,-3496.09,287.25,4.61,3520,0,0,15415,50000,0,0,0),
(88320,15977,533,959,0,3107.82,-3489.64,287.25,3.94,3520,0,0,15415,50000,0,0,0),
(88319,15977,533,959,0,3111.41,-3486.3,287.25,2.99,3520,0,0,15415,50000,0,0,0),
(88318,15977,533,959,0,3117.86,-3487.48,287.25,1.68,3520,0,0,15415,50000,0,0,0),
(88317,15977,533,959,0,3118.5,-3493.96,287.25,0.97,3520,0,0,15415,50000,0,0,0),
(2530356,15977,533,0,0,3159.81,-3479.58,287.087,3.90802,3000,0,0,15415,50000,0,0,0),
(88315,15977,533,959,0,3112.53,-3491.46,287.25,3.7,3520,0,0,15415,50000,0,0,0),
(88314,15975,533,15938,0,3150,-3528.35,287.26,1.13,3520,0,0,55905,0,0,0,0),
(88313,15975,533,15938,0,3142.6,-3544.74,287.26,1.19,3520,0,0,55905,0,0,0,0),
(88312,15975,533,15938,0,3148.15,-3556.65,287.08,2.57321,3520,0,0,55905,0,0,0,0),
(88311,15976,533,15939,0,3163.55,-3540.59,287.092,3.00753,3520,0,0,92095,0,0,0,0),
(88309,15975,533,15938,0,3072.14,-3539.25,287.076,1.27965,3520,0,0,55905,0,0,0,0),
(88310,15976,533,15939,0,3054.23,-3540.13,287.074,6.21981,3520,0,0,92095,0,0,0,0),
(88308,15975,533,15938,0,3059.2,-3536.06,287.25,0.12,3520,0,0,55905,0,0,0,0),
(88307,15975,533,15938,0,3067.59,-3551.4,287.26,1.14,3520,0,0,55905,0,0,0,0),
(88305,16025,533,15961,0,3331.06,-3322.79,292.77,3.04,3520,0,0,217197,0,0,0,0),
(88306,16025,533,15961,0,3330.77,-3299.13,292.77,3.11,3520,0,0,217197,0,0,0,0),
(88304,15932,533,16064,0,3283.09,-3156.96,297.788,3.82227,604800,0,0,1665500,0,0,0,0),
(88303,15931,533,16035,0,3179.6,-3306.65,320.056,3.26349,604800,0,5,2165150,0,0,2,0),
(88302,16025,533,15961,0,3200.55,-3277.2,292.596,6.22207,3520,0,0,217197,0,0,0,0),
(88301,16025,533,15961,0,3197.16,-3337.31,292.596,6.22207,3520,0,0,217197,0,0,0,0),
(88300,16025,533,15961,0,3288.33,-3359.58,292.596,1.53074,3520,0,0,217197,0,0,0,0),
(88299,16025,533,15961,0,3264.63,-3357.66,292.78,1.59,3520,0,0,217197,0,0,0,0),
(88298,16028,533,16174,0,3308.46,-3232.08,294.24,3.01,604800,0,0,3997200,0,0,2,0),
(88297,16024,533,12349,0,3138.39,-3208.57,294.24,2.97,180,0,0,14619,0,0,0,0),
(88296,16024,533,12349,0,3132.54,-3227.46,294.24,0.24,180,0,0,14619,0,0,0,0),
(88295,16024,533,12349,0,3122.35,-3224.93,294.24,5.63,180,0,0,14619,0,0,0,0),
(88294,16024,533,12349,0,3116.53,-3213.87,294.24,4.61,180,0,0,14619,0,0,0,0),
(88293,16024,533,12349,0,3129.32,-3195.76,294.24,2.71,180,0,0,14619,0,0,0,0),
(88292,16024,533,12349,0,3130.98,-3213.34,294.24,6.02,180,0,0,14619,0,0,0,0),
(88291,16024,533,12349,0,3128.57,-3206.8,294.24,4.72,180,0,0,14619,0,0,0,0),
(88290,16024,533,12349,0,3137.26,-3202.88,294.24,2.57,180,0,0,14619,0,0,0,0),
(88288,16024,533,12349,0,3126.7,-3220.53,294.24,6.01,180,0,0,14619,0,0,0,0),
(88289,16024,533,12349,0,3138.04,-3221.12,294.24,0.77,180,0,0,14619,0,0,0,0),
(88287,16024,533,12349,0,3117.48,-3207.45,294.24,5.28,180,0,0,14619,0,0,0,0),
(88286,16024,533,12349,0,3123.89,-3199.2,294.24,5.38,180,0,0,14619,0,0,0,0),
(88285,16024,533,12349,0,3143.48,-3198.31,294.24,3.39,180,0,0,14619,0,0,0,0),
(88284,16024,533,12349,0,3150.39,-3205.3,294.24,3.62,180,0,0,14619,0,0,0,0),
(88282,16024,533,12349,0,3144.81,-3224.97,294.24,0.93,180,0,0,14619,0,0,0,0),
(88283,16024,533,12349,0,3149.52,-3216.86,294.24,1.2,180,0,0,14619,0,0,0,0),
(88266,16017,533,9760,0,3103.7,-3278.3,294.5,5.55,3520,0,0,87532,0,0,0,0),
(88281,16017,533,9760,0,3152.14,-3264.34,294.77,4.18,3520,0,0,87532,0,0,0,0),
(88265,16017,533,9760,0,3081.76,-3298.5,294.53,5.47,3520,0,0,87532,0,0,0,0),
(88277,16244,533,10627,0,2864.44,-3540.59,298.05,0.32,3520,0,0,93620,0,0,0,0),
(88276,16244,533,10627,0,2866.86,-3545.76,297.95,0.49,3520,0,0,93620,0,0,0,0),
(88272,16018,533,15958,0,3146.67,-3342.52,294.69,2.24,3520,0,0,187197,0,0,0,0),
(88271,16018,533,15958,0,3097.22,-3292.59,294.69,5.36,3520,0,0,187197,0,0,0,0),
(88270,16018,533,15958,0,3118.04,-3323.24,293.81,2.33,3520,0,0,187197,0,0,2,0),
(88269,16018,533,15958,0,3087.84,-3354.07,299.47,0.81,3520,0,0,187197,0,0,2,0),
(88278,16017,533,9760,0,3161.87,-3268.43,294.94,3.93,3520,0,0,87532,0,0,0,0),
(88279,16017,533,9760,0,3172.09,-3276.61,295.02,3.81,3520,0,0,87532,0,0,0,0),
(88280,16017,533,9760,0,3175.32,-3285.62,294.85,3.71,3520,0,0,87532,0,0,0,0),
(88268,16017,533,9760,0,3141.24,-3358.8,294.49,2.35,3520,0,0,87532,0,0,0,0),
(88262,16017,533,9760,0,3086.74,-3364.31,298.5,3.84,3520,0,0,87532,0,0,0,0),
(88267,16017,533,9760,0,3162.97,-3337.11,294.48,2.32,3520,0,0,87532,0,0,0,0),
(88260,16057,533,15554,0,2858.06,-3755.19,273.79,3.51,60,15,0,3052,0,0,1,0),
(88259,16056,533,15978,0,2867.02,-3782.55,273.79,2.85,60,15,0,3052,0,0,1,0),
(88258,16057,533,15554,0,2890.33,-3783.99,273.79,2.84,60,15,0,3052,0,0,1,0),
(88257,16056,533,15978,0,2896.47,-3753.83,273.77,3.14,60,15,0,3052,0,0,1,0),
(88256,16057,533,15554,0,2895.87,-3762.12,273.8,1.38,60,15,0,3052,0,0,1,0),
(88255,16056,533,15978,0,2894.08,-3774.59,273.8,5.49,60,15,0,3052,0,0,1,0),
(88254,16057,533,15554,0,2877.29,-3781.67,273.8,5.55,60,15,0,3052,0,0,1,0),
(88253,16056,533,15978,0,2869.94,-3774.74,273.8,4.47,60,15,0,3052,0,0,1,0),
(88252,16057,533,15554,0,2874.25,-3759.26,273.79,0.3,60,15,0,3052,0,0,1,0),
(88251,16056,533,15978,0,2861.43,-3763.23,273.8,0.34,60,15,0,3052,0,0,1,0),
(88250,16057,533,15554,0,2848.19,-3766.48,273.8,5.34,60,15,0,3052,0,0,1,0),
(88249,16056,533,15978,0,2838.32,-3754.31,273.8,0.81,60,15,0,3052,0,0,1,0),
(88248,16057,533,15554,0,2817.98,-3780.79,273.8,2.99,60,15,0,3052,0,0,1,0),
(88246,16057,533,15554,0,2853.26,-3786.51,273.78,5.35,60,15,0,3052,0,0,1,0),
(88247,16056,533,15978,0,2831.52,-3783.05,273.79,2.77,60,15,0,3052,0,0,1,0),
(88245,16056,533,15978,0,2846.39,-3777.18,273.8,5.52,60,15,0,3052,0,0,1,0),
(88244,16057,533,15554,0,2837.27,-3768.31,273.8,5.3,60,15,0,3052,0,0,1,0),
(88243,16056,533,15978,0,2829.56,-3755.74,273.8,0.01,60,15,0,3052,0,0,1,0),
(88242,16057,533,15554,0,2822.22,-3755.18,273.8,6.12,60,15,0,3052,0,0,1,0),
(88241,16056,533,15978,0,2786.38,-3757.27,273.8,3.32,60,15,0,3052,0,0,1,0),
(88240,16057,533,15554,0,2796.81,-3755.49,273.8,2.05,60,15,0,3052,0,0,1,0),
(88239,16056,533,15978,0,2799.23,-3760.2,273.8,2.02,60,15,0,3052,0,0,1,0),
(88238,16057,533,15554,0,2805.28,-3772.6,273.8,1.31,60,15,0,3052,0,0,1,0),
(88237,16056,533,15978,0,2803.44,-3780.83,273.8,0.52,60,15,0,3052,0,0,1,0),
(88236,16057,533,15554,0,2796.71,-3783.82,273.8,0.3,60,15,0,3052,0,0,1,0),
(88235,16056,533,15978,0,2775.5,-3782.08,273.8,4.46,60,15,0,3052,0,0,1,0),
(88234,16057,533,15554,0,2768.21,-3778.49,273.8,5.68,60,15,0,3052,0,0,1,0),
(88233,16056,533,15978,0,2758,-3769.48,273.86,1.6,60,15,0,3052,0,0,1,0),
(88232,16057,533,15554,0,2764.08,-3768.61,273.8,2.4,60,15,0,3052,0,0,1,0),
(2530430,16447,533,0,0,2675.17,-3005.24,240.525,3.82489,3520,0,0,93736,0,0,0,0),
(2530415,16446,533,0,0,2537.32,-3252.41,257.091,1.48026,3000,0,0,252533,12000,0,2,0),
(88226,16011,533,16110,0,2909.43,-3999.46,274.28,1.58,604800,0,0,5329600,0,0,0,0),
(2530431,16447,533,0,0,2726.57,-2975.25,240.525,6.28162,3520,0,0,93736,0,0,0,0),
(88205,15936,533,16309,0,2793.86,-3707.38,276.627,0.593412,604800,0,0,1832050,0,0,0,0),
(88204,16034,533,9013,0,2910.3,-3575.17,274.22,4.47,240,7,0,56067,0,0,1,0),
(88203,16034,533,9013,0,2916.1,-3589.21,274.93,3.06,240,7,0,56067,0,0,1,0),
(88202,16034,533,9013,0,2914.24,-3691.49,286.408,5.54425,240,7,0,56067,0,0,1,0),
(88201,16034,533,9013,0,2840.62,-3685.1,277.89,2.15,240,7,0,56067,0,0,1,0),
(2530424,16447,533,0,0,3434.55,-3760.84,294.661,3.95223,3520,0,0,93736,0,0,0,0),
(88199,16034,533,9013,0,2785.76,-3591.58,254.214,4.35673,240,7,0,56067,0,0,1,0),
(2530427,16448,533,0,0,2735.8,-2991.56,240.526,5.96354,3520,0,0,93736,19925,0,0,0),
(2530428,16448,533,0,0,2724.01,-2985.8,240.526,6.28162,3520,0,0,93736,31387,0,0,0),
(88196,16034,533,9013,0,2831.62,-3613.72,260.25,2.59,240,7,0,56067,0,0,1,0),
(88195,16034,533,9013,0,2874.47,-3640.95,272.871,2.54028,240,7,0,56067,0,0,1,0),
(88194,16034,533,9013,0,2858.4,-3614.76,264.47,2.73,240,7,0,56067,0,0,1,0),
(2530425,16447,533,0,0,3431.66,-3756.29,294.661,3.70719,3520,0,0,93736,0,0,0,0),
(88192,16034,533,9013,0,2801.81,-3543.9,250.296,5.08715,240,7,0,56067,0,0,1,0),
(2530426,16448,533,0,0,2735.9,-2979.28,240.526,0.257619,3520,0,0,93736,85162,0,0,0),
(2530423,16447,533,0,0,3282.6,-3884.32,294.66,3.2383,3520,0,0,93736,0,0,0,0),
(88189,16034,533,9013,0,2879.68,-3719.12,285.02,1.29,240,7,0,56067,0,0,1,0),
(2530450,16037,533,0,0,2667.08,-3601.62,261.947,3.54228,30,7,0,10283,12000,0,1,0),
(2530449,16036,533,0,0,2685.49,-3605.35,262.017,3.59726,30,7,0,10283,12000,0,1,0),
(2530448,16037,533,0,0,2698.52,-3595.09,260.794,5.14056,30,7,0,10283,12000,0,1,0),
(2530451,16036,533,0,0,2656.38,-3623.81,266.9,0.70228,30,7,0,10283,12000,0,1,0),
(2530433,16368,533,0,0,2567.03,-3590.62,267.594,3.18271,3520,0,0,110197,25680,0,0,0),
(2530454,16036,533,0,0,2796,-3619.09,255.617,0.425038,30,7,0,10283,12000,0,1,0),
(2530418,16067,533,0,0,2951.92,-3171.46,273.788,3.69294,3520,0,0,29500,0,0,0,0),
(2530452,16036,533,0,0,2684.53,-3581.42,261.356,0.289948,30,7,0,10283,12000,0,1,0),
(2530455,16036,533,0,0,2810.54,-3589.78,255.618,0.913556,30,7,0,10283,12000,0,1,0),
(2530456,16037,533,0,0,2797.3,-3571.9,252.566,0.913556,30,7,0,10283,12000,0,1,0),
(2530416,16067,533,0,0,2871.65,-3154.08,273.787,4.64502,3520,0,0,29500,0,0,0,0),
(2530417,16154,533,0,525,2947.18,-3177.15,273.788,3.49834,3520,0,0,24260,0,0,0,0),
(2530419,16448,533,0,0,3277.72,-3875.4,294.66,2.83068,3520,0,0,93736,74440,0,0,0),
(2530457,16036,533,0,0,2788.73,-3544.15,249.824,0.913556,30,7,0,10283,12000,0,1,0),
(2530453,16037,533,0,0,2778.76,-3619.62,254.668,5.11229,30,7,0,10283,12000,0,1,0),
(2530458,16036,533,0,0,2824.97,-3538.01,254.649,0.0551157,30,7,0,10283,12000,0,1,0),
(2530421,16448,533,0,0,3286.19,-3882.28,294.66,6.24716,3520,0,0,93736,22979,0,0,0),
(2530420,16448,533,0,0,3277.91,-3888,294.66,3.3569,3520,0,0,93736,43048,0,0,0),
(2530459,16036,533,0,0,2838.6,-3567.07,253.962,4.82876,30,7,0,10283,12000,0,1,0),
(2530422,16447,533,0,0,3282.28,-3879.7,294.66,2.90372,3520,0,0,93736,0,0,0,0),
(2530460,16036,533,0,0,2828.96,-3599.87,259.198,4.82876,30,7,0,10283,12000,0,1,0),
(2530709,16297,533,0,0,2859.91,-3678.87,278.124,3.8651, 30,7,0,24843,12000,0,1,0),
(2530710,16036,533,0,0,2850.26,-3697.36,282.112,3.76301,30,7,0,10283,12000,0,1,0),                                                          
(88156,16297,533,7898,0,2893.68,-3626.3,274.35,4.56,30,7,0,24843,12000,0,1,0),
(88155,16297,533,7898,0,2852.13,-3599.43,262.8,3.45,30,7,0,24843,12000,0,1,0),
(88154,16297,533,7898,0,2842.45,-3623.29,261.7,2.99,30,7,0,24843,12000,0,1,0),
(88153,16297,533,7898,0,2854.38,-3631.16,266.49,3.33,30,7,0,24843,12000,0,1,0),
(88152,16297,533,7898,0,2852.86,-3657.02,273.05,1.66,30,7,0,24843,12000,0,1,0),
(88151,16297,533,7898,0,2862.28,-3711.71,285.45,2.22,30,7,0,24843,12000,0,1,0),
(88150,16297,533,7898,0,2908.17,-3696.23,286.7,4.07,30,7,0,24843,12000,0,1,0),
(88149,16297,533,7898,0,2913.74,-3664.8,278.82,4.58,30,7,0,24843,12000,0,1,0),
(88148,16297,533,7898,0,2901.45,-3648.02,276.54,1.04,30,7,0,24843,12000,0,1,0),
(88147,16297,533,7898,0,2915.28,-3633.89,276.31,4.46,30,7,0,24843,12000,0,1,0),
(88146,16297,533,7898,0,2910.07,-3609.95,277.48,4.01,30,7,0,24843,12000,0,1,0),
(88145,16297,533,7898,0,2893.03,-3578.38,271.88,5.74,30,7,0,24843,12000,0,1,0),
(88144,16297,533,7898,0,2887.32,-3593.19,270.7,0.14,30,7,0,24843,12000,0,1,0),
(88143,16297,533,7898,0,2871.27,-3583.17,266.3,5.83,30,7,0,24843,12000,0,1,0),
(88142,16297,533,7898,0,2854.08,-3580.71,259.47,2.82,30,7,0,24843,12000,0,1,0),
(88141,16297,533,7898,0,2823.35,-3619.96,259.69,0.02,30,7,0,24843,12000,0,1,0),
(88140,16297,533,7898,0,2838.48,-3577.66,255.04,5.37,30,7,0,24843,12000,0,1,0),
(88139,16297,533,7898,0,2831.97,-3563.32,252.38,4.66,30,7,0,24843,12000,0,1,0),
(88138,16297,533,7898,0,2832.6,-3544.57,254.9,4.76,30,7,0,24843,12000,0,1,0),
(88137,16297,533,7898,0,2750.93,-3555.78,255.82,0.23,30,7,0,24843,12000,0,1,0),
(88136,16297,533,7898,0,2719.3,-3595.48,259.78,2.28,30,7,0,24843,12000,0,1,0),
(88135,16297,533,7898,0,2660.81,-3598.78,262.4,1.55,30,7,0,24843,12000,0,1,0),
(88134,16297,533,7898,0,2674.77,-3627.66,266.63,1.47,30,7,0,24843,12000,0,1,0),
(88133,16297,533,7898,0,2714.63,-3622.95,260.76,2.83,30,7,0,24843,12000,0,1,0),
(88132,16297,533,7898,0,2760.83,-3618.31,255.41,2.86,30,7,0,24843,12000,0,1,0),
(88131,16297,533,7898,0,2794.52,-3622.3,255.63,2.73,30,7,0,24843,12000,0,1,0),
(88130,16297,533,7898,0,2805.42,-3601.85,257.1,4.63,30,7,0,24843,12000,0,1,0),
(88129,16297,533,7898,0,2812.64,-3569.93,252.8,5.52,30,7,0,24843,12000,0,1,0),
(88128,16297,533,7898,0,2802.14,-3557.95,251.32,6.03,30,7,0,24843,12000,0,1,0),
(88127,16297,533,7898,0,2771.57,-3562.39,252.11,1.89,30,7,0,24843,12000,0,1,0),
(88126,16297,533,7898,0,2767.52,-3599.94,256.48,0.59,30,7,0,24843,12000,0,1,0),
(88123,16297,533,7898,0,2724.52,-3589.56,259.11,1.25,30,7,0,24843,12000,0,1,0),
(2530568,16025,533,0,0,3200.39,-3309.29,292.596,6.13411,3520,0,0,217197,0,0,0,0),
(88125,16297,533,7898,0,2745.61,-3580.18,256.65,1.29,30,7,0,24843,12000,0,1,0),
(88124,16297,533,7898,0,2739.28,-3602.42,258.33,0.91,30,7,0,24843,12000,0,1,0),
(88122,16297,533,7898,0,2715.56,-3611.95,260.57,0.18,30,7,0,24843,12000,0,1,0),
(88121,16297,533,7898,0,2695.17,-3611.18,261.97,0.87,30,7,0,24843,12000,0,1,0),
(88120,16297,533,7898,0,2677.29,-3610.61,262.73,6.2,30,7,0,24843,12000,0,1,0),
(88119,16297,533,7898,0,2671.31,-3595.84,261.9,0.21,30,7,0,24843,12000,0,1,0),
(88118,16297,533,7898,0,2678.01,-3584.88,261.73,1.06,30,7,0,24843,12000,0,1,0),
(88100,15954,533,16590,0,2675.49,-3491.24,261.53,6.12,604800,0,0,1665500,0,0,2,0),
(88117,16297,533,7898,0,2694.39,-3578.36,261.32,1.14,30,7,0,24843,12000,0,1,0),
(88099,16168,533,14710,0,2777.78,-3497.08,274.22,1.49,3520,0,0,263136,24860,0,0,0),
(88098,16168,533,14710,0,2777.35,-3483.15,274.21,4.62,3520,0,0,263136,24860,0,0,0),
(88097,16168,533,14710,0,2809.14,-3497.45,286.14,1.47,3520,0,0,263136,24860,0,0,0),
(88096,16168,533,14710,0,2808.59,-3482.06,286.13,4.64,3520,0,0,263136,24860,0,0,0),
(88095,16168,533,14710,0,2873.97,-3510.78,297.8,4.84,3520,0,0,263136,24860,0,2,0),
(88092,16168,533,14710,0,2840.33,-3481.69,297.868,5.13401,3520,0,0,263136,24860,0,0,0),
(88094,16168,533,14710,0,2848.22,-3489.6,298.04,3.09,3520,0,0,263136,24860,0,2,0),
(88093,16168,533,14710,0,2840.21,-3498.89,297.862,1.35231,3520,0,0,263136,24860,0,0,0),
(88091,16244,533,10627,0,2874.55,-3539.43,297.8,0.5,3520,0,0,93620,0,0,0,0),
(88090,16243,533,11140,0,2874.49,-3547.83,297.79,1.07,3520,0,0,140943,0,0,0,0),
(88089,16243,533,11140,0,2865.55,-3532.49,298.05,0.75,3520,0,0,140943,0,0,0,0),
(88088,16244,533,10627,0,2889.3,-3486.13,297.8,4.2,3520,0,0,93620,0,0,0,0),
(88087,16243,533,11140,0,2887.7,-3480.92,297.8,4.47,3520,0,0,140943,0,0,0,0),
(88086,16243,533,11140,0,2894.93,-3485.27,297.8,4.51,3520,0,0,140943,0,0,0,0),
(88085,16244,533,10627,0,2893.59,-3474.98,297.8,4.25,3520,0,0,93620,0,0,0,0),
(88084,16244,533,10627,0,2900.2,-3478.23,298.04,4.28,3520,0,0,93620,0,0,0,0),
(88083,16244,533,10627,0,2937.83,-3515.39,297.82,2.07,3520,0,0,93620,0,0,0,0),
(88082,16244,533,10627,0,2929.64,-3515.51,297.55,2.14,3520,0,0,93620,0,0,0,0),
(88081,16244,533,10627,0,2925.82,-3521.14,297.6,2.06,3520,0,0,93620,0,0,0,0),
(88080,16243,533,11140,0,2927.26,-3526.3,297.58,1.75,3520,0,0,140943,0,0,0,0),
(88079,16243,533,11140,0,2933.36,-3520.55,297.5,2.01,3520,0,0,140943,0,0,0,0),
(88078,16381,533,16158,0,3005.77,-3486.86,299.73,1.62,3520,0,0,19500,243400,0,0,0),
(533005,16082,533,0,0,3122.96,-3152.1,342.371,0,3600,0,0,17010,0,0,0,0),
(88928,16447,533,0,0,2884.32,-2985.22,267.604,4.63092,3520,0,0,93736,0,0,2,0),
(88927,16447,533,0,0,2934.58,-2981.35,267.604,4.89492,3520,0,0,93736,0,0,0,0),
(88926,16447,533,0,0,2932.24,-2981.26,267.604,4.98592,3520,0,0,93736,0,0,0,0),
(88925,16447,533,0,0,2938.54,-2985.85,267.604,4.75792,3520,0,0,93736,0,0,0,0),
(88924,16447,533,0,0,2935.14,-2985.83,267.594,4.75792,3520,0,0,93736,0,0,2,0),
(88919,16447,533,0,0,2675.32,-2981.46,240.536,4.6388,3520,0,0,93736,0,0,0,0),
(88918,16447,533,0,0,2672.42,-2980.3,240.536,4.6388,3520,0,0,93736,0,0,0,0),
(88917,16447,533,0,0,2671.43,-2984.63,240.536,4.6388,3520,0,0,93736,0,0,0,0),
(88916,16447,533,0,0,2674.54,-2984.97,240.536,4.6168,3520,0,0,93736,0,0,2,0),
(88915,16447,533,0,0,2724.8,-2981.1,240.536,4.8808,3520,0,0,93736,0,0,0,0),
(88914,16447,533,0,0,2722.47,-2981.01,240.536,4.9718,3520,0,0,93736,0,0,0,0),
(88913,16447,533,0,0,2728.76,-2985.6,240.536,4.7438,3520,0,0,93736,0,0,0,0),
(88912,16447,533,0,0,2725.36,-2985.58,240.526,4.7438,3520,0,0,93736,0,0,2,0),
(88896,16447,533,0,0,2531.79,-3124.69,240.536,4.532,3520,0,0,93736,0,0,0,0),
(88895,16447,533,0,0,2528.88,-3123.53,240.536,4.532,3520,0,0,93736,0,0,0,0),
(88894,16447,533,0,0,2527.89,-3127.86,240.536,4.532,3520,0,0,93736,0,0,0,0),
(88954,16447,533,0,0,3335.37,-2985.71,294.672,4.8362,3520,0,0,93736,0,0,0,0),
(88953,16447,533,0,0,3333.03,-2985.62,294.672,4.9272,3520,0,0,93736,0,0,0,0),
(88893,16447,533,0,0,2531.01,-3128.2,240.536,4.51,3520,0,0,93736,0,0,2,0),
(88952,16447,533,0,0,3339.33,-2990.21,294.672,4.6992,3520,0,0,93736,0,0,0,0),
(88951,16447,533,0,0,3335.93,-2990.19,294.662,4.6992,3520,0,0,93736,0,0,2,0),
(88949,16447,533,0,0,3429.08,-3124.85,294.671,4.635,3520,0,0,93736,0,0,0,0),
(88948,16447,533,0,0,3426.17,-3123.69,294.671,4.635,3520,0,0,93736,0,0,0,0),
(88947,16447,533,0,0,3425.18,-3128.02,294.671,4.635,3520,0,0,93736,0,0,0,0),
(88955,16447,533,0,0,3285.11,-2989.58,294.672,4.5722,3520,0,0,93736,0,0,2,0),
(88956,16447,533,0,0,3281.99,-2989.24,294.672,4.5942,3520,0,0,93736,0,0,2,0),
(88957,16447,533,0,0,3282.98,-2984.91,294.672,4.5942,3520,0,0,93736,0,0,0,0),
(88958,16447,533,0,0,3285.89,-2986.07,294.672,4.5942,3520,0,0,93736,0,0,0,0),
(88960,16447,533,0,0,3128.28,-2985.7,267.593,4.7047,3520,0,0,93736,0,0,2,0),
(88946,16447,533,0,0,3428.3,-3128.36,294.671,4.613,3520,0,0,93736,0,0,2,0),
(88945,16447,533,0,0,3478.56,-3124.49,294.671,4.877,3520,0,0,93736,0,0,0,0),
(2530717,16037,533,0,0,2678.7,-3640.19,269.576,4.74318,30,7,0,10410,0,0,1,0),
(2530711,16037,533,0,0,2857.9,-3687.22,80.0552,.26212, 30,7,0,10283,0,0,1,0),
(533499,16037,533,0,0,2786.5,-3564.93,251.451,0.28998,30,7,0,10283,0,0,1,0),
(2530712,16037,533,0,0,2881.8,-3647.76,274.819,1.3275, 30,7,0,10283,0,0,1,0),
(2530713,16037,533,0,0,2880.8,-3612.98,269.571,1.62516,30,7,0,10283,0,0,1,0),
(533498,16037,533,0,0,2786.2,-3625.69,254.442,3.04673,30,7,0,10283,0,0,1,0),
(533497,16037,533,0,0,2768.6,-3580.17,255.791,0.28605,30,7,0,10283,0,0,1,0),
(533496,16037,533,0,0,2749.5,-3552.16,256.199,1.37775,30,7,0,10283,0,0,1,0),
(533495,16037,533,0,0,2895.5,-3729.22,284.335,5.33616,30,7,0,10283,0,0,1,0);
                                                                








/*
-- Query: select * from creature_movement where id in (select guid from creature where map = 533)
-- Date: 2017-08-12 14:11
*/

INSERT INTO `creature_movement` (`id`,`point`,`position_x`,`position_y`,`position_z`,`waittime`,`script_id`,`textid1`,`textid2`,`textid3`,`textid4`,`textid5`,`emote`,`spell`,`wpguid`,`orientation`,`model1`,`model2`) 
VALUES 
(88723,1,3029.09,-3234.9,294.063,0,0,0,0,0,0,0,0,0,0,1.52068,0,0),
(88723,2,3033.92,-3204.77,294.063,0,0,0,0,0,0,0,0,0,0,1.36753,0,0),
(88723,3,3037.4,-3184.12,294.063,0,0,0,0,0,0,0,0,0,0,1.45785,0,0),
(88723,4,3039.78,-3170.66,294.063,0,0,0,0,0,0,0,0,0,0,1.39502,0,0),
(88723,5,3036.2,-3163.54,294.067,0,0,0,0,0,0,0,0,0,0,2.09009,0,0),
(88723,6,3029.53,-3161.43,294.068,0,0,0,0,0,0,0,0,0,0,2.83229,0,0),
(88723,7,3008.22,-3156.2,294.065,0,0,0,0,0,0,0,0,0,0,2.87156,0,0),
(88873,12,3433.61,-3519.23,267.592,0,0,0,0,0,0,0,0,0,0,0.860199,0,0),
(88873,11,3426.76,-3527.75,267.592,0,0,0,0,0,0,0,0,0,0,1.47438,0,0),
(88873,10,3430.05,-3541.73,267.592,0,0,0,0,0,0,0,0,0,0,2.06343,0,0),
(88873,9,3441.04,-3553.32,267.592,0,0,0,0,0,0,0,0,0,0,2.61478,0,0),
(88873,8,3460.33,-3554.62,267.592,0,0,0,0,0,0,0,0,0,0,3.20383,0,0),
(88873,7,3474.44,-3548.57,267.592,0,0,0,0,0,0,0,0,0,0,3.86592,0,0),
(88873,6,3480.21,-3531.48,267.592,0,0,0,0,0,0,0,0,0,0,4.60105,0,0),
(88873,5,3477.51,-3515.59,267.592,0,0,0,0,0,0,0,0,0,0,5.04166,0,0),
(88873,4,3467.59,-3503.92,267.592,0,0,0,0,0,0,0,0,0,0,5.74145,0,0),
(88873,3,3451.41,-3501.67,267.592,0,0,0,0,0,0,0,0,0,0,0.193398,0,0),
(88873,2,3436.64,-3511.58,267.592,0,0,0,0,0,0,0,0,0,0,0.966231,0,0),
(88873,1,3431.34,-3522.89,267.592,0,0,0,0,0,0,0,0,0,0,1.26075,0,0),
(88760,25,3453.18,-3681.7,294.662,0,0,0,0,0,0,0,0,0,0,1.56877,0,0),
(88760,24,3453.13,-3706.34,294.662,0,0,0,0,0,0,0,0,0,0,1.56877,0,0),
(88760,23,3453.09,-3725.48,294.662,0,0,0,0,0,0,0,0,0,0,1.56877,0,0),
(88760,22,3453.07,-3733.67,294.662,0,0,0,0,0,0,0,0,0,0,1.56877,0,0),
(88760,21,3452.67,-3737.5,294.662,0,0,0,0,0,0,0,0,0,0,4.70644,0,0),
(88760,20,3452.83,-3710.16,294.662,0,0,0,0,0,0,0,0,0,0,4.70644,0,0),
(88760,19,3452.94,-3692.14,294.662,0,0,0,0,0,0,0,0,0,0,4.70644,0,0),
(88760,18,3453.05,-3674.11,293.76,0,0,0,0,0,0,0,0,0,0,4.70644,0,0),
(88760,17,3453.12,-3662.63,288.23,0,0,0,0,0,0,0,0,0,0,4.70644,0,0),
(88760,16,3453.2,-3648.95,282.002,0,0,0,0,0,0,0,0,0,0,4.70644,0,0),
(88760,15,3453.33,-3627.63,270.817,0,0,0,0,0,0,0,0,0,0,4.70644,0,0),
(88760,14,3453.55,-3589.91,267.594,0,0,0,0,0,0,0,0,0,0,4.70644,0,0),
(88760,13,3453.68,-3568.59,267.594,0,0,0,0,0,0,0,0,0,0,4.70644,0,0),
(88760,12,3453.79,-3550.01,267.594,0,0,0,0,0,0,0,0,0,0,4.69073,0,0),
(88760,11,3454.22,-3532.38,267.594,0,0,0,0,0,0,0,0,0,0,4.73785,0,0),
(88760,10,3454.15,-3529.62,267.594,0,0,0,0,0,0,0,0,0,0,1.56484,0,0),
(88760,9,3454.07,-3543.3,267.594,0,0,0,0,0,0,0,0,0,0,1.56484,0,0),
(88760,8,3453.97,-3560.28,267.594,0,0,0,0,0,0,0,0,0,0,1.56484,0,0),
(88760,7,3453.87,-3576.17,267.594,0,0,0,0,0,0,0,0,0,0,1.56484,0,0),
(88760,6,3453.77,-3593.67,267.594,0,0,0,0,0,0,0,0,0,0,1.56484,0,0),
(88760,5,3453.68,-3608.44,267.595,0,0,0,0,0,0,0,0,0,0,1.56484,0,0),
(88760,4,3453.58,-3625.38,269.631,0,0,0,0,0,0,0,0,0,0,1.56484,0,0),
(88760,3,3453.46,-3645.05,279.954,0,0,0,0,0,0,0,0,0,0,1.56484,0,0),
(88760,2,3453.36,-3661.46,287.889,0,0,0,0,0,0,0,0,0,0,1.56484,0,0),
(88760,1,3453.28,-3675.14,294.257,0,0,0,0,0,0,0,0,0,0,1.56484,0,0),
(88867,10,3468.72,-3760.42,294.661,0,0,0,0,0,0,0,0,0,0,3.52991,0,0),
(88867,9,3481.4,-3743.88,294.661,0,0,0,0,0,0,0,0,0,0,4.56192,0,0),
(88867,8,3478.44,-3726.7,294.661,0,0,0,0,0,0,0,0,0,0,5.22402,0,0),
(88867,7,3465.04,-3715.66,294.661,0,0,0,0,0,0,0,0,0,0,5.92145,0,0),
(88867,6,3447.58,-3713.86,294.661,0,0,0,0,0,0,0,0,0,0,0.189614,0,0),
(88867,5,3432.83,-3724.37,294.661,0,0,0,0,0,0,0,0,0,0,1.07319,0,0),
(88867,4,3427.82,-3741.3,294.661,0,0,0,0,0,0,0,0,0,0,1.55149,0,0),
(88867,3,3432.71,-3755.32,294.661,0,0,0,0,0,0,0,0,0,0,2.21359,0,0),
(88867,2,3452.88,-3764.58,294.661,0,0,0,0,0,0,0,0,0,0,3.42231,0,0),
(88867,1,3465.95,-3760.65,294.661,0,0,0,0,0,0,0,0,0,0,3.76632,0,0),
(88933,9,3472.07,-3350.24,267.593,0,0,0,0,0,0,0,0,0,0,4.1469,0,0),
(88933,8,3476.49,-3333.77,267.593,0,0,0,0,0,0,0,0,0,0,4.70061,0,0),
(88933,7,3476.65,-3320.65,267.593,0,0,0,0,0,0,0,0,0,0,2.09937,0,0),
(88933,6,3483.8,-3338.74,267.593,0,0,0,0,0,0,0,0,0,0,1.76715,0,0),
(88933,5,3480.51,-3352.69,267.592,0,0,0,0,0,0,0,0,0,0,1.06736,0,0),
(88933,4,3470.93,-3362.27,267.592,0,0,0,0,0,0,0,0,0,0,0.697435,0,0),
(88933,3,3463.4,-3368.54,267.581,0,0,0,0,0,0,0,0,0,0,3.76677,0,0),
(88933,2,3474.14,-3353.15,267.592,0,0,0,0,0,0,0,0,0,0,4.5773,0,0),
(88933,1,3476.67,-3344.27,267.592,0,0,0,0,0,0,0,0,0,0,4.32676,0,0),
(88938,11,3423.93,-3346,267.591,0,0,0,0,0,0,0,0,0,0,5.14246,0,0),
(88938,10,3422.6,-3332.71,267.591,0,0,0,0,0,0,0,0,0,0,4.55341,0,0),
(88938,9,3431.56,-3320.31,267.591,0,0,0,0,0,0,0,0,0,0,3.78058,0,0),
(88938,8,3440.77,-3313.46,267.591,0,0,0,0,0,0,0,0,0,0,0.619348,0,0),
(88938,7,3426.11,-3325.71,267.591,0,0,0,0,0,0,0,0,0,0,1.17384,0,0),
(88938,6,3424.48,-3338.5,267.591,0,0,0,0,0,0,0,0,0,0,1.65215,0,0),
(88938,5,3427.65,-3349.38,267.591,0,0,0,0,0,0,0,0,0,0,2.05741,0,0),
(88938,4,3435.05,-3358.7,267.591,0,0,0,0,0,0,0,0,0,0,2.42498,0,0),
(88938,3,3444.48,-3367.74,267.585,0,0,0,0,0,0,0,0,0,0,5.70794,0,0),
(88938,2,3429.37,-3353.4,267.592,0,0,0,0,0,0,0,0,0,0,5.19194,0,0),
(88938,1,3425.98,-3343.1,267.592,0,0,0,0,0,0,0,0,0,0,4.89741,0,0),
(88763,18,3452.95,-3191.45,294.661,0,0,0,0,0,0,0,0,0,0,4.76704,0,0),
(88763,17,3454.18,-3132.03,294.661,0,0,0,0,0,0,0,0,0,0,1.55476,0,0),
(88763,16,3453.7,-3161.57,294.661,0,0,0,0,0,0,0,0,0,0,1.55476,0,0),
(88763,15,3452.7,-3189.43,294.661,0,0,0,0,0,0,0,0,0,0,1.48172,0,0),
(88763,14,3451.67,-3200.87,290.757,0,0,0,0,0,0,0,0,0,0,1.48172,0,0),
(88763,13,3451.68,-3222.69,280.483,0,0,0,0,0,0,0,0,0,0,1.63016,0,0),
(88763,12,3452.62,-3238.51,272.177,0,0,0,0,0,0,0,0,0,0,1.63016,0,0),
(88763,11,3453.4,-3268.53,267.594,0,0,0,0,0,0,0,0,0,0,1.51942,0,0),
(88763,10,3452.7,-3292.02,267.594,0,0,0,0,0,0,0,0,0,0,1.6278,0,0),
(88763,9,3452.31,-3315.51,267.594,0,0,0,0,0,0,0,0,0,0,1.51706,0,0),
(88763,8,3452.47,-3339.56,267.594,0,0,0,0,0,0,0,0,0,0,4.80631,0,0),
(88763,7,3452.32,-3306.76,267.594,0,0,0,0,0,0,0,0,0,0,4.69557,0,0),
(88763,6,3452.58,-3291.43,267.594,0,0,0,0,0,0,0,0,0,0,4.69557,0,0),
(88763,5,3452.86,-3275.02,267.594,0,0,0,0,0,0,0,0,0,0,4.69557,0,0),
(88763,4,3453.12,-3259.16,267.595,0,0,0,0,0,0,0,0,0,0,4.69557,0,0),
(88763,3,3453.43,-3241.11,270.819,0,0,0,0,0,0,0,0,0,0,4.69557,0,0),
(88763,2,3453.71,-3224.13,279.726,0,0,0,0,0,0,0,0,0,0,4.69557,0,0),
(88763,1,3453.95,-3209.92,287.182,0,0,0,0,0,0,0,0,0,0,4.69557,0,0),
(88942,10,3480.18,-3133.08,294.661,0,0,0,0,0,0,0,0,0,0,4.38455,0,0),
(88942,9,3479.11,-3118.8,294.661,0,0,0,0,0,0,0,0,0,0,5.08434,0,0),
(88942,8,3474.46,-3107.13,294.661,0,0,0,0,0,0,0,0,0,0,5.73544,0,0),
(88942,7,3464.17,-3103.53,294.661,0,0,0,0,0,0,0,0,0,0,2.58049,0,0),
(88942,6,3479.41,-3119.09,294.661,0,0,0,0,0,0,0,0,0,0,2.02914,0,0),
(88942,5,3479.72,-3133.39,294.661,0,0,0,0,0,0,0,0,0,0,1.29401,0,0),
(88942,4,3473.71,-3144.19,294.661,0,0,0,0,0,0,0,0,0,0,0.851045,0,0),
(88942,3,3465.76,-3153.19,294.661,0,0,0,0,0,0,0,0,0,0,4.03191,0,0),
(88942,2,3474.03,-3141.07,294.661,0,0,0,0,0,0,0,0,0,0,4.25339,0,0),
(88942,1,3477.48,-3132.45,294.661,0,0,0,0,0,0,0,0,0,0,4.40183,0,0),
(88946,11,3426.28,-3138.91,294.661,0,0,0,0,0,0,0,0,0,0,5.0113,0,0),
(88946,10,3422.67,-3123.5,294.661,0,0,0,0,0,0,0,0,0,0,4.44738,0,0),
(88946,9,3433.38,-3111.83,294.661,0,0,0,0,0,0,0,0,0,0,3.67455,0,0),
(88946,8,3445.16,-3104.88,294.661,0,0,0,0,0,0,0,0,0,0,0.269852,0,0),
(88946,7,3433.59,-3108.17,294.661,0,0,0,0,0,0,0,0,0,0,0.773292,0,0),
(88946,6,3426.44,-3121.8,294.661,0,0,0,0,0,0,0,0,0,0,1.40004,0,0),
(88946,5,3427.92,-3135.63,294.661,0,0,0,0,0,0,0,0,0,0,1.91369,0,0),
(88946,4,3435.17,-3147.69,294.661,0,0,0,0,0,0,0,0,0,0,2.24591,0,0),
(88946,3,3443.7,-3158.34,294.661,0,0,0,0,0,0,0,0,0,0,5.74486,0,0),
(88946,2,3433.29,-3148.97,294.661,0,0,0,0,0,0,0,0,0,0,5.3396,0,0),
(88946,1,3427.14,-3137.51,294.661,0,0,0,0,0,0,0,0,0,0,5.04507,0,0),
(88951,12,3334.11,-3000.3,294.661,0,0,0,0,0,0,0,0,0,0,4.24319,0,0),
(88951,11,3338.36,-2986.38,294.661,0,0,0,0,0,0,0,0,0,0,4.64846,0,0),
(88951,10,3334.18,-2972.63,294.661,0,0,0,0,0,0,0,0,0,0,5.27285,0,0),
(88951,9,3329.23,-2964.75,294.661,0,0,0,0,0,0,0,0,0,0,2.52396,0,0),
(88951,8,3336.32,-2975.46,294.661,0,0,0,0,0,0,0,0,0,0,1.93491,0,0),
(88951,7,3338.75,-2995.58,294.661,0,0,0,0,0,0,0,0,0,0,1.4189,0,0),
(88951,6,3332.47,-3007.97,294.661,0,0,0,0,0,0,0,0,0,0,0.82985,0,0),
(88951,5,3321.84,-3014.35,294.661,0,0,0,0,0,0,0,0,0,0,0.386885,0,0),
(88951,4,3310.91,-3018.99,294.661,0,0,0,0,0,0,0,0,0,0,3.39889,0,0),
(88951,3,3322.14,-3013.68,294.661,0,0,0,0,0,0,0,0,0,0,3.80415,0,0),
(88951,2,3332.33,-3002.57,294.661,0,0,0,0,0,0,0,0,0,0,4.20942,0,0),
(88951,1,3336.56,-2993.12,294.661,0,0,0,0,0,0,0,0,0,0,4.3932,0,0),
(88956,11,3279.52,-2991.54,294.661,0,0,0,0,0,0,0,0,0,0,4.77098,0,0),
(88956,10,3283.1,-2975.32,294.661,0,0,0,0,0,0,0,0,0,0,4.21963,0,0),
(88956,9,3290.78,-2967.73,294.661,0,0,0,0,0,0,0,0,0,0,3.74132,0,0),
(88956,8,3297.11,-2963.4,294.661,0,0,0,0,0,0,0,0,0,0,0.780371,0,0),
(88956,7,3291.29,-2969.17,294.661,0,0,0,0,0,0,0,0,0,0,0.780371,0,0),
(88956,6,3282.34,-2981.37,294.661,0,0,0,0,0,0,0,0,0,0,1.14794,0,0),
(88956,5,3278.04,-2994.88,294.661,0,0,0,0,0,0,0,0,0,0,1.75269,0,0),
(88956,4,3284.19,-3006.12,294.661,0,0,0,0,0,0,0,0,0,0,2.34174,0,0),
(88956,3,3291.44,-3013.58,294.661,0,0,0,0,0,0,0,0,0,0,5.47548,0,0),
(88956,2,3282.31,-3000.69,294.661,0,0,0,0,0,0,0,0,0,0,4.94848,0,0),
(88956,1,3281.8,-2990.41,294.661,0,0,0,0,0,0,0,0,0,0,4.65396,0,0),
(88766,11,3246.63,-2984.85,294.647,0,0,0,0,0,0,0,0,0,0,6.24831,0,0),
(88766,10,3228.09,-2985.87,286.443,0,0,0,0,0,0,0,0,0,0,0.075865,0,0),
(88766,9,3199.68,-2987.07,271.533,0,0,0,0,0,0,0,0,0,0,0.002823,0,0),
(88766,8,3163.6,-2987.17,267.594,0,0,0,0,0,0,0,0,0,0,0.002823,0,0),
(88766,7,3126.62,-2984.61,267.594,0,0,0,0,0,0,0,0,0,0,0.024028,0,0),
(88766,6,3099.86,-2985.47,267.594,0,0,0,0,0,0,0,0,0,0,3.11457,0,0),
(88766,5,3137.56,-2985.73,267.594,0,0,0,0,0,0,0,0,0,0,3.22531,0,0),
(88766,4,3156.64,-2985.09,267.594,0,0,0,0,0,0,0,0,0,0,3.04153,0,0),
(88766,3,3175.72,-2986.3,267.595,0,0,0,0,0,0,0,0,0,0,3.15227,0,0),
(88766,2,3203.56,-2987.31,273.571,0,0,0,0,0,0,0,0,0,0,3.14991,0,0),
(88766,1,3233.52,-2985.82,288.33,0,0,0,0,0,0,0,0,0,0,3.11457,0,0),
(88960,9,3126.55,-2988.05,267.593,0,0,0,0,0,0,0,0,0,0,4.59819,0,0),
(88960,8,3128.19,-2973.37,267.593,0,0,0,0,0,0,0,0,0,0,5.2108,0,0),
(88960,7,3116.45,-2963.54,267.593,0,0,0,0,0,0,0,0,0,0,5.91059,0,0),
(88960,6,3103.47,-2957.83,267.593,0,0,0,0,0,0,0,0,0,0,2.82398,0,0),
(88960,5,3118.8,-2966.04,267.593,0,0,0,0,0,0,0,0,0,0,2.49411,0,0),
(88960,4,3126.94,-2976.64,267.593,0,0,0,0,0,0,0,0,0,0,1.9781,0,0),
(88960,3,3126.96,-2991.93,267.593,0,0,0,0,0,0,0,0,0,0,1.24297,0,0),
(88960,2,3123.43,-3002.3,267.593,0,0,0,0,0,0,0,0,0,0,4.10967,0,0),
(88960,1,3128.02,-2990.58,267.593,0,0,0,0,0,0,0,0,0,0,4.38064,0,0),
(88965,11,3073.66,-2992.55,267.593,0,0,0,0,0,0,0,0,0,0,4.74742,0,0),
(88965,10,3073.41,-2976.91,267.587,0,0,0,0,0,0,0,0,0,0,4.1945,0,0),
(88965,9,3080.44,-2964.56,267.592,0,0,0,0,0,0,0,0,0,0,0.88404,0,0),
(88965,8,3072.23,-2977.35,267.59,0,0,0,0,0,0,0,0,0,0,1.17857,0,0),
(88965,7,3070.95,-2990.75,267.592,0,0,0,0,0,0,0,0,0,0,1.65687,0,0),
(88965,6,3077.1,-3003.15,267.593,0,0,0,0,0,0,0,0,0,0,2.28362,0,0),
(88965,5,3087.54,-3011.82,267.593,0,0,0,0,0,0,0,0,0,0,2.57815,0,0),
(88965,4,3096.77,-3017.66,267.593,0,0,0,0,0,0,0,0,0,0,6.05443,0,0),
(88965,3,3087.7,-3012.88,267.593,0,0,0,0,0,0,0,0,0,0,5.61382,0,0),
(88965,2,3077.1,-3004.29,267.593,0,0,0,0,0,0,0,0,0,0,5.17243,0,0),
(88965,1,3073,-2991.38,267.594,0,0,0,0,0,0,0,0,0,0,4.84021,0,0),
(2530415,16,2538.98,-3249.64,255.639,0,0,0,0,0,0,0,0,0,0,3.08719,0,0),
(2530415,15,2556.96,-3256.29,259.127,0,0,0,0,0,0,0,0,0,0,1.71274,0,0),
(2530415,14,2555.26,-3278.94,267.594,0,0,0,0,0,0,0,0,0,0,4.63992,0,0),
(2530415,13,2559.06,-3257.11,259.558,0,0,0,0,0,0,0,0,0,0,4.31005,0,0),
(2530415,12,2572.25,-3243.45,252.393,0,0,0,0,0,0,0,0,0,0,4.73967,0,0),
(2530415,11,2570.02,-3228.73,244.668,0,0,0,0,0,0,0,0,0,0,5.32714,0,0),
(2530415,10,2553.07,-3208.15,240.525,0,0,0,0,0,0,0,0,0,0,4.69333,0,0),
(2530415,9,2551.44,-3180.9,240.525,0,0,0,0,0,0,0,0,0,0,5.80938,0,0),
(2530415,8,2537.45,-3170.91,240.525,0,0,0,0,0,0,0,0,0,0,4.58258,0,0),
(2530415,7,2539.35,-3161.31,240.525,0,0,0,0,0,0,0,0,0,0,3.25762,0,0),
(2530415,6,2555.25,-3170.51,240.525,0,0,0,0,0,0,0,0,0,0,1.66247,0,0),
(2530415,5,2554.97,-3185.18,240.525,0,0,0,0,0,0,0,0,0,0,1.40329,0,0),
(2530415,4,2548.26,-3199.27,240.525,0,0,0,0,0,0,0,0,0,0,0.493798,0,0),
(2530415,3,2536.15,-3219.06,240.525,0,0,0,0,0,0,0,0,0,0,1.63498,0,0),
(2530415,2,2536.33,-3238.65,249.868,0,0,0,0,0,0,0,0,0,0,1.4135,0,0),
(2530415,1,2537.22,-3250.38,256.023,0,0,0,0,0,0,0,0,0,0,4.76322,0,0),
(88893,12,2530.23,-3135.94,240.525,0,0,0,0,0,0,0,0,0,0,5.0499,0,0),
(88893,11,2528.47,-3123.15,240.525,0,0,0,0,0,0,0,0,0,0,4.60929,0,0),
(88893,10,2529.86,-3110.63,240.525,0,0,0,0,0,0,0,0,0,0,4.15611,0,0),
(88893,9,2544.59,-3102.62,240.525,0,0,0,0,0,0,0,0,0,0,3.31024,0,0),
(88893,8,2556.46,-3100.6,240.525,0,0,0,0,0,0,0,0,0,0,0.266821,0,0),
(88893,7,2538.97,-3107.86,240.525,0,0,0,0,0,0,0,0,0,0,0.596689,0,0),
(88893,6,2528.41,-3119.31,240.525,0,0,0,0,0,0,0,0,0,0,1.03965,0,0),
(88893,5,2525.74,-3132.4,240.525,0,0,0,0,0,0,0,0,0,0,1.6287,0,0),
(88893,4,2532.52,-3144.99,240.525,0,0,0,0,0,0,0,0,0,0,2.36384,0,0),
(88893,3,2541.61,-3153.72,240.525,0,0,0,0,0,0,0,0,0,0,5.48579,0,0),
(88893,2,2533.53,-3145.56,240.525,0,0,0,0,0,0,0,0,0,0,4.99492,0,0),
(88893,1,2531.21,-3133.79,240.525,0,0,0,0,0,0,0,0,0,0,4.81114,0,0),
(88889,8,2583.55,-3131.7,240.525,0,0,0,0,0,0,0,0,0,0,4.52447,0,0),
(88889,7,2583.07,-3112.18,240.525,0,0,0,0,0,0,0,0,0,0,1.73395,0,0),
(88889,6,2583.74,-3130.04,240.525,0,0,0,0,0,0,0,0,0,0,1.40172,0,0),
(88889,5,2580.14,-3145.81,240.525,0,0,0,0,0,0,0,0,0,0,0.775761,0,0),
(88889,4,2569.45,-3153.19,240.525,0,0,0,0,0,0,0,0,0,0,0.445893,0,0),
(88889,3,2563.04,-3156.26,240.525,0,0,0,0,0,0,0,0,0,0,3.68173,0,0),
(88889,2,2576.31,-3145.29,240.525,0,0,0,0,0,0,0,0,0,0,4.12234,0,0),
(88889,1,2581.59,-3133.94,240.525,0,0,0,0,0,0,0,0,0,0,4.34382,0,0),
(88924,9,2933.21,-2994.91,267.59,0,0,0,0,0,0,0,0,0,0,4.28335,0,0),
(88924,8,2937.21,-2983.1,267.594,0,0,0,0,0,0,0,0,0,0,4.57787,0,0),
(88924,7,2934.18,-2970.11,267.593,0,0,0,0,0,0,0,0,0,0,5.20462,0,0),
(88924,6,2923.47,-2961.24,267.593,0,0,0,0,0,0,0,0,0,0,5.79367,0,0),
(88924,5,2912.87,-2955.6,267.593,0,0,0,0,0,0,0,0,0,0,2.99451,0,0),
(88924,4,2926.28,-2959.82,267.593,0,0,0,0,0,0,0,0,0,0,2.66464,0,0),
(88924,3,2934.83,-2970.05,267.593,0,0,0,0,0,0,0,0,0,0,2.00255,0,0),
(88924,2,2936.15,-2982.29,267.593,0,0,0,0,0,0,0,0,0,0,1.4512,0,0),
(88924,1,2933.4,-2994.59,267.588,0,0,0,0,0,0,0,0,0,0,4.33833,0,0),
(88929,10,2879.49,-2990.55,267.593,0,0,0,0,0,0,0,0,0,0,1.79049,0,0),
(88929,9,2884.64,-3001.85,267.593,0,0,0,0,0,0,0,0,0,0,2.15805,0,0),
(88929,8,2894.53,-3010.25,267.593,0,0,0,0,0,0,0,0,0,0,2.56332,0,0),
(88929,7,2910.69,-3014.61,267.593,0,0,0,0,0,0,0,0,0,0,3.00628,0,0),
(88929,6,2923.19,-3011.85,267.593,0,0,0,0,0,0,0,0,0,0,3.63303,0,0),
(88929,5,2931.51,-3005.76,267.593,0,0,0,0,0,0,0,0,0,0,0.68386,0,0),
(88929,4,2917.47,-3013.61,267.593,0,0,0,0,0,0,0,0,0,0,0.13251,0,0),
(88929,3,2901.45,-3012.44,267.593,0,0,0,0,0,0,0,0,0,0,5.89969,0,0),
(88929,2,2888.56,-3003.69,267.593,0,0,0,0,0,0,0,0,0,0,5.45908,0,0),
(88929,1,2880.38,-2994.86,267.593,0,0,0,0,0,0,0,0,0,0,5.45908,0,0),
(88912,8,2728.56,-2987.97,240.525,0,0,0,0,0,0,0,0,0,0,1.49989,0,0),
(88912,7,2723.22,-3003.63,240.525,0,0,0,0,0,0,0,0,0,0,0.948537,0,0),
(88912,6,2718,-3010.64,240.525,0,0,0,0,0,0,0,0,0,0,0.359488,0,0),
(88912,5,2704.69,-3013.66,240.525,0,0,0,0,0,0,0,0,0,0,0.175705,0,0),
(88912,4,2696.08,-3015.19,240.525,0,0,0,0,0,0,0,0,0,0,3.13273,0,0),
(88912,3,2715.04,-3012,240.525,0,0,0,0,0,0,0,0,0,0,3.68643,0,0),
(88912,2,2723.36,-3002.26,240.525,0,0,0,0,0,0,0,0,0,0,4.27548,0,0),
(88912,1,2725.94,-2992.28,240.525,0,0,0,0,0,0,0,0,0,0,4.58807,0,0),
(88916,10,2672.76,-2988.89,240.524,0,0,0,0,0,0,0,0,0,0,4.52367,0,0),
(88916,9,2676.18,-2971.19,240.524,0,0,0,0,0,0,0,0,0,0,4.20559,0,0),
(88916,8,2683.62,-2959.84,240.524,0,0,0,0,0,0,0,0,0,0,3.49244,0,0),
(88916,7,2701.06,-2958.52,240.526,0,0,0,0,0,0,0,0,0,0,2.86569,0,0),
(88916,6,2714.23,-2962.25,240.526,0,0,0,0,0,0,0,0,0,0,5.81487,0,0),
(88916,5,2698.66,-2957.91,240.526,0,0,0,0,0,0,0,0,0,0,6.18243,0,0),
(88916,4,2686.09,-2961.1,240.526,0,0,0,0,0,0,0,0,0,0,0.377554,0,0),
(88916,3,2675.76,-2970.29,240.526,0,0,0,0,0,0,0,0,0,0,1.0043,0,0),
(88916,2,2674,-2983.46,240.526,0,0,0,0,0,0,0,0,0,0,1.70409,0,0),
(88916,1,2675.09,-2991.58,240.526,0,0,0,0,0,0,0,0,0,0,4.72002,0,0),
(88885,11,2526.91,-3344.19,267.593,0,0,0,0,0,0,0,0,0,0,5.10409,0,0),
(88885,10,2527.23,-3326.93,267.593,0,0,0,0,0,0,0,0,0,0,4.33125,0,0),
(88885,9,2535.08,-3318.14,267.593,0,0,0,0,0,0,0,0,0,0,3.74221,0,0),
(88885,8,2542.77,-3312.88,267.593,0,0,0,0,0,0,0,0,0,0,0.694861,0,0),
(88885,7,2534.64,-3320.91,267.593,0,0,0,0,0,0,0,0,0,0,0.916344,0,0),
(88885,6,2527.98,-3332.67,267.593,0,0,0,0,0,0,0,0,0,0,1.24857,0,0),
(88885,5,2528.24,-3346.07,267.593,0,0,0,0,0,0,0,0,0,0,1.79992,0,0),
(88885,4,2534.51,-3357.38,267.593,0,0,0,0,0,0,0,0,0,0,2.24288,0,0),
(88885,3,2541.88,-3366.16,267.593,0,0,0,0,0,0,0,0,0,0,5.50228,0,0),
(88885,2,2533.55,-3355.44,267.593,0,0,0,0,0,0,0,0,0,0,5.20776,0,0),
(88885,1,2529.33,-3344.85,267.593,0,0,0,0,0,0,0,0,0,0,4.95093,0,0),
(88880,12,2581.98,-3346.22,267.593,0,0,0,0,0,0,0,0,0,0,4.25115,0,0),
(88880,11,2584.38,-3332.55,267.593,0,0,0,0,0,0,0,0,0,0,4.80485,0,0),
(88880,10,2579.5,-3321.22,267.593,0,0,0,0,0,0,0,0,0,0,5.32086,0,0),
(88880,9,2572.94,-3311.8,267.593,0,0,0,0,0,0,0,0,0,0,2.4463,0,0),
(88880,8,2579.97,-3320.84,267.593,0,0,0,0,0,0,0,0,0,0,2.18948,0,0),
(88880,7,2583.63,-3331.04,267.593,0,0,0,0,0,0,0,0,0,0,1.78421,0,0),
(88880,6,2583.89,-3342.46,267.593,0,0,0,0,0,0,0,0,0,0,1.52503,0,0),
(88880,5,2583.03,-3353.33,267.593,0,0,0,0,0,0,0,0,0,0,1.00824,0,0),
(88880,4,2572.85,-3361.27,267.593,0,0,0,0,0,0,0,0,0,0,0.492229,0,0),
(88880,3,2561.75,-3367.23,267.592,0,0,0,0,0,0,0,0,0,0,3.50816,0,0),
(88880,2,2572.9,-3360.61,267.592,0,0,0,0,0,0,0,0,0,0,3.87573,0,0),
(88880,1,2581.06,-3351.14,267.594,0,0,0,0,0,0,0,0,0,0,4.0815,0,0),
(89102,11,2526.32,-3533.56,267.593,0,0,0,0,0,0,0,0,0,0,4.78208,0,0),
(89102,10,2529.05,-3516.21,267.593,0,0,0,0,0,0,0,0,0,0,4.22837,0,0),
(89102,9,2538.92,-3507.14,267.593,0,0,0,0,0,0,0,0,0,0,3.67467,0,0),
(89102,8,2550.28,-3502.19,267.593,0,0,0,0,0,0,0,0,0,0,0.352431,0,0),
(89102,7,2538.53,-3507.9,267.593,0,0,0,0,0,0,0,0,0,0,0.571557,0,0),
(89102,6,2529.27,-3518.53,267.593,0,0,0,0,0,0,0,0,0,0,0.939124,0,0),
(89102,5,2525.51,-3530.83,267.593,0,0,0,0,0,0,0,0,0,0,1.49047,0,0),
(89102,4,2530.39,-3544.31,267.593,0,0,0,0,0,0,0,0,0,0,2.19026,0,0),
(89102,3,2538.01,-3554.99,267.593,0,0,0,0,0,0,0,0,0,0,5.37505,0,0),
(89102,2,2531.68,-3543.67,267.593,0,0,0,0,0,0,0,0,0,0,5.00749,0,0),
(89102,1,2529.99,-3531.77,267.593,0,0,0,0,0,0,0,0,0,0,4.8237,0,0),
(89098,11,2581.3,-3542.21,267.593,0,0,0,0,0,0,0,0,0,0,4.32575,0,0),
(89098,10,2581.95,-3523.6,267.592,0,0,0,0,0,0,0,0,0,0,5.02554,0,0),
(89098,9,2577.34,-3511.32,267.592,0,0,0,0,0,0,0,0,0,0,2.1824,0,0),
(89098,8,2584.97,-3522.63,267.594,0,0,0,0,0,0,0,0,0,0,1.8007,0,0),
(89098,7,2585.55,-3535.58,267.594,0,0,0,0,0,0,0,0,0,0,1.43078,0,0),
(89098,6,2578.23,-3543.53,267.593,0,0,0,0,0,0,0,0,0,0,0.694858,0,0),
(89098,5,2567.15,-3553.27,267.593,0,0,0,0,0,0,0,0,0,0,0.711351,0,0),
(89098,4,2555.58,-3557.73,267.593,0,0,0,0,0,0,0,0,0,0,3.27568,0,0),
(89098,3,2565.31,-3556.33,267.593,0,0,0,0,0,0,0,0,0,0,3.63146,0,0),
(89098,2,2575.25,-3545.79,267.593,0,0,0,0,0,0,0,0,0,0,4.14747,0,0),
(89098,1,2579.61,-3536.42,267.593,0,0,0,0,0,0,0,0,0,0,4.43571,0,0),
(89120,11,2527.65,-3743.53,294.66,0,0,0,0,0,0,0,0,0,0,4.67133,0,0),
(89120,10,2531.07,-3723.82,294.66,0,0,0,0,0,0,0,0,0,0,4.26607,0,0),
(89120,9,2540.25,-3714.75,294.66,0,0,0,0,0,0,0,0,0,0,3.75006,0,0),
(89120,8,2551.89,-3710.45,294.66,0,0,0,0,0,0,0,0,0,0,3.34322,0,0),
(89120,7,2564.82,-3711.47,294.66,0,0,0,0,0,0,0,0,0,0,6.2649,0,0),
(89120,6,2551.17,-3711.31,294.66,0,0,0,0,0,0,0,0,0,0,0.38777,0,0),
(89120,5,2539.26,-3720.5,294.66,0,0,0,0,0,0,0,0,0,0,0.830735,0,0),
(89120,4,2529.21,-3732.04,294.66,0,0,0,0,0,0,0,0,0,0,1.39465,0,0),
(89120,3,2528.98,-3745.03,294.66,0,0,0,0,0,0,0,0,0,0,1.72687,0,0),
(89120,2,2530.68,-3755.82,294.66,0,0,0,0,0,0,0,0,0,0,4.83705,0,0),
(89120,1,2530.15,-3745.47,294.66,0,0,0,0,0,0,0,0,0,0,4.64541,0,0),
(89116,9,2581.19,-3746.99,294.66,0,0,0,0,0,0,0,0,0,0,4.42393,0,0),
(89116,8,2585.02,-3728.83,294.66,0,0,0,0,0,0,0,0,0,0,1.63184,0,0),
(89116,7,2581.52,-3745.8,294.66,0,0,0,0,0,0,0,0,0,0,1.26427,0,0),
(89116,6,2577.91,-3756.69,294.66,0,0,0,0,0,0,0,0,0,0,0.772616,0,0),
(89116,5,2568.7,-3763.5,294.66,0,0,0,0,0,0,0,0,0,0,0.588832,0,0),
(89116,4,2560.99,-3768.64,294.66,0,0,0,0,0,0,0,0,0,0,3.60869,0,0),
(89116,3,2571.11,-3763.26,294.66,0,0,0,0,0,0,0,0,0,0,4.03752,0,0),
(89116,2,2577,-3754.09,294.66,0,0,0,0,0,0,0,0,0,0,4.18596,0,0),
(89116,1,2580.91,-3745.67,294.66,0,0,0,0,0,0,0,0,0,0,4.36974,0,0),
(89112,13,2669.23,-3890.17,294.66,0,0,0,0,0,0,0,0,0,0,4.91716,0,0),
(89112,12,2673.7,-3873.18,294.66,0,0,0,0,0,0,0,0,0,0,4.20638,0,0),
(89112,11,2679.62,-3863.86,294.66,0,0,0,0,0,0,0,0,0,0,0.801673,0,0),
(89112,10,2674.58,-3871.58,294.66,0,0,0,0,0,0,0,0,0,0,1.0962,0,0),
(89112,9,2669.23,-3882.36,294.66,0,0,0,0,0,0,0,0,0,0,1.53995,0,0),
(89112,8,2671.42,-3894.12,294.66,0,0,0,0,0,0,0,0,0,0,1.83447,0,0),
(89112,7,2675.91,-3903.39,294.66,0,0,0,0,0,0,0,0,0,0,2.45886,0,0),
(89112,6,2684.44,-3910.26,294.66,0,0,0,0,0,0,0,0,0,0,2.77931,0,0),
(89112,5,2695.56,-3914.75,294.66,0,0,0,0,0,0,0,0,0,0,5.94446,0,0),
(89112,4,2688.76,-3911.34,294.66,0,0,0,0,0,0,0,0,0,0,5.76068,0,0),
(89112,3,2679.89,-3905.95,294.66,0,0,0,0,0,0,0,0,0,0,5.37897,0,0),
(89112,2,2673.13,-3897.37,294.66,0,0,0,0,0,0,0,0,0,0,5.44181,0,0),
(89112,1,2670.42,-3884.31,294.66,0,0,0,0,0,0,0,0,0,0,4.92737,0,0),
(89107,9,2725.86,-3891.83,294.66,0,0,0,0,0,0,0,0,0,0,4.13805,0,0),
(89107,8,2728.05,-3875.2,294.66,0,0,0,0,0,0,0,0,0,0,4.98393,0,0),
(89107,7,2723.05,-3860.22,294.66,0,0,0,0,0,0,0,0,0,0,2.04654,0,0),
(89107,6,2728.07,-3872.32,294.66,0,0,0,0,0,0,0,0,0,0,1.82505,0,0),
(89107,5,2725.31,-3890.52,294.66,0,0,0,0,0,0,0,0,0,0,1.20695,0,0),
(89107,4,2720.04,-3902.45,294.66,0,0,0,0,0,0,0,0,0,0,0.492233,0,0),
(89107,3,2706.97,-3910.38,294.66,0,0,0,0,0,0,0,0,0,0,3.78305,0,0),
(89107,2,2718.04,-3901.49,294.66,0,0,0,0,0,0,0,0,0,0,4.15219,0,0),
(89107,1,2722.98,-3891.15,294.662,0,0,0,0,0,0,0,0,0,0,4.40746,0,0),
(89134,10,2881.76,-3882.99,267.988,0,0,0,0,0,0,0,0,0,0,4.67136,0,0),
(89134,9,2884.88,-3867.48,267.892,0,0,0,0,0,0,0,0,0,0,4.11922,0,0),
(89134,8,2905.97,-3853.79,267.806,0,0,0,0,0,0,0,0,0,0,3.69118,0,0),
(89134,7,2928.84,-3860.69,267.825,0,0,0,0,0,0,0,0,0,0,2.46989,0,0),
(89134,6,2936.15,-3876.79,267.952,0,0,0,0,0,0,0,0,0,0,1.86906,0,0),
(89134,5,2936.52,-3895.29,267.886,0,0,0,0,0,0,0,0,0,0,1.03653,0,0),
(89134,4,2918.6,-3907.24,267.902,0,0,0,0,0,0,0,0,0,0,0.365018,0,0),
(89134,3,2906.17,-3911.32,267.823,0,0,0,0,0,0,0,0,0,0,0.07442,0,0),
(89134,2,2887.6,-3897.27,267.982,0,0,0,0,0,0,0,0,0,0,5.28554,0,0),
(89134,1,2882.97,-3886.21,267.971,0,0,0,0,0,0,0,0,0,0,5.05778,0,0),
(89130,8,2933.14,-3887.82,268.053,0,0,0,0,0,0,0,0,0,0,4.56848,0,0),
(89130,7,2926.11,-3862.49,267.893,0,0,0,0,0,0,0,0,0,0,5.33031,0,0),
(89130,6,2907.93,-3857.69,267.909,0,0,0,0,0,0,0,0,0,0,0.09563,0,0),
(89130,5,2890.13,-3866.07,267.955,0,0,0,0,0,0,0,0,0,0,0.751437,0,0),
(89130,4,2885.41,-3889.63,268.02,0,0,0,0,0,0,0,0,0,0,1.90911,0,0),
(89130,3,2899.49,-3905.74,267.928,0,0,0,0,0,0,0,0,0,0,2.85552,0,0),
(89130,2,2914.6,-3907.84,267.902,0,0,0,0,0,0,0,0,0,0,3.62128,0,0),
(89130,1,2930.63,-3896.96,268.012,0,0,0,0,0,0,0,0,0,0,4.59518,0,0),
(2530447,3,2798.4,-3881.13,277.811,0,0,0,0,0,0,0,0,0,0,3.13783,0,0),
(2530447,4,2758.73,-3874.56,294.661,0,0,0,0,0,0,0,0,0,0,2.55428,0,0),
(2530447,5,2736.45,-3857.7,294.66,0,0,0,0,0,0,0,0,0,0,2.85823,0,0),
(2530447,6,2750.41,-3879.93,294.66,0,0,0,0,0,0,0,0,0,0,5.90008,0,0),
(88473,1,2791.79,-3366.2,267.685,0,0,0,0,0,0,0,0,0,0,1.6099,0,0),
(88473,2,2791.17,-3350.35,267.685,0,0,0,0,0,0,0,0,0,0,1.6099,0,0),
(88473,3,2790.38,-3330.14,267.685,0,0,0,0,0,0,0,0,0,0,1.6099,0,0),
(88473,4,2789.68,-3312.13,267.685,0,0,0,0,0,0,0,0,0,0,1.6099,0,0),
(88473,5,2787.58,-3294.09,267.685,0,0,0,0,0,0,0,0,0,0,2.29712,0,0),
(88473,6,2776.3,-3281.4,267.685,0,0,0,0,0,0,0,0,0,0,2.29712,0,0),
(88473,7,2757.59,-3255.91,267.685,0,0,0,0,0,0,0,0,0,0,2.25942,0,0),
(88473,8,2774.5,-3281.4,267.685,0,0,0,0,0,0,0,0,0,0,5.30677,0,0),
(2530372,18,3271.86,-3880.43,294.661,0,0,0,0,0,0,0,0,0,0,0.079137,0,0),
(2530372,17,3247.89,-3882.33,294.663,0,0,0,0,0,0,0,0,0,0,0.079137,0,0),
(2530372,16,3231.1,-3884.56,287.887,0,0,0,0,0,0,0,0,0,0,0.227578,0,0),
(2530372,15,3225.55,-3866.75,285.144,0,0,0,0,0,0,0,0,0,0,6.17697,0,0),
(2530372,14,3201.05,-3864.14,272.294,0,0,0,0,0,0,0,0,0,0,6.17697,0,0),
(2530372,13,3177.29,-3864.55,267.604,0,0,0,0,0,0,0,0,0,0,1.08602,0,0),
(2530372,12,3169.88,-3886.18,267.593,0,0,0,0,0,0,0,0,0,0,6.19425,0,0),
(2530372,11,3150.88,-3877.17,267.593,0,0,0,0,0,0,0,0,0,0,4.86771,0,0),
(2530372,10,3146.97,-3863.11,267.593,0,0,0,0,0,0,0,0,0,0,0.045365,0,0),
(2530372,9,3142.67,-3863.79,267.593,0,0,0,0,0,0,0,0,0,0,1.28551,0,0),
(2530372,8,3145.73,-3880.91,267.593,0,0,0,0,0,0,0,0,0,0,3.36917,0,0),
(2530372,7,3162.26,-3882.58,267.595,0,0,0,0,0,0,0,0,0,0,3.30555,0,0),
(2530372,6,3176.3,-3876.91,267.596,0,0,0,0,0,0,0,0,0,0,4.34699,0,0),
(2530372,5,3182.19,-3861.63,267.609,0,0,0,0,0,0,0,0,0,0,3.29063,0,0),
(2530372,4,3209.25,-3860.77,276.596,0,0,0,0,0,0,0,0,0,0,2.92306,0,0),
(2530372,3,3226.06,-3868.56,285.409,0,0,0,0,0,0,0,0,0,0,1.64993,0,0),
(2530372,2,3227.27,-3883.8,286.042,0,0,0,0,0,0,0,0,0,0,2.12117,0,0),
(2530372,1,3265.73,-3882.76,294.662,0,0,0,0,0,0,0,0,0,0,3.09428,0,0),
(2530371,19,3224.78,-3900.3,284.736,0,0,0,0,0,0,0,0,0,0,4.55276,0,0),
(2530371,18,3227.56,-3883.02,286.196,0,0,0,0,0,0,0,0,0,0,4.74754,0,0),
(2530371,17,3237.42,-3882.52,290.238,0,0,0,0,0,0,0,0,0,0,3.19245,0,0),
(2530371,16,3259.26,-3881.4,294.661,0,0,0,0,0,0,0,0,0,0,3.19245,0,0),
(2530371,15,3283.12,-3885.09,294.661,0,0,0,0,0,0,0,0,0,0,1.00512,0,0),
(2530371,14,3268.33,-3899.21,294.661,0,0,0,0,0,0,0,0,0,0,5.40335,0,0),
(2530371,13,3254.71,-3882.76,294.661,0,0,0,0,0,0,0,0,0,0,6.27907,0,0),
(2530371,12,3243.79,-3882.71,293.309,0,0,0,0,0,0,0,0,0,0,6.27907,0,0),
(2530371,11,3224.81,-3886.05,284.75,0,0,0,0,0,0,0,0,0,0,0.953281,0,0),
(2530371,10,3217.88,-3902.02,281.116,0,0,0,0,0,0,0,0,0,0,0.017871,0,0),
(2530371,9,3205.85,-3902.23,274.798,0,0,0,0,0,0,0,0,0,0,0.017871,0,0),
(2530371,8,3182.35,-3901.95,267.593,0,0,0,0,0,0,0,0,0,0,5.35779,0,0),
(2530371,7,3166.2,-3882.88,267.593,0,0,0,0,0,0,0,0,0,0,6.14319,0,0),
(2530371,6,3146.6,-3883.07,267.593,0,0,0,0,0,0,0,0,0,0,0.032792,0,0),
(2530371,5,3142.67,-3894.96,267.593,0,0,0,0,0,0,0,0,0,0,4.18755,0,0),
(2530371,4,3150.72,-3884.31,267.593,0,0,0,0,0,0,0,0,0,0,3.23172,0,0),
(2530371,3,3172.22,-3885.94,267.593,0,0,0,0,0,0,0,0,0,0,2.20206,0,0),
(2530371,2,3183.92,-3900.26,267.593,0,0,0,0,0,0,0,0,0,0,3.10999,0,0),
(2530371,1,3205.26,-3900.72,274.492,0,0,0,0,0,0,0,0,0,0,3.18067,0,0),
(88859,11,3328.83,-3902.97,294.66,0,0,0,0,0,0,0,0,0,0,3.68962,0,0),
(88859,10,3337.38,-3893.43,294.66,0,0,0,0,0,0,0,0,0,0,4.57712,0,0),
(88859,9,3338.82,-3880.92,294.66,0,0,0,0,0,0,0,0,0,0,1.36877,0,0),
(88859,8,3335.13,-3895.69,294.66,0,0,0,0,0,0,0,0,0,0,0.888106,0,0),
(88859,7,3325.76,-3906.34,294.66,0,0,0,0,0,0,0,0,0,0,0.742022,0,0),
(88859,6,3315.92,-3912.13,294.66,0,0,0,0,0,0,0,0,0,0,0.066579,0,0),
(88859,5,3301.19,-3909.05,294.66,0,0,0,0,0,0,0,0,0,0,5.93743,0,0),
(88859,4,3287.76,-3904.41,294.66,0,0,0,0,0,0,0,0,0,0,2.53273,0,0),
(88859,3,3296.79,-3909.52,294.66,0,0,0,0,0,0,0,0,0,0,2.96549,0,0),
(88859,2,3309.78,-3911.37,294.66,0,0,0,0,0,0,0,0,0,0,0.636779,0,0),
(88859,1,3321.1,-3909.53,294.66,0,0,0,0,0,0,0,0,0,0,3.44458,0,0),
(2530220,6,3316.11,-3854.17,294.66,0,0,0,0,0,0,0,0,0,0,6.00889,0,0),
(2530220,5,3306.57,-3851.65,294.66,0,0,0,0,0,0,0,0,0,0,0.166318,0,0),
(2530220,4,3292.03,-3857.6,294.66,0,0,0,0,0,0,0,0,0,0,0.57394,0,0),
(2530220,3,3280.65,-3866.95,294.66,0,0,0,0,0,0,0,0,0,0,3.74302,0,0),
(2530220,2,3293.3,-3859.43,294.661,0,0,0,0,0,0,0,0,0,0,3.55924,0,0),
(2530220,1,3307.8,-3854.88,294.661,0,0,0,0,0,0,0,0,0,0,3.16261,0,0),
(2530314,17,3223.63,-3883.21,284.135,0,0,0,0,0,0,0,0,0,0,3.15023,0,0),
(2530314,16,3247.15,-3883.01,294.661,0,0,0,0,0,0,0,0,0,0,3.15023,0,0),
(2530314,15,3268.45,-3881.18,294.661,0,0,0,0,0,0,0,0,0,0,0.000785,0,0),
(2530314,14,3245.17,-3883.37,293.969,0,0,0,0,0,0,0,0,0,0,6.21093,0,0),
(2530314,13,3224.46,-3882.52,284.57,0,0,0,0,0,0,0,0,0,0,0.076183,0,0),
(2530314,12,3201.01,-3883.43,272.259,0,0,0,0,0,0,0,0,0,0,6.21328,0,0),
(2530314,11,3156.75,-3883.43,267.593,0,0,0,0,0,0,0,0,0,0,0.005497,0,0),
(2530314,10,3124.92,-3882.73,267.593,0,0,0,0,0,0,0,0,0,0,3.09212,0,0),
(2530314,9,3147.33,-3883.34,267.593,0,0,0,0,0,0,0,0,0,0,3.2005,0,0),
(2530314,8,3170.25,-3882.62,267.594,0,0,0,0,0,0,0,0,0,0,3.08976,0,0),
(2530314,7,3221.01,-3883.25,282.756,0,0,0,0,0,0,0,0,0,0,3.17615,0,0),
(2530314,6,3250.5,-3883.69,294.661,0,0,0,0,0,0,0,0,0,0,3.17615,0,0),
(2530314,5,3270.72,-3882.99,294.661,0,0,0,0,0,0,0,0,0,0,3.17615,0,0),
(2530314,4,3268.14,-3881.31,294.661,0,0,0,0,0,0,0,0,0,0,0.014925,0,0),
(2530314,3,3270.19,-3882.65,294.661,0,0,0,0,0,0,0,0,0,0,0.014925,0,0),
(2530314,2,3249.4,-3882.96,294.661,0,0,0,0,0,0,0,0,0,0,0.014925,0,0),
(2530314,1,3232.43,-3882.99,287.887,0,0,0,0,0,0,0,0,0,0,0.042414,0,0),
(2530312,18,3116.15,-3883.33,267.594,0,0,0,0,0,0,0,0,0,0,3.1526,0,0),
(2530312,17,3140.75,-3883.06,267.594,0,0,0,0,0,0,0,0,0,0,3.1526,0,0),
(2530312,16,3163.15,-3882.82,267.594,0,0,0,0,0,0,0,0,0,0,3.1526,0,0),
(2530312,15,3187.19,-3882.55,267.595,0,0,0,0,0,0,0,0,0,0,3.1526,0,0),
(2530312,14,3221.07,-3882.18,282.791,0,0,0,0,0,0,0,0,0,0,3.1526,0,0),
(2530312,13,3235.28,-3882.02,289.208,0,0,0,0,0,0,0,0,0,0,3.1526,0,0),
(2530312,12,3246.76,-3881.89,294.661,0,0,0,0,0,0,0,0,0,0,3.1526,0,0),
(2530312,11,3261.53,-3881.73,294.661,0,0,0,0,0,0,0,0,0,0,3.1526,0,0),
(2530312,10,3275.21,-3881.58,294.661,0,0,0,0,0,0,0,0,0,0,3.1526,0,0),
(2530312,9,3269.88,-3882.09,294.661,0,0,0,0,0,0,0,0,0,0,0.262337,0,0),
(2530312,8,3270.79,-3886.82,294.661,0,0,0,0,0,0,0,0,0,0,6.25335,0,0),
(2530312,7,3253.86,-3886.31,294.662,0,0,0,0,0,0,0,0,0,0,6.25335,0,0),
(2530312,6,3241.26,-3885.94,292.09,0,0,0,0,0,0,0,0,0,0,6.25335,0,0),
(2530312,5,3228.7,-3885.56,286.796,0,0,0,0,0,0,0,0,0,0,6.25335,0,0),
(2530312,4,3217.79,-3885.24,281.068,0,0,0,0,0,0,0,0,0,0,6.25335,0,0),
(88808,4,2700.06,-2985.15,240.526,0,0,0,0,0,0,0,0,0,0,3.16753,0,0),
(88808,3,2637.32,-3046.26,240.527,0,0,0,0,0,0,0,0,0,0,3.93722,0,0),
(88808,2,2700.06,-2985.15,240.526,0,0,0,0,0,0,0,0,0,0,3.16753,0,0),
(88808,1,2848.13,-2984.63,267.594,0,0,0,0,0,0,0,0,0,0,3.16753,0,0),
(88795,4,2555.62,-3129.9,240.525,0,0,0,0,0,0,0,0,0,0,0.75946,0,0),
(88795,3,2608.56,-3078.92,240.526,0,0,0,0,0,0,0,0,0,0,0.75946,0,0),
(88795,2,2555.62,-3129.9,240.525,0,0,0,0,0,0,0,0,0,0,0.75946,0,0),
(88795,1,2556.96,-3279.51,267.593,0,0,0,0,0,0,0,0,0,0,1.52915,0,0),
(88723,14,3012.75,-3234.04,294.064,0,0,0,0,0,0,0,0,0,0,5.71862,0,0),
(88723,13,3006.07,-3224.94,294.064,0,0,0,0,0,0,0,0,0,0,4.86254,0,0),
(88723,12,3002.59,-3206.02,294.064,0,0,0,0,0,0,0,0,0,0,4.94894,0,0),
(88723,11,2993.05,-3192.84,294.064,0,0,0,0,0,0,0,0,0,0,5.47122,0,0),
(88723,10,2987.8,-3184.54,294.064,0,0,0,0,0,0,0,0,0,0,4.8861,0,0),
(88723,9,2988.1,-3173.17,294.064,0,0,0,0,0,0,0,0,0,0,4.56802,0,0),
(88723,8,2991.58,-3152.47,294.064,0,0,0,0,0,0,0,0,0,0,4.37167,0,0),
(88722,10,3043.97,-3211.98,293.345,0,0,0,0,0,0,0,0,0,0,1.51034,0,0),
(88722,9,3050.71,-3176.3,293.345,0,0,0,0,0,0,0,0,0,0,1.2111,0,0),
(88722,8,3065.25,-3148.93,293.346,0,0,0,0,0,0,0,0,0,0,0.878878,0,0),
(88722,7,3083.83,-3128.89,293.937,0,0,0,0,0,0,0,0,0,0,0.369154,0,0),
(88722,6,3123.61,-3119.76,293.346,0,0,0,0,0,0,0,0,0,0,0.092694,0,0),
(88722,5,3083.83,-3128.89,293.937,0,0,0,0,0,0,0,0,0,0,0.369154,0,0),
(88722,4,3065.25,-3148.93,293.346,0,0,0,0,0,0,0,0,0,0,0.878878,0,0),
(88722,3,3050.71,-3176.3,293.345,0,0,0,0,0,0,0,0,0,0,1.2111,0,0),
(88722,2,3043.97,-3211.98,293.345,0,0,0,0,0,0,0,0,0,0,1.51034,0,0),
(88722,1,3048.88,-3242.07,293.346,0,0,0,0,0,0,0,0,0,0,1.80722,0,0),
(88721,12,3126.77,-3180.29,294.062,0,0,0,0,0,0,0,0,0,0,3.31439,0,0),
(88721,11,3116.83,-3183.31,294.062,0,0,0,0,0,0,0,0,0,0,3.74322,0,0),
(88721,10,3107.8,-3189.61,294.062,0,0,0,0,0,0,0,0,0,0,4.13592,0,0),
(88721,9,3101.08,-3208.57,294.062,0,0,0,0,0,0,0,0,0,0,4.60716,0,0),
(88721,8,3105.41,-3226.72,294.062,0,0,0,0,0,0,0,0,0,0,5.20563,0,0),
(88721,7,3116.79,-3239.36,294.062,0,0,0,0,0,0,0,0,0,0,5.80882,0,0),
(88721,6,3137.12,-3244.54,294.088,0,0,0,0,0,0,0,0,0,0,0.404492,0,0),
(88721,5,3153.32,-3235.47,294.063,0,0,0,0,0,0,0,0,0,0,0.740643,0,0),
(88721,4,3163.48,-3220.17,294.063,0,0,0,0,0,0,0,0,0,0,1.31712,0,0),
(88721,3,3164.48,-3204.92,294.063,0,0,0,0,0,0,0,0,0,0,1.9745,0,0),
(88721,2,3155.1,-3188.16,294.063,0,0,0,0,0,0,0,0,0,0,2.48815,0,0),
(88721,1,3141.54,-3181.26,294.063,0,0,0,0,0,0,0,0,0,0,3.0183,0,0),
(88720,13,3176.8,-3310.56,294.535,0,0,0,0,0,0,0,0,0,0,5.44851,0,0),
(88720,12,3155.97,-3287.14,294.895,0,0,0,0,0,0,0,0,0,0,5.56397,0,0),
(88720,11,3134.98,-3265.76,294.504,0,0,0,0,0,0,0,0,0,0,5.89384,0,0),
(88720,10,3133.01,-3244.84,294.088,0,0,0,0,0,0,0,0,0,0,4.35162,0,0),
(88720,9,3111.14,-3232.83,294.062,0,0,0,0,0,0,0,0,0,0,2.32215,0,0),
(88720,8,3100.13,-3217.02,294.062,0,0,0,0,0,0,0,0,0,0,3.39422,0,0),
(88720,7,3089.23,-3218.59,294.194,10000,0,0,0,0,0,0,0,0,0,3.36752,0,0),
(88720,6,3100.13,-3217.02,294.062,0,0,0,0,0,0,0,0,0,0,3.39422,0,0),
(88720,5,3111.14,-3232.83,294.062,0,0,0,0,0,0,0,0,0,0,2.32215,0,0),
(88720,4,3133.01,-3244.84,294.088,0,0,0,0,0,0,0,0,0,0,4.35162,0,0),
(88720,3,3131.16,-3265.35,294.505,0,0,0,0,0,0,0,0,0,0,2.95566,0,0),
(88720,2,3146.05,-3274.03,294.62,0,0,0,0,0,0,0,0,0,0,2.30692,0,0),
(88720,1,3169.74,-3300.18,294.607,0,0,0,0,0,0,0,0,0,0,2.30692,0,0),
(88719,5,3073.47,-3071.07,294.064,0,0,0,0,0,0,0,0,0,0,3.4919,0,0),
(88719,4,3088,-3070.5,294.073,0,0,0,0,0,0,0,0,0,0,2.04676,0,0),
(88719,3,3099.77,-3100.41,294.071,0,0,0,0,0,0,0,0,0,0,2.04676,0,0),
(88719,2,3075.07,-3104.07,294.074,0,0,0,0,0,0,0,0,0,0,5.19699,0,0),
(88719,1,3065.85,-3080.8,294.074,0,0,0,0,0,0,0,0,0,0,5.13416,0,0),
(88718,5,3026.44,-3110.25,294.065,0,0,0,0,0,0,0,0,0,0,4.10136,0,0),
(88718,4,3040.62,-3102.68,294.075,0,0,0,0,0,0,0,0,0,0,2.2329,0,0),
(88718,3,3052.1,-3128.79,294.064,0,0,0,0,0,0,0,0,0,0,2.06953,0,0),
(88718,2,3038.54,-3134.17,294.075,0,0,0,0,0,0,0,0,0,0,5.62896,0,0),
(88718,1,3020.24,-3120.13,294.075,0,0,0,0,0,0,0,0,0,0,5.62896,0,0),
(2530447,7,2772.35,-3888.77,290.34,0,0,0,0,0,0,0,0,0,0,5.90008,0,0),
(88473,11,2787.13,-3371.9,267.685,0,0,0,0,0,0,0,0,0,0,4.68552,0,0),
(88473,10,2787.78,-3337.47,267.685,0,0,0,0,0,0,0,0,0,0,4.72322,0,0),
(88473,9,2786.44,-3301.43,267.685,0,0,0,0,0,0,0,0,0,0,4.79626,0,0),
(2530447,8,2805.41,-3899.3,274.14,0,0,0,0,0,0,0,0,0,0,0.204368,0,0),
(2530447,2,2825.54,-3881.23,267.594,0,0,0,0,0,0,0,0,0,0,3.13783,0,0),
(2530310,1,3090.49,-3854.87,267.593,0,0,0,0,0,0,0,0,0,0,3.93016,0,0),
(2530310,2,3080.34,-3862.16,267.593,0,0,0,0,0,0,0,0,0,0,3.85555,0,0),
(88430,2,2872.69,-3202.18,298.146,27000,1614601,0,0,0,0,0,0,0,0,5.8079,0,0),
(88440,2,2877.82,-3214.98,298.15,0,0,0,0,0,0,0,0,0,0,4.62,0,0),
(88440,1,2812.05,-3177.41,298.33,0,0,0,0,0,0,0,0,0,0,6.01,0,0),
(88434,2,2829.04,-3208.18,298.252,21000,1614602,0,0,0,0,0,0,0,0,4.10672,0,0),
(88439,1,2825.19,-3157.38,298.146,0,0,0,0,0,0,0,0,0,0,1.3861,0,0),
(88434,1,2829.04,-3208.18,298.252,0,0,0,0,0,0,0,0,0,0,4.10672,0,0),
(88439,2,2825.19,-3157.38,298.146,20000,1614604,0,0,0,0,0,0,0,0,1.3861,0,0),
(88430,1,2872.69,-3202.18,298.146,0,0,0,0,0,0,0,0,0,0,5.8079,0,0),
(88436,2,2857.09,-3180.16,298.147,20000,1614603,0,0,0,0,0,0,0,0,0.024496,0,0),
(88436,1,2857.09,-3180.16,298.153,0,0,0,0,0,0,0,0,0,0,0.024496,0,0),
(88444,2,2799.66,-3166,298.147,27000,1614601,0,0,0,0,0,0,0,0,3.11147,0,0),
(88444,1,2799.66,-3166,298.147,0,0,0,0,0,0,0,0,0,0,3.11147,0,0),
(88425,2,2851.37,-3289.55,298.125,0,0,0,0,0,0,0,0,0,0,4.24272,0,0),
(88425,1,2886.46,-3257.89,298.146,0,0,0,0,0,0,0,0,0,0,3.69687,0,0),
(88422,6,2845.06,-3296.36,298.124,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88422,5,2832.53,-3295.22,298.15,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88422,4,2845.06,-3296.36,298.124,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88422,3,2847.82,-3308.78,298.147,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88422,2,2838.8,-3321.94,298.152,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88422,1,2847.82,-3308.78,298.147,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88418,8,2835.76,-3331.32,299.364,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88418,7,2842.91,-3323.56,298.155,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88418,6,2852.52,-3333.61,298.146,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88418,5,2854.87,-3350.62,298.146,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88418,4,2852.52,-3333.61,298.146,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88418,3,2842.91,-3323.56,298.155,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88418,2,2835.76,-3331.32,299.364,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88418,1,2830.41,-3329.09,304.837,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88411,6,2882.14,-3275.98,298.141,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88411,5,2879.74,-3293.5,298.146,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88411,4,2889.02,-3298.33,298.146,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88411,3,2902.46,-3288.92,298.547,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88411,2,2899.09,-3280.57,298.547,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88411,1,2899.5,-3263.09,298.146,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88410,8,2910.94,-3290.13,298.547,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88410,7,2915.13,-3296.64,298.547,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88410,6,2920.32,-3301.1,298.547,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88410,5,2920.52,-3308.82,298.146,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88410,4,2911.01,-3309.07,298.146,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88410,3,2902.87,-3306.91,298.146,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88410,2,2899.26,-3299.75,298.146,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88410,1,2902.24,-3293.14,298.547,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88407,2,2854.1,-3335.93,298.15,0,0,0,0,0,0,0,0,0,0,0.75,0,0),
(88407,1,2903.97,-3293.77,298.73,0,0,0,0,0,0,0,0,0,0,3.96,0,0),
(88425,3,2842.75,-3327.63,298.145,0,0,0,0,0,0,0,0,0,0,1.06342,0,0),
(88397,1,2919.02,-3345.98,298.145,0,0,0,0,0,0,0,0,0,0,5.4813,0,0),
(2530254,12,3379.97,-3669.78,259.084,0,0,0,0,0,0,0,0,0,0,5.04061,0,0),
(2530254,11,3372.97,-3645.62,259.084,0,0,0,0,0,0,0,0,0,0,5.36027,0,0),
(2530254,10,3358.43,-3628.62,260.996,0,0,0,0,0,0,0,0,0,0,4.32982,0,0),
(2530254,9,3367.47,-3611.23,260.997,0,0,0,0,0,0,0,0,0,0,5.35163,0,0),
(2530254,8,3347.64,-3600.98,260.997,0,0,0,0,0,0,0,0,0,0,0.4421,0,0),
(2530254,7,3334.92,-3613.56,260.997,0,0,0,0,0,0,0,0,0,0,2.3192,0,0),
(2530254,6,3346.42,-3629.17,260.997,0,0,0,0,0,0,0,0,0,0,1.03272,0,0),
(2530254,5,3330.91,-3646.8,259.083,0,0,0,0,0,0,0,0,0,0,1.52359,0,0),
(2530254,4,3327.49,-3668.3,259.083,0,0,0,0,0,0,0,0,0,0,1.26677,0,0),
(2530254,3,3319.27,-3699.91,262.729,0,0,0,0,0,0,0,0,0,0,3.41876,0,0),
(2530254,2,3340.27,-3696.69,259.083,0,0,0,0,0,0,0,0,0,0,3.23498,0,0),
(2530254,1,3383.74,-3689.38,259.081,0,0,0,0,0,0,0,0,0,0,3.91435,0,0),
(2530323,1,3210.54,-3645.1,287.077,0,0,0,0,0,0,0,0,0,0,3.63186,0,0),
(88298,14,3257.23,-3230.15,294.063,0,0,0,0,0,0,0,0,0,0,6.17648,0,0),
(88298,13,3233.26,-3210.67,294.063,0,0,0,0,0,0,0,0,0,0,5.53246,0,0),
(88298,12,3209.04,-3188.25,294.063,0,0,0,0,0,0,0,0,0,0,5.49712,0,0),
(88298,11,3182.92,-3162.53,294.063,0,0,0,0,0,0,0,0,0,0,5.50497,0,0),
(88298,10,3160.95,-3145.5,294.063,0,0,0,0,0,0,0,0,0,0,5.68954,0,0),
(88298,9,3134.25,-3140.29,294.063,0,0,0,0,0,0,0,0,0,0,6.17256,0,0),
(88298,8,3107.4,-3145.3,294.063,60000,0,0,0,0,0,0,0,0,0,3.41188,0,0),
(88298,7,3134.11,-3140.88,294.063,0,0,0,0,0,0,0,0,0,0,3.12128,0,0),
(88298,6,3161.25,-3145.45,294.063,0,0,0,0,0,0,0,0,0,0,2.64612,0,0),
(88298,5,3182.32,-3163.56,294.063,0,0,0,0,0,0,0,0,0,0,2.37908,0,0),
(88298,4,3208.7,-3188.16,294.063,0,0,0,0,0,0,0,0,0,0,2.37515,0,0),
(88298,3,3232.6,-3210.97,294.063,0,0,0,0,0,0,0,0,0,0,2.35551,0,0),
(88298,2,3257.44,-3230.36,294.063,0,0,0,0,0,0,0,0,0,0,2.78355,0,0),
(88298,1,3305.03,-3231.81,294.063,0,0,0,0,0,0,0,0,0,0,3.14091,0,0),
(88270,8,3122.67,-3328.53,293.629,0,0,0,0,0,0,0,0,0,0,2.28807,0,0),
(88270,7,3136.21,-3342.25,293.629,0,0,0,0,0,0,0,0,0,0,2.40117,0,0),
(88270,6,3169.74,-3300.18,294.607,0,0,0,0,0,0,0,0,0,0,2.30692,0,0),
(88270,5,3136.21,-3342.25,293.629,0,0,0,0,0,0,0,0,0,0,2.40117,0,0),
(88270,4,3133.27,-3340.26,293.629,0,0,0,0,0,0,0,0,0,0,5.46108,0,0),
(88270,3,3119.91,-3326.92,293.629,0,0,0,0,0,0,0,0,0,0,5.58184,0,0),
(88270,2,3099.02,-3305.01,293.629,0,0,0,0,0,0,0,0,0,0,2.42061,0,0),
(88270,1,3116.33,-3321.32,293.629,0,0,0,0,0,0,0,0,0,0,2.42061,0,0),
(88269,10,3075.35,-3365.5,298.318,0,0,0,0,0,0,0,0,0,0,0.764993,0,0),
(88269,9,3064.48,-3375.94,298.318,10000,0,0,0,0,0,0,0,0,0,3.938,0,0),
(88269,8,3076.13,-3365.25,298.318,0,0,0,0,0,0,0,0,0,0,3.96942,0,0),
(88269,7,3098.54,-3342.14,294.532,0,0,0,0,0,0,0,0,0,0,4.08251,0,0),
(88269,6,3108.98,-3324.68,293.629,0,0,0,0,0,0,0,0,0,0,4.1045,0,0),
(88269,5,3120.88,-3288.93,293.629,0,0,0,0,0,0,0,0,0,0,4.28593,0,0),
(88269,4,3133.19,-3259.06,294.505,0,0,0,0,0,0,0,0,0,0,4.26394,0,0),
(88269,3,3122.68,-3287.7,293.629,0,0,0,0,0,0,0,0,0,0,1.22602,0,0),
(88269,2,3108.96,-3318.47,293.629,0,0,0,0,0,0,0,0,0,0,1.03595,0,0),
(88269,1,3098.54,-3342.14,294.532,0,0,0,0,0,0,0,0,0,0,3.70159,0,0),
(88194,14,2727.22,-3594.06,258.886,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88194,13,2736.52,-3591.67,257.918,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88194,12,2743.84,-3597.85,257.671,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88194,11,2752.58,-3595.4,257.06,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88194,10,2755.27,-3585.13,256.305,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88194,9,2757.01,-3575.48,255.636,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88194,8,2755.27,-3585.13,256.305,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88194,7,2752.58,-3595.4,257.06,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88194,6,2743.84,-3597.85,257.671,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88194,5,2736.52,-3591.67,257.918,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88194,4,2727.22,-3594.06,258.886,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88194,3,2723.64,-3604.72,259.696,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88194,2,2720.89,-3620.15,260.07,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88194,1,2723.64,-3604.72,259.696,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88192,12,2777.6,-3575.9,253.75,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88192,11,2767.95,-3589.93,256.704,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88192,10,2777.6,-3575.9,253.75,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88192,9,2790.98,-3565.05,251.559,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88192,8,2806.23,-3568.65,252.559,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88192,7,2817.8,-3583.1,254.576,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88192,6,2822.72,-3595.13,257.765,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88192,5,2829.62,-3612.2,259.915,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88192,4,2822.72,-3595.13,257.765,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88192,3,2817.8,-3583.1,254.576,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88192,2,2806.23,-3568.65,252.559,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88192,1,2790.74,-3564.99,251.512,0,0,0,0,0,0,0,0,0,0,0,0,0),
(533000,1,2851.03,-3186.75,273.787,0,0,0,0,0,0,0,0,0,0,3.10485,0,0),
(533000,2,2933.84,-3187.14,273.371,0,0,0,0,0,0,0,0,0,0,0.045722,0,0),
(2530447,1,2839.49,-3867.25,267.594,0,0,0,0,0,0,0,0,0,0,4.41645,0,0),
(2530414,4,2827.8,-3216.88,273.787,0,0,0,0,0,0,0,0,0,0,1.4899,0,0),
(2530414,3,2841.84,-3143.88,273.795,0,0,0,0,0,0,0,0,0,0,4.5074,0,0),
(2530414,2,2837.82,-3123.78,273.817,0,0,0,0,0,0,0,0,0,0,1.26842,0,0),
(2530414,1,2826.25,-3162.43,273.787,0,0,0,0,0,0,0,0,0,0,1.53938,0,0),
(2530447,9,2837.89,-3859.9,267.593,0,0,0,0,0,0,0,0,0,0,1.12564,0,0),
(88100,8,2671.65,-3489.11,261.375,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88100,7,2676.57,-3484.5,261.4,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88100,6,2671.65,-3489.11,261.375,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88100,5,2666.34,-3502.6,261.29,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88100,4,2670.34,-3514.17,261.278,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88100,3,2676.19,-3520.29,261.262,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88100,2,2670.34,-3514.17,261.278,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88100,1,2666.34,-3502.6,261.29,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88095,10,2864.62,-3468.97,297.87,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88095,9,2871.25,-3500.7,297.619,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88095,8,2888.54,-3522.79,297.615,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88095,7,2905.12,-3519.57,297.863,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88095,6,2921.4,-3509.92,297.482,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88095,5,2944.05,-3494.68,297.631,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88095,4,2921.4,-3509.92,297.482,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88095,3,2905.12,-3519.57,297.863,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88095,2,2888.54,-3522.79,297.615,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88095,1,2871.25,-3500.7,297.619,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88094,10,2854.79,-3489.83,297.886,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88094,9,2836.62,-3489.82,297.864,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88094,8,2809.43,-3490.46,285.972,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88094,7,2775.24,-3489.8,274.027,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88094,6,2728.6,-3490.62,262.131,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88094,5,2775.24,-3489.8,274.027,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88094,4,2809.43,-3490.46,285.972,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88094,3,2836.62,-3489.82,297.864,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88094,2,2855.09,-3489.83,297.883,0,0,0,0,0,0,0,0,0,0,0,0,0),
(88094,1,2872.72,-3489.73,297.62,0,0,0,0,0,0,0,0,0,0,0,0,0),
(2530323,2,3184.35,-3652.37,287.077,0,0,0,0,0,0,0,0,0,0,3.26979,0,0),
(2530323,3,3163.18,-3641.2,287.092,0,0,0,0,0,0,0,0,0,0,3.30749,0,0),
(2530323,4,3145.52,-3640.79,287.081,0,0,0,0,0,0,0,0,0,0,1.91026,0,0),
(2530323,5,3145.52,-3619.04,287.109,0,0,0,0,0,0,0,0,0,0,1.83722,0,0),
(2530323,6,3139.31,-3589.42,287.076,0,0,0,0,0,0,0,0,0,0,1.13743,0,0),
(2530323,7,3160.35,-3571.22,287.08,0,0,0,0,0,0,0,0,0,0,0.475342,0,0),
(2530323,8,3196.02,-3575.64,287.086,0,0,0,0,0,0,0,0,0,0,5.90794,0,0),
(2530323,9,3208.15,-3573.88,287.082,0,0,0,0,0,0,0,0,0,0,5.61342,0,0),
(2530323,10,3223.77,-3614.02,287.076,0,0,0,0,0,0,0,0,0,0,5.09977,0,0),
(2530323,11,3212.27,-3642.08,286.677,0,0,0,0,0,0,0,0,0,0,4.15415,0,0),
(88397,2,2943.49,-3370.25,298.145,0,0,0,0,0,0,0,0,0,0,5.51664,0,0),
(88397,3,2847.74,-3275.32,298.095,0,0,0,0,0,0,0,0,0,0,2.36719,0,0),
(2530254,13,3382.84,-3691.44,259.081,0,0,0,0,0,0,0,0,0,0,4.90631,0,0),
(88608,10,3276.96,-3691.5,280.679,0,0,0,0,0,0,0,0,0,0,2.24804,0,0),
(88608,9,3299.11,-3723.31,268.701,0,0,0,0,0,0,0,0,0,0,5.49959,0,0),
(88608,8,3280.14,-3704.41,276.693,0,0,0,0,0,0,0,0,0,0,5.49959,0,0),
(88608,7,3263.92,-3690.11,285.707,0,0,0,0,0,0,0,0,0,0,0.017505,0,0),
(88608,6,3240.42,-3686.76,287.081,0,0,0,0,0,0,0,0,0,0,5.04013,0,0),
(88608,5,3237.04,-3674.68,287.039,0,0,0,0,0,0,0,0,0,0,5.13045,0,0),
(88608,4,3221.91,-3650.82,287.071,0,0,0,0,0,0,0,0,0,0,2.30604,0,0),
(88608,3,3234.65,-3668.94,287.123,0,0,0,0,0,0,0,0,0,0,2.00366,0,0),
(88608,2,3240.8,-3685.27,287.081,0,0,0,0,0,0,0,0,0,0,2.96971,0,0),
(88608,1,3261.61,-3689.64,286.179,0,0,0,0,0,0,0,0,0,0,2.73016,0,0),
(2530340,1,3283.91,-3725.2,272.789,0,0,0,0,0,0,0,0,0,0,0.528021,0,0),
(2530340,2,3308.35,-3708.69,266.182,0,0,0,0,0,0,0,0,0,0,0.65447,0,0),
(2530340,3,3287.83,-3721.17,270.688,0,0,0,0,0,0,0,0,0,0,3.6704,0,0),
(2530341,1,3275.67,-3722.66,276.213,0,0,0,0,0,0,0,0,0,0,0.391361,0,0),
(2530341,2,3296.25,-3715.39,268.496,0,0,0,0,0,0,0,0,0,0,0.308894,0,0),
(2530341,3,3315.28,-3707.3,264.651,0,0,0,0,0,0,0,0,0,0,0.530376,0,0),
(2530341,4,3289.83,-3719.79,270.121,0,0,0,0,0,0,0,0,0,0,3.53452,0,0),
(2530341,5,3274.7,-3724.42,276.292,0,0,0,0,0,0,0,0,0,0,3.38844,0,0),
(2530341,6,3218.18,-3734.67,284.875,0,0,0,0,0,0,0,0,0,0,3.12926,0,0),
(2530341,7,3270.54,-3727.79,277.157,0,0,0,0,0,0,0,0,0,0,0.352876,0,0),
(2530361,1,3147.71,-3498.44,287.066,0,0,0,0,0,0,0,0,0,0,3.78185,0,0),
(2530361,2,3134.13,-3508.56,287.069,0,0,0,0,0,0,0,0,0,0,3.06321,0,0),
(2530361,3,3112.77,-3495.43,287.074,0,0,0,0,0,0,0,0,0,0,2.66109,0,0),
(2530361,4,3092.79,-3503.29,287.078,0,0,0,0,0,0,0,0,0,0,3.75358,0,0),
(2530361,5,3075.87,-3525.42,287.078,0,0,0,0,0,0,0,0,0,0,4.08423,0,0),
(2530361,6,3069.2,-3547.57,287.078,0,0,0,0,0,0,0,0,0,0,5.10132,0,0),
(2530361,7,3085.99,-3567.82,287.072,0,0,0,0,0,0,0,0,0,0,5.76341,0,0),
(2530361,8,3109.11,-3572.24,287.08,0,0,0,0,0,0,0,0,0,0,0.366154,0,0),
(2530361,9,3125.96,-3562.33,287.08,0,0,0,0,0,0,0,0,0,0,0.693665,0,0),
(2530361,10,3142.78,-3548.34,287.08,0,0,0,0,0,0,0,0,0,0,0.693665,0,0),
(2530361,11,3153.36,-3536.03,287.078,0,0,0,0,0,0,0,0,0,0,0.988189,0,0),
(2530361,12,3140.22,-3517.26,287.075,0,0,0,0,0,0,0,0,0,0,2.3375,0,0),
(2530361,13,3153.76,-3537.86,287.079,0,0,0,0,0,0,0,0,0,0,4.79266,0,0),
(2530361,14,3140.59,-3554.4,287.08,0,0,0,0,0,0,0,0,0,0,3.76064,0,0),
(2530361,15,3117.61,-3572.86,287.08,0,0,0,0,0,0,0,0,0,0,3.76064,0,0),
(2530361,16,3089.79,-3568.46,287.077,0,0,0,0,0,0,0,0,0,0,2.32415,0,0),
(2530361,17,3072.19,-3549.7,287.078,0,0,0,0,0,0,0,0,0,0,2.32415,0,0),
(2530361,18,3069.75,-3532.45,287.077,0,0,0,0,0,0,0,0,0,0,1.1814,0,0),
(2530361,19,3086.64,-3512.93,287.078,0,0,0,0,0,0,0,0,0,0,0.554648,0,0),
(2530361,20,3109.77,-3495.51,287.076,0,0,0,0,0,0,0,0,0,0,0.665389,0,0),
(2530361,21,3128.37,-3507,287.073,0,0,0,0,0,0,0,0,0,0,5.72257,0,0),
(2530361,22,3157.23,-3486.84,287.077,0,0,0,0,0,0,0,0,0,0,0.641827,0,0),
(2530361,23,3184.25,-3476.46,287.079,0,0,0,0,0,0,0,0,0,0,0.297823,0,0),
(2530361,24,3155.57,-3490.48,287.074,0,0,0,0,0,0,0,0,0,0,3.82426,0,0),
(2530310,3,3071.79,-3872.71,267.584,0,0,0,0,0,0,0,0,0,0,4.06761,0,0),
(2530310,4,3078.36,-3863.99,267.593,0,0,0,0,0,0,0,0,0,0,0.910304,0,0),
(2530310,5,3086.36,-3855.09,267.592,0,0,0,0,0,0,0,0,0,0,0.651123,0,0),
(2530310,6,3098.39,-3851.47,267.594,0,0,0,0,0,0,0,0,0,0,0.247428,0,0),
(2530310,7,3107.8,-3854.3,267.594,0,0,0,0,0,0,0,0,0,0,5.99026,0,0),
(2530310,8,3121.61,-3861.78,267.593,0,0,0,0,0,0,0,0,0,0,5.69573,0,0),
(2530310,9,3113.99,-3858.18,267.593,0,0,0,0,0,0,0,0,0,0,2.69944,0,0),
(2530310,10,3105.98,-3854.67,267.595,0,0,0,0,0,0,0,0,0,0,2.93035,0,0),
(2530310,11,3096.15,-3854.54,267.593,0,0,0,0,0,0,0,0,0,0,3.4707,0,0),
(88851,1,3096.28,-3910.55,267.593,0,0,0,0,0,0,0,0,0,0,2.82117,0,0),
(88851,2,3087.41,-3907.61,267.593,0,0,0,0,0,0,0,0,0,0,2.82117,0,0),
(88851,3,3076.8,-3901.98,267.593,0,0,0,0,0,0,0,0,0,0,2.55806,0,0),
(88851,4,3071.94,-3896.74,267.593,0,0,0,0,0,0,0,0,0,0,2.29103,0,0),
(88851,5,3075.92,-3903.25,267.593,0,0,0,0,0,0,0,0,0,0,5.29125,0,0),
(88851,6,3081.3,-3907.6,267.593,0,0,0,0,0,0,0,0,0,0,5.86066,0,0),
(88851,7,3089.53,-3910.42,267.593,0,0,0,0,0,0,0,0,0,0,6.21016,0,0),
(88851,8,3102.08,-3911.1,267.593,0,0,0,0,0,0,0,0,0,0,0.049495,0,0),
(88851,9,3120.25,-3905.91,267.593,0,0,0,0,0,0,0,0,0,0,0.49246,0,0),
(88851,10,3110.73,-3910.36,267.593,0,0,0,0,0,0,0,0,0,0,3.28455,0,0),
(88851,11,3099.92,-3911.87,267.593,0,0,0,0,0,0,0,0,0,0,3.11098,0,0),
(88851,12,3093.41,-3911.32,267.593,0,0,0,0,0,0,0,0,0,0,2.92484,0,0),
(2530312,1,3154.36,-3883.34,267.593,0,0,0,0,0,0,0,0,0,0,6.25335,0,0),
(2530312,2,3195.92,-3884.58,269.594,0,0,0,0,0,0,0,0,0,0,6.25335,0,0),
(2530312,3,3206.84,-3884.91,275.322,0,0,0,0,0,0,0,0,0,0,6.25335,0,0),
(533001,22,3007.17,-3430.96,304.205,1000,0,0,0,0,0,0,0,0,0,0,0,0),
(533001,21,3001.51,-3438.93,304.701,0,0,0,0,0,0,0,0,0,0,0,0,0),
(533001,20,2996.33,-3443.94,304.329,0,0,0,0,0,0,0,0,0,0,0,0,0),
(533001,19,2989.16,-3451.02,300.192,0,0,0,0,0,0,0,0,0,0,0,0,0),
(533001,18,2978.24,-3452.06,298.47,0,0,0,0,0,0,0,0,0,0,0,0,0),
(533001,17,2978.02,-3452.58,298.47,0,0,0,0,0,0,0,0,0,0,0,0,0),
(533001,16,2983.23,-3457.17,298.469,0,0,0,0,0,0,0,0,0,0,0,0,0),
(533001,15,2988.44,-3461.87,298.469,0,0,0,0,0,0,0,0,0,0,0,0,0),
(533001,14,2988.64,-3461.9,298.469,0,0,0,0,0,0,0,0,0,0,0,0,0),
(533001,13,2989.27,-3450.97,300.192,0,0,0,0,0,0,0,0,0,0,0,0,0),
(533001,12,2978.18,-3450.87,298.471,0,0,0,0,0,0,0,0,0,0,0,0,0),
(533001,11,2961.41,-3435.03,298.226,10000,0,0,0,0,0,0,0,0,0,0,0,0),
(533001,10,2964.24,-3433.71,298.464,0,0,0,0,0,0,0,0,0,0,0,0,0),
(533001,9,2974.41,-3409.65,298.442,0,0,0,0,0,0,0,0,0,0,0,0,0),
(533001,8,2981.36,-3399,298.447,0,0,0,0,0,0,0,0,0,0,0,0,0),
(533001,7,3032.73,-3409.67,298.217,0,0,0,0,0,0,0,0,0,0,0,0,0),
(533001,6,3034.99,-3408.07,298.217,10000,0,0,0,0,0,0,0,0,0,0,0,0),
(533001,5,3034.87,-3412.85,298.217,0,0,0,0,0,0,0,0,0,0,0,0,0),
(533001,4,3041.13,-3419.58,298.469,0,0,0,0,0,0,0,0,0,0,0,0,0),
(533001,3,3042.86,-3436.82,298.472,0,0,0,0,0,0,0,0,0,0,0,0,0),
(533001,2,3039.73,-3450.8,298.521,0,0,0,0,0,0,0,0,0,0,0,0,0),
(533001,1,3026.88,-3454.75,299.462,0,0,0,0,0,0,0,0,0,0,0,0,0),
(127795,2,2686.82,-3248.25,267.613,0,0,0,0,0,0,0,0,0,0,5.12489,0,0),
(127795,1,2679.7,-3216.63,267.538,0,0,0,0,0,0,0,0,0,0,5.16023,0,0),
(127798,6,2720.83,-3197.71,267.522,0,0,0,0,0,0,0,0,0,0,1.07224,0,0),
(127798,5,2707.99,-3214.05,267.522,0,0,0,0,0,0,0,0,0,0,0.738445,0,0),
(127798,4,2686.75,-3183.34,267.522,0,0,0,0,0,0,0,0,0,0,4.86572,0,0),
(127798,3,2695.12,-3165.47,267.522,0,0,0,0,0,0,0,0,0,0,4.0332,0,0),
(127798,2,2711.06,-3142.63,267.522,0,0,0,0,0,0,0,0,0,0,1.61025,0,0),
(127798,1,2711.64,-3157.39,267.522,0,0,0,0,0,0,0,0,0,0,1.61025,0,0),
(127797,3,2737.33,-3189.75,267.557,0,0,0,0,0,0,0,0,0,0,3.65228,0,0),
(127797,2,2743.6,-3170.45,267.592,0,0,0,0,0,0,0,0,0,0,5.29376,0,0),
(127797,1,2720.62,-3132.57,267.522,0,0,0,0,0,0,0,0,0,0,5.01495,0,0),
(127819,4,2690.05,-3126.77,267.563,0,0,0,0,0,0,0,0,0,0,1.15,0,0),
(127819,3,2665.19,-3171.2,267.624,0,0,0,0,0,0,0,0,0,0,1.53013,0,0),
(127819,2,2664.19,-3199.6,267.628,0,0,0,0,0,0,0,0,0,0,4.59711,0,0),
(127819,1,2667.21,-3173.53,267.611,0,0,0,0,0,0,0,0,0,0,4.41647,0,0),
(127795,3,2704.63,-3257.83,267.654,0,0,0,0,0,0,0,0,0,0,6.20088,0,0),
(127795,4,2723.72,-3256.89,267.663,0,0,0,0,0,0,0,0,0,0,0.247562,0,0),
(127795,5,2734.3,-3243.79,267.616,0,0,0,0,0,0,0,0,0,0,0.369299,0,0),
(127823,1,2731.47,-3230.08,267.553,0,0,0,0,0,0,0,0,0,0,1.07616,0,0),
(127823,2,2749.88,-3198.36,267.63,0,0,0,0,0,0,0,0,0,0,0.820903,0,0),
(127823,3,2734.57,-3228.62,267.56,0,0,0,0,0,0,0,0,0,0,4.25309,0,0),
(127823,4,2704.09,-3223.83,267.525,0,0,0,0,0,0,0,0,0,0,2.67837,0,0);










/*
-- Query: SELECT * FROM creature_movement_template where entry in (select id from creature where map = 533)
-- Date: 2017-08-09 17:16
*/

INSERT INTO `creature_movement_template` (`entry`,`point`,`position_x`,`position_y`,`position_z`,`waittime`,`script_id`,`textid1`,`textid2`,`textid3`,`textid4`,`textid5`,`emote`,`spell`,`wpguid`,`orientation`,`model1`,`model2`) 
VALUES 
(15931,1,3205.45,-3341.86,320.177,0,0,0,0,0,0,0,0,0,0,1.55799,0,0),
(15931,2,3205.57,-3306.46,320.333,0,0,0,0,0,0,0,0,0,0,3.10619,0,0),
(15931,3,3180.08,-3306.33,320.095,60000,1593101,0,0,0,0,0,0,0,0,3.16902,0,0),
(15931,4,3205.57,-3306.46,320.333,0,0,0,0,0,0,0,0,0,0,3.10619,0,0),
(15931,5,3205.45,-3341.86,320.177,0,0,0,0,0,0,0,0,0,0,1.55799,0,0),
(15931,6,3205.06,-3377.29,311.328,0,0,0,0,0,0,0,0,0,0,4.72411,0,0),
(15931,7,3218.09,-3387.23,311.328,0,0,0,0,0,0,0,0,0,0,0.086909,0,0),
(15931,8,3227.38,-3377.29,311.328,0,0,0,0,0,0,0,0,0,0,1.57074,0,0),
(15931,9,3228.32,-3341.07,292.596,0,0,0,0,0,0,0,0,0,0,1.57466,0,0),
(15931,10,3228.81,-3309.42,292.596,0,0,0,0,0,0,0,0,0,0,6.24464,0,0),
(15931,11,3255.3,-3310.34,292.596,60000,0,0,0,0,0,0,0,0,0,6.27998,0,0),
(15931,12,3228.81,-3309.42,292.596,0,0,0,0,0,0,0,0,0,0,6.24464,0,0),
(15931,13,3228.32,-3341.07,292.596,0,0,0,0,0,0,0,0,0,0,1.57466,0,0),
(15931,14,3228.05,-3378.03,311.326,0,0,0,0,0,0,0,0,0,0,1.57074,0,0),
(15931,15,3218.09,-3387.23,311.328,0,0,0,0,0,0,0,0,0,0,0.086909,0,0),
(15931,16,3205.06,-3377.29,311.328,0,0,0,0,0,0,0,0,0,0,1.55799,0,0),
(16061,1,2765.25,-3088.47,267.685,0,0,0,0,0,0,0,0,0,0,0.38872,0,0),
(16061,2,2780,-3090.74,267.685,0,0,0,0,0,0,0,0,0,0,5.78048,0,0),
(16061,3,2783.57,-3100.87,267.685,0,0,0,0,0,0,0,0,0,0,5.04221,0,0),
(16061,4,2776.59,-3109.78,267.685,0,0,0,0,0,0,0,0,0,0,3.98977,0,0),
(16061,5,2765.44,-3110.8,267.685,0,0,0,0,0,0,0,0,0,0,3.15332,0,0),
(16061,6,2757.56,-3100.27,267.685,0,0,0,0,0,0,0,0,0,0,2.06162,0,0),
(16061,7,2760.86,-3090.25,267.685,10000,0,0,0,0,0,0,0,0,0,1.48676,0,0);









/*
-- Query: select * from creature_linking_template
-- Date: 2017-08-09 17:45
*/

INSERT INTO `creature_linking_template` (`entry`,`map`,`master_entry`,`flag`,`search_range`) VALUES 
(16056,533,16011,3072,0),
(16057,533,16011,3072,0);










/*
-- Query: select * from creature_linking where master_guid in (select guid from creature where map = 533)
-- Date: 2017-08-12 14:12
*/

INSERT INTO `creature_linking` (`guid`,`master_guid`,`flag`) 
VALUES 
(88453,88460,3073),
(88452,88460,3073),
(88451,88460,3073),
(88448,88460,3073),
(88419,88460,3073),
(88418,88460,3073),
(88420,88460,3073),
(88421,88460,3073),
(88422,88460,3073),
(88408,88460,3073),
(88409,88460,3073),
(88411,88460,3073),
(88410,88460,3073),
(2530389,88298,3073),
(88403,88460,3073),
(88393,88460,3073),
(88402,88460,3073),
(88395,88460,3073),
(88396,88460,3073),
(88401,88460,3073),
(88394,88460,3073),
(88400,88460,3073),
(88399,88460,3073),
(88398,88460,3073),
(88397,88460,3073),
(88406,88460,3073),
(88423,88460,3073),
(88404,88460,3073),
(88405,88460,3073),
(88407,88460,3073),
(88425,88460,3073),
(88424,88460,3073),
(88426,88460,3073),
(88417,88460,3073),
(88416,88460,3073),
(88414,88460,3073),
(88412,88460,3073),
(88415,88460,3073),
(88413,88460,3073),
(88441,88460,3073),
(88442,88460,3073),
(88440,88460,3073),
(88427,88460,3073),
(88430,88460,3073),
(88429,88460,3073),
(88428,88460,3073),
(88437,88460,3073),
(88436,88460,3073),
(88432,88460,3073),
(88435,88460,3073),
(88431,88460,3073),
(88434,88460,3073),
(88433,88460,3073),
(88439,88460,3073),
(88438,88460,3073),
(88444,88460,3073),
(88443,88460,3073),
(88446,88460,3073),
(88445,88460,3073),
(88449,88460,3073),
(88450,88460,3073),
(88447,88460,3073),
(88457,88460,3073),
(2530414,88460,3073),
(2530413,88460,3073),
(88466,88460,3073),
(533000,88460,3073),
(88465,88460,3073),
(88454,88460,3073),
(88455,88460,3073),
(2530412,88460,3073),
(88456,88460,3073),
(88467,88460,3073),
(2530416,88460,3073),
(88676,88460,3073),
(88675,88460,3073),
(2530418,88460,3073),
(2530417,88460,3073),
(88468,88460,3073),
(88469,88460,3073),
(88674,88460,3073),
(2530409,88479,3072),
(2530410,88479,3072),
(88475,88479,3072),
(2530411,88479,3072),
(88473,88479,3072),
(88474,88479,3072),
(88471,88479,3072),
(88470,88479,3072),
(88472,88479,3072),
(127823,88479,3072),
(127799,88479,3072),
(127818,88479,3072),
(127795,88479,3072),
(127819,88479,3072),
(2530408,88479,3072),
(127824,88479,3072),
(127798,88479,3072),
(127797,88479,3072),
(127796,88479,3072),
(88098,88100,3072),
(88099,88100,3072),
(88097,88100,3072),
(88096,88100,3072),
(88094,88100,3072),
(88092,88100,3072),
(88093,88100,3072),
(88095,88100,3072),
(88085,88100,3072),
(88087,88100,3072),
(88084,88100,3072),
(88086,88100,3072),
(88088,88100,3072),
(88089,88100,3072),
(88091,88100,3072),
(88277,88100,3072),
(88276,88100,3072),
(88090,88100,3072),
(88080,88100,3072),
(88081,88100,3072),
(88079,88100,3072),
(88083,88100,3072),
(88082,88100,3072),
(88201,88205,3072),
(2530485,88205,3072),
(88189,88205,3072),
(2530471,88205,3072),
(2530470,88205,3072),
(2530486,88205,3072),
(2530469,88205,3072),
(2530468,88205,3072),
(2530465,88205,3072),
(88195,88205,3072),
(2530466,88205,3072),
(88152,88205,3072),
(2530467,88205,3072),
(88153,88205,3072),
(88148,88205,3072),
(88149,88205,3072),
(88192,88205,3072),
(88194,88205,3072),
(88196,88205,3072),
(88199,88205,3072),
(88202,88205,3072),
(88203,88205,3072),
(88204,88205,3072),
(2530460,88205,3072),
(2530459,88205,3072),
(2530458,88205,3072),
(2530453,88205,3072),
(2530457,88205,3072),
(2530456,88205,3072),
(2530455,88205,3072),
(2530452,88205,3072),
(2530454,88205,3072),
(2530451,88205,3072),
(2530448,88205,3072),
(2530449,88205,3072),
(2530450,88205,3072),
(2530461,88205,3072),
(2530462,88205,3072),
(2530472,88205,3072),
(2530484,88205,3072),
(2530474,88205,3072),
(2530475,88205,3072),
(2530476,88205,3072),
(2530477,88205,3072),
(2530478,88205,3072),
(2530479,88205,3072),
(2530480,88205,3072),
(2530481,88205,3072),
(2530482,88205,3072),
(2530483,88205,3072),

(2530717,88205,3072),
(2530711,88205,3072),
(533499,88205,3072),
(2530712,88205,3072),
(2530713,88205,3072),
(533498,88205,3072),
(533497,88205,3072),
(533496,88205,3072),
(533495,88205,3072),

(88117,88205,3072),
(88118,88205,3072),
(88119,88205,3072),
(88120,88205,3072),
(88121,88205,3072),
(88122,88205,3072),
(88123,88205,3072),
(88124,88205,3072),
(88125,88205,3072),
(88126,88205,3072),
(88127,88205,3072),
(88128,88205,3072),
(88129,88205,3072),
(88130,88205,3072),
(88131,88205,3072),
(88132,88205,3072),
(88133,88205,3072),
(88134,88205,3072),
(88135,88205,3072),
(88136,88205,3072),
(88137,88205,3072),
(88138,88205,3072),
(88139,88205,3072),
(88140,88205,3072),
(88141,88205,3072),
(88142,88205,3072),
(88143,88205,3072),
(88144,88205,3072),
(88145,88205,3072),
(88146,88205,3072),
(88147,88205,3072),
(88150,88205,3072),
(88151,88205,3072),
(88154,88205,3072),
(88155,88205,3072),
(88156,88205,3072),
(88299,88303,3073),
(88300,88303,3073),
(88306,88303,3073),
(88305,88303,3073),
(88302,88303,3073),
(88301,88303,3073),
(88343,88346,3072),
(88341,88346,3072),
(88338,88346,3072),
(88342,88346,3072),
(88340,88346,3072),
(88339,88346,3072),
(88322,88346,3072),
(88321,88346,3072),
(88315,88346,3072),
(88317,88346,3072),
(88318,88346,3072),
(88319,88346,3072),
(88320,88346,3072),
(88329,88346,3072),
(88314,88346,3072),
(88336,88346,3072),
(88311,88346,3072),
(88337,88346,3072),
(88313,88346,3072),
(88312,88346,3072),
(2530245,88346,3072),
(2530238,88346,3072),
(2530243,88346,3072),
(2530239,88346,3072),
(2530246,88346,3072),
(2530244,88346,3072),
(2530240,88346,3072),
(2530241,88346,3072),
(2530242,88346,3072),
(88307,88346,3072),
(88309,88346,3072),
(88334,88346,3072),
(88310,88346,3072),
(88308,88346,3072),
(88335,88346,3072),
(2530358,88346,3072),
(2530359,88346,3072),
(2530360,88346,3072),
(2530354,88346,3072),
(2530357,88346,3072),
(2530361,88346,3072),
(2530355,88346,3072),
(2530356,88346,3072),
(2530303,88496,3073),
(2530302,88496,3073),
(2530301,88496,3073),
(2530300,88496,3073),
(2530299,88496,3073),
(2530306,88496,3073),
(2530305,88496,3073),
(2530304,88496,3073),
(2530291,88496,3073),
(2530292,88496,3073),
(2530293,88496,3073),
(2530294,88496,3073),
(2530298,88496,3073),
(2530297,88496,3073),
(2530296,88496,3073),
(2530295,88496,3073),
(2530283,88496,3073),
(2530287,88496,3073),
(2530284,88496,3073),
(2530288,88496,3073),
(2530289,88496,3073),
(2530285,88496,3073),
(2530290,88496,3073),
(2530286,88496,3073),
(2530280,88496,3073),
(2530275,88496,3073),
(2530279,88496,3073),
(2530281,88496,3073),
(2530276,88496,3073),
(2530278,88496,3073),
(2530282,88496,3073),
(2530277,88496,3073),
(2530379,88298,3073),
(2530251,88496,3073),
(2530268,88496,3073),
(2530269,88496,3073),
(2530274,88496,3073),
(2530273,88496,3073),
(2530272,88496,3073),
(2530267,88496,3073),
(2530248,88496,3073),
(2530252,88496,3073),
(2530253,88496,3073),
(2530247,88496,3073),
(2530254,88496,3073),
(2530255,88496,3073),
(2530270,88496,3073),
(2530271,88496,3073),
(2530260,88496,3073),
(2530266,88496,3073),
(2530262,88496,3073),
(2530261,88496,3073),
(2530265,88496,3073),
(2530264,88496,3073),
(2530259,88496,3073),
(2530263,88496,3073),
(2530258,88496,3073),
(2530340,88496,3072),
(2530341,88496,3072),
(88651,88496,3072),
(2530352,88496,3072),
(2530353,88496,3072),
(88650,88496,3072),
(2530350,88496,3072),
(2530351,88496,3072),
(88648,88496,3072),
(88649,88496,3072),
(2530366,88496,3072),
(2530369,88496,3072),
(2530364,88496,3072),
(2530362,88496,3072),
(2530363,88496,3072),
(2530368,88496,3072),
(2530365,88496,3072),
(2530367,88496,3072),
(88608,88496,3072),
(88607,88496,3072),
(2530336,88496,3072),
(2530337,88496,3072),
(2530333,88496,3072),
(2530334,88496,3072),
(2530332,88496,3072),
(2530331,88496,3072),
(2530339,88496,3072),
(2530338,88496,3072),
(2530335,88496,3072),
(2530343,88496,3072),
(88541,88496,3072),
(88559,88496,3072),
(88560,88496,3072),
(2530345,88496,3072),
(2530342,88496,3072),
(2530347,88496,3072),
(2530348,88496,3072),
(2530349,88496,3072),
(88563,88496,3072),
(88564,88496,3072),
(2530346,88496,3072),
(88543,88496,3072),
(2530317,88496,3072),
(2530320,88496,3072),
(2530315,88496,3072),
(2530321,88496,3072),
(2530318,88496,3072),
(2530316,88496,3072),
(2530322,88496,3072),
(2530323,88496,3072),
(2530378,88298,3073),
(2530377,88298,3073),
(2530380,88298,3073),
(2530376,88298,3073),
(2530374,88298,3073),
(2530381,88298,3073),
(2530375,88298,3073),
(2530382,88298,3073),
(88723,88298,3073),
(88722,88298,3073),
(88725,88298,3073),
(88727,88298,3073),
(88724,88298,3073),
(88726,88298,3073),
(2530395,88298,3073),
(2530390,88298,3073),
(2530396,88298,3073),
(2530388,88298,3073),
(2530391,88298,3073),
(2530393,88298,3073),
(2530394,88298,3073),
(2530392,88298,3073),
(88718,88298,3073),
(2530402,88298,3073),
(2530401,88298,3073),
(2530403,88298,3073),
(2530397,88298,3073),
(2530400,88298,3073),
(2530404,88298,3073),
(2530399,88298,3073),
(2530405,88298,3073),
(2530398,88298,3073),
(88719,88298,3073),
(88709,88298,3073),
(2530407,88298,3073),
(88716,88298,3073),
(2530406,88298,3073),
(88710,88298,3073),
(88715,88298,3073),
(88711,88298,3073),
(88714,88298,3073),
(88712,88298,3073),
(88736,88298,3073),
(2530385,88298,3073),
(88737,88298,3073),
(2530384,88298,3073),
(2530383,88298,3073),
(2530386,88298,3073),
(88735,88298,3073),
(2530387,88298,3073),
(88734,88298,3073),
(88721,88298,3073),
(88720,88298,3073),
(88296,88298,3072),
(88289,88298,3072),
(88282,88298,3072),
(88288,88298,3072),
(88295,88298,3072),
(88294,88298,3072),
(88287,88298,3072),
(88291,88298,3072),
(88286,88298,3072),
(88293,88298,3072),
(88292,88298,3072),
(88290,88298,3072),
(88297,88298,3072),
(88283,88298,3072),
(88284,88298,3072),
(88285,88298,3072),
(88266,88298,3073),
(88271,88298,3073),
(88265,88298,3073),
(88269,88298,3073),
(88281,88298,3073),
(88278,88298,3073),
(88279,88298,3073),
(88280,88298,3073),
(88270,88298,3073),
(88267,88298,3073),
(88272,88298,3073),
(88268,88298,3073),
(88262,88298,3073),
(88263,88298,3073),
(88261,88298,3073),
(88264,88298,3073);








/*
-- Query: select * from creature_groups where leaderGUID in (select guid from creature where map = 533)
-- Date: 2017-08-12 14:10
*/
INSERT INTO `creature_groups` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`flags`)
VALUES 
(88438,88439,11.3125,3.27637,6),
(88431,88435,7.40747,1.6397,6),
(88431,88434,8.28381,0.19928,6),
(88394,88401,5.50621,5.71132,6),
(88394,88400,5.40285,2.04768,6),
(88393,88403,4.36646,2.60825,6),
(88393,88402,5.14078,5.1247,6),
(88395,88396,17.9912,3.94272,6),
(88409,88411,30.6756,5.47968,6),
(88409,88408,9.2693,2.86626,6),
(88409,88410,9.80378,1.86171,6),
(88420,88422,21.5361,3.77267,6),
(88420,88418,19.4298,2.80589,6),
(88420,88419,12.9696,2.20109,6),
(88420,88421,8.18176,4.76619,6),
(88426,88417,7.28106,1.07091,6),
(88426,88416,7.76384,3.68887,6),
(88413,88414,12.3101,6.27993,6),
(88413,88412,9.69387,5.84306,6),
(88413,88415,6.11542,5.41674,6),
(88406,88405,7.08383,4.56789,6),
(88406,88404,10.8064,5.35161,6),
(88406,88423,6.33888,6.09756,6),
(88099,88098,13.9368,4.74324,6),
(88097,88096,15.3997,4.7481,6),
(88093,88092,17.2004,4.70541,6),
(88088,88085,11.9467,4.34509,6),
(88088,88086,5.69517,3.29315,6),
(88088,88087,5.45014,5.01037,6),
(88088,88084,13.4617,3.76875,6),
(88091,88277,10.1765,0.114252,6),
(88091,88089,11.365,5.62631,6),
(88091,88090,8.40036,1.56365,6),
(88091,88276,9.96018,0.688706,6),
(88083,88082,8.19107,0.014665,6),
(88083,88079,6.82699,0.856945,6),
(88083,88080,15.1907,0.801229,6),
(88083,88081,13.3155,0.446518,6),
(88343,88342,18.3672,5.73128,6),
(88343,88338,8.39385,5.14513,6),
(88343,88339,10.7638,1.32107,6),
(88343,88340,15.7231,0.747608,6),
(88343,88341,13.7664,6.201,6),
(88313,88311,21.357,3.33715,6),
(88313,88336,19.1011,3.728,6),
(88313,88337,12.4199,3.00835,6),
(88313,88312,13.1395,2.00686,6),
(88313,88314,17.983,4.28829,6),
(2530242,2530246,10.4201,2.03228,6),
(2530242,2530238,19.3819,2.35728,6),
(2530242,2530239,17.7232,1.86917,6),
(2530242,2530240,13.3963,1.17297,6),
(2530242,2530241,6.72544,1.28902,6),
(2530242,2530243,24.1565,2.02,6),
(2530242,2530244,16.6207,1.56237,6),
(2530242,2530245,14.1146,2.55949,6),
(88309,88310,17.9315,0.049089,6),
(88309,88334,12.8484,0.463996,6),
(88309,88335,11.3303,5.26734,6),
(88309,88307,12.9739,1.21249,6),
(88296,88297,19.775,4.41207,6),
(88296,88282,12.5201,3.34181,6),
(88296,88283,20.0169,3.69966,6),
(88296,88284,28.4549,4.0343,6),
(88296,88285,31.1352,4.35336,6),
(88296,88286,29.5542,5.00943,6),
(88296,88287,25.0441,5.35757,6),
(88296,88288,9.06259,5.41265,6),
(88296,88289,8.39307,3.99781,6),
(88296,88290,25.0292,4.52267,6),
(88296,88291,21.0379,4.90223,6),
(88296,88293,31.8631,4.81362,6),
(88296,88294,21.0001,5.57937,6),
(88296,88295,10.4993,6.03982,6),
(88272,88268,16.9939,1.22811,6),
(88272,88267,17.1744,3.46205,6),
(88281,88280,31.4668,2.39891,6),
(88281,88278,10.5548,2.74369,6),
(88281,88279,23.4214,2.59019,6),
(88271,88266,15.6906,4.28666,6),
(88271,88265,16.5511,0.365131,6),
(2530559,2530558,16.0982,3.37969,6),
(2530559,2530560,7.77125,4.69643,6),
(2530559,2530561,7.14206,3.22215,6),
(2530559,2530557,16.8078,4.62978,6),
(2530554,2530553,14.7307,1.04345,6),
(2530554,2530555,7.43685,2.1447,6),
(2530554,2530556,7.38238,1.05018,6),
(2530554,2530552,14.6274,2.14356,6),
(2530547,2530549,16.4744,4.33619,6),
(2530547,2530550,7.88833,5.31867,6),
(2530547,2530551,7.82758,4.21481,6),
(2530547,2530548,18.3816,5.22984,6),
(2530544,2530543,15.3585,1.93736,6),
(2530544,2530545,6.76385,2.95877,6),
(2530544,2530546,6.22538,1.91331,6),
(2530544,2530542,17.4459,2.83738,6),
(2530539,2530538,15.1485,4.92462,6),
(2530539,2530540,6.68047,6.14785,6),
(2530539,2530541,6.65651,4.8086,6),
(2530539,2530537,15.2536,6.01395,6),
(2530534,2530533,15.9731,3.6102,6),
(2530534,2530535,7.88315,3.73023,6),
(2530534,2530536,7.52905,2.42322,6),
(2530534,2530532,16.6061,2.5495,6),
(2530529,2530528,14.2481,3.40725,6),
(2530529,2530530,6.34493,4.58402,6),
(2530529,2530531,5.95976,3.30923,6),
(2530529,2530527,15.2191,4.45577,6),
(2530524,2530523,15.8089,4.22079,6),
(2530524,2530525,8.0545,5.4822,6),
(2530524,2530526,7.17237,4.04353,6),
(2530524,2530522,17.0155,5.22842,6),
(2530519,2530518,13.0754,0.976792,6),
(2530519,2530520,7.50705,2.56276,6),
(2530519,2530521,5.55853,1.10021,6),
(2530519,2530517,14.0084,2.25317,6),
(2530514,2530515,7.2668,6.02722,6),
(2530505,2530508,9.02102,5.88518,6),
(2530505,2530509,8.1768,0.443777,6),
(2530514,2530516,6.6079,5.14829,6),
(2530514,2530512,16.0155,6.15798,6),
(2530505,2530506,16.3558,0.438498,6),
(2530505,2530507,16.1132,5.75559,6),
(2530514,2530513,14.909,4.90269,6),
(2530504,2530503,13.3421,1.92561,6),
(2530504,2530510,5.86693,3.05798,6),
(2530504,2530511,6.8253,1.75953,6),
(2530504,2530502,13.9885,2.98614,6),
(2530454,88141,30.6932,3.15081,6),
(2530454,88130,23.1244,4.17771,6),
(2530481,2530480,11.035,5.55946,6),
(2530481,2530482,14.7196,1.02724,6),
(2530481,88124,15.1583,0.638537,6),
(2530481,88125,15.9109,4.69993,6),
(2530454,88131,3.06976,2.73246,6),
(2530452,88135,29.4002,0.631804,6),
(2530452,2530448,19.558,2.3674,6),
(2530452,2530449,23.6531,1.61151,6),
(2530452,2530450,26.7024,0.858273,6),
(2530452,88117,10.318,3.4423,6),
(2530452,88118,7.38722,0.488007,6),
(2530447,2530446,7.00241,5.34279,15),
(2530433,2530435,22.5349,2.38439,6),
(2530436,2530437,19.0559,3.90351,6),
(2530439,2530438,22.5464,8.60809,6),
(2530441,2530440,15.053,3.69984,6),
(2530443,2530442,12.1677,3.49344,6),
(2530445,2530444,18.1317,3.69603,6),
(2530428,2530427,13.1218,2.68715,6),
(2530428,2530431,10.8516,4.47437,6),
(2530428,2530432,7.60759,3.31544,6),
(2530428,2530426,13.5602,3.64318,6),
(88922,88923,16.318,6.25193,6),
(88922,2530429,9.11508,1.12138,6),
(2530421,2530420,10.0626,0.604133,6),
(2530421,2530422,4.68793,5.70019,6),
(2530421,2530423,4.12547,0.517054,6),
(2530421,2530419,10.911,5.60056,6),
(2530406,2530407,6.95752,0.103667,6),
(2530406,88709,8.64515,0.592788,6),
(2530406,88710,9.266,1.43439,6),
(2530406,88711,9.04452,2.09283,6),
(2530406,88712,9.30071,3.12763,6),
(2530406,88714,6.71818,2.48708,6),
(2530406,88715,6.73378,1.69734,6),
(2530406,88716,7.72788,1.10944,6),
(2530397,2530405,6.03012,3.37247,6),
(2530397,2530398,7.15521,3.75516,6),
(2530397,2530399,8.46864,2.96713,6),
(2530397,2530400,8.24016,1.72677,6),
(2530397,2530401,7.73991,0.895267,6),
(2530397,2530402,6.10509,0.573029,6),
(2530397,2530403,5.91093,1.33692,6),
(2530397,2530404,5.73806,2.38948,6),
(2530388,2530392,7.01362,3.42184,6),
(2530388,2530393,7.90595,2.87667,6),
(2530388,2530394,7.18671,4.05523,6),
(2530388,2530395,8.07039,1.95568,6),
(2530388,2530396,8.12983,1.15281,6),
(2530388,2530389,7.23552,0.807875,6),
(2530388,2530390,7.77835,1.52452,6),
(2530388,2530391,7.50594,2.3873,6),
(2530383,2530387,6.11973,4.42579,6),
(2530383,88734,8.32247,4.73642,6),
(2530383,88735,7.41076,3.9327,6),
(2530383,88736,8.27318,2.88869,6),
(2530383,88737,7.77648,1.98787,6),
(2530383,2530384,5.39122,1.54856,6),
(2530383,2530385,6.80857,2.45881,6),
(2530383,2530386,6.49765,3.38247,6),
(88727,88726,14.1928,1.30121,6),
(88727,88724,12.72,6.2824,6),
(88727,88725,16.7884,0.555953,6),
(88470,88472,8.17791,4.07451,6),
(88470,88471,7.44804,0.966765,6),
(88475,2530410,6.88658,5.75843,6),
(88475,2530411,8.17652,0.69881,6),
(88475,2530409,7.35097,4.65796,6),
(88447,88450,12.5713,1.39166,6),
(88447,88457,11.1413,4.51271,6),
(88447,88449,11.0195,2.83935,6),
(88448,88453,7.37561,4.23178,6),
(88448,88451,7.07104,1.24099,6),
(88448,88452,8.55718,2.81318,6),
(2530412,88454,11.1084,1.18696,6),
(2530412,88456,8.47306,5.05169,6),
(2530412,88455,13.4782,0.034894,6),
(88263,88261,33.3301,4.87695,6),
(88263,88262,23.54,4.4805,6),
(88263,88264,39.7219,5.47465,6),
(88873,88874,4.27234,6.14226,7),
(88873,88871,5.33233,1.08282,7),
(88873,88872,4.72641,1.73874,7),
(88760,88762,2.97126,2.89329,7),
(88760,88761,2.87111,0.207001,7),
(88867,88866,3.69226,2.59793,7),
(88867,88864,4.39214,4.26505,7),
(88867,88865,5.74492,3.55541,7),
(88869,88870,5.14998,2.43596,6),
(88869,88868,5.21401,5.57787,6),
(88933,88936,4.51482,4.8367,7),
(88933,88934,3.4002,3.1357,7),
(88933,88935,5.41227,5.27784,7),
(88938,88940,5.0257,3.8241,7),
(88938,88937,3.1386,3.03302,7),
(88938,88939,4.44157,4.48761,7),
(88763,88765,3.21898,3.40241,7),
(88763,88764,2.94162,5.98298,7),
(88942,88945,4.51485,4.83676,7),
(88942,88943,3.39996,3.1357,7),
(88942,88944,5.41261,5.27786,7),
(88946,88949,3.59564,4.49371,7),
(88946,88947,3.1386,6.17462,7),
(88946,88948,5.13302,5.14032,7),
(88951,88954,4.51482,4.8367,7),
(88951,88952,3.4002,3.1357,7),
(88951,88953,5.41227,5.27784,7),
(88956,88958,5.0257,3.8241,7),
(88956,88955,3.1386,3.03302,7),
(88956,88957,4.44181,4.48762,7),
(88766,88768,3.17595,1.78978,7),
(88766,88767,3.16291,4.54723,7),
(88960,88963,4.51485,4.83676,7),
(88960,88961,3.39996,3.1357,7),
(88960,88962,5.41261,5.27786,7),
(88965,88967,5.0257,3.8241,7),
(88965,88964,3.13835,3.03301,7),
(88965,88966,4.44181,4.48762,7),
(2530415,88898,6.43465,0.610524,7),
(88893,88896,3.59564,4.49371,7),
(88893,88894,3.13857,6.17469,7),
(88893,88895,5.1328,5.14034,7),
(88889,88892,4.51485,4.83676,7),
(88889,88890,3.39996,3.1357,7),
(88889,88891,5.41261,5.27786,7),
(88924,88927,4.51482,4.8367,7),
(88924,88925,3.4002,3.1357,7),
(88924,88926,5.41248,5.27782,7),
(88929,88931,5.02589,3.82407,7),
(88929,88928,3.1386,3.03302,7),
(88929,88930,4.44157,4.48761,7),
(88912,88915,4.51485,4.83676,7),
(88912,88913,3.39996,3.1357,7),
(88912,88914,5.40726,5.2763,7),
(88916,88919,3.59564,4.49371,7),
(88916,88917,3.12865,6.17427,7),
(88916,88918,5.12865,5.13856,7),
(88922,2530430,7.52462,0.227886,6),
(88922,88921,15.9847,1.41058,6),
(88885,88887,5.02589,3.82407,7),
(88885,88884,3.1386,3.03302,7),
(88885,88886,4.44181,4.48762,7),
(88880,88883,4.51485,4.83676,7),
(88880,88881,3.39996,3.1357,7),
(88880,88882,5.41241,5.27788,7),
(89102,89105,3.59564,4.49371,7),
(89102,89103,3.13857,6.17469,7),
(89102,89104,5.1328,5.14034,7),
(89098,89101,4.51482,4.8367,7),
(89098,89099,3.4002,3.1357,7),
(89098,89100,5.41248,5.27782,7),
(89120,89123,3.59564,4.49371,7),
(89120,89121,3.14937,6.17187,7),
(89120,89122,5.14596,5.14125,7),
(89116,89119,4.51485,4.83676,7),
(89116,89117,3.3902,3.13569,7),
(89116,89118,5.40941,5.28038,7),
(89112,89114,5.02604,3.82411,7),
(89112,89111,3.13857,3.0331,7),
(89112,89113,4.44181,4.48762,7),
(89107,89110,4.51482,4.8367,7),
(89107,89108,3.4002,3.1357,7),
(89107,89109,5.41248,5.27782,7),
(89134,89137,3.59564,4.49371,7),
(89134,89135,3.13857,6.17469,7),
(89134,89136,5.1328,5.14034,7),
(89130,89133,4.51485,4.83676,7),
(89130,89131,3.39996,3.1357,7),
(89130,89132,5.41261,5.27786,7),
(2530414,2530413,7.3265,3.04179,15),
(88473,88474,5.98019,6.27482,15),
(88474,88473,5.98019,3.13322,7),
(2530374,2530378,5.15667,2.80926,6),
(2530374,2530379,6.60346,3.22751,6),
(2530374,2530380,6.95178,4.05568,6),
(2530374,2530381,7.19307,4.93466,6),
(2530374,2530382,7.37456,5.805,6),
(2530374,2530375,6.24728,5.33489,6),
(2530374,2530376,6.30208,4.4686,6),
(2530374,2530377,5.05232,3.6353,6),
(2530372,2530373,5.98178,4.01235,7),
(88851,2530370,7.98219,3.87742,15),
(88851,88849,7.10442,2.70564,15),
(2530364,2530369,4.59101,2.12379,6),
(2530364,2530362,6.68964,5.25726,6),
(2530364,2530363,7.36442,0.186427,6),
(2530364,2530365,9.01726,3.48219,6),
(2530364,2530366,8.30779,1.43232,6),
(2530364,2530367,8.37017,2.79001,6),
(2530364,2530368,8.81406,4.47643,6),
(533000,88465,17.5749,1.0172,15),
(533000,88466,18.7217,5.231,15),
(2530361,2530360,10.9186,3.67279,7),
(2530361,2530354,14.7777,3.99499,7),
(2530361,2530355,15.8294,4.27339,7),
(2530361,2530356,10.4311,4.4811,7),
(2530361,2530357,8.63163,3.99204,7),
(2530361,2530358,10.1969,3.29854,7),
(2530361,2530359,14.6635,3.61555,7),
(88651,2530353,6.16534,3.12326,6),
(88651,88648,11.0265,0.441337,6),
(88651,88649,14.6796,0.6923,6),
(88651,88650,8.35256,2.33672,6),
(88651,2530350,7.79768,1.96276,6),
(88651,2530351,10.2212,1.24643,6),
(88651,2530352,5.30145,0.690463,6),
(88608,88607,8.75211,1.10765,15),
(88543,2530349,27.4501,2.07027,6),
(88543,88563,25.3958,1.70428,6),
(88543,88564,26.3661,1.54955,6),
(88543,2530346,10.1121,1.06262,6),
(88543,2530347,13.0484,2.11861,6),
(88543,2530348,27.2807,2.37318,6),
(88541,2530345,24.1545,5.17711,6),
(88541,88559,19.7517,4.34307,6),
(88541,88560,19.2949,4.65224,6),
(88541,2530342,16.8909,3.14129,6),
(2530568,88301,15.0093,7.54701,6),
(88300,88299,16.1763,6.22627,6),
(88305,88306,23.6619,4.72465,6),
(88808,88810,6.76021,3.53439,15),
(88808,88809,6.66522,2.6693,15),
(88795,88797,3.97623,0.743924,15),
(88795,88796,3.49285,2.32213,15),
(88429,88428,7.90055,4.76433,6),
(88429,88430,9.01197,5.78578,6),
(88429,88427,8.84809,0.44141,6),
(88432,88437,9.14933,2.73958,6),
(88432,88436,9.24439,3.57235,6),
(88438,88433,9.77186,2.46351,6),
(88444,88443,8.40371,1.36711,6),
(88444,88445,6.52038,0.175761,6),
(88444,88446,9.29992,0.715415,6),
(88440,88442,6.0001,0.182114,15),
(88440,88441,6.20943,5.34892,15),
(88425,88424,4.40571,2.41398,15),
(88397,88398,4.09886,4.46095,15),
(88397,88399,3.91167,0.076781,15),
(2530341,2530340,6.01656,11.5782,15),
(2530337,2530339,12.6262,0.56736,6),
(2530337,2530331,16.1022,0.886337,6),
(2530337,2530332,13.6886,1.40068,6),
(2530337,2530333,8.66018,1.63232,6),
(2530337,2530334,7.97066,0.968283,6),
(2530337,2530335,14.6348,0.108933,6),
(2530337,2530336,3.91468,2.2731,6),
(2530337,2530338,8.57839,0.18554,6),
(127982,2530330,8.19881,3.37263,6),
(127982,88623,12.4752,2.75618,6),
(127982,2530328,9.56052,0.584171,6),
(127982,2530329,9.40065,1.67727,6),
(127981,2530327,8.29027,0.303795,6),
(127981,2530324,10.9803,3.81233,6),
(127981,2530325,10.0619,4.66586,6),
(127981,2530326,8.03833,5.39685,6),
(2530323,2530322,4.45496,3.36501,15),
(2530323,2530315,4.16258,3.98106,15),
(2530323,2530316,6.75805,3.86557,15),
(2530323,2530317,7.36797,4.14387,15),
(2530323,2530318,9.91787,4.04833,15),
(88322,88315,8.56629,4.32451,6),
(2530312,2530311,7.70149,4.34586,15),
(2530314,2530313,8.75329,4.68497,7),
(2530323,2530320,11.0326,4.33498,15),
(2530323,2530321,8.3548,3.62758,15),
(2530310,2530307,5.46088,3.15992,15),
(2530310,2530308,7.43091,2.41619,15),
(88851,88850,6.24229,3.28306,15),
(88322,88317,10.6915,3.67431,6),
(88322,88318,14.6728,4.08865,6),
(88322,88319,13.2604,4.55184,6),
(2530254,2530247,3.3425,0.199258,15),
(2530254,2530248,7.48921,5.85891,15),
(2530254,2530251,11.1241,4.74158,15),
(2530254,2530252,6.66718,4.74176,15),
(2530254,2530253,4.05654,5.39055,15),
(2530254,2530255,3.37756,4.03824,15),
(2530254,2530258,3.36757,3.08567,15),
(88541,2530343,10.4802,5.4317,6),
(2530283,2530289,11.6684,4.0424,6),
(2530283,2530284,4.2866,3.59913,6),
(2530283,2530286,13.0375,3.64786,6),
(2530283,2530288,7.45627,4.28795,6),
(2530283,2530290,15.7358,3.94815,6),
(2530283,2530285,8.22669,3.64156,6),
(2530283,2530287,4.8138,4.75308,6),
(2530276,2530282,9.49656,3.55673,6),
(2530276,2530275,5.0349,4.81186,6),
(2530276,2530277,14.2008,3.54694,6),
(2530276,2530279,12.7235,3.90643,6),
(2530276,2530281,4.36331,3.54678,6),
(2530276,2530278,16.9452,3.77282,6),
(2530276,2530280,8.17157,4.1896,6),
(2530267,2530274,18.909,3.64972,6),
(2530267,2530268,16.4296,3.83649,6),
(2530267,2530269,5.50393,3.89615,6),
(2530267,2530271,4.31967,2.88654,6),
(2530267,2530273,13.6857,3.57681,6),
(2530267,2530270,10.9531,3.85528,6),
(2530267,2530272,8.92222,3.43144,6),
(2530291,2530298,15.0596,5.56074,6),
(2530291,2530293,8.64248,5.9117,6),
(2530291,2530295,4.83135,4.51169,6),
(2530291,2530297,11.0809,5.47016,6),
(2530291,2530292,4.38411,5.94363,6),
(2530291,2530294,13.1386,5.91109,6),
(2530291,2530296,7.62696,5.19362,6),
(2530303,2530305,8.9772,5.2478,6),
(2530303,2530300,14.9926,5.94488,6),
(2530303,2530302,5.57883,5.97309,6),
(2530303,2530304,6.39938,4.7771,6),
(2530303,2530306,13.2672,5.50763,6),
(2530303,2530299,16.7834,5.64015,6),
(2530303,2530301,10.4998,5.9731,6),
(2530263,2530265,10.01,3.27587,6),
(2530263,2530259,4.66456,2.04498,6),
(2530263,2530262,12.8509,2.88189,6),
(2530263,2530264,4.62575,3.28261,6),
(2530263,2530266,15.4471,3.26491,6),
(2530263,2530260,17.5367,2.94532,6),
(2530263,2530261,8.24203,2.68012,6),
(88541,2530344,10.0988,3.81874,6),
(2530220,2530221,5.67378,2.87948,7),
(2530220,2530222,7.31388,2.1626,7),
(2530371,88856,5.99895,2.23625,7),
(88322,88320,9.86019,4.86203,6),
(88322,88321,4.07449,5.33926,6),
(88322,88329,12.644,5.35923,6),
(88309,88308,13.3273,6.04149,6),
(88859,88860,8.18054,3.1538,7),
(88859,88861,9.71605,4.47342,7),
(88859,88862,7.1089,3.87524,7),
(88773,88774,22.0061,0.79504,6),
(88772,88771,21.771,1.56115,6),
(88769,88770,21.8715,1.55937,6),
(88807,88806,23.153,1.55438,6),
(88805,88804,23.1411,1.53968,6),
(88802,88803,31.6012,2.36268,6),
(88801,88800,32.0401,2.34803,6),
(88799,88798,21.7409,3.10985,6),
(88794,88793,20.5153,3.6634,6),
(88791,88792,22.8699,4.71195,6),
(88789,88790,21.8624,4.72703,6),
(88787,88788,23.1309,5.50909,6),
(88785,88786,28.3717,4.10273,6),
(88784,88783,15.7959,3.88663,6),
(88781,88782,4.69984,4.06305,6),
(88776,88775,12.452,9.94033,6),
(2530568,88302,17.0826,4.84884,6),
(127795,127818,11.3225,3.56896,15),
(127823,127799,13.2325,5.30584,15),
(88777,88778,13.8705,10.174,6),
(88780,88779,14.6885,4.44886,6),
(127798,127824,7.12035,5.40927,15),
(127797,127796,10.3397,5.29395,15),
(127819,2530408,4.03805,5.51352,15);












update `creature_template` set `flags_extra` = 769 where `entry` = 15928; -- Thaddius
update `creature_template` set `flags_extra` = 8705 where `entry` = 15929; -- Stalagg
update `creature_template` set `flags_extra` = 513 where `entry` = 15930; -- Feugen
update `creature_template` set `flags_extra` = 769 where `entry` = 15931; -- Grobbulus
update `creature_template` set `flags_extra` = 769 where `entry` = 15932; -- Gluth
update `creature_template` set `flags_extra` = 769 where `entry` = 15936; -- Heigan the Unclean
update `creature_template` set `flags_extra` = 769 where `entry` = 15952; -- Maexxna
update `creature_template` set `flags_extra` = 769 where `entry` = 15953; -- Grand Widow Faerlina
update `creature_template` set `flags_extra` = 769 where `entry` = 15954; -- Noth the Plaguebringer
update `creature_template` set `flags_extra` = 769 where `entry` = 15956; -- Anub'Rekhan
update `creature_template` set `flags_extra` = 769 where `entry` = 15989; -- Sapphiron
update `creature_template` set `flags_extra` = 769 where `entry` = 15990; -- Kel'Thuzad
update `creature_template` set `flags_extra` = 769 where `entry` = 16011; -- Loatheb
update `creature_template` set `flags_extra` = 769 where `entry` = 16060; -- Gothik the Harvester
update `creature_template` set `flags_extra` = 513 where `entry` = 16061; -- Instructor Razuvious
update `creature_template` set `flags_extra` = 513 where `entry` = 16062; -- Highlord Mograine
update `creature_template` set `flags_extra` = 513 where `entry` = 16063; -- Sir Zeliek
update `creature_template` set `flags_extra` = 513 where `entry` = 16064; -- Thane Korth'azz
update `creature_template` set `flags_extra` = 513 where `entry` = 16065; -- Lady Blaumeux
update `creature_template` set `flags_extra` = 768 where `entry` = 16028; -- Patchwerk
update `creature_template` set `flags_extra` = 4096 where `entry` = 16017; -- Patchwork Golem
update `creature_template` set `flags_extra` = 2050 where `entry` = 16027; -- Living Poison
update `creature_template` set `flags_extra` = 4096 where `entry` = 16029; -- Sludge Belcher
update `creature_template` set `flags_extra` = 4096 where `entry` = 16034; -- Plague Beast
update `creature_template` set `flags_extra` = 4096 where `entry` = 16290; -- Fallout Slime
update `creature_template` set `flags_extra` = 4096 where `entry` = 16168; -- Stoneskin Gargoyle
update `creature_template` set `flags_extra` = 4096 where `entry` = 16164; -- Shade of Naxxramas
update `creature_template` set `flags_extra` = 4096 where `entry` = 16449; -- Spirit of Naxxramas

update creature_template set flags_extra = 0 where entry in (
15974, -- Dread Creeper
15975, -- Carrion Spinner
15976, -- Venom Stalker
15977, -- Poisonous Skitterer
15978, -- Crypt Reaver
15980, -- Naxxramas Cultist
15981, -- Naxxramas Acolyte
16018, -- Bile Retcher
16020, -- Mad Scientist
16021, -- Living Monstrosity
16022, -- Surgical Assistant
16024, -- Embalming Slime
16025, -- Stitched Giant
16037, -- Plagued Bat
16056, -- Diseased Maggot
16057, -- Rotting Maggot
16067, -- Deathcharger Steed
16124, -- Unrelenting Trainee
16125, -- Unrelenting Death Knight
16126, -- Unrelenting Rider
16127, -- Spectral Trainee
16142, -- Bile Sludge
16145, -- Death Knight Captain
16148, -- Spectral Death Knight
16149, -- Spectral Horse
16150, -- Spectral Rider
16154, -- Risen Squire
16156, -- Dark Touched Warrior
16157, -- Doom Touched Warrior
16158, -- Death Touched Warrior
16163, -- Death Knight Cavalier
16165, -- Necro Knight
16167, -- Bony Construct
16236, -- Eye Stalk
16243, -- Plague Slime
16244, -- Infectious Ghoul
16297, -- Mutated Grub
16360, -- Zombie Chow
16368, -- Necropolis Acolyte
16427, -- Soldier of the Frozen Wastes
16428, -- Unstoppable Abomination
16429, -- Soul Weaver
16441, -- Guardian of Icecrown
16446, -- Plagued Gargoyle
16447, -- Plagued Ghoul
16451, -- Deathknight Vindicator
16452, -- Necro Knight Guardian
16453, -- Necro Stalker
16505, -- Naxxramas Follower
16506, -- Naxxramas Worshipper
16573, -- Crypt Guard
16698, -- Corpse Scarab
16803, -- Death Knight Understudy
16861, -- Death Lord
16981, -- Plagued Guardian
16982, -- Plagued Construct
16983, -- Plagued Champion
16984, -- Plagued Warrior
17055, -- Maexxna Spiderling
16194, -- Unholy Axe
16215, -- Unholy Staff
16216, -- Unholy Swords
16420, -- Portal of Shadows
16446, -- Plagued Gargoyle
16448, -- Plagued Deathhound
16390 -- Deathchill Servant
);




update `creature_template` set `MechanicImmuneMask` = 1019953019 where `entry` = 15928; -- Thaddius
update `creature_template` set `MechanicImmuneMask` = 1019953019 where `entry` = 15929; -- Stalagg
update `creature_template` set `MechanicImmuneMask` = 1019953019 where `entry` = 15930; -- Feugen
update `creature_template` set `MechanicImmuneMask` = 1019953019 where `entry` = 15931; -- Grobbulus
update `creature_template` set `MechanicImmuneMask` = 1019953019 where `entry` = 15932; -- Gluth
update `creature_template` set `MechanicImmuneMask` = 1019953019 where `entry` = 15936; -- Heigan the Unclean
update `creature_template` set `MechanicImmuneMask` = 1019953019 where `entry` = 15952; -- Maexxna
update `creature_template` set `MechanicImmuneMask` = 1019953019 where `entry` = 15953; -- Grand Widow Faerlina
update `creature_template` set `MechanicImmuneMask` = 1019953019 where `entry` = 15954; -- Noth the Plaguebringer
update `creature_template` set `MechanicImmuneMask` = 1019953019 where `entry` = 15956; -- Anub'Rekhan
update `creature_template` set `MechanicImmuneMask` = 1019953019 where `entry` = 15989; -- Sapphiron
update `creature_template` set `MechanicImmuneMask` = 1019953019 where `entry` = 15990; -- Kel'Thuzad
update `creature_template` set `MechanicImmuneMask` = 1019953019 where `entry` = 16011; -- Loatheb
update `creature_template` set `MechanicImmuneMask` = 1019953019 where `entry` = 16028; -- Patchwerk
update `creature_template` set `MechanicImmuneMask` = 1019953019 where `entry` = 16060; -- Gothik the Harvester
update `creature_template` set `MechanicImmuneMask` = 1019953019 where `entry` = 16061; -- Instructor Razuvious
update `creature_template` set `MechanicImmuneMask` = 1019953019 where `entry` = 16062; -- Highlord Mograine
update `creature_template` set `MechanicImmuneMask` = 1019953019 where `entry` = 16063; -- Sir Zeliek
update `creature_template` set `MechanicImmuneMask` = 1019953019 where `entry` = 16064; -- Thane Korth'azz
update `creature_template` set `MechanicImmuneMask` = 1019953019 where `entry` = 16065; -- Lady Blaumeux
update `creature_template` set `MechanicImmuneMask` = 1023391482 where `entry` = 15974; -- Dread Creeper
update `creature_template` set `MechanicImmuneMask` = 1023391482 where `entry` = 15975; -- Carrion Spinner
update `creature_template` set `MechanicImmuneMask` = 1023391482 where `entry` = 15977; -- Poisonous Skitterer
update `creature_template` set `MechanicImmuneMask` = 1023391483 where `entry` = 15980; -- Naxxramas Cultist
update `creature_template` set `MechanicImmuneMask` = 1023391483 where `entry` = 15981; -- Naxxramas Acolyte
update `creature_template` set `MechanicImmuneMask` = 1015758352 where `entry` = 16020; -- Mad Scientist
update `creature_template` set `MechanicImmuneMask` = 1015751184 where `entry` = 16022; -- Surgical Assistant
update `creature_template` set `MechanicImmuneMask` = 1019952723 where `entry` = 16021; -- Living Monstrosity
update `creature_template` set `MechanicImmuneMask` = 1022042641 where `entry` = 16056; -- Diseased Maggot
update `creature_template` set `MechanicImmuneMask` = 1022042641 where `entry` = 16236; -- Eye Stalk
update `creature_template` set `MechanicImmuneMask` = 1022042641 where `entry` = 16057; -- Rotting Maggot
update `creature_template` set `MechanicImmuneMask` = 1015751186 where `entry` = 16027; -- Living Poison
update `creature_template` set `MechanicImmuneMask` = 1023393531 where `entry` = 16142; -- Bile Sludge
update `creature_template` set `MechanicImmuneMask` = 1015756368 where `entry` = 16167; -- Bony Construct
update `creature_template` set `MechanicImmuneMask` = 1022049811 where `entry` = 16243; -- Plague Slime
update `creature_template` set `MechanicImmuneMask` = 1015226896 where `entry` = 16244; -- Infectious Ghoul
update `creature_template` set `MechanicImmuneMask` = 1021518352 where `entry` = 16447; -- Plagued Ghoul
update `creature_template` set `MechanicImmuneMask` = 1022042641 where `entry` = 16698; -- Corpse Scarab
update `creature_template` set `MechanicImmuneMask` = 1022042641 where `entry` = 17055; -- Maexxna Spiderling
update `creature_template` set `MechanicImmuneMask` = 1015751184 where `entry` = 16390; -- Deathchill Servant
update `creature_template` set `MechanicImmuneMask` = 1022042643 where `entry` = 16037; -- Plagued Bat
update `creature_template` set `MechanicImmuneMask` = 1022042641 where `entry` = 16036; -- Frenzied Bat
update `creature_template` set `MechanicImmuneMask` = 1022049811 where `entry` = 16034; -- Plague Beast
update `creature_template` set `MechanicImmuneMask` = 1022042641 where `entry` = 16297; -- Mutated Grub
update `creature_template` set `MechanicImmuneMask` = 1015751186 where `entry` = 16164; -- Shade of Naxxramas
update `creature_template` set `MechanicImmuneMask` = 1015751186 where `entry` = 16449; -- Spirit of Naxxramas
update `creature_template` set `MechanicImmuneMask` = 1023391482 where `entry` = 16505; -- Naxxramas Follower
update `creature_template` set `MechanicImmuneMask` = 1023391482 where `entry` = 16506; -- Naxxramas Worshipper
update `creature_template` set `MechanicImmuneMask` = 1015751184 where `entry` = 16981; -- Plagued Guardian
update `creature_template` set `MechanicImmuneMask` = 1021518353 where `entry` = 16982; -- Plagued Construct
update `creature_template` set `MechanicImmuneMask` = 1015226896 where `entry` = 16983; -- Plagued Champion
update `creature_template` set `MechanicImmuneMask` = 1021518353 where `entry` = 16984; -- Plagued Warrior
update `creature_template` set `MechanicImmuneMask` = 1023393530 where `entry` = 16573; -- Crypt Guard
update `creature_template` set `MechanicImmuneMask` = 1006632960 where `entry` = 16127; -- Spectral Trainee
update `creature_template` set `MechanicImmuneMask` = 1006764032 where `entry` = 16148; -- Spectral Death Knight
update `creature_template` set `MechanicImmuneMask` = 1006764050 where `entry` = 16149; -- Spectral Horse
update `creature_template` set `MechanicImmuneMask` = 1015693311 where `entry` = 16150; -- Spectral Rider
update `creature_template` set `MechanicImmuneMask` = 1006764032 where `entry` = 16124; -- Unrelenting Trainee
update `creature_template` set `MechanicImmuneMask` = 1006764050 where `entry` = 16125; -- Unrelenting Death Knight
update `creature_template` set `MechanicImmuneMask` = 1023033343 where `entry` = 16126; -- Unrelenting Rider
update `creature_template` set `MechanicImmuneMask` = 1006830096 where `entry` = 16154; -- Risen Squire
update `creature_template` set `MechanicImmuneMask` = 1006830096 where `entry` = 16156; -- Dark Touched Warrior
update `creature_template` set `MechanicImmuneMask` = 1006830096 where `entry` = 16157; -- Doom Touched Warrior
update `creature_template` set `MechanicImmuneMask` = 1006830096 where `entry` = 16158; -- Death Touched Warrior
update `creature_template` set `MechanicImmuneMask` = 1015758354 where `entry` = 16024; -- Embalming Slime
update `creature_template` set `MechanicImmuneMask` = 1015758450 where `entry` = 16375; -- Sewage Slime
update `creature_template` set `MechanicImmuneMask` = 1015758846 where `entry` = 16290; -- Fallout Slime
update `creature_template` set `MechanicImmuneMask` = 1015226896 where `entry` = 16360; -- Zombie Chow
update `creature_template` set `MechanicImmuneMask` = 1022049874 where `entry` = 16803; -- Death Knight Understudy
update `creature_template` set `MechanicImmuneMask` = 1019952754 where `entry` = 16429; -- Soul Weaver
update `creature_template` set `MechanicImmuneMask` = 1019428466 where `entry` = 16441; -- Guardian of Icecrown
update `creature_template` set `MechanicImmuneMask` = 1019952754 where `entry` = 16428; -- Unstoppable Abomination
update `creature_template` set `MechanicImmuneMask` = 1015226896 where `entry` = 16427; -- Soldier of the Frozen Wastes
update `creature_template` set `MechanicImmuneMask` = 1022066674 where `entry` = 16017; -- Patchwork Golem
update `creature_template` set `MechanicImmuneMask` = 1022066674 where `entry` = 16025; -- Stitched Spewer
update `creature_template` set `MechanicImmuneMask` = 1022066674 where `entry` = 16018; -- Bile Retcher
update `creature_template` set `MechanicImmuneMask` = 1022066674 where `entry` = 16029; -- Sludge Belcher
update `creature_template` set `MechanicImmuneMask` = 1022049875 where `entry` = 16448; -- Plagued Deathhound
update `creature_template` set `MechanicImmuneMask` = 1022049875 where `entry` = 16368; -- Necropolis Acolyte
update `creature_template` set `MechanicImmuneMask` = 1023393531 where `entry` = 15978; -- Crypt Reaver
update `creature_template` set `MechanicImmuneMask` = 1019945555 where `entry` = 16067; -- Deathcharger Steed
update `creature_template` set `MechanicImmuneMask` = 1019952727 where `entry` = 16145; -- Death Knight Captain
update `creature_template` set `MechanicImmuneMask` = 1019952723 where `entry` = 16146; -- Death Knight
update `creature_template` set `MechanicImmuneMask` = 1019952723 where `entry` = 16163; -- Death Knight Cavalier
update `creature_template` set `MechanicImmuneMask` = 1019952723 where `entry` = 16165; -- Necro Knight
update `creature_template` set `MechanicImmuneMask` = 1019952723 where `entry` = 16452; -- Necro Knight Guardian
update `creature_template` set `MechanicImmuneMask` = 1073725439 where `entry` = 16446; -- Plagued Gargoyle
update `creature_template` set `MechanicImmuneMask` = 1073725439 where `entry` = 16168; -- Stoneskin Gargoyle
update `creature_template` set `MechanicImmuneMask` = 1019952723 where `entry` = 16451; -- Deathknight Vindicator
update `creature_template` set `MechanicImmuneMask` = 1023393531 where `entry` = 15976; -- Venom Stalker
update `creature_template` set `MechanicImmuneMask` = 1023393531 where `entry` = 15976; -- Venom Stalker
update `creature_template` set `MechanicImmuneMask` = 1023393531 where `entry` = 15979; -- Tomb Horror
update `creature_template` set `MechanicImmuneMask` = 1019952723 where `entry` = 16194; -- Unholy Axe
update `creature_template` set `MechanicImmuneMask` = 1019952723 where `entry` = 16215; -- Unholy Staff
update `creature_template` set `MechanicImmuneMask` = 1019952723 where `entry` = 16216; -- Unholy Swords
update `creature_template` set `MechanicImmuneMask` = 1019952723 where `entry` = 16861; -- Death Lord






/*
-- Query: select * from elysium.gameobject where id = 181287
-- Date: 2017-08-12 20:03
*/
DELETE FROM `gameobject` where id = 181287;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) 
VALUES 
(21613,181287,533,3241,-3433.2,288,2.16771,0,0,0.883768,0.467925,604800,100,1,0),
(21612,181287,533,2619.4,-2952,243.5,0.739406,0,0,0.361338,0.932435,604800,100,1,0),
(21615,181287,533,3475,-3673.2,296,4.70392,0,0,0.710093,-0.704108,604800,100,1,0),
(21614,181287,533,2454.2,-2978,243.5,3.86137,0,0,0.935936,-0.352171,604800,100,1,0),
(23982,181287,533,2750,-3311,271,0.138569,0,0,0.0692289,0.997601,604800,100,1,0),
(23981,181287,533,2790,-3059.2,275,0.814009,0,0,0.708005,0.706208,604800,100,1,0),
(21621,181287,533,3340,-3335.4,295,4.8431,0,0,0.659415,-0.751779,604800,100,1,0),
(3998514,181287,533,3464.9,-3383,268,2.78111,0,0,0.983801,0.179265,604800,100,1,0),
(3998515,181287,533,3419,-3585.7,269,4.73675,0,0,0.69844,-0.715668,604800,100,1,0),
(3998516,181287,533,3243.9,-3926,295,6.20937,0,0,0.0368997,-0.999319,604800,100,1,0),
(21623,181287,533,3189,-3361,295,4.32474,0,0,0.999286,-0.0377817,604800,100,1,0),
(21626,181287,533,3337.3,-3200,299,5.80127,0,0,0.0179724,-0.999838,604800,100,1,0),
(3998512,181287,533,3473,-3185.05,296,4.71713,0,0,0.705429,-0.708781,604800,100,1,0),
(3998513,181287,533,3433.1,-3283.1,269,1.49306,0,0,0.679096,0.734049,604800,100,1,0),
(21628,181287,533,3539,-2926,305,0.217081,0,0,0.853506,0.521083,604800,100,1,0),
(3998510,181287,533,3166.8,-3004,269,3.11099,0,0,0.999883,0.0153024,604800,100,1,0),
(3998511,181287,533,3339.8,-3036.7,296,4.17521,0,0,0.869402,-0.494106,604800,100,1,0),
(3998509,181287,533,2953,-2995.8,268,4.89384,0,0,0.709593,-0.704612,604800,100,1,0),
(21632,181287,533,3551,-3928,307,6.02981,0,0,0.337549,-0.941308,604800,100,1,0),
(3998508,181287,533,2765,-2970.6,243,1.84255,0,0,0.796372,0.604807,604800,100,1,0),
(21635,181287,533,3322,-3635.3,261,2.99895,0,0,0.997458,0.0712598,604800,100,1,0),
(3998507,181287,533,2669,-3048.8,243,0.774405,0,0,0.377599,0.925969,604800,100,1,0),
(3998506,181287,533,2620,-3535,275,4.74067,0,0,0.697038,-0.717034,604800,100,1,0),
(27824,181287,533,3334,-3489.5,288,0.301108,0,0,0.700912,-0.713247,604800,100,1,0),
(3998505,181287,533,2590.5,-3683.6,295,1.55194,0,0,0.70041,0.713741,604800,100,1,0),
(27820,181287,533,2639.6,-3512,263,3.17082,0,0,0.999893,-0.0146143,604800,100,1,0),
(3998504,181287,533,2593.5,-3849,297,4.01417,0,0,0.906325,-0.422581,604800,100,1,0),
(27819,181287,533,2812.7,-3705,275,5.56223,0,0,0.35272,-0.935729,604800,100,1,0),
(21634,181287,533,3194,-3813.4,276,4.61361,0,0,0.726065,0.687626,604800,100,1,0),
(3998503,181287,533,2635.8,-3867.8,294,2.31771,0,0,0.916346,0.400388,604800,100,1,0),
(3998502,181287,533,2821,-3854.7,269,1.53232,0,0,0.693372,0.72058,604800,100,1,0),
(27817,181287,533,2797.5,-3650,275,0.378605,0,0,0.0183731,-0.999831,604800,100,1,0),
(27816,181287,533,2929,-3956,274.5,0.855331,0,0,0.414748,0.909936,604800,100,1,0),
(27815,181287,533,2925,-4041.51,275,4.7941,0,0,0.677635,-0.735399,604800,100,1,0),
(27814,181287,533,3071,-3060.6,296.5,1.78932,0,0,0.794523,0.607234,604800,100,1,0),
(3998517,181287,533,2853.7,-3902.5,269,3.13061,0,0,0.999985,0.00549154,604800,100,1,0),
(3998518,181287,533,2582,-3259.6,262,4.70533,0,0,0.709599,-0.704605,604800,100,1,0),
(3998519,181287,533,2755.75,-2956,244,6.28003,0,0,0.0015761,-0.999999,604800,100,1,0),
(3998520,181287,533,2766.1,-2951,243,3.11252,0,0,0.999894,0.0145333,604800,100,1,0);


REPLACE INTO creature_onkill_reputation (creature_id, RewOnKillRepFaction1, MaxStanding1, RewOnKillRepValue1) VALUES            
(16861,529,7,50), -- Death Lord
(16451,529,7,50), -- Deathknight Vindicator
(16018,529,7,50), -- Bile Retcher
(16025,529,7,50), -- Stitched Giant
(16029,529,7,50), -- Sludge Belcher
(16163,529,7,50), -- Death Knight Cavalier

(16368,529,7,25), -- Necropolis Acolyte
(16452,529,7,25), -- Necro Knight Guardian
(16168,529,7,25), -- Stoneskin Gargoyle
(16021,529,7,25), -- Living Monstrosity
(16145,529,7,25), -- Death Knight Captain
(15978,529,7,25), -- Crypt Reaver
(16446,529,7,25), -- Plagued Gargoyle
(16165,529,7,25), -- Necro Knight
(16448,529,7,25), -- Plagued Deathhound
(15976,529,7,25), -- Venom Stalker
(16453,529,7,25), -- Necro Stalker
(16449,529,7,25), -- Spirit of Naxxramas
(16164,529,7,25), -- Shade of Naxxramas

(16146,529,7,0), -- Death Knight
(16154,529,7,0), -- Risen Squire
(16156,529,7,0), -- Dark Touched Warrior
(16157,529,7,0), -- Doom Touched Warrior
(16158,529,7,0), -- Death Touched Warrior
(16167,529,7,0), -- Bony Construct
(16193,529,7,0), -- Skeletal Smith
(16067,529,7,0), -- Deathcharger Steed
(16022,529,7,0), -- Surgical Assistant
(16020,529,7,0), -- Mad Scientist
(15974,529,7,0), -- Dread Creeper
(15975,529,7,0), -- Carrion Spinner
(15977,529,7,0), -- Poisonous Skitterer
(15980,529,7,0), -- Naxxramas Cultist
(15981,529,7,0), -- Naxxramas Acolyte
(16447,529,7,0), -- Plagued Ghoul
(16243,529,7,0), -- Plague Slime
(16244,529,7,0), -- Infectious Ghoul
(16194,529,7,0), -- Unholy Axe
(16215,529,7,0), -- Unholy Staff
(16216,529,7,0), -- Unholy Swords

(15928,529,7,100), -- Thaddius
(15929,529,7,100), -- Stalagg
(15930,529,7,100), -- Feugen
(15931,529,7,100), -- Grobbulus
(15932,529,7,100), -- Gluth
(15936,529,7,100), -- Heigan the Unclean
(15952,529,7,100), -- Maexxna
(15953,529,7,100), -- Grand Widow Faerlina
(15954,529,7,100), -- Noth the Plaguebringer
(15956,529,7,100), -- Anub'Rekhan
(15989,529,7,100), -- Sapphiron
(15990,529,7,100), -- Kel'Thuzad
(16011,529,7,100), -- Loatheb
(16028,529,7,100), -- Patchwerk
(16060,529,7,100), -- Gothik the Harvester
(16061,529,7,100); -- Instructor Razuvious
-- 4hm is handled by script

-- misc events with incorrrect event chance, and 16243 no longer uses EventAI
delete from creature_ai_scripts where creature_id in (16243);
update creature_ai_scripts set event_chance = 100 where creature_id in (15975, 15979, 16017, 16018, 16020, 16024, 16165, 16297, 16446, 16452);
update creature_ai_scripts set event_chance = 100 where id in (1616301, 1616302, 1616802, 1645101, 1686101);

-- defaulting all trash respawn timers to 2H
UPDATE creature set spawntimesecs = 7200 where map = 533 and id in (
16446,
15977,
16163,
16215,
16165,
16145,
16861,
15975,
16022,
16020,
16021,
15974,
15976,
16447,
16447,
16243,
16244,
16168,
16025,
16448,
16154,
16067,
16368,
16017,
16018,
15975,
15976,
15977,
15974,
16146,
16145,
16164,
16165,
16158,
16156,
16193,
16167,
16157,
15978,
16446,
16022,
16029,
16452,
16451,
16449,
16453,
16194,
16215,
16216,
16400,
15980,
15981,
15977,
14881,
15979,
16030,
16068,
4075,
16447,
16163,
16067,
16020);

-- no gold from Frenzied Bat
UPDATE `creature_template` SET `mingold`='0', `maxgold`='0' WHERE `entry`=16036;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
