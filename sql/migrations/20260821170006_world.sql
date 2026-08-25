DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260821170006');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260821170006');
-- Add your query below.


-- PvP ALT-N Credit Marker
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=15005; -- DB2 Matches (sniff neither)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=15005; -- DB2 Matches (sniff neither)

-- PvP H-Mid Credit Marker
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=15003; -- DB2 Matches (sniff neither)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=15003; -- DB2 Matches (sniff neither)

-- PvP A-Mid Credit Marker
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=15001; -- DB2 Matches (sniff neither)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=15001; -- DB2 Matches (sniff neither)

-- PvP ALT-S Credit Marker
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=15004; -- DB2 Matches (sniff neither)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=15004; -- DB2 Matches (sniff neither)

-- PvP Mid Credit Marker
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=15002; -- DB2 Matches (sniff neither)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=15002; -- DB2 Matches (sniff neither)

-- Timmy the Cruel
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=10808; -- No Match

-- Eye of Naxxramas
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=10411; -- No Match

-- Field Marshal Oslight
DELETE FROM `creature_template` WHERE `entry`=14983;
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (14983, 5, 'Field Marshal Oslight', NULL, 62, 62, 1577, 3, 6323, 15142, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 100, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1, 1, 1.15, 1, 0.14, 0, 2000, 2000, 0, 10, 10, 10, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 3, 0, 0, 14983, 0, 0, 0, 0, 0, 6, 0, 0, '');
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (14983, 6, 'Field Marshal Oslight', NULL, 62, 62, 1577, 3, 6323, 15142, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 100, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1, 1, 1.15, 1, 0.14, 0, 2000, 2000, 0, 10, 10, 10, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 3, 0, 0, 14983, 0, 0, 0, 0, 0, 4194310, 0, 0, '');

-- Sergeant Maclear
DELETE FROM `creature_template` WHERE `entry`=14984;
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (14984, 5, 'Sergeant Maclear', '', 62, 62, 1577, 3, 6324, 15143, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 100, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1, 1, 1, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 3, 0, 0, 14984, 0, 0, 0, 0, 0, 6, 0, 0, '');
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (14984, 6, 'Sergeant Maclear', '', 62, 62, 1577, 3, 6324, 15143, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 100, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1, 1, 1, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 3, 0, 0, 14984, 0, 0, 0, 0, 0, 4194310, 0, 0, '');

-- Ivus the Forest Lord
DELETE FROM `creature_template` WHERE `entry`=13419;
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (13419, 3, 'Ivus the Forest Lord', NULL, 61, 61, 11, 0, 0, 14884, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 2.14286, 20, 5, 0, 7, 0, 3, 2, 1, 50, 15, 1.7, 5.3, 0.14, 0, 2000, 1255, 0, 15, 15, 15, 15, 15, 0, 0, 0, 0, 13419, 0, 0, 505, 2525, 0, 0, 0, 0, NULL, '', 1, 3, 0, 0, 0, 0, 0, 617299803, 0, 0, 2160594944, 0, 0, 'npc_worldboss_a_av');
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (13419, 4, 'Ivus the Forest Lord', NULL, 61, 61, 1594, 0, 0, 14884, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 2.14286, 20, 5, 0, 7, 0, 3, 2, 1, 50, 15, 1.7, 5.3, 0.14, 0, 2000, 1255, 0, 15, 15, 15, 15, 15, 0, 0, 0, 0, 13419, 0, 0, 505, 2525, 0, 0, 0, 0, NULL, '', 1, 3, 0, 0, 0, 0, 0, 617299803, 0, 0, 2160594944, 0, 0, 'npc_worldboss_a_av');
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (13419, 9, 'Ivus the Forest Lord', NULL, 61, 61, 1594, 0, 0, 14884, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 2.14286, 20, 5, 0, 7, 0, 3, 2, 1, 50, 15, 1.7, 5.3, 0.14, 0, 2000, 1255, 0, 15, 15, 15, 15, 15, 0, 0, 0, 0, 13419, 0, 0, 505, 2525, 0, 0, 0, 0, NULL, '', 1, 3, 0, 0, 0, 0, 0, 617299803, 0, 0, 2160595008, 0, 0, 'npc_worldboss_a_av');

-- Lokholar the Ice Lord
DELETE FROM `creature_template` WHERE `entry`=13256;
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (13256, 3, 'Lokholar the Ice Lord', NULL, 61, 61, 1214, 0, 0, 13174, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 2.14286, 20, 5, 0, 4, 0, 3, 2, 1, 50, 8, 1.75, 3.85, 0.14, 0, 2000, 2000, 0, 15, 15, 15, 15, 15, 0, 0, 0, 0, 13256, 0, 0, 1, 886, 0, 0, 0, 0, NULL, '', 1, 3, 0, 0, 0, 0, 0, 617316187, 0, 32, 2160070656, 4, 0, 'npc_worldboss_h_av');
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (13256, 9, 'Lokholar the Ice Lord', NULL, 61, 61, 1214, 0, 0, 13174, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 2.14286, 20, 5, 0, 4, 0, 3, 2, 1, 50, 8, 1.75, 3.85, 0.14, 0, 2000, 2000, 0, 15, 15, 15, 15, 15, 0, 0, 0, 0, 13256, 0, 0, 1, 886, 0, 0, 0, 0, NULL, '', 1, 3, 0, 0, 0, 0, 0, 617316187, 0, 32, 2160070720, 4, 0, 'npc_worldboss_h_av');

-- Hooktooth Frenzy
DELETE FROM `creature_template` WHERE `entry`=11374;
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (11374, 5, 'Hooktooth Frenzy', NULL, 60, 60, 16, 0, 0, 15101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1.14286, 20, 5, 0, 1, 0, 1, 1, 1, 3, 1, 1.1, 2.4, 0.14, 0, 1200, 2000, 0, 15, 15, 15, 15, 15, 0, 0, 0, 0, 0, 0, 0, 503, 661, 113740, 0, 0, 0, NULL, '', 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 277086214, 0, 0, '');
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (11374, 6, 'Hooktooth Frenzy', NULL, 60, 60, 16, 0, 0, 15101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1.14286, 20, 5, 0, 1, 0, 1, 1, 1, 3, 1, 1.1, 2.4, 0.14, 0, 1200, 2000, 0, 15, 15, 15, 15, 15, 0, 0, 0, 0, 0, 0, 0, 503, 661, 113740, 0, 0, 0, NULL, '', 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 277086208, 0, 0, '');

-- Son of Hakkar
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~16 /*Tameable*/ WHERE `entry`=11357 && `patch`=5; -- No Match (progressive) (type_flag 1)

-- High Justice Grimstone
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=10096; -- DB2 Matches (sniff agree)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=10096; -- DB2 Matches (sniff agree)

-- Ok'thor the Breaker
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4096 /*CorpseRaid*/ WHERE `entry`=9030; -- No Match

-- Crypt Scarab
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 512 /*Uninteractible*/ WHERE `entry`=10577; -- DB2 Matches (sniff agree)

-- Black Guard Swordsmith
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=11121; -- No Match

-- Black Guard Sentry
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=10394; -- No Match

-- Servant of Antu'sul
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=8156; -- No Match

-- Ghoul
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=846; -- No Match

-- Sergeant Major Clate
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~134217728 /*Calls Guards*/ WHERE `entry`=12785; -- No Match

-- Archmage Gaiman
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~134217728 /*Calls Guards*/ WHERE `entry`=12779; -- No Match

-- Master Sergeant Biggins
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~134217728 /*Calls Guards*/ WHERE `entry`=12781; -- No Match

-- Lieutenant Rachel Vaccar
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~134217728 /*Calls Guards*/ WHERE `entry`=12778; -- No Match

-- Lieutenant Jackspring
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~134217728 /*Calls Guards*/ WHERE `entry`=12784; -- No Match

-- Sergeant Major Skyshadow
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~134217728 /*Calls Guards*/ WHERE `entry`=12780; -- No Match

-- Honored Hero
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=15113; -- DB2 Matches (sniff agree)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=15113; -- DB2 Matches (sniff agree)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15113; -- No Match

-- Wagner Hammerstrike
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15011; -- No Match

-- Threggil
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=14432; -- No Match


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
