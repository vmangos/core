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
(176350, 2, 2508.97, -4739.86, 94.2171, 100, 0, 0, 0),
(176350, 3, 2499.11, -4728.21, 91.2576, 100, 0, 0, 0),
(176350, 4, 2489.62, -4696.67, 82.5334, 100, 0, 0, 0),
(176350, 5, 2489.41, -4679.48, 79.23, 100, 0, 0, 0),
(176350, 6, 2492.75, -4661.14, 75.2698, 100, 0, 0, 0),
(176350, 7, 2507.7, -4657.5, 75.9172, 100, 0, 0, 0),
(176350, 8, 2527.35, -4655.69, 76.9172, 100, 0, 0, 0),
(176350, 9, 2551.24, -4650.62, 78.2178, 100, 0, 0, 0),
(176350, 10,2581.14, -4637.59, 80.8094, 100, 0, 0, 0),
(176350, 11, 2606.74, -4620.01, 83.2762, 100, 0, 0, 0),
(176350, 12, 2632.55, -4604.1, 84.6785, 100, 0, 0, 0),
(176350, 13, 2670.71, -4583.26, 85.9197, 100, 0, 0, 0),
(176350, 14, 2704.45, -4563.24, 87.572, 100, 0, 0, 0),
(176350, 15, 2731.74, -4547.38, 88.322, 100, 0, 0, 0),
(176350, 16, 2758.3, -4526.77, 89.1629, 100, 0, 0, 0),
(176350, 17, 2773.15, -4510.53, 89.6595, 100, 0, 0, 0),
(176350, 18, 2790.7, -4493.29, 89.9334, 100, 0, 0, 0),
(176350, 19, 2813.27, -4468.35, 90.0207, 100, 0, 0, 0),
(176350, 20, 2826.77, -4451.97, 89.9391, 100, 0, 0, 0),
(176350, 21, 2836.21, -4437.79, 89.6759, 100, 0, 0, 0),
(176350, 22, 2852.29, -4416.58, 89.4426, 100, 0, 0, 0),
(176350, 23, 2857.23, -4412.86, 89.5676, 100, 0, 0, 0),
(176350, 24, 2881.88, -4408.76, 90.6221, 100, 0, 0, 0),
(176350, 25, 2911.51, -4408.25, 92.2111, 100, 0, 0, 0),
(176350, 26, 2936.4, -4408.94, 93.708, 100, 0, 0, 0),
(176350, 27, 2970.33, -4412.12, 96.0126, 100, 0, 0, 0),
(176350, 28, 2984.13, -4399.77, 96.7575, 100, 0, 0, 0),
(176350, 29, 2999.98, -4371.98, 93.8738, 100, 0, 0, 0),
(176350, 30, 3010.16, -4346.37, 96.5469, 100, 0, 0, 0),
(176350, 31, 3028.67, -4331.88, 99.0939, 100, 0, 0, 0),
(176350, 32, 3044.38, -4332.39, 99.4215, 100, 0, 0, 0),
(176350, 33, 3065.92, -4320.47, 105.869, 100, 0, 0, 0),
(176350, 34, 3102.85, -4316.72, 106.062, 100, 0, 0, 0),
(176350, 35, 3119.25, -4311.59, 118.468, 100, 0, 0, 0),
(176350, 36, 3129.17, -4309.67, 122.739, 100, 0, 0, 0),
(176350, 37, 3140.95, -4315.83, 128.318, 100, 0, 0, 0),
(176350, 38, 3154.63, -4326.59, 133.206, 100, 0, 0, 0),
(176350, 39, 3166.6, -4342.52, 135.782, 100, 0, 0, 0);

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
