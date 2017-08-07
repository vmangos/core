INSERT INTO `migrations` VALUES ('20170416060011'); 

-- ERROR:Gameobject (Entry: 179512 GoType: 10) have data7=2 but PageText (Entry 2) not exist.
UPDATE `gameobject_template` SET `data7`=0 WHERE `entry`=179512;

-- ERROR:Spell 12284 listed in `spell_proc_event` has exactly same custom chance as in spell.dbc, field value redundant
UPDATE `spell_proc_event` SET `CustomChance`=0 WHERE `entry`=12284;

-- ERROR:Spell 15600 listed in `spell_proc_event` has exactly same custom chance as in spell.dbc, field value redundant
DELETE FROM `spell_proc_event` WHERE `entry`=15600;

-- ERROR:Spell 23686 listed in `spell_proc_event` has exactly same proc flags as in spell.dbc, field value redundant
UPDATE `spell_proc_event` SET `procFlags`=0 WHERE `entry`=23686;

-- ERROR:Spell 23688 listed in `spell_proc_event` has exactly same proc flags as in spell.dbc, field value redundant
-- ERROR:Spell 23688 listed in `spell_proc_event` has exactly same custom chance as in spell.dbc, field value redundant
DELETE FROM `spell_proc_event` WHERE `entry`=23688;

-- ERROR:Spell 27774 listed in `spell_proc_event` has exactly same custom chance as in spell.dbc, field value redundant
DELETE FROM `spell_proc_event` WHERE `entry`=27774;

-- ERROR:Spell 12701 listed in `spell_proc_event` is not first rank (12284) in chain
-- ERROR:Spell 12702 listed in `spell_proc_event` is not first rank (12284) in chain
-- ERROR:Spell 12703 listed in `spell_proc_event` is not first rank (12284) in chain
-- ERROR:Spell 12704 listed in `spell_proc_event` is not first rank (12284) in chain
DELETE FROM `spell_proc_event` WHERE `entry` BETWEEN 12701 AND 12704;

-- ERROR:Spell 15323 listed in `spell_proc_event` is not first rank (15268) in chain
-- ERROR:Spell 15324 listed in `spell_proc_event` is not first rank (15268) in chain
-- ERROR:Spell 15325 listed in `spell_proc_event` is not first rank (15268) in chain
-- ERROR:Spell 15326 listed in `spell_proc_event` is not first rank (15268) in chain
DELETE FROM `spell_proc_event` WHERE `entry` BETWEEN 15323 AND 15326;

-- ERROR:Table `spell_script_target`: spellId 4170 listed for TargetEntry 2595 does not have any implicit target TARGET_SCRIPT(38) or TARGET_SCRIPT_COORDINATES (46) or TARGET_FOCUS_OR_SCRIPTED_GAMEOBJECT (40).
-- ERROR:Table `spell_script_target`: spellId 4170 listed for TargetEntry 2596 does not have any implicit target TARGET_SCRIPT(38) or TARGET_SCRIPT_COORDINATES (46) or TARGET_FOCUS_OR_SCRIPTED_GAMEOBJECT (40).
-- ERROR:Table `spell_script_target`: spellId 4170 listed for TargetEntry 11054 does not have any implicit target TARGET_SCRIPT(38) or TARGET_SCRIPT_COORDINATES (46) or TARGET_FOCUS_OR_SCRIPTED_GAMEOBJECT (40).
INSERT INTO `spell_effect_mod` (`Id`, `EffectIndex`, `Effect`, `EffectDieSides`, `EffectBaseDice`, `EffectDicePerLevel`, `EffectRealPointsPerLevel`, `EffectBasePoints`, `EffectAmplitude`, `EffectPointsPerComboPoint`, `EffectChainTarget`, `EffectMultipleValue`, `EffectMechanic`, `EffectImplicitTargetA`, `EffectImplicitTargetB`, `EffectRadiusIndex`, `EffectApplyAuraName`, `EffectItemType`, `EffectMiscValue`, `EffectTriggerSpell`, `Comment`) VALUES (4170, 0, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 38, 0, -1, -1, -1, 0, -1, 'Cannon Ball');

-- ERROR:Table `spell_script_target`: spellId 1842 listed for TargetEntry 179784 does not have any implicit target TARGET_SCRIPT(38) or TARGET_SCRIPT_COORDINATES (46) or TARGET_FOCUS_OR_SCRIPTED_GAMEOBJECT (40).
DELETE FROM `spell_script_target` WHERE `entry`=1842;

-- ERROR:Table `spell_script_target`: spellId 16474 listed for TargetEntry 175124 does not have any implicit target TARGET_SCRIPT(38) or TARGET_SCRIPT_COORDINATES (46) or TARGET_FOCUS_OR_SCRIPTED_GAMEOBJECT (40).
DELETE FROM `spell_script_target` WHERE `entry`=16474;

-- ERROR:Table `spell_script_target`: spellId 25164 listed for TargetEntry 15324 does not have any implicit target TARGET_SCRIPT(38) or TARGET_SCRIPT_COORDINATES (46) or TARGET_FOCUS_OR_SCRIPTED_GAMEOBJECT (40).
DELETE FROM `spell_script_target` WHERE `entry`=25164;

-- ERROR:Table `spell_script_target`: spellId 25171 listed for TargetEntry 15339 does not have any implicit target TARGET_SCRIPT(38) or TARGET_SCRIPT_COORDINATES (46) or TARGET_FOCUS_OR_SCRIPTED_GAMEOBJECT (40).
DELETE FROM `spell_script_target` WHERE `entry`=25171;

-- ERROR:Table `spell_script_target`: spellId 27202 listed for TargetEntry 16048 does not have any implicit target TARGET_SCRIPT(38) or TARGET_SCRIPT_COORDINATES (46) or TARGET_FOCUS_OR_SCRIPTED_GAMEOBJECT (40).
INSERT INTO `spell_effect_mod` (`Id`, `EffectIndex`, `Effect`, `EffectDieSides`, `EffectBaseDice`, `EffectDicePerLevel`, `EffectRealPointsPerLevel`, `EffectBasePoints`, `EffectAmplitude`, `EffectPointsPerComboPoint`, `EffectChainTarget`, `EffectMultipleValue`, `EffectMechanic`, `EffectImplicitTargetA`, `EffectImplicitTargetB`, `EffectRadiusIndex`, `EffectApplyAuraName`, `EffectItemType`, `EffectMiscValue`, `EffectTriggerSpell`, `Comment`) VALUES (27202, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 38, 0, -1, -1, -1, -1, -1, 'Summon Lord Valthalak');

-- ERROR:Table `spell_script_target`: spellId 27203 listed for TargetEntry 16044 does not have any implicit target TARGET_SCRIPT(38) or TARGET_SCRIPT_COORDINATES (46) or TARGET_FOCUS_OR_SCRIPTED_GAMEOBJECT (40).
INSERT INTO `spell_effect_mod` (`Id`, `EffectIndex`, `Effect`, `EffectDieSides`, `EffectBaseDice`, `EffectDicePerLevel`, `EffectRealPointsPerLevel`, `EffectBasePoints`, `EffectAmplitude`, `EffectPointsPerComboPoint`, `EffectChainTarget`, `EffectMultipleValue`, `EffectMechanic`, `EffectImplicitTargetA`, `EffectImplicitTargetB`, `EffectRadiusIndex`, `EffectApplyAuraName`, `EffectItemType`, `EffectMiscValue`, `EffectTriggerSpell`, `Comment`) VALUES (27203, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 38, 0, -1, -1, -1, -1, -1, 'Summon Various');

-- ERROR:Table `spell_script_target`: creature template entry 16388 does not exist.
DELETE FROM `spell_script_target` WHERE `targetEntry`=16388;

-- ERROR:Creature (Entry: 15349) has nonexistent modelid in modelid_1/modelid_2
UPDATE `creature_template` SET `modelid_1`=4 WHERE `entry`=15349;

-- ERROR:Creature (Entry: 15711) has nonexistent modelid in modelid_1/modelid_2
UPDATE `creature_template` SET `modelid_1`=15677 WHERE `entry`=15711;

-- ERROR:Table 'creature_equip_template_raw` have redundant data for ID 818 ('creature_equip_template` already have data)
DELETE FROM `creature_equip_template_raw` WHERE `entry`=818;

-- ERROR:Table `creature` have creature (GUID: 11921 Entry: 15130) with `creature_template`.`RegenHealth`=1 and low current health (1550), `creature_template`.`minhealth`=7842.
-- ERROR:Table `creature` have creature (GUID: 11920 Entry: 15130) with `creature_template`.`RegenHealth`=1 and low current health (1550), `creature_template`.`minhealth`=7842.
-- ERROR:Table `creature` have creature (GUID: 11919 Entry: 15130) with `creature_template`.`RegenHealth`=1 and low current health (1550), `creature_template`.`minhealth`=7842.
-- ERROR:Table `creature` have creature (GUID: 11918 Entry: 15130) with `creature_template`.`RegenHealth`=1 and low current health (1550), `creature_template`.`minhealth`=7842.
UPDATE `creature` SET `curhealth`=7842 WHERE `id`=15130;
-- ERROR:Table `creature` have creature (GUID: 11261 Entry: 15128) with `creature_template`.`RegenHealth`=1 and low current health (7125), `creature_template`.`minhealth`=7842.
-- ERROR:Table `creature` have creature (GUID: 11260 Entry: 15128) with `creature_template`.`RegenHealth`=1 and low current health (7125), `creature_template`.`minhealth`=7842.
-- ERROR:Table `creature` have creature (GUID: 11259 Entry: 15128) with `creature_template`.`RegenHealth`=1 and low current health (7125), `creature_template`.`minhealth`=7842.
-- ERROR:Table `creature` have creature (GUID: 11258 Entry: 15128) with `creature_template`.`RegenHealth`=1 and low current health (7125), `creature_template`.`minhealth`=7842.
UPDATE `creature` SET `curhealth`=7842 WHERE `id`=15128;
-- ERROR:Table `creature` have creature (GUID: 11241 Entry: 15127) with `creature_template`.`RegenHealth`=1 and low current health (10672), `creature_template`.`minhealth`=48440.
UPDATE `creature` SET `curhealth`=48440 WHERE `guid`=11241;
-- ERROR:Table `creature` have creature (GUID: 16989 Entry: 13841) with `creature_template`.`RegenHealth`=1 and low current health (9563), `creature_template`.`minhealth`=44296.
UPDATE `creature` SET `curhealth`=44296 WHERE `guid`=16989;
-- ERROR:Table `creature` have creature (GUID: 11208 Entry: 15126) with `creature_template`.`RegenHealth`=1 and low current health (2000), `creature_template`.`minhealth`=48440.
UPDATE `creature` SET `curhealth`=48440 WHERE `guid`=11208;
-- ERROR:Table `creature` have creature (GUID: 16594 Entry: 14284) with `creature_template`.`RegenHealth`=1 and low current health (9563), `creature_template`.`minhealth`=16638.
-- ERROR:Table `creature` have creature (GUID: 16595 Entry: 14284) with `creature_template`.`RegenHealth`=1 and low current health (9563), `creature_template`.`minhealth`=16638.
-- ERROR:Table `creature` have creature (GUID: 16592 Entry: 14284) with `creature_template`.`RegenHealth`=1 and low current health (9563), `creature_template`.`minhealth`=16638.
-- ERROR:Table `creature` have creature (GUID: 16593 Entry: 14284) with `creature_template`.`RegenHealth`=1 and low current health (9563), `creature_template`.`minhealth`=16638.
-- ERROR:Table `creature` have creature (GUID: 16591 Entry: 14284) with `creature_template`.`RegenHealth`=1 and low current health (9563), `creature_template`.`minhealth`=16638.
-- ERROR:Table `creature` have creature (GUID: 16590 Entry: 14284) with `creature_template`.`RegenHealth`=1 and low current health (9563), `creature_template`.`minhealth`=16638.
-- ERROR:Table `creature` have creature (GUID: 16589 Entry: 14284) with `creature_template`.`RegenHealth`=1 and low current health (9563), `creature_template`.`minhealth`=16638.
-- ERROR:Table `creature` have creature (GUID: 16588 Entry: 14284) with `creature_template`.`RegenHealth`=1 and low current health (9563), `creature_template`.`minhealth`=16638.
-- ERROR:Table `creature` have creature (GUID: 16587 Entry: 14284) with `creature_template`.`RegenHealth`=1 and low current health (9563), `creature_template`.`minhealth`=16638.
-- ERROR:Table `creature` have creature (GUID: 16586 Entry: 14284) with `creature_template`.`RegenHealth`=1 and low current health (9563), `creature_template`.`minhealth`=16638.
-- ERROR:Table `creature` have creature (GUID: 16585 Entry: 14284) with `creature_template`.`RegenHealth`=1 and low current health (9563), `creature_template`.`minhealth`=16638.
-- ERROR:Table `creature` have creature (GUID: 16583 Entry: 14284) with `creature_template`.`RegenHealth`=1 and low current health (9563), `creature_template`.`minhealth`=16638.
-- ERROR:Table `creature` have creature (GUID: 16584 Entry: 14284) with `creature_template`.`RegenHealth`=1 and low current health (9563), `creature_template`.`minhealth`=16638.
-- ERROR:Table `creature` have creature (GUID: 150134 Entry: 14284) with `creature_template`.`RegenHealth`=1 and low current health (9563), `creature_template`.`minhealth`=16638.
-- ERROR:Table `creature` have creature (GUID: 150136 Entry: 14284) with `creature_template`.`RegenHealth`=1 and low current health (9563), `creature_template`.`minhealth`=16638.
-- ERROR:Table `creature` have creature (GUID: 150137 Entry: 14284) with `creature_template`.`RegenHealth`=1 and low current health (9563), `creature_template`.`minhealth`=16638.
-- ERROR:Table `creature` have creature (GUID: 150138 Entry: 14284) with `creature_template`.`RegenHealth`=1 and low current health (9563), `creature_template`.`minhealth`=16638.
-- ERROR:Table `creature` have creature (GUID: 150140 Entry: 14284) with `creature_template`.`RegenHealth`=1 and low current health (9563), `creature_template`.`minhealth`=16638.
-- ERROR:Table `creature` have creature (GUID: 150141 Entry: 14284) with `creature_template`.`RegenHealth`=1 and low current health (9563), `creature_template`.`minhealth`=16638.
-- ERROR:Table `creature` have creature (GUID: 53883 Entry: 14284) with `creature_template`.`RegenHealth`=1 and low current health (9563), `creature_template`.`minhealth`=16638.
-- ERROR:Table `creature` have creature (GUID: 53882 Entry: 14284) with `creature_template`.`RegenHealth`=1 and low current health (9563), `creature_template`.`minhealth`=16638.
-- ERROR:Table `creature` have creature (GUID: 53881 Entry: 14284) with `creature_template`.`RegenHealth`=1 and low current health (9563), `creature_template`.`minhealth`=16638.
-- ERROR:Table `creature` have creature (GUID: 53880 Entry: 14284) with `creature_template`.`RegenHealth`=1 and low current health (9563), `creature_template`.`minhealth`=16638.
-- ERROR:Table `creature` have creature (GUID: 53879 Entry: 14284) with `creature_template`.`RegenHealth`=1 and low current health (9563), `creature_template`.`minhealth`=16638.
-- ERROR:Table `creature` have creature (GUID: 53878 Entry: 14284) with `creature_template`.`RegenHealth`=1 and low current health (9563), `creature_template`.`minhealth`=16638.
-- ERROR:Table `creature` have creature (GUID: 53877 Entry: 14284) with `creature_template`.`RegenHealth`=1 and low current health (9563), `creature_template`.`minhealth`=16638.
-- ERROR:Table `creature` have creature (GUID: 53876 Entry: 14284) with `creature_template`.`RegenHealth`=1 and low current health (9563), `creature_template`.`minhealth`=16638.
-- ERROR:Table `creature` have creature (GUID: 150135 Entry: 14284) with `creature_template`.`RegenHealth`=1 and low current health (9563), `creature_template`.`minhealth`=16638.
-- ERROR:Table `creature` have creature (GUID: 1245617 Entry: 14284) with `creature_template`.`RegenHealth`=1 and low current health (9563), `creature_template`.`minhealth`=16638.
-- ERROR:Table `creature` have creature (GUID: 1245616 Entry: 14284) with `creature_template`.`RegenHealth`=1 and low current health (9563), `creature_template`.`minhealth`=16638.
-- ERROR:Table `creature` have creature (GUID: 1245615 Entry: 14284) with `creature_template`.`RegenHealth`=1 and low current health (9563), `creature_template`.`minhealth`=16638.
-- ERROR:Table `creature` have creature (GUID: 150139 Entry: 14284) with `creature_template`.`RegenHealth`=1 and low current health (9563), `creature_template`.`minhealth`=16638.
UPDATE `creature` SET `curhealth`=16638 WHERE `id`=14284;
-- ERROR:Table `creature` have creature (GUID: 16574 Entry: 13217) with `creature_template`.`RegenHealth`=1 and low current health (8774), `creature_template`.`minhealth`=41595.
UPDATE `creature` SET `curhealth`=41595 WHERE `guid`=16574;

-- ERROR:Creature (Entry: 10485) has wrong spell 0 defined in `auras` field in `creature_template_addon`.
UPDATE `creature_template_addon` SET `auras`='6356' WHERE `entry`=10485;
-- ERROR:Creature (Entry: 15633) has wrong spell 0 defined in `auras` field in `creature_template_addon`.
UPDATE `creature_template_addon` SET `auras`='16056' WHERE `entry`=15633;
-- ERROR:Creature (Entry: 15634) has wrong spell 0 defined in `auras` field in `creature_template_addon`.
UPDATE `creature_template_addon` SET `auras`='16056' WHERE `entry`=15634;
-- ERROR:Creature (Entry: 16103) has wrong spell 0 defined in `auras` field in `creature_template_addon`.
UPDATE `creature_template_addon` SET `auras`='27650' WHERE `entry`=16103;
-- ERROR:Creature (Entry: 16104) has wrong spell 0 defined in `auras` field in `creature_template_addon`.
UPDATE `creature_template_addon` SET `auras`='27650' WHERE `entry`=16104;

-- ERROR:Creature (GUID: 32333) has wrong spell 0 defined in `auras` field in `creature_addon`.
UPDATE `creature_addon` SET `auras`=20514 WHERE `guid`=32333;
-- ERROR:Creature (GUID: 38663) has wrong spell 0 defined in `auras` field in `creature_addon`.
UPDATE `creature_addon` SET `auras`=18373 WHERE `guid`=38663;

-- ERROR:Creature (GUID: 27289) does not exist but has a record in `creature_addon`
DELETE FROM `creature_addon` WHERE `guid`=27289;
-- ERROR:Creature (GUID: 27290) does not exist but has a record in `creature_addon`
DELETE FROM `creature_addon` WHERE `guid`=27290;
-- ERROR:Creature (GUID: 28728) does not exist but has a record in `creature_addon`
DELETE FROM `creature_addon` WHERE `guid`=28728;
-- ERROR:Creature (GUID: 45843) does not exist but has a record in `creature_addon`
DELETE FROM `creature_addon` WHERE `guid`=45843;
-- ERROR:Creature (GUID: 52124) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 52125) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 52126) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 52127) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 52128) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 52129) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 52130) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 52131) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 52132) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 52133) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 52134) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 52135) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 52136) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 52137) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 52138) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 52139) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 52140) does not exist but has a record in `creature_addon`
DELETE FROM `creature_addon` WHERE `guid` BETWEEN 52124 AND 52140;
-- ERROR:Creature (GUID: 92273) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 92276) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 92277) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 92280) does not exist but has a record in `creature_addon`
DELETE FROM `creature_addon` WHERE `guid` IN (92273, 92276, 92277, 92280);

-- ERROR:`pool_gameobject` has a not lootable gameobject spawn (GUID: 27558, type: 8) defined for pool id (1), skipped.
DELETE FROM `pool_gameobject` WHERE `guid`=27558;

-- ERROR:`pool_gameobject` has a non existing gameobject spawn (GUID: 8985) defined for pool id (1283), skipped.
DELETE FROM `pool_gameobject` WHERE `guid`=8985;

-- ERROR:`pool_gameobject` has a non existing gameobject spawn (GUID: 16415) defined for pool id (1247), skipped.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `spawnFlags`) VALUES (16415, 142144, 0, 446.073, -3668, 122.923, 1.439, 0, 0, 0, 0, 2700, 100, 1, 12);

-- ERROR:`pool_gameobject` has a non existing gameobject spawn (GUID: 16416) defined for pool id (1247), skipped.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `spawnFlags`) VALUES (16416, 142144, 0, 352.95, -3719, 136.142, 3.976, 0, 0, 0, 0, 2700, 100, 1, 12);

-- ERROR:`pool_gameobject` has a non existing gameobject spawn (GUID: 16420) defined for pool id (1247), skipped.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `spawnFlags`) VALUES (16420, 142144, 0, 382.809, -3681, 129.152, 5.692, 0, 0, 0, 0, 2700, 100, 1, 12);

-- ERROR:`pool_gameobject` has a non existing gameobject spawn (GUID: 16425) defined for pool id (1247), skipped.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `spawnFlags`) VALUES (16425, 142144, 0, 331.884, -3687, 129.329, 0.296, 0, 0, 0, 0, 2700, 100, 1, 12);

-- ERROR:`pool_gameobject` has a non existing gameobject spawn (GUID: 16429) defined for pool id (1247), skipped.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `spawnFlags`) VALUES (16429, 142144, 0, 386.07, -3675, 129.194, 0.312, 0, 0, 0, 0, 2700, 100, 1, 12);

-- ERROR:`pool_gameobject` has a non existing gameobject spawn (GUID: 16443) defined for pool id (1247), skipped.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `spawnFlags`) VALUES (16443, 142144, 0, 418.9, -3709, 128.792, 6.191, 0, 0, 0, 0, 2700, 100, 1, 12);

-- ERROR:`pool_gameobject` has a non existing gameobject spawn (GUID: 16445) defined for pool id (1247), skipped.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `spawnFlags`) VALUES (16445, 142144, 0, 353.601, -3685, 128.618, 2.393, 0, 0, 0, 0, 2700, 100, 1, 12);

-- ERROR:`pool_gameobject` has a non existing gameobject spawn (GUID: 16447) defined for pool id (1247), skipped.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `spawnFlags`) VALUES (16447, 142144, 0, 438.617, -3677, 121.545, 0.976, 0, 0, 0, 0, 2700, 100, 1, 12);

-- ERROR:`pool_gameobject` has a non existing gameobject spawn (GUID: 397046) defined for pool id (22908), skipped.
-- ERROR:`pool_gameobject` has a non existing gameobject spawn (GUID: 397047) defined for pool id (22908), skipped.
-- ERROR:`pool_gameobject` has a non existing gameobject spawn (GUID: 397048) defined for pool id (22908), skipped.
-- ERROR:`pool_gameobject` has a non existing gameobject spawn (GUID: 397049) defined for pool id (22908), skipped.
-- ERROR:`pool_gameobject` has a non existing gameobject spawn (GUID: 397050) defined for pool id (22908), skipped.
DELETE FROM `pool_gameobject` WHERE `guid` BETWEEN 397046 AND 397050;

-- ERROR:`pool_gameobject` has a non existing gameobject spawn (GUID: 3997169) defined for pool id (9003), skipped.
-- ERROR:`pool_gameobject` has a non existing gameobject spawn (GUID: 3997170) defined for pool id (9003), skipped.
-- ERROR:`pool_gameobject` has a non existing gameobject spawn (GUID: 3997171) defined for pool id (9003), skipped.
-- ERROR:`pool_gameobject` has a non existing gameobject spawn (GUID: 3997172) defined for pool id (9003), skipped.
DELETE FROM `pool_gameobject` WHERE `guid` BETWEEN 3997169 AND 3997172;

-- ERROR:Table `gameobject` have gameobject (GUID: 45730 Entry: 175488) with `spawntimesecs` (0) value, but gameobejct marked as despawnable at action.
UPDATE `gameobject` SET `spawntimesecs`=2 WHERE `guid`=45730;

-- ERROR:Table `gameobject` have gameobject (GUID: 45731 Entry: 175487) with `spawntimesecs` (0) value, but gameobejct marked as despawnable at action.
UPDATE `gameobject` SET `spawntimesecs`=2 WHERE `guid`=45731;

-- ERROR:DB table script_waypoint has waypoint for nonexistant creature entry 81553
DELETE FROM `script_waypoint` WHERE `entry`=81553;

-- ERROR:DB table script_waypoint has waypoint for creature entry 13557, but creature does not have ScriptName defined and then useless.
DELETE FROM `script_waypoint` WHERE `entry`=13557;

-- ERROR:WaypointMovementGenerator::LoadPath: creature Solomon (Entry: 798 GUID: 86158) doesn't have waypoint path
UPDATE `creature` SET `MovementType`=0 WHERE `guid`=86158;

-- CreatureEVentAI: EventMap for Creature 2384 is empty but creature is using CreatureEventAI.
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=2384;

-- ERROR:Creature (Entry: 2260) has no model info defined in table `creature_model_info`, can't load.
INSERT INTO `creature_model_info` VALUES (3618,0.208,1.5,1,3616,0);

-- ERROR:Table `npc_gossip` have nonexistent creature (GUID: 92913) entry, ignore.
UPDATE `npc_gossip` SET `npc_guid`=1182601 WHERE `npc_guid`=92913;

-- ERROR:Table `npc_gossip` have nonexistent creature (GUID: 24440) entry, ignore.
UPDATE `creature_template` SET `npcflag`=1, `gossip_menu_id`=500 WHERE `entry`=14528;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (500, 7042, 0);
DELETE FROM `npc_gossip` WHERE `npc_guid`=24440;

-- ERROR:Table `npc_gossip` have nonexistent creature (GUID: 79862) entry, ignore.
DELETE FROM `npc_gossip` WHERE `npc_guid`=79862;

-- ERROR:Table `npc_gossip` have nonexistent creature (GUID: 79689) entry, ignore. 
DELETE FROM `npc_gossip` WHERE `npc_guid`=79689;

-- ERROR:Table `npc_gossip` have nonexistent creature (GUID: 1247126) entry, ignore.
DELETE FROM `npc_gossip` WHERE `npc_guid`=1247126;

-- These creatures have no database script yet the one from the core is not assigned.
-- ERROR:Script registering but ScriptName npc_felhound_minion is not assigned in database. Script will not be used.
UPDATE `creature_template` SET `ScriptName`="npc_felhound_minion" WHERE `entry`=10656;
-- ERROR:Script registering but ScriptName boss_lord_blackwood is not assigned in database. Script will not be used.
UPDATE `creature_template` SET `ScriptName`="boss_lord_blackwood" WHERE `entry`=14695;
-- ERROR:Script registering but ScriptName boss_lady_faltheress is not assigned in database. Script will not be used.
UPDATE `creature_template` SET `ScriptName`="boss_lady_faltheress" WHERE `entry`=14686;
-- ERROR:Script registering but ScriptName npc_neeru_fireblade is not assigned in database. Script will not be used.
UPDATE `creature_template` SET `ScriptName`="npc_neeru_fireblade" WHERE `entry`=3216;
-- ERROR:Script registering but ScriptName npc_cenarion_scout_azenel is not assigned in database. Script will not be used.
UPDATE `creature_template` SET `ScriptName`="npc_cenarion_scout_azenel" WHERE `entry`=15610;
-- ERROR:Script registering but ScriptName npc_Krug_SkullSplit is not assigned in database. Script will not be used.
UPDATE `creature_template` SET `ScriptName`="npc_Krug_SkullSplit" WHERE `entry`=15612;
-- ERROR:Script registering but ScriptName mob_HiveRegal_HunterKiller is not assigned in database. Script will not be used.
UPDATE `creature_template` SET `ScriptName`="mob_HiveRegal_HunterKiller" WHERE `entry`=15620;
-- ERROR:Script registering but ScriptName npc_Shai is not assigned in database. Script will not be used.
UPDATE `creature_template` SET `ScriptName`="npc_Shai" WHERE `entry`=15615;

-- ERROR:No script found for ScriptName 'custom_teleportNPC'.
-- ERROR:Script registering but ScriptName custom_TeleportNPC is not assigned in database. Script will not be used.
UPDATE `creature_template` SET `ScriptName`="custom_TeleportNPC" WHERE `ScriptName`="custom_teleportNPC";

-- These have had their scripts moved to the database.
-- ERROR:No script found for ScriptName 'alcove_mgr'.
-- ERROR:No script found for ScriptName 'boss_victor_nefarius_vael'.
-- ERROR:No script found for ScriptName 'gameobject_cage_trap'.
-- ERROR:No script found for ScriptName 'go_harbinger_second_trial'.
-- ERROR:No script found for ScriptName 'go_loosely_turned_soil'.
-- ERROR:No script found for ScriptName 'go_rookey_egg'.
-- ERROR:No script found for ScriptName 'go_skull_pile'.
-- ERROR:No script found for ScriptName 'innkeeper'.
-- ERROR:No script found for ScriptName 'item_defias_gunpowder'.
-- ERROR:No script found for ScriptName 'item_muiseks_vessel'.
-- ERROR:No script found for ScriptName 'item_tame_beast_rods'.
-- ERROR:No script found for ScriptName 'item_voodoo_charm'.
-- ERROR:No script found for ScriptName 'item_yehkinyas_bramble'.
-- ERROR:No script found for ScriptName 'lumberjack'.
-- ERROR:No script found for ScriptName 'mob_ivina_test'.
-- ERROR:No script found for ScriptName 'mob_mindless_skeleton'.
-- ERROR:No script found for ScriptName 'mob_primal_ooze'.
-- ERROR:No script found for ScriptName 'mob_thuzadin_acolyte'.
-- ERROR:No script found for ScriptName 'mob_yauj_brood'.
-- ERROR:No script found for ScriptName 'npc_naxx_rareelite'.
-- ERROR:No script found for ScriptName 'npc_pre_invasion_spawner'.
-- ERROR:No script found for ScriptName 'npc_ravenholdt'.
-- ERROR:No script found for ScriptName 'npc_steam_tonk'.
-- ERROR:No script found for ScriptName 'npc_stormwind_royal_guard'.
-- ERROR:No script found for ScriptName 'npc_tonk_mine'.
-- ERROR:No script found for ScriptName 'npc_winter_reveler'.
-- ERROR:No script found for ScriptName 'single_alcove_mgr'.
-- ERROR:No script found for ScriptName 'ubrs_arena_event'.
UPDATE `creature_template` SET `ScriptName`='' WHERE `ScriptName` IN ('alcove_mgr', 'boss_victor_nefarius_vael', 'innkeeper', 'lumberjack', 'mob_ivina_test',  'mob_mindless_skeleton', 'mob_primal_ooze', 'mob_thuzadin_acolyte', 'mob_yauj_brood', 'npc_naxx_rareelite', 'npc_pre_invasion_spawner', 'npc_ravenholdt', 'npc_steam_tonk', 'npc_stormwind_royal_guard', 'npc_tonk_mine', 'npc_winter_reveler', 'single_alcove_mgr', 'ubrs_arena_event');
UPDATE `item_template` SET `ScriptName`='' WHERE `ScriptName` IN ('item_defias_gunpowder', 'item_muiseks_vessel', 'item_tame_beast_rods', 'item_voodoo_charm', 'item_yehkinyas_bramble');
UPDATE `gameobject_template` SET `ScriptName`='' WHERE `ScriptName` IN ('gameobject_cage_trap', 'go_harbinger_second_trial',  'go_loosely_turned_soil', 'go_rookey_egg', 'go_skull_pile');