-- KT updates
UPDATE `creature_template` SET `minhealth`=3150000, `maxhealth`=3150000, `MechanicImmuneMask`=617316223/*not immune to interrupt*/ WHERE `entry`=15990;


-- unstoppable abomination. Stun/shackle immune?
UPDATE `creature_template` SET `mindmg`=8000, `maxdmg`=10000, `speed_walk`='0.7', `speed_run`='0.8', `ScriptName`='unstoppable_abomination_ai', `unit_flags`=0 /*256passive*/ WHERE `entry`=16428;

-- soldier of the frozen wastes. Should not be shackle immune
UPDATE `creature_template` SET `minhealth`=2012, `maxhealth`=2012, `speed_walk`='0.35', `speed_run`='0.35',`ScriptName`='soldier_frozen_wastes_ai', `unit_flags`=0/*256passive*/ WHERE `entry`=16427;

-- soul weaver. 
UPDATE `creature_template` SET `ScriptName`='soul_weaver_ai', `speed_walk`='0.1', `speed_run`='0.114286', `unit_flags`=0 /*256passive*/  WHERE `entry`=16429;

-- guardian of icecrown. 
UPDATE `creature_template` SET `minhealth`='3150000', `maxhealth`='3150000', `speed_run`='1.42858', rank=1, scale=0.7, `mindmg`=3250, `maxdmg`=3750, `ScriptName`='mob_guardian_icecrownAI' WHERE `entry`=16441;
UPDATE `creature_model_info` SET bounding_radius = 1.2, combat_reach = 3 where modelid = 16586;

-- frost blast not resistable hack, cant find any evidence of it being binary or partially resistable
DELETE FROM spell_mod where Id = 29879;
INSERT INTO `spell_mod` (`Id`, `procChance`, `procFlags`, `procCharges`, `DurationIndex`, `Category`, `CastingTimeIndex`, `StackAmount`, `SpellIconID`, `activeIconID`, `manaCost`, `Attributes`, `AttributesEx`, `AttributesEx2`, `AttributesEx3`, `AttributesEx4`, `Custom`, `InterruptFlags`, `AuraInterruptFlags`, `ChannelInterruptFlags`, `Dispel`, `Stances`, `StancesNot`, `SpellVisual`, `ManaCostPercentage`, `StartRecoveryCategory`, `StartRecoveryTime`, `MaxAffectedTargets`, `MaxTargetLevel`, `DmgClass`, `rangeIndex`, `RecoveryTime`, `CategoryRecoveryTime`, `SpellFamilyName`, `SpellFamilyFlags`, `Mechanic`, `Comment`) 
VALUES ('29879', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '1', '0', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '0', '-1', 'Kel\'thuzad Frost blast not resistable');

-- giving shadow fissure creature script
UPDATE `creature_template` SET `AIName`='', `ScriptName`='mob_shadow_fissure', `minlevel`='63', `maxlevel`='63', `scale`=2 WHERE `entry`=16129;