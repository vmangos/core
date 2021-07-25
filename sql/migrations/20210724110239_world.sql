DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210724110239');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210724110239');
-- Add your query below.


-- William Kielar.
UPDATE `creature_template` SET `faction`=774, `speed_walk`=1, `unit_flags`=768, `movement_type`=0, `civilian`=1 WHERE  `entry`=17209 AND `patch`=10;

-- Lordaeron Commander.
UPDATE `creature_template` SET `health_min`=3175, `health_max`=3175, `faction`=123, `speed_walk`=1, `speed_run`=1.38571, `unit_flags`=0, `auras`=31748, `script_name`='npc_epl_tower_summon' WHERE `entry`=17635;

-- Lordaeron Soldier.
UPDATE `creature_template` SET `faction`=123, `speed_walk`=1, `movement_type`=0, `unit_flags`=0, `auras`=31748 WHERE `entry`=17647;

-- Lordaeron Veteran.
UPDATE `creature_template` SET `faction`=118, `speed_walk`=1, `base_attack_time`=2000, `ranged_attack_time`=2000, `movement_type`=0, `auras`=31309, `script_name`='npc_epl_tower_summon' WHERE `entry`=17995;

-- Lordaeron Fighter.
UPDATE `creature_template` SET `faction`=118, `speed_walk`=1, `base_attack_time`=2000, `ranged_attack_time`=2000, `movement_type`=0, `auras`=31309 WHERE  `entry`=17996;

-- Spectral Gryphon.
INSERT INTO `creature_template` (`entry`, `patch`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `name`, `subname`, `gossip_menu_id`, `level_min`, `level_max`, `health_min`, `health_max`, `mana_min`, `mana_max`, `armor`, `faction`, `npc_flags`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `rank`, `xp_multiplier`, `dmg_min`, `dmg_max`, `dmg_school`, `attack_power`, `dmg_multiplier`, `base_attack_time`, `ranged_attack_time`, `unit_class`, `unit_flags`, `dynamic_flags`, `pet_family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `ranged_dmg_min`, `ranged_dmg_max`, `ranged_attack_power`, `type`, `type_flags`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `spell_id1`, `spell_id2`, `spell_id3`, `spell_id4`, `spell_list_id`, `pet_spell_list_id`, `auras`, `gold_min`, `gold_max`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `regeneration`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `flags_extra`, `script_name`) VALUES 
(16081, 10, 17328, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 'Spectral Gryphon', NULL, 0, 60, 60, 3052, 3052, 0, 0, 3791, 35, 0, 0, 0, 20, 0, 0, 0, 1, 104, 138, 0, 252, 1, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, '');

-- Add correct mount.
UPDATE `taxi_nodes` SET `mount_creature_id1`=16081, `mount_creature_id2`=16081 WHERE `id` in (84,85,86,87);

-- Spirit of Victory.
INSERT INTO `creature_template` (`entry`, `patch`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `name`, `subname`, `gossip_menu_id`, `level_min`, `level_max`, `health_min`, `health_max`, `mana_min`, `mana_max`, `armor`, `faction`, `npc_flags`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `rank`, `xp_multiplier`, `dmg_min`, `dmg_max`, `dmg_school`, `attack_power`, `dmg_multiplier`, `base_attack_time`, `ranged_attack_time`, `unit_class`, `unit_flags`, `dynamic_flags`, `pet_family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `ranged_dmg_min`, `ranged_dmg_max`, `ranged_attack_power`, `type`, `type_flags`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `spell_id1`, `spell_id2`, `spell_id3`, `spell_id4`, `spell_list_id`, `pet_spell_list_id`, `auras`, `gold_min`, `gold_max`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `regeneration`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `flags_extra`, `script_name`) VALUES
(18039, 10, 17548, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 'Spirit of Victory', NULL, 0, 60, 60, 3052, 3052, 0, 0, 0, 35, 0, 1, 1.14286, 20, 5, 0, 0, 1, 0, 0, 0, 0, 1, 2000, 2000, 1, 33555200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '31951', 0, 0, '', 0, 3, 1, 0, 3, 0, 0, 0, 0, 0, 0, '');

-- Fix buffers.
UPDATE `creature_template` SET `movement_type`=0 WHERE `entry` in (17794, 17795);

-- Fix Horde Curing Shrine.
UPDATE `gameobject_template` SET `faction`=1314 WHERE `entry`=181955;

-- Delete unnecessary GameObjects.
DELETE FROM `gameobject` WHERE  `guid`=45864;

-- William Kielar Gossips.
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `action_script_id`) VALUES (7379, 0, 0, 'Take me to Northpass Tower.', 13562, 1, 1, 0, 0, 0, 0, NULL, 0, 737901);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `action_script_id`) VALUES (7379, 1, 0, 'Take me to Eastwall Tower.', 13563, 1, 1, 0, 0, 0, 0, NULL, 0, 737902);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `action_script_id`) VALUES (7379, 2, 0, 'Take me to Crown Guard Tower.', 13564, 1, 1, 0, 0, 0, 0, NULL, 0, 737903);

INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (737901, 0, 15, 29931, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'William Kielar - Cast Spell: Flight Path (Northpass Tower)');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (737902, 0, 15, 29934, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'William Kielar - Cast Spell: Flight Path (Eastwall Tower)');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (737903, 0, 15, 29994, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'William Kielar - Cast Spell: Flight Path (Crown Guard Tower)');

-- Waypoints for Lordaeron Commander / Lordaeron Veteran from Eastwall Tower to Northpass Tower.
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(176350, 1, 2532.85, -4764.92, 103.617, 100, 0, 0, 0),
(176350, 2, 2522.68, -4753.96, 99.5256, 100, 0, 0, 0),
(176350, 3, 2512.23, -4743.17, 95.4806, 100, 0, 0, 0),
(176350, 4, 2502.15, -4731.8, 92.4165, 100, 0, 0, 0),
(176350, 5, 2491.29, -4704.58, 83.6992, 100, 0, 0, 0),
(176350, 6, 2489.52, -4689.05, 81.8524, 100, 0, 0, 0),
(176350, 7, 2490.37, -4674.23, 77.47, 100, 0, 0, 0),
(176350, 8, 2494.71, -4660.66, 75.3537, 100, 0, 0, 0),
(176350, 9, 2509.99, -4657.29, 76.0322, 100, 0, 0, 0),
(176350, 10, 2540.91, -4652.83, 77.6851, 100, 0, 0, 0),
(176350, 11, 2570.34, -4642.32, 79.81, 100, 0, 0, 0),
(176350, 12, 2596.79, -4626.84, 82.2492, 100, 0, 0, 0),
(176350, 13, 2623.15, -4609.89, 84.5451, 100, 0, 0, 0),
(176350, 14, 2650.47, -4594.34, 84.9536, 100, 0, 0, 0),
(176350, 15, 2692.08, -4570.6, 87.3573, 100, 0, 0, 0),
(176350, 16, 2718.88, -4554.85, 87.9527, 100, 0, 0, 0),
(176350, 17, 2744.82, -4537.22, 88.8412, 100, 0, 0, 0),
(176350, 18, 2768, -4516.15, 89.5253, 100, 0, 0, 0),
(176350, 19, 2779.02, -4504.75, 89.762, 100, 0, 0, 0),
(176350, 20, 2800.34, -4482.64, 89.9707, 100, 0, 0, 0),
(176350, 21, 2821, -4458.96, 89.974, 100, 0, 0, 0),
(176350, 22, 2830.51, -4446.35, 89.8184, 100, 0, 0, 0),
(176350, 23, 2839.18, -4433.88, 89.6282, 100, 0, 0, 0),
(176350, 24, 2848.62, -4421.44, 89.4764, 100, 0, 0, 0),
(176350, 25, 2860.47, -4411.85, 89.6888, 100, 0, 0, 0),
(176350, 26, 2891.5, -4408.59, 91.153, 100, 0, 0, 0),
(176350, 27, 2922.72, -4408.56, 92.9054, 100, 0, 0, 0),
(176350, 28, 2954, -4410.59, 94.9373, 100, 0, 0, 0),
(176350, 29, 2969.57, -4412.06, 95.9218, 100, 0, 0, 0),
(176350, 30, 2989.93, -4389.59, 94.5874, 100, 0, 0, 0),
(176350, 31, 3003.48, -4363.16, 93.7045, 100, 0, 0, 0),
(176350, 32, 3019.67, -4338.93, 99.9005, 100, 0, 0, 0),
(176350, 33, 3032.59, -4332.01, 98.9721, 100, 0, 0, 0),
(176350, 34, 3047.7, -4330.55, 100.057, 100, 0, 0, 0),
(176350, 35, 3089.89, -4318.03, 104.096, 100, 0, 0, 0),
(176350, 36, 3104.95, -4316.07, 106.771, 100, 0, 0, 0),
(176350, 37, 3116.2, -4312.54, 117.187, 100, 0, 0, 0),
(176350, 38, 3129.67, -4309.93, 123.121, 100, 0, 0, 0),
(176350, 39, 3154.63, -4326.59, 133.206, 100, 0, 0, 0);

-- Remove endless channel from Tower Capture (DND).
INSERT INTO `spell_mod` (`Id`, `procChance`, `procFlags`, `procCharges`, `DurationIndex`, `Category`, `CastingTimeIndex`, `StackAmount`, `SpellIconID`, `activeIconID`, `manaCost`, `Attributes`, `AttributesEx`, `AttributesEx2`, `AttributesEx3`, `AttributesEx4`, `Custom`, `InterruptFlags`, `AuraInterruptFlags`, `ChannelInterruptFlags`, `Dispel`, `Stances`, `StancesNot`, `SpellVisual`, `ManaCostPercentage`, `StartRecoveryCategory`, `StartRecoveryTime`, `MaxAffectedTargets`, `MaxTargetLevel`, `DmgClass`, `rangeIndex`, `RecoveryTime`, `CategoryRecoveryTime`, `SpellFamilyName`, `SpellFamilyFlags`, `Mechanic`, `EquippedItemClass`, `Comment`) VALUES (31929, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, NULL);

-- Modify Spell Tower Capture (DND) to be casted by the Tower Buffer NPC and buff only friendly players in 100 yards.
INSERT INTO `spell_effect_mod` (`Id`, `EffectIndex`, `Effect`, `EffectDieSides`, `EffectBaseDice`, `EffectDicePerLevel`, `EffectRealPointsPerLevel`, `EffectBasePoints`, `EffectAmplitude`, `EffectPointsPerComboPoint`, `EffectChainTarget`, `EffectMultipleValue`, `EffectMechanic`, `EffectImplicitTargetA`, `EffectImplicitTargetB`, `EffectRadiusIndex`, `EffectApplyAuraName`, `EffectItemType`, `EffectMiscValue`, `EffectTriggerSpell`, `Comment`) VALUES (30882, 0, 64, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, 1, 0, 0, -1, -1, -1, 31929, NULL);
INSERT INTO `spell_effect_mod` (`Id`, `EffectIndex`, `Effect`, `EffectDieSides`, `EffectBaseDice`, `EffectDicePerLevel`, `EffectRealPointsPerLevel`, `EffectBasePoints`, `EffectAmplitude`, `EffectPointsPerComboPoint`, `EffectChainTarget`, `EffectMultipleValue`, `EffectMechanic`, `EffectImplicitTargetA`, `EffectImplicitTargetB`, `EffectRadiusIndex`, `EffectApplyAuraName`, `EffectItemType`, `EffectMiscValue`, `EffectTriggerSpell`, `Comment`) VALUES (31929, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 22, 30, 12, -1, -1, -1, -1, NULL);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
