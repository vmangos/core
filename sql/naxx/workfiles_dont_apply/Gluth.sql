
-- Corrected start position of gluth
-- UPDATE `creature` SET `position_x`='3283.09', `position_y`='-3156.96', `position_z`='297.788', `orientation`='3.82227' WHERE `guid`='88304';

-- HP Correction for gluth. Exact source missing, but some vanilla videos have it hovering around 1.6mill
UPDATE `creature_template` SET `minhealth`='1608075', `maxhealth`='1608075' WHERE `entry`='15932';


-- Zombie chow health from 52k to 122k (wowwiki states they still have 6104 hp at 5% after decimate)
UPDATE `creature_template` SET `minhealth`='122080', `maxhealth`='122080' WHERE `entry`='16360';

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