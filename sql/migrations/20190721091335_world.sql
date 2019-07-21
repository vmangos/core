DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190721091335');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190721091335');
-- Add your query below.


-- Gameobjects addded in 1.8.
UPDATE `gameobject_template` SET `patch`=6 WHERE `patch` < 6 && `entry` IN (180914, 180913, 180915, 180405, 180451, 180448, 180742, 180719, 180515, 180455, 180454, 180453, 180715, 180844, 180472, 180471, 180427, 180426, 180425, 180412, 180411, 180410, 180407, 180406, 180698, 180573, 186720, 180699, 300054, 300055, 300056);
UPDATE `gameobject` SET `patch_min`=6 WHERE `patch_min` < 6 && `id` IN (180914, 180913, 180915, 180405, 180451, 180448, 180742, 180719, 180515, 180455, 180454, 180453, 180715, 180844, 180472, 180471, 180427, 180426, 180425, 180412, 180411, 180410, 180407, 180406, 180698, 180573, 186720, 180699, 300054, 300055, 300056);
UPDATE `gameobject` SET `patch_min`=6 WHERE `patch_min` < 6 && `guid` IN (49273);

-- Duplicate mailbox spawn.
DELETE FROM `gameobject` WHERE `guid`=30003;

-- Insect Swarm was added in 1.8.
UPDATE `spell_chain` SET `build_min`=4878 WHERE `first_spell`=5570;

-- Feline Swiftness was changed in 1.8.
UPDATE `spell_learn_spell` SET `build_min`=4878 WHERE `entry`=17002;
UPDATE `spell_learn_spell` SET `build_min`=4878 WHERE `entry`=24866;

-- Omen of Clarity was changed in 1.8.
UPDATE `spell_proc_event` SET `build_min`=4878 WHERE `entry`=16864;

-- Improved Enrage was changed in 1.8.
UPDATE `spell_proc_event` SET `build_min`=4878 WHERE `entry`=17079;

-- These unobtainable items must have been added in 1.8.
UPDATE `item_template` SET `patch`=6 WHERE `entry` IN (20334, 20339, 20349);

-- Non existent display ids.
UPDATE `creature_model_info` SET `build`=4878 WHERE `modelid` IN (15300, 15302, 15304, 15305, 15306, 15307, 15308, 15309, 15310, 15311, 15312, 15313, 15314, 15315, 15316, 15317, 15318, 15319, 15320, 15321, 15322, 15323, 15324, 15325, 15326, 15327, 15328, 15329, 15330, 15331, 15332, 15349, 15350, 15352, 15353, 15355, 15356, 15357, 15358, 15359, 15363, 15364, 15365, 15366, 15367, 15368, 15369, 15370, 15371, 15372, 15373, 15374, 15375, 15377, 15381, 15382, 15383, 15384, 15385, 15386, 15387, 15388, 15389, 15390, 15391, 15393, 15394, 15395, 15396, 15397, 15398, 15399, 15402, 15403, 15407, 15408, 15409, 15410, 15411, 15416, 15425, 15435, 15660, 15663, 15667, 15671, 15684, 15687, 15698, 15713, 15732, 15733, 15734, 15735, 15736, 15737, 15744, 15745, 15746, 15747, 15748, 15749, 15750, 15751, 15752, 15753, 15754, 15755, 15756, 15757, 15758, 15759, 15760, 15762, 15763, 15764, 15765, 15766, 15767, 15768, 15769, 15770, 15771, 15772, 15773, 15795, 15796, 15797, 15798, 15799, 15800, 15801, 15802, 15803, 15804, 15805, 15806, 15807, 15808, 15809, 15901, 15902, 15903, 15904);
UPDATE `creature` SET `modelid`=0 WHERE `modelid` IN (15300, 15302, 15304, 15305, 15306, 15307, 15308, 15309, 15310, 15311, 15312, 15313, 15314, 15315, 15316, 15317, 15318, 15319, 15320, 15321, 15322, 15323, 15324, 15325, 15326, 15327, 15328, 15329, 15330, 15331, 15332, 15349, 15350, 15352, 15353, 15355, 15356, 15357, 15358, 15359, 15363, 15364, 15365, 15366, 15367, 15368, 15369, 15370, 15371, 15372, 15373, 15374, 15375, 15377, 15381, 15382, 15383, 15384, 15385, 15386, 15387, 15388, 15389, 15390, 15391, 15393, 15394, 15395, 15396, 15397, 15398, 15399, 15402, 15403, 15407, 15408, 15409, 15410, 15411, 15416, 15425, 15435, 15660, 15663, 15667, 15671, 15684, 15687, 15698, 15713, 15732, 15733, 15734, 15735, 15736, 15737, 15744, 15745, 15746, 15747, 15748, 15749, 15750, 15751, 15752, 15753, 15754, 15755, 15756, 15757, 15758, 15759, 15760, 15762, 15763, 15764, 15765, 15766, 15767, 15768, 15769, 15770, 15771, 15772, 15773, 15795, 15796, 15797, 15798, 15799, 15800, 15801, 15802, 15803, 15804, 15805, 15806, 15807, 15808, 15809, 15901, 15902, 15903, 15904);

-- One of the display ids of Stormpike Emissary was changed in 1.8.
DELETE FROM `creature_template` WHERE `entry`=15103;
INSERT INTO `creature_template` (`entry`, `patch`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `name`, `subname`, `gossip_menu_id`, `level_min`, `level_max`, `health_min`, `health_max`, `mana_min`, `mana_max`, `armor`, `faction`, `npc_flags`, `speed_walk`, `speed_run`, `scale`, `detection_range`, `call_for_help_range`, `leash_range`, `rank`, `xp_multiplier`, `dmg_min`, `dmg_max`, `dmg_school`, `attack_power`, `dmg_multiplier`, `base_attack_time`, `ranged_attack_time`, `unit_class`, `unit_flags`, `dynamic_flags`, `beast_family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `ranged_dmg_min`, `ranged_dmg_max`, `ranged_attack_power`, `type`, `type_flags`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `spell_id1`, `spell_id2`, `spell_id3`, `spell_id4`, `spell_list_id`, `pet_spell_list_id`, `gold_min`, `gold_max`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `regeneration`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `flags_extra`, `script_name`) VALUES (15103, 5, 15259, 15260, 15261, 15262, 'Stormpike Emissary', NULL, 8453, 55, 55, 4108, 4108, 0, 0, 4500, 1217, 2049, 1, 1.14286, 0, 20, 5, 0, 0, 1, 143, 194, 0, 248, 1, 2000, 2000, 1, 4352, 0, 0, 0, 0, 0, 0, 70.664, 97.163, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'EventAI', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 2, '');
INSERT INTO `creature_template` (`entry`, `patch`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `name`, `subname`, `gossip_menu_id`, `level_min`, `level_max`, `health_min`, `health_max`, `mana_min`, `mana_max`, `armor`, `faction`, `npc_flags`, `speed_walk`, `speed_run`, `scale`, `detection_range`, `call_for_help_range`, `leash_range`, `rank`, `xp_multiplier`, `dmg_min`, `dmg_max`, `dmg_school`, `attack_power`, `dmg_multiplier`, `base_attack_time`, `ranged_attack_time`, `unit_class`, `unit_flags`, `dynamic_flags`, `beast_family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `ranged_dmg_min`, `ranged_dmg_max`, `ranged_attack_power`, `type`, `type_flags`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `spell_id1`, `spell_id2`, `spell_id3`, `spell_id4`, `spell_list_id`, `pet_spell_list_id`, `gold_min`, `gold_max`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `regeneration`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `flags_extra`, `script_name`) VALUES (15103, 6, 15259, 15260, 15388, 15262, 'Stormpike Emissary', NULL, 8453, 55, 55, 4108, 4108, 0, 0, 4500, 1217, 2049, 1, 1.14286, 0, 20, 5, 0, 0, 1, 143, 194, 0, 248, 1, 2000, 2000, 1, 4352, 0, 0, 0, 0, 0, 0, 70.664, 97.163, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'EventAI', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 2, '');

-- Fix wrong display id used by Carrion Swarmer.
UPDATE `creature_template` SET `display_id1`=13096, `display_id2`=13097, `display_id3`=13111, `display_id4`=0 WHERE `entry`=13160;

-- Remove wrong spells from Gorrik.
UPDATE `creature_template` SET `spell_id1`=0, `spell_id2`=0, `spell_id3`=0, `spell_id4`=0 WHERE `entry`=2861;

-- Fix pre 1.8 faction for Occulus.
DELETE FROM `creature_template` WHERE `entry`=8196;
INSERT INTO `creature_template` (`entry`, `patch`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `name`, `subname`, `gossip_menu_id`, `level_min`, `level_max`, `health_min`, `health_max`, `mana_min`, `mana_max`, `armor`, `faction`, `npc_flags`, `speed_walk`, `speed_run`, `scale`, `detection_range`, `call_for_help_range`, `leash_range`, `rank`, `xp_multiplier`, `dmg_min`, `dmg_max`, `dmg_school`, `attack_power`, `dmg_multiplier`, `base_attack_time`, `ranged_attack_time`, `unit_class`, `unit_flags`, `dynamic_flags`, `beast_family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `ranged_dmg_min`, `ranged_dmg_max`, `ranged_attack_power`, `type`, `type_flags`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `spell_id1`, `spell_id2`, `spell_id3`, `spell_id4`, `spell_list_id`, `pet_spell_list_id`, `gold_min`, `gold_max`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `regeneration`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `flags_extra`, `script_name`) VALUES (8196, 0, 8317, 0, 0, 0, 'Occulus', NULL, 0, 50, 50, 6782, 6782, 0, 0, 2999, 103, 0, 1.05, 1.14286, 0, 20, 5, 0, 1, 1, 284, 366, 0, 226, 1, 1241, 2000, 1, 64, 0, 0, 0, 0, 0, 0, 54.6, 75.075, 100, 2, 0, 8196, 0, 8196, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 81960, 0, 367, 484, 'EventAI', 1, 1, 0, 0, 3, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `creature_template` (`entry`, `patch`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `name`, `subname`, `gossip_menu_id`, `level_min`, `level_max`, `health_min`, `health_max`, `mana_min`, `mana_max`, `armor`, `faction`, `npc_flags`, `speed_walk`, `speed_run`, `scale`, `detection_range`, `call_for_help_range`, `leash_range`, `rank`, `xp_multiplier`, `dmg_min`, `dmg_max`, `dmg_school`, `attack_power`, `dmg_multiplier`, `base_attack_time`, `ranged_attack_time`, `unit_class`, `unit_flags`, `dynamic_flags`, `beast_family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `ranged_dmg_min`, `ranged_dmg_max`, `ranged_attack_power`, `type`, `type_flags`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `spell_id1`, `spell_id2`, `spell_id3`, `spell_id4`, `spell_list_id`, `pet_spell_list_id`, `gold_min`, `gold_max`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `regeneration`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `flags_extra`, `script_name`) VALUES (8196, 6, 8317, 0, 0, 0, 'Occulus', NULL, 0, 50, 50, 6782, 6782, 0, 0, 2999, 1605, 0, 1.05, 1.14286, 0, 20, 5, 0, 1, 1, 284, 366, 0, 226, 1, 1241, 2000, 1, 64, 0, 0, 0, 0, 0, 0, 54.6, 75.075, 100, 2, 0, 8196, 0, 8196, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 81960, 0, 367, 484, 'EventAI', 1, 1, 0, 0, 3, 0, 0, 0, 0, 0, 0, '');

-- Fix pre 1.8 faction for Chronalis.
DELETE FROM `creature_template` WHERE `entry`=8197;
INSERT INTO `creature_template` (`entry`, `patch`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `name`, `subname`, `gossip_menu_id`, `level_min`, `level_max`, `health_min`, `health_max`, `mana_min`, `mana_max`, `armor`, `faction`, `npc_flags`, `speed_walk`, `speed_run`, `scale`, `detection_range`, `call_for_help_range`, `leash_range`, `rank`, `xp_multiplier`, `dmg_min`, `dmg_max`, `dmg_school`, `attack_power`, `dmg_multiplier`, `base_attack_time`, `ranged_attack_time`, `unit_class`, `unit_flags`, `dynamic_flags`, `beast_family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `ranged_dmg_min`, `ranged_dmg_max`, `ranged_attack_power`, `type`, `type_flags`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `spell_id1`, `spell_id2`, `spell_id3`, `spell_id4`, `spell_list_id`, `pet_spell_list_id`, `gold_min`, `gold_max`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `regeneration`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `flags_extra`, `script_name`) VALUES (8197, 0, 6370, 0, 0, 0, 'Chronalis', NULL, 0, 61, 61, 37435, 37435, 0, 0, 4091, 103, 0, 1.05, 1.14286, 0, 20, 5, 0, 1, 1, 559, 720, 0, 278, 1, 1158, 2000, 1, 64, 0, 0, 0, 0, 0, 0, 172.1, 240.07, 100, 2, 0, 8197, 0, 8197, 0, 5, 5, 5, 5, 5, 20717, 0, 13748, 0, 81970, 0, 1716, 2245, 'EventAI', 1, 1, 0, 0, 3, 0, 0, 0, 617299675, 0, 256, '');
INSERT INTO `creature_template` (`entry`, `patch`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `name`, `subname`, `gossip_menu_id`, `level_min`, `level_max`, `health_min`, `health_max`, `mana_min`, `mana_max`, `armor`, `faction`, `npc_flags`, `speed_walk`, `speed_run`, `scale`, `detection_range`, `call_for_help_range`, `leash_range`, `rank`, `xp_multiplier`, `dmg_min`, `dmg_max`, `dmg_school`, `attack_power`, `dmg_multiplier`, `base_attack_time`, `ranged_attack_time`, `unit_class`, `unit_flags`, `dynamic_flags`, `beast_family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `ranged_dmg_min`, `ranged_dmg_max`, `ranged_attack_power`, `type`, `type_flags`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `spell_id1`, `spell_id2`, `spell_id3`, `spell_id4`, `spell_list_id`, `pet_spell_list_id`, `gold_min`, `gold_max`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `regeneration`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `flags_extra`, `script_name`) VALUES (8197, 6, 6370, 0, 0, 0, 'Chronalis', NULL, 0, 61, 61, 37435, 37435, 0, 0, 4091, 1605, 0, 1.05, 1.14286, 0, 20, 5, 0, 1, 1, 559, 720, 0, 278, 1, 1158, 2000, 1, 64, 0, 0, 0, 0, 0, 0, 172.1, 240.07, 100, 2, 0, 8197, 0, 8197, 0, 5, 5, 5, 5, 5, 20717, 0, 13748, 0, 81970, 0, 1716, 2245, 'EventAI', 1, 1, 0, 0, 3, 0, 0, 0, 617299675, 0, 256, '');

-- Fix pre 1.8 faction for Tick.
DELETE FROM `creature_template` WHERE `entry`=8198;
INSERT INTO `creature_template` (`entry`, `patch`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `name`, `subname`, `gossip_menu_id`, `level_min`, `level_max`, `health_min`, `health_max`, `mana_min`, `mana_max`, `armor`, `faction`, `npc_flags`, `speed_walk`, `speed_run`, `scale`, `detection_range`, `call_for_help_range`, `leash_range`, `rank`, `xp_multiplier`, `dmg_min`, `dmg_max`, `dmg_school`, `attack_power`, `dmg_multiplier`, `base_attack_time`, `ranged_attack_time`, `unit_class`, `unit_flags`, `dynamic_flags`, `beast_family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `ranged_dmg_min`, `ranged_dmg_max`, `ranged_attack_power`, `type`, `type_flags`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `spell_id1`, `spell_id2`, `spell_id3`, `spell_id4`, `spell_list_id`, `pet_spell_list_id`, `gold_min`, `gold_max`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `regeneration`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `flags_extra`, `script_name`) VALUES (8198, 0, 8318, 0, 0, 0, 'Tick', NULL, 0, 52, 52, 7105, 7105, 0, 0, 3108, 103, 0, 1.05, 1.14286, 0, 20, 5, 0, 1, 1, 310, 400, 0, 234, 1, 1216, 2000, 1, 64, 0, 0, 0, 0, 0, 0, 56.7312, 78.0054, 100, 2, 0, 8198, 0, 8198, 0, 0, 0, 0, 0, 0, 21073, 20717, 0, 0, 81980, 0, 391, 516, 'EventAI', 1, 1, 0, 0, 3, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `creature_template` (`entry`, `patch`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `name`, `subname`, `gossip_menu_id`, `level_min`, `level_max`, `health_min`, `health_max`, `mana_min`, `mana_max`, `armor`, `faction`, `npc_flags`, `speed_walk`, `speed_run`, `scale`, `detection_range`, `call_for_help_range`, `leash_range`, `rank`, `xp_multiplier`, `dmg_min`, `dmg_max`, `dmg_school`, `attack_power`, `dmg_multiplier`, `base_attack_time`, `ranged_attack_time`, `unit_class`, `unit_flags`, `dynamic_flags`, `beast_family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `ranged_dmg_min`, `ranged_dmg_max`, `ranged_attack_power`, `type`, `type_flags`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `spell_id1`, `spell_id2`, `spell_id3`, `spell_id4`, `spell_list_id`, `pet_spell_list_id`, `gold_min`, `gold_max`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `regeneration`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `flags_extra`, `script_name`) VALUES (8198, 6, 8318, 0, 0, 0, 'Tick', NULL, 0, 52, 52, 7105, 7105, 0, 0, 3108, 1605, 0, 1.05, 1.14286, 0, 20, 5, 0, 1, 1, 310, 400, 0, 234, 1, 1216, 2000, 1, 64, 0, 0, 0, 0, 0, 0, 56.7312, 78.0054, 100, 2, 0, 8198, 0, 8198, 0, 0, 0, 0, 0, 0, 21073, 20717, 0, 0, 81980, 0, 391, 516, 'EventAI', 1, 1, 0, 0, 3, 0, 0, 0, 0, 0, 0, '');

-- Remove wrong spells from Hierophant Theodora Mulvadania.
UPDATE `creature_template` SET `spell_id1`=0, `spell_id2`=0, `spell_id3`=0, `spell_id4`=0 WHERE `entry`=9079;

-- Fix wrong spell id used by Desert Rager.
UPDATE `creature_template` SET `spell_id1`=13728 WHERE `entry`=11747;

-- Add patch to ghost aura added in 1.8.
DELETE FROM `creature_template_addon` WHERE `entry`=10946;
INSERT INTO `creature_template_addon` (`entry`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (10946, 0, 0, 0, 0, 0, 0, 0, '17467');
INSERT INTO `creature_template_addon` (`entry`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (10946, 6, 0, 0, 0, 0, 0, 0, '25039 17467');
UPDATE `creature_template_addon` SET `patch`=6 WHERE `entry` IN (10938, 15082, 15083, 15084, 15085);

-- Fix wrong aura used by sleeping mobs in Blackrock Spire.
-- Not sure this is correct aura either, but Bruiser Sleeping certainly was not.
UPDATE `creature_addon` SET `emote`=12, `auras`='6606' WHERE `guid` IN (43765, 44311, 44328, 45776, 45785, 45796, 45797, 1004514);

-- This model id was changed in 1.8.
DELETE FROM `creature_model_info` WHERE `modelid`=11242;
INSERT INTO `creature_model_info` (`modelid`, `build`, `bounding_radius`, `combat_reach`, `gender`, `modelid_other_gender`, `modelid_other_team`) VALUES (11242, 0, 2, 3, 1, 11241, 0);
INSERT INTO `creature_model_info` (`modelid`, `build`, `bounding_radius`, `combat_reach`, `gender`, `modelid_other_gender`, `modelid_other_team`) VALUES (11242, 4878, 2, 3, 1, 15403, 0);

-- This model id was changed in 1.8.
DELETE FROM `creature_model_info` WHERE `modelid`=15259;
INSERT INTO `creature_model_info` (`modelid`, `build`, `bounding_radius`, `combat_reach`, `gender`, `modelid_other_gender`, `modelid_other_team`) VALUES (15259, 0, 0.347, 1.5, 0, 15261, 0);
INSERT INTO `creature_model_info` (`modelid`, `build`, `bounding_radius`, `combat_reach`, `gender`, `modelid_other_gender`, `modelid_other_team`) VALUES (15259, 4878, 0.347, 1.5, 0, 15388, 0);

-- These graveyards were added in 1.8.
UPDATE `game_graveyard_zone` SET `build_min`=4878 WHERE `id`=910;
UPDATE `game_graveyard_zone` SET `build_min`=4878 WHERE `id`=911;

-- Fix old version of Soul Link.
DELETE FROM `spell_scripts` WHERE `id`=19028;
INSERT INTO `spell_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (19028, 0, 15, 18814, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Soul Link - Cast Soul Link Aura');

-- Defensive State 2 (DND) was added in 1.8.
UPDATE `playercreateinfo_spell` SET `build_min`=4878 WHERE `spell`=24949;

-- These spells were added in 1.8.
UPDATE `npc_trainer` SET `build_min`=4878 WHERE `spell` IN (24981, 24980, 24979, 24922, 24978, 24656, 24657);

-- Mark of the Wild Rank 7 was added in 1.8.
UPDATE `spell_group` SET `build_min`=4878 WHERE `spell_id`=24752;

-- Cenarion Hold Inn was added in 1.8.
UPDATE `areatrigger_tavern` SET `patch_min`=6 WHERE `id`=3985;

-- Throw Nightmare Object was added in 1.8.
UPDATE `spell_target_position` SET `build_min`=4878 WHERE `id`=25004;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
