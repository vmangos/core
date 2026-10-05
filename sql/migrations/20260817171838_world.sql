DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260817171838');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260817171838');
-- Add your query below.


-- Tiny Walking Bomb (minipet)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=9656; -- DB2 Matches (sniff agree)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=9656; -- DB2 Matches (sniff agree)

-- Camerick Jongleur
DELETE FROM `creature_template` WHERE `entry`=1451;
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (1451, 0, 'Camerick Jongleur', 'Wandering Minstrel', 25, 25, 12, 2, 0, 3462, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.02, 1, 1, 0.9, 0.14, 0, 1500, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 1, 0, 0, 1451, 0, 0, 0, 0, 0, 4194374, 0, 2, '');
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (1451, 1, 'Camerick Jongleur', 'Wandering Minstrel', 25, 25, 12, 2, 0, 3462, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.02, 1, 1, 0.9, 0.14, 0, 1500, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 3, 0, 0, 1451, 0, 0, 0, 0, 0, 4718662, 0, 2, '');
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (1451, 7, 'Camerick Jongleur', 'Wandering Minstrel', 25, 25, 12, 2, 0, 3462, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.02, 1, 1, 0.9, 0.14, 0, 1500, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 3, 0, 0, 1451, 0, 0, 0, 0, 0, 138936390, 0, 2, '');

-- Teronis' Corpse
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4 /*No Loot*/ WHERE `entry`=3891; -- DB2 Matches

-- Mountaineer Grugelm
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4 /*No Loot*/ WHERE `entry`=2466 && `patch` > 0; -- DB2 Matches (progressive)

-- Mountaineer Thar
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4 /*No Loot*/ WHERE `entry`=2468 && `patch` > 0; -- DB2 Matches (progressive)

-- Mountaineer Rharen
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4 /*No Loot*/ WHERE `entry`=2469 && `patch` > 0; -- DB2 Matches (progressive)

-- Mountaineer Dokkin
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4 /*No Loot*/ WHERE `entry`=2105 && `patch` > 0; -- DB2 Matches (progressive)

-- Mountaineer Rockgar
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=1342; -- DB2 Matches (sniff agree)

-- Mountaineer Stormpike
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=1343; -- DB2 Matches (sniff agree)

-- Gothor Brumn
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=1362; -- DB2 Matches (sniff agree)

-- Event Generator 001
DELETE FROM `creature_template` WHERE `entry`=2334;
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (2334, 0, 'Event Generator 001', NULL, 5, 5, 12, 0, 0, 11686, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 10, 0, 0, 1, 1, 0.2, 1, 1, 1.2, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 102, 0, 130, '');
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (2334, 7, 'Event Generator 001', NULL, 5, 5, 12, 0, 0, 11686, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 10, 0, 0, 1, 1, 0.2, 1, 1, 1.2, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 614, 0, 130, '');

-- The Defias Traitor
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 134217728 /*Calls Guards*/ WHERE `entry`=467; -- DB2 Matches

-- Thor
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~134217728 /*Calls Guards*/ WHERE `entry`=523; -- No Match

-- Protector Korelor
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4 /*No Loot*/ WHERE `entry`=874 && `patch` > 0; -- DB2 Matches (progressive)

-- Undead Dynamiter
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=625; -- No Match

-- Undead Excavator
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=624; -- No Match

-- Sargath
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=4509; -- DB2 Matches (sniff agree)

-- Blink Dragon
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=3815; -- No Match

-- Felslayer
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=3774; -- No Match

-- Lesser Felguard
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=3772; -- No Match

-- Ratchet Bruiser
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4 /*No Loot*/ WHERE `entry`=3502 && `patch` > 0; -- DB2 Matches

-- Roger
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 134217728 /*Calls Guards*/ WHERE `entry`=5607; -- DB2 Matches

-- Jamin
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 134217728 /*Calls Guards*/ WHERE `entry`=5608; -- DB2 Matches

-- Shawn
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 134217728 /*Calls Guards*/ WHERE `entry`=8965; -- DB2 Matches

-- Hilary
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 134217728 /*Calls Guards*/ WHERE `entry`=8962; -- DB2 Matches

-- Nathan
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 134217728 /*Calls Guards*/ WHERE `entry`=847; -- DB2 Matches

-- Rachel
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 134217728 /*Calls Guards*/ WHERE `entry`=849; -- DB2 Matches

-- Lakeshire Guard
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4 /*No Loot*/ WHERE `entry`=10037 && `patch` > 0; -- DB2 Matches (progressive)

-- Wulmort Jinglepocket
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 134217728 /*Calls Guards*/ WHERE `entry`=13433; -- DB2 Matches

-- Macey Jinglepocket
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 134217728 /*Calls Guards*/ WHERE `entry`=13434; -- DB2 Matches

-- Greatfather Winter
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=13444; -- DB2 Matches (sniff agree)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=13444; -- DB2 Matches (sniff agree)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 134217728 /*Calls Guards*/ WHERE `entry`=13444; -- DB2 Matches

-- Goli Krumn
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=1365; -- DB2 Matches (sniff agree)

-- Winter Reveler
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15760; -- No Match

-- Wonderform Operator
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 134217728 /*Calls Guards*/ WHERE `entry`=15732; -- DB2 Matches

-- Guchie Jinglepocket
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 134217728 /*Calls Guards*/ WHERE `entry`=13436; -- DB2 Matches

-- Khole Jinglepocket
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 134217728 /*Calls Guards*/ WHERE `entry`=13435; -- DB2 Matches

-- Milton Beats
DELETE FROM `creature_template` WHERE `entry`=13082;
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (13082, 0, 'Milton Beats', 'Giver of the Beatings', 33, 33, 16, 0, 0, 4016, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1.14286, 20, 5, 0, 7, 0, 1, 1, 1, 1.1, 1, 1, 3.15, 0.14, 0, 1400, 1540, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 130820, 0, 0, 0, NULL, 'EventAI', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, '');
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (13082, 1, 'Milton Beats', 'Giver of the Beatings', 33, 33, 16, 0, 0, 4016, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1.14286, 20, 5, 0, 7, 0, 1, 1, 1, 1.1, 1, 1, 3.15, 0.14, 0, 1400, 1540, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 130820, 0, 0, 0, NULL, 'EventAI', 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 524294, 0, 0, '');

-- Krolg
DELETE FROM `creature_template` WHERE `entry`=3897;
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (3897, 0, 'Krolg', NULL, 9, 9, 934, 2, 0, 1010, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.666668, 0.992063, 18, 5, 0, 7, 0, 0, 1, 1, 1, 1, 1, 1.45, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'EventAI', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, '');
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (3897, 1, 'Krolg', NULL, 9, 9, 934, 2, 0, 1010, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.666668, 0.992063, 18, 5, 0, 7, 0, 0, 1, 1, 1, 1, 1, 1.45, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'EventAI', 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 524294, 0, 0, '');

-- Bleakheart Trickster
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=3767; -- No Match

-- Bleakheart Shadowstalker
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=3770; -- No Match

-- Felmusk Satyr
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=3758; -- No Match

-- Felmusk Rogue
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=3759; -- No Match

-- Felmusk Shadowstalker
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=3763; -- No Match

-- Argent Guard Thaelrid
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~134217728 /*Calls Guards*/ WHERE `entry`=4787; -- No Match

-- Fallenroot Hellcaller
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=4799; -- No Match

-- Fallenroot Shadowstalker
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=4798; -- No Match

-- Twilight Lord Kelris
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~64 /*ImmuneNPC*/ WHERE `entry`=4832; -- DB2 Matches (sniff agree)

-- Aku'mai Servant
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=4978; -- No Match

-- Draenei Refugee
DELETE FROM `creature_template` WHERE `entry`=7401;
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (7401, 0, 'Draenei Refugee', NULL, 45, 45, 120, 0, 0, 11650, 11652, 11651, 0, 0, 0, 0, 0, 1, 1, 1, 0, 3, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.2, 1, 1, 1.35, 0.14, 0, 2000, 1716, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 102, 0, 2, '');
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (7401, 1, 'Draenei Refugee', NULL, 45, 45, 120, 0, 0, 11650, 11652, 11651, 0, 0, 0, 0, 0, 1, 1, 1, 0, 3, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.2, 1, 1, 1.35, 0.14, 0, 2000, 1716, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 524390, 0, 2, '');

-- Noxxion's Spawn
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=13456; -- No Match

-- Meshlok the Harvester
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4096 /*CorpseRaid*/ WHERE `entry`=12237; -- No Match
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=12237; -- No Match

-- Celebras the Redeemed
DELETE FROM `creature_template` WHERE `entry`=13716;
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (13716, 0, 'Celebras the Redeemed', NULL, 49, 49, 35, 3, 5349, 13715, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.11111, 1.14286, 20, 5, 0, 7, 0, 1, 2, 1, 8, 4, 1.25, 3.35, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 102, 0, 2, 'celebras_spirit');
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (13716, 1, 'Celebras the Redeemed', NULL, 49, 49, 35, 3, 5349, 13715, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.11111, 1.14286, 20, 5, 0, 7, 0, 1, 2, 1, 8, 4, 1.25, 3.35, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 524390, 0, 2, 'celebras_spirit');

-- Nillen Andemar
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=222; -- DB2 Matches (sniff agree)

-- Mountaineer Haggis
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4 /*No Loot*/ WHERE `entry`=2524 && `patch` > 0; -- DB2 Matches (progressive)

-- Skeletal Warrior
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=48; -- No Match

-- Skeletal Mage
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=203; -- No Match

-- Insane Ghoul
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=511; -- No Match

-- Commander Felstrom
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=771; -- No Match

-- Eliza
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=314; -- DB2 Matches (sniff both)

-- Events list for Eliza
DELETE FROM `creature_ai_events` WHERE `creature_id`=314;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(31401, 314, 0, 4, 0, 50, 0, 0, 0, 0, 0, 31401, 0, 0, 'Eliza - Say on Aggro');
DELETE FROM `creature_ai_scripts` WHERE `id`=31401;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(31401, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 111, 0, 0, 0, 0, 0, 0, 0, 0, 'Eliza - Say Text');
DELETE FROM `creature_ai_scripts` WHERE `id` IN (31403, 31404, 31412, 31413);
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (3140, 'Duskwood - Eliza', 11831, 100, 1, 0, 0, 64, 1, 10, 13, 20, 0, 3107, 100, 0, 0, 0, 0, 2, 13, 121, 121, 0, 20819, 100, 1, 0, 0, 0, 0, 0, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
-- Summon script for Eliza
DELETE FROM `quest_end_scripts` WHERE `id`=254;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(254, 1, 0, 10, 314, 3000000, 0, 0, 0, 0, 0, 0, 8, 314, -1, 1, -10270, 53.9225, 41.8903, 6.15428, 0, 'Digging Through the Dirt: Summon Creature Eliza');
DELETE FROM `generic_scripts` WHERE `id`=314;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(314, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 110, 0, 0, 0, 0, 0, 0, 0, 0, 'Eliza - Say Text'),
(314, 4, 0, 4, 46, 256, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eliza - Remove Immune to Player Flag'),
(314, 4, 1, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eliza - Start Attack');

-- Morgan Ladimore
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 512 /*Uninteractible*/ WHERE `entry`=3301; -- DB2 Matches (sniff agree)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=3301; -- No Match

-- Greatfather Winter's Helper
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=15745; -- DB2 Matches (sniff agree)

-- Gretta Ganter
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=8508; -- DB2 Matches (sniff agree)

-- Burdrak Harglhelm
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=3162; -- DB2 Matches (sniff agree)

-- Mechano-Tank
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=6225; -- No Match

-- Peacekeeper Security Suit
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=6230; -- No Match

-- Arcane Nullifier X-21
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=6232; -- No Match

-- Mechanized Guardian
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=6234; -- No Match

-- Mechano-Flamewalker
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=6226; -- No Match

-- Ghost Walker Brave
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4 /*No Loot*/ WHERE `entry`=8154 && `patch` > 0; -- DB2 Matches

-- Moonglade Warden
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~4194304 /*PvP Enabling*/ WHERE `entry`=11822 && `patch` < 7; -- No Match (progressive) (sniff disagree)

-- Sindrayl
DELETE FROM `creature_template` WHERE `entry`=10897;
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (10897, 0, 'Sindrayl', 'Hippogryph Master', 55, 55, 80, 9, 6944, 10196, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 20, 5, 0, 7, 0, 1, 1, 1, 3, 3, 1.4, 3.25, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 'EventAI', 0, 1, 0, 0, 10897, 0, 0, 0, 0, 0, 4194374, 0, 2, '');
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (10897, 1, 'Sindrayl', 'Hippogryph Master', 55, 55, 80, 9, 6944, 10196, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 20, 5, 0, 7, 0, 1, 1, 1, 3, 3, 1.4, 3.25, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 'EventAI', 0, 3, 0, 0, 10897, 0, 0, 0, 0, 0, 4718662, 0, 2, '');
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (10897, 7, 'Sindrayl', 'Hippogryph Master', 55, 55, 80, 9, 6944, 10196, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 20, 5, 0, 7, 0, 1, 1, 1, 3, 3, 1.4, 3.25, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'EventAI', 0, 3, 0, 0, 10897, 0, 0, 0, 0, 0, 4718598, 0, 2, '');

-- Tajarri
DELETE FROM `creature_template` WHERE `entry`=11799;
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (11799, 0, 'Tajarri', '', 60, 60, 635, 3, 4084, 11766, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 2, 1, 1.35, 1, 1.05, 1.7, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 1, 0, 0, 11799, 0, 0, 0, 0, 0, 134217734, 0, 0, '');
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (11799, 1, 'Tajarri', '', 60, 60, 635, 3, 4084, 11766, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 2, 1, 1.35, 1, 1.05, 1.7, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 3, 0, 0, 11799, 0, 0, 0, 0, 0, 134742022, 0, 0, '');
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (11799, 7, 'Tajarri', '', 60, 60, 635, 3, 4084, 11766, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 2, 1, 1.35, 1, 1.05, 1.7, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 3, 0, 0, 11799, 0, 0, 0, 0, 0, 138936326, 0, 0, '');

-- Silva Fil'naveth
DELETE FROM `creature_template` WHERE `entry`=11800;
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (11800, 0, 'Silva Fil\'naveth', 'Darnassus Flight Master', 60, 60, 994, 1, 4041, 11767, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 100, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 2, 1, 1.35, 1, 0.95, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 134217734, 0, 0, '');
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (11800, 1, 'Silva Fil\'naveth', 'Darnassus Flight Master', 60, 60, 994, 1, 4041, 11767, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 100, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 2, 1, 1.35, 1, 0.95, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 134742022, 0, 0, '');
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (11800, 7, 'Silva Fil\'naveth', 'Darnassus Flight Master', 60, 60, 994, 1, 4041, 11767, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 100, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 2, 1, 1.35, 1, 0.95, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 138936326, 0, 0, '');

-- Malfurion Stormrage
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15362; -- No Match

-- Faustron
DELETE FROM `creature_template` WHERE `entry`=12740;
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (12740, 0, 'Faustron', 'Wind Rider Master', 55, 55, 29, 9, 6944, 12629, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 20, 5, 0, 7, 0, 1, 1, 1, 3, 3, 1.4, 3.25, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 'EventAI', 0, 1, 0, 0, 12740, 0, 0, 1, 0, 0, 4194374, 0, 2, '');
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (12740, 1, 'Faustron', 'Wind Rider Master', 55, 55, 29, 9, 6944, 12629, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 20, 5, 0, 7, 0, 1, 1, 1, 3, 3, 1.4, 3.25, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 'EventAI', 0, 3, 0, 0, 12740, 0, 0, 1, 0, 0, 4718662, 0, 2, '');
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (12740, 7, 'Faustron', 'Wind Rider Master', 55, 55, 29, 9, 6944, 12629, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 20, 5, 0, 7, 0, 1, 1, 1, 3, 3, 1.4, 3.25, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'EventAI', 0, 3, 0, 0, 12740, 0, 0, 1, 0, 0, 4718598, 0, 2, '');

-- Remains of a Paladin
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=6912; -- DB2 Matches (sniff agree)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=6912; -- DB2 Matches (sniff agree)

-- Stone Steward
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=4860; -- No Match

-- Obsidian Sentinel
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=7023; -- No Match

-- Earthen Guardian
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 512 /*Uninteractible*/ WHERE `entry`=7076; -- DB2 Matches (sniff agree)

-- Stone Keeper
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~32 /*ImmunePC*/ WHERE `entry`=4857; -- DB2 Matches (sniff disagree)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~64 /*ImmuneNPC*/ WHERE `entry`=4857; -- DB2 Matches (sniff disagree)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~512 /*Uninteractible*/ WHERE `entry`=4857; -- DB2 Matches (sniff disagree)

-- Earthen Custodian
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 512 /*Uninteractible*/ WHERE `entry`=7309; -- DB2 Matches (sniff agree)

-- Earthen Hallshaper
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 512 /*Uninteractible*/ WHERE `entry`=7077; -- DB2 Matches (sniff agree)

-- Archaedas
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 512 /*Uninteractible*/ WHERE `entry`=2748; -- DB2 Matches (sniff agree)

-- Ancient Stone Keeper
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=7206; -- No Match

-- Lore Keeper of Norgannon
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=7172; -- DB2 Matches (sniff agree)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=7172; -- DB2 Matches (sniff agree)

-- Hermit Ortell
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15194; -- No Match

-- Hazzali Stinger
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=5450; -- No Match

-- Living Storm
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=9397; -- No Match

-- Synge
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 134217728 /*Calls Guards*/ WHERE `entry`=3053; -- DB2 Matches

-- Nyrill
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 134217728 /*Calls Guards*/ WHERE `entry`=8399; -- DB2 Matches

-- Malvor
DELETE FROM `creature_template` WHERE `entry`=12025;
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (12025, 0, 'Malvor', 'Herbalist', 51, 51, 994, 18, 0, 12047, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.3, 1, 1, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 1, 0, 0, 12025, 0, 0, 0, 0, 0, 134217798, 0, 2, '');
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (12025, 1, 'Malvor', 'Herbalist', 51, 51, 994, 18, 0, 12047, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.3, 1, 1, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 3, 0, 0, 12025, 0, 0, 0, 0, 0, 134742086, 0, 2, '');
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (12025, 7, 'Malvor', 'Herbalist', 51, 51, 994, 18, 0, 12047, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.3, 1, 1, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 3, 0, 0, 12025, 0, 0, 0, 0, 0, 138936326, 0, 2, '');

-- Kruban Darkblade
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=14843; -- DB2 Matches (sniff agree)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=14843; -- DB2 Matches (sniff agree)

-- Bloodvenom Post Brave
DELETE FROM `creature_template` WHERE `entry`=11180;
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (11180, 0, 'Bloodvenom Post Brave', NULL, 55, 55, 105, 2, 0, 10734, 10735, 10737, 10736, 1.25, 1.35, 1.25, 1.35, 1, 1, 1, 1, 4, 0, 1, 1.42857, 18, 5, 0, 7, 0, 0, 1, 1, 2, 1, 1, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11180, 0, 0, 1, 727, 0, 0, 0, 0, NULL, '', 0, 1, 0, 0, 11180, 0, 0, 0, 0, 0, 4194306, 0, 0, '');
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (11180, 1, 'Bloodvenom Post Brave', NULL, 55, 55, 105, 2, 0, 10734, 10735, 10737, 10736, 1.25, 1.35, 1.25, 1.35, 1, 1, 1, 1, 4, 0, 1, 1.42857, 18, 5, 0, 7, 0, 0, 1, 1, 2, 1, 1, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11180, 0, 0, 1, 727, 0, 0, 0, 0, NULL, '', 0, 3, 0, 0, 11180, 0, 0, 0, 0, 0, 4718598, 0, 0, '');

-- Hematos
-- UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=8976; -- No Match (sniff disagree)

-- Thunderstomp
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=5832; -- No Match

-- Doomwarder Captain
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=4680; -- No Match

-- Nether Sorceress
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=4684; -- No Match

-- Brave Rainchaser
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4 /*No Loot*/ WHERE `entry`=3223 && `patch` > 0; -- DB2 Matches

-- Brave Wildrunner
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4 /*No Loot*/ WHERE `entry`=3222 && `patch` > 0; -- DB2 Matches

-- Brave Ironhorn
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4 /*No Loot*/ WHERE `entry`=3212 && `patch` > 0; -- DB2 Matches

-- Brave Strongbash
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4 /*No Loot*/ WHERE `entry`=3215 && `patch` > 0; -- DB2 Matches

-- Dendrite Starblaze
DELETE FROM `creature_template` WHERE `entry`=11802;
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (11802, 0, 'Dendrite Starblaze', '', 60, 60, 994, 3, 3901, 11769, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 2, 1, 1.35, 1, 1.05, 1.7, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 134217734, 0, 0, '');
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (11802, 1, 'Dendrite Starblaze', '', 60, 60, 994, 3, 3901, 11769, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 2, 1, 1.35, 1, 1.05, 1.7, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 134742022, 0, 0, '');
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (11802, 7, 'Dendrite Starblaze', '', 60, 60, 994, 3, 3901, 11769, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 2, 1, 1.35, 1, 1.05, 1.7, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 138936326, 0, 0, '');

-- Kharedon
DELETE FROM `creature_template` WHERE `entry`=12023;
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (12023, 0, 'Kharedon', 'Light Armor Merchant', 51, 51, 994, 16388, 0, 12034, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.3, 1, 1, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 134217798, 0, 2, '');
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (12023, 1, 'Kharedon', 'Light Armor Merchant', 51, 51, 994, 16388, 0, 12034, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.3, 1, 1, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 134742086, 0, 2, '');
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (12023, 7, 'Kharedon', 'Light Armor Merchant', 51, 51, 994, 16388, 0, 12034, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.3, 1, 1, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 138936326, 0, 2, '');

-- Geenia Sunshadow
DELETE FROM `creature_template` WHERE `entry`=4184;
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (4184, 0, 'Geenia Sunshadow', 'Speciality Dress Maker', 51, 51, 994, 16388, 0, 11907, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.3, 1, 1, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 134217798, 0, 2, '');
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (4184, 1, 'Geenia Sunshadow', 'Speciality Dress Maker', 51, 51, 994, 16388, 0, 11907, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.3, 1, 1, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 134742086, 0, 2, '');
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (4184, 7, 'Geenia Sunshadow', 'Speciality Dress Maker', 51, 51, 994, 16388, 0, 11907, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.3, 1, 1, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 134742022, 0, 2, '');

-- Mylentha Riverbend
DELETE FROM `creature_template` WHERE `entry`=11795;
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (11795, 0, 'Mylentha Riverbend', '', 60, 60, 994, 0, 0, 11770, 0, 0, 0, 1.25, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 2, 1, 1.35, 1, 1.05, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 134217734, 0, 0, '');
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (11795, 1, 'Mylentha Riverbend', '', 60, 60, 994, 0, 0, 11770, 0, 0, 0, 1.25, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 2, 1, 1.35, 1, 1.05, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 134742022, 0, 0, '');
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (11795, 7, 'Mylentha Riverbend', '', 60, 60, 994, 0, 0, 11770, 0, 0, 0, 1.25, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 2, 1, 1.35, 1, 1.05, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 138936326, 0, 0, '');

-- Darnall
DELETE FROM `creature_template` WHERE `entry`=7940;
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (7940, 0, 'Darnall', 'Tailoring Supplies', 53, 53, 994, 6, 0, 7016, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 2, 1, 1, 1.05, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 134217798, 0, 2, '');
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (7940, 1, 'Darnall', 'Tailoring Supplies', 53, 53, 994, 6, 0, 7016, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 2, 1, 1, 1.05, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 134742086, 0, 2, '');
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (7940, 7, 'Darnall', 'Tailoring Supplies', 53, 53, 994, 6, 0, 7016, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 2, 1, 1, 1.05, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 138936326, 0, 2, '');

-- Loganaar
DELETE FROM `creature_template` WHERE `entry`=12042;
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (12042, 0, 'Loganaar', 'Druid Trainer', 51, 51, 994, 19, 4687, 12053, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.3, 1, 1, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 'EventAI', 0, 1, 0, 0, 12042, 17, 0, 0, 0, 0, 134217798, 0, 2, '');
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (12042, 1, 'Loganaar', 'Druid Trainer', 51, 51, 994, 19, 4687, 12053, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.3, 1, 1, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 'EventAI', 0, 3, 0, 0, 12042, 17, 0, 0, 0, 0, 134742086, 0, 2, '');
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (12042, 7, 'Loganaar', 'Druid Trainer', 51, 51, 994, 19, 4687, 12053, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.3, 1, 1, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'EventAI', 0, 3, 0, 0, 12042, 17, 0, 0, 0, 0, 138936326, 0, 2, '');

-- Dargon
DELETE FROM `creature_template` WHERE `entry`=12019;
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (12019, 0, 'Dargon', 'Food & Drink Merchant', 51, 51, 994, 6, 0, 12044, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.3, 1, 1, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 'EventAI', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 134217798, 0, 2, '');
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (12019, 1, 'Dargon', 'Food & Drink Merchant', 51, 51, 994, 6, 0, 12044, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.3, 1, 1, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 'EventAI', 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 134742086, 0, 2, '');
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (12019, 7, 'Dargon', 'Food & Drink Merchant', 51, 51, 994, 6, 0, 12044, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.3, 1, 1, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'EventAI', 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 138936326, 0, 2, '');

-- Frostwolf Emissary
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~32 /*ImmunePC*/ WHERE `entry`=15106; -- DB2 Matches (sniff agree)

-- Tah Winterhoof
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=3024; -- No Match (sniff agree)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=3024; -- No Match (sniff agree)

-- Hulfnar Stonetotem
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=10599; -- DB2 Matches (sniff both)

-- The Plains Vision
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=2983; -- DB2 Matches (sniff agree)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=2983; -- DB2 Matches (sniff agree)

-- Awbee
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~32 /*ImmunePC*/ WHERE `entry`=10740; -- DB2 Matches (sniff agree)

-- Spire Scarab
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=10177; -- No Match

-- Spire Spider
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=10374; -- No Match

-- Bijou
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~32 /*ImmunePC*/ WHERE `entry`=10257; -- DB2 Matches (sniff agree)

-- Undercity Guardian
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4 /*No Loot*/ WHERE `entry`=5624 && `patch` > 0; -- DB2 Matches

-- Frostwolf Battleguard
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=14285; -- DB2 Matches (sniff agree)

-- Korrak the Bloodrager
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=12159; -- DB2 Matches (sniff neither)

-- Vehena
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=14727; -- No Match

-- Legashi Hellcaller
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=6202; -- No Match

-- Champion Commando
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 1024 /*No Automatic Regen*/ WHERE `entry`=13527; -- DB2 Matches

-- War Rider
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=13178; -- DB2 Matches (sniff agree)

-- Master Engineer Zinfizzlex
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=13377; -- DB2 Matches (sniff neither)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=13377; -- DB2 Matches (sniff neither)

-- Champion Coldmine Guard
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~4 /*No Loot*/ WHERE `entry`=13536; -- No Match

-- Champion Coldmine Surveyor
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~4 /*No Loot*/ WHERE `entry`=13539; -- No Match

-- Coldmine Peon
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~4 /*No Loot*/ WHERE `entry`=13316; -- No Match

-- Whitewhisker Geomancer
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~4 /*No Loot*/ WHERE `entry`=11604; -- No Match

-- Warchief Rend Blackhand
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~32 /*ImmunePC*/ WHERE `entry`=10429; -- DB2 Matches (sniff both)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~64 /*ImmuneNPC*/ WHERE `entry`=10429; -- DB2 Matches (sniff both)

-- 41809: Source's Guid Is 41809
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (41809, 52, 41809, 0, 0, 0, 0);

-- Events list for Warchief Rend Blackhand
DELETE FROM `creature_ai_events` WHERE `creature_id`=10429;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(1042901, 10429, 0, 2, 0, 100, 0, 20, 1, 0, 0, 1042901, 0, 0, 'Warchief Rend Blackhand - Cast Enrage at 20% HP'),
(1042902, 10429, 110, 11, 0, 100, 0, 0, 0, 0, 0, 1042902, 0, 0, 'Warchief Rend Blackhand - Morph on Spawn during Winter Veil'),
(1042903, 10429, 41809, 11, 0, 100, 1, 0, 0, 0, 0, 1042903, 0, 0, 'Warchief Rend Blackhand - Add Immune to Player and NPC Flags on Spawn');
DELETE FROM `creature_ai_scripts` WHERE `id`=1042903;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1042903, 0, 0, 4, 46, 768, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warchief Rend Blackhand - Add Immune to Player and NPC Flags');
DELETE FROM `creature_ai_scripts` WHERE `id`=1033904;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1033904, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 5711, 0, 0, 0, 0, 0, 0, 0, 0, 'Warchief Rend Blackhand - Say Text'),
(1033904, 0, 0, 15, 13360, 2, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warchief Rend Blackhand - Cast Spell Knockdown');

-- Finkle Einhorn
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~32 /*ImmunePC*/ WHERE `entry`=10776; -- DB2 Matches (sniff agree)

-- Felstalker
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=3102; -- No Match

-- Spirit of Minshina
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=3289; -- DB2 Matches (sniff agree)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=3289; -- DB2 Matches (sniff agree)

-- Hallucination
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=10603; -- DB2 Matches (sniff neither)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=10603; -- DB2 Matches (sniff neither)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` | 2 WHERE `entry`=10603; -- DB2 Matches

-- Nazgrel
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=3230; -- DB2 Matches (sniff agree)

-- Earthborer
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=11320; -- No Match

-- Robert Gossom
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 134217728 /*Calls Guards*/ WHERE `entry`=5655; -- DB2 Matches

-- Richard Van Brunt
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 134217728 /*Calls Guards*/ WHERE `entry`=5656; -- DB2 Matches

-- Andrew Hartwell
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 134217728 /*Calls Guards*/ WHERE `entry`=5659; -- DB2 Matches

-- Riley Walker
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 134217728 /*Calls Guards*/ WHERE `entry`=5660; -- DB2 Matches

-- Tyler
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=5653; -- DB2 Matches (sniff both)
-- Edward
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=5654; -- DB2 Matches (sniff both)
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(566101, 0, 0, 4, 46, 512, 2, 0, 5653, 30, 10, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Tyler - Remove Immune to NPC Flag'),
(566101, 0, 0, 4, 46, 512, 2, 0, 5654, 30, 10, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Edward - Remove Immune to NPC Flag'),
(566101, 140, 0, 4, 46, 512, 1, 0, 5654, 30, 10, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Edward - Add Immune to NPC Flag'),
(566101, 140, 0, 4, 46, 512, 1, 0, 5653, 30, 10, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Tyler - Add Immune to NPC Flag');

-- Chloe Curthas
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 134217728 /*Calls Guards*/ WHERE `entry`=5658; -- DB2 Matches

-- Marla Fowler
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 134217728 /*Calls Guards*/ WHERE `entry`=5657; -- DB2 Matches

-- Theodore Griffs
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 134217728 /*Calls Guards*/ WHERE `entry`=11835; -- DB2 Matches

-- Falla Sagewind
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 134217728 /*Calls Guards*/ WHERE `entry`=8418; -- DB2 Matches

-- Deathstalker Adamant
DELETE FROM `creature_template` WHERE `entry`=3849;
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (3849, 0, 'Deathstalker Adamant', '', 18, 18, 68, 1, 302, 2006, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 100, 0, 1, 1.14286, 20, 5, 0, 6, 0, 1, 1, 1, 3, 1, 1, 1.65, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3849, 0, 0, 87, 154, 38490, 0, 0, 0, NULL, '', 0, 1, 0, 0, 3849, 0, 0, 0, 0, 0, 64, 0, 32, '');
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (3849, 1, 'Deathstalker Adamant', '', 18, 18, 68, 1, 302, 2006, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 100, 0, 1, 1.14286, 20, 5, 0, 6, 0, 1, 1, 1, 3, 1, 1, 1.65, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3849, 0, 0, 87, 154, 38490, 0, 0, 0, NULL, '', 0, 3, 0, 0, 3849, 0, 0, 0, 0, 0, 273154112, 0, 32, '');
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (3849, 3, 'Deathstalker Adamant', '', 18, 18, 68, 1, 302, 2006, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 100, 0, 1, 1.14286, 20, 5, 0, 7, 0, 1, 1, 1, 3, 1, 1, 1.65, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3849, 0, 0, 87, 154, 38490, 0, 0, 0, NULL, '', 0, 3, 0, 0, 3849, 0, 0, 0, 0, 0, 273154112, 0, 32, '');

-- Wailing Guardsman
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=3877; -- No Match

-- Arugal
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~64 /*ImmuneNPC*/ WHERE `entry`=10000; -- DB2 Matches (sniff agree)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~512 /*Uninteractible*/ WHERE `entry`=10000; -- DB2 Matches (sniff agree)

-- Wolfguard Worg
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4 /*No Loot*/ WHERE `entry`=5058; -- No Match

-- Archmage Arugal
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=4275; -- DB2 Matches (sniff both)

-- 16255: Source's Guid Is 16255
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (16255, 52, 16255, 0, 0, 0, 0);

-- Events list for Archmage Arugal
DELETE FROM `creature_ai_events` WHERE `creature_id`=4275;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(427501, 4275, 0, 4, 0, 100, 0, 0, 0, 0, 0, 427501, 0, 0, 'Archmage Arugal - Yell on Aggro'),
(427502, 4275, 0, 5, 0, 100, 0, 0, 0, 1, 0, 427502, 0, 0, 'Archmage Arugal - Yell on Player Kill'),
(427503, 4275, 0, 9, 0, 100, 1, 0, 10, 500, 500, 427503, 0, 0, 'Archmage Arugal - Enable Melee Attack below 10 yards'),
(427504, 4275, 0, 9, 0, 100, 1, 10, 60, 500, 500, 427504, 0, 0, 'Archmage Arugal - Disable Melee Attack above 10 yards'),
(427505, 4275, 3710, 0, 4, 100, 13, 48000, 48000, 40000, 40000, 427505, 0, 0, 'Archmage Arugal - Cast Shadow Port 1'),
(427506, 4275, 3710, 0, 4, 100, 13, 22000, 22000, 40000, 40000, 427506, 0, 0, 'Archmage Arugal - Cast Shadow Port 2'),
(427507, 4275, 3710, 0, 4, 100, 1, 34000, 34000, 40000, 40000, 427507, 0, 0, 'Archmage Arugal - Cast Shadow Port 3'),
(427508, 4275, 0, 27, 5, 100, 1, 7587, 1, 5000, 5000, 427508, 0, 0, 'Archmage Arugal - Cast Shadow Port when Root Expires'),
(427509, 4275, 0, 3, 6, 100, 0, 20, 0, 0, 0, 427509, 0, 0, 'Archmage Arugal - Set Phase when Mana below 10%'),
(427510, 4275, 0, 7, 0, 100, 0, 0, 0, 0, 0, 427510, 0, 0, 'Archmage Arugal - Set Phase on Evade'),
(427511, 4275, 16255, 11, 0, 100, 1, 0, 0, 0, 0, 427511, 0, 0, 'Archmage Arugal - Remove Immune to Player Flag on Spawn');
DELETE FROM `creature_ai_scripts` WHERE `id`=427511;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(427511, 0, 0, 4, 46, 256, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Archmage Arugal - Remove Immune to Player Flag');
DELETE FROM `generic_scripts` WHERE `id`=427403;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(427403, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1435, 0, 0, 0, 0, 0, 0, 0, 0, 'Archmage Arugal - Say Text'),
(427403, 2, 0, 15, 6422, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Archmage Arugal - Cast Spell Ashcrombe\'s Teleport'),
(427403, 8, 0, 13, 0, 0, 0, 0, 32447, 0, 14, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Archmage Arugal - Activate Object Arugal\'s Focus');

-- Ward of Laze
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 16384 /*No Defense*/ WHERE `entry`=2667; -- DB2 Matches

-- Badly Injured Soldier
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=12924; -- DB2 Matches (sniff agree)

-- Mistwing Ravager
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=8764; -- No Match

-- Deathguard Abraham
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4 /*No Loot*/ WHERE `entry`=1735 && `patch` > 0; -- DB2 Matches

-- Centipaar Worker
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=5458; -- No Match

-- Arin'sor
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=11702; -- DB2 Matches (sniff agree)

-- Aendel Windspear
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15293; -- No Match

-- Shade of Ambermoon
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=12199; -- No Match

-- Vorrel Sengutz
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` | 2 WHERE `entry`=3981; -- DB2 Matches

-- Deneb Walker
DELETE FROM `creature_template` WHERE `entry`=2805;
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (2805, 0, 'Deneb Walker', 'Scrolls & Potions', 45, 45, 12, 4, 0, 1506, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.2, 1, 1, 0.75, 0.14, 0, 1500, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 70, 0, 2, '');
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (2805, 1, 'Deneb Walker', 'Scrolls & Potions', 45, 45, 12, 4, 0, 1506, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.2, 1, 1, 0.75, 0.14, 0, 1500, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 3, 1, 0, 0, 0, 0, 0, 0, 0, 524358, 0, 2, '');
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (2805, 7, 'Deneb Walker', 'Scrolls & Potions', 45, 45, 12, 4, 0, 1506, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.2, 1, 1, 0.75, 0.14, 0, 1500, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 3, 1, 0, 0, 0, 0, 0, 0, 0, 4718662, 0, 2, '');

-- Critically Injured Soldier
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=12925; -- DB2 Matches (sniff agree)

-- Ambassador Malcin
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=12865; -- No Match

-- Withered Battle Boar
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=7333; -- No Match

-- Boneflayer Ghoul
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=7347; -- No Match

-- Freezing Spirit
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=7353; -- No Match

-- Skeletal Summoner
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=7342; -- No Match

-- Splinterbone Centurion
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=7346; -- No Match

-- Skeletal Shadowcaster
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=7340; -- No Match

-- Frozen Soul
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=7352; -- No Match

-- Splinterbone Warrior
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=7344; -- No Match

-- Thorn Eater Ghoul
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=7348; -- No Match

-- Skeletal Frostweaver
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=7341; -- No Match

-- Splinterbone Captain
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=7345; -- No Match

-- Annora
DELETE FROM `creature_template` WHERE `entry`=11073;
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (11073, 0, 'Annora', 'Master Enchanter', 54, 54, 35, 16, 0, 10609, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.3, 1, 1, 1, 0.14, 0, 2000, 1617, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 1, 1, 0, 0, 11073, 0, 0, 0, 0, 0, 102, 0, 2, 'mob_annora');
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (11073, 1, 'Annora', 'Master Enchanter', 54, 54, 35, 16, 0, 10609, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.3, 1, 1, 1, 0.14, 0, 2000, 1617, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 1, 3, 0, 0, 11073, 0, 0, 0, 0, 0, 524390, 0, 2, 'mob_annora');

-- Riggle Bassbait
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=15077; -- DB2 Matches (sniff agree)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=15077; -- DB2 Matches (sniff agree)

-- Ogron
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 134217728 /*Calls Guards*/ WHERE `entry`=4983; -- DB2 Matches

-- Meliri
DELETE FROM `creature_template` WHERE `entry`=12024;
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (12024, 0, 'Meliri', 'Weaponsmith', 51, 51, 994, 16388, 0, 12031, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.3, 1, 0.95, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 'EventAI', 0, 1, 0, 0, 12024, 0, 0, 0, 0, 0, 134217798, 0, 2, '');
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (12024, 1, 'Meliri', 'Weaponsmith', 51, 51, 994, 16388, 0, 12031, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.3, 1, 0.95, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 'EventAI', 0, 3, 0, 0, 12024, 0, 0, 0, 0, 0, 134742086, 0, 2, '');
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (12024, 7, 'Meliri', 'Weaponsmith', 51, 51, 994, 16388, 0, 12031, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.3, 1, 0.95, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'EventAI', 0, 3, 0, 0, 12024, 0, 0, 0, 0, 0, 138936326, 0, 2, '');

-- Narianna
DELETE FROM `creature_template` WHERE `entry`=12029;
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (12029, 0, 'Narianna', 'Bowyer', 51, 51, 994, 16388, 0, 12040, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.3, 1, 1, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 'EventAI', 0, 1, 0, 0, 12029, 0, 0, 0, 0, 0, 134217798, 0, 2, '');
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (12029, 1, 'Narianna', 'Bowyer', 51, 51, 994, 16388, 0, 12040, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.3, 1, 1, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 'EventAI', 0, 3, 0, 0, 12029, 0, 0, 0, 0, 0, 134742086, 0, 2, '');
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (12029, 7, 'Narianna', 'Bowyer', 51, 51, 994, 16388, 0, 12040, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.3, 1, 1, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'EventAI', 0, 3, 0, 0, 12029, 0, 0, 0, 0, 0, 138936326, 0, 2, '');

-- Moren Riverbend
DELETE FROM `creature_template` WHERE `entry`=11797;
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (11797, 0, 'Moren Riverbend', '', 60, 60, 994, 0, 0, 11772, 0, 0, 0, 1.35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 2, 1, 1.35, 1, 1.05, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 134217734, 0, 0, '');
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (11797, 1, 'Moren Riverbend', '', 60, 60, 994, 0, 0, 11772, 0, 0, 0, 1.35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 2, 1, 1.35, 1, 1.05, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 134742022, 0, 0, '');
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (11797, 7, 'Moren Riverbend', '', 60, 60, 994, 0, 0, 11772, 0, 0, 0, 1.35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 2, 1, 1.35, 1, 1.05, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 138936326, 0, 0, '');

-- Lorelae Wintersong
DELETE FROM `creature_template` WHERE `entry`=12022;
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (12022, 0, 'Lorelae Wintersong', 'Trade Supplies', 51, 51, 994, 6, 0, 12033, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.3, 1, 1, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 1, 0, 0, 12022, 0, 0, 0, 0, 0, 134217798, 0, 2, '');
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (12022, 1, 'Lorelae Wintersong', 'Trade Supplies', 51, 51, 994, 6, 0, 12033, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.3, 1, 1, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 3, 0, 0, 12022, 0, 0, 0, 0, 0, 134742086, 0, 2, '');
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (12022, 7, 'Lorelae Wintersong', 'Trade Supplies', 51, 51, 994, 6, 0, 12033, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.3, 1, 1, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 3, 0, 0, 12022, 0, 0, 0, 0, 0, 138936326, 0, 2, '');

-- Rabine Saturna
DELETE FROM `creature_template` WHERE `entry`=11801;
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (11801, 0, 'Rabine Saturna', '', 60, 60, 635, 3, 5102, 11768, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 2, 1, 1.35, 1, 1.05, 1.7, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 134217734, 0, 0, '');
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (11801, 1, 'Rabine Saturna', '', 60, 60, 635, 3, 5102, 11768, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 2, 1, 1.35, 1, 1.05, 1.7, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 134742022, 0, 0, '');
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (11801, 7, 'Rabine Saturna', '', 60, 60, 635, 3, 5102, 11768, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 2, 1, 1.35, 1, 1.05, 1.7, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 138936326, 0, 0, '');

-- Tomb Reaver
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=7351; -- No Match

-- Sah'rhee
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 134217728 /*Calls Guards*/ WHERE `entry`=8767; -- DB2 Matches

-- Jer'kai Moonweaver
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` | 2 WHERE `entry`=7957; -- DB2 Matches

-- Kindal Moonweaver
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` | 2 WHERE `entry`=7956; -- DB2 Matches

-- Namdo Bizzfizzle
DELETE FROM `creature_template` WHERE `entry`=2683;
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (2683, 0, 'Namdo Bizzfizzle', 'Engineering Supplies', 24, 24, 875, 6, 0, 4953, 0, 0, 0, 1.15, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.02, 1, 1, 1.35, 0.14, 0, 2000, 1947, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 'EventAI', 1, 1, 0, 0, 2683, 0, 0, 0, 0, 0, 138412102, 0, 2, '');
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (2683, 1, 'Namdo Bizzfizzle', 'Engineering Supplies', 24, 24, 875, 6, 0, 4953, 0, 0, 0, 1.15, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.02, 1, 1, 1.35, 0.14, 0, 2000, 1947, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 'EventAI', 1, 3, 0, 0, 2683, 0, 0, 0, 0, 0, 138936390, 0, 2, '');
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (2683, 7, 'Namdo Bizzfizzle', 'Engineering Supplies', 24, 24, 875, 6, 0, 4953, 0, 0, 0, 1.15, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.02, 1, 1, 1.35, 0.14, 0, 2000, 1947, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'EventAI', 1, 3, 0, 0, 2683, 0, 0, 0, 0, 0, 134742086, 0, 2, '');

-- Chomper
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=6215; -- No Match

-- Grubbis
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4096 /*CorpseRaid*/ WHERE `entry`=7361; -- No Match

-- Mechano-Frostwalker
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=6227; -- No Match

-- Idol Room Spawner
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=8611; -- DB2 Matches (sniff agree)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=8611; -- DB2 Matches (sniff agree)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 512 /*Uninteractible*/ WHERE `entry`=8611; -- DB2 Matches (sniff agree)

-- Marryk Nurribit
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=944; -- DB2 Matches (sniff agree)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=944; -- DB2 Matches (sniff agree)

-- Alamar Grimm
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=460; -- DB2 Matches (sniff agree)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=460; -- DB2 Matches (sniff agree)

-- Wren Darkspring
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=6376; -- DB2 Matches (sniff agree)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=6376; -- DB2 Matches (sniff agree)

-- Mahren Skyseer
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 134217728 /*Calls Guards*/ WHERE `entry`=3388; -- DB2 Matches

-- Dalinda Malem
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 134217728 /*Calls Guards*/ WHERE `entry`=5644; -- DB2 Matches

-- Demon Portal Guardian
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=11937; -- No Match

-- Zanzil Skeleton
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4 /*No Loot*/ WHERE `entry`=6388; -- DB2 Matches

-- Injured Soldier
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=12923; -- DB2 Matches (sniff agree)

-- Faire Cannon Trigger
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~536870912 /*Floating <Don't Use>*/ WHERE `entry`=15218; -- No Match

-- Wandering Spirit
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=1532; -- No Match

-- Hayoc
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~2 /*No XP*/ WHERE `entry`=14234; -- DB2 Matches

-- Brackenwall Enforcer
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4194304 /*PvP Enabling*/ WHERE `entry`=10036; -- No Match (sniff agree)

-- Balai Lok'Wein
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` | 2 WHERE `entry`=13476; -- DB2 Matches

-- Willix the Importer
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~64 /*ImmuneNPC*/ WHERE `entry`=4508; -- DB2 Matches (sniff agree)

-- Death's Head Ward Keeper
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4 /*No Loot*/ WHERE `entry`=4625; -- DB2 Matches

-- Stonard Grunt
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4 /*No Loot*/ WHERE `entry`=866 && `patch` > 0; -- DB2 Matches

-- Mobs made able to swim in 1.3.
DELETE FROM `creature_template` WHERE `entry` IN (986, 988, 1775, 1442, 5591, 7643, 7623, 6026, 6930, 989, 8177, 982, 10049, 5353, 11198, 1776, 11874, 3682, 3678, 12384, 11140, 11706, 12958, 2688, 3097, 5748, 2058, 11751, 11718, 5878);
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES 
(982, 0, 'Thultash', 'Food & Drink Vendor', 45, 45, 29, 4, 0, 4563, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.2, 1, 1, 0.95, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 1, 0, 0, 982, 0, 0, 0, 0, 0, 138412102, 0, 2, ''),
(982, 1, 'Thultash', 'Food & Drink Vendor', 45, 45, 29, 4, 0, 4563, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.2, 1, 1, 0.95, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 3, 0, 0, 982, 0, 0, 0, 0, 0, 138936390, 0, 2, ''),
(986, 0, 'Haromm', 'Shaman Trainer', 50, 50, 29, 19, 4652, 4552, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.25, 1, 1, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 1, 0, 0, 986, 10, 0, 0, 0, 0, 138412102, 0, 2, ''),
(986, 1, 'Haromm', 'Shaman Trainer', 50, 50, 29, 19, 4652, 4552, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.25, 1, 1, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 3, 0, 0, 986, 10, 0, 0, 0, 0, 138936390, 0, 2, ''),
(988, 0, 'Kartosh', 'Warlock Trainer', 50, 50, 29, 19, 4642, 4567, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.25, 1, 1, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'EventAI', 0, 1, 0, 0, 988, 14, 0, 0, 0, 0, 138412102, 0, 2, ''),
(988, 1, 'Kartosh', 'Warlock Trainer', 50, 50, 29, 19, 4642, 4567, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.25, 1, 1, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'EventAI', 0, 3, 0, 0, 988, 14, 0, 0, 0, 0, 138936390, 0, 2, ''),
(989, 0, 'Banalash', 'Trade Goods', 50, 50, 29, 4, 0, 4559, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.25, 1, 1, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 1, 0, 0, 989, 0, 0, 0, 0, 0, 138412102, 0, 2, ''),
(989, 1, 'Banalash', 'Trade Goods', 50, 50, 29, 4, 0, 4559, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.25, 1, 1, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 3, 0, 0, 989, 0, 0, 0, 0, 0, 138936390, 0, 2, ''),
(1442, 0, 'Helgrum the Swift', '', 60, 60, 29, 2, 0, 4549, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.35, 1, 2.4, 1.6, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 1, 0, 0, 1442, 0, 0, 0, 0, 0, 138412102, 0, 2, ''),
(1442, 1, 'Helgrum the Swift', '', 60, 60, 29, 2, 0, 4549, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.35, 1, 2.4, 1.6, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 3, 0, 0, 1442, 0, 0, 0, 0, 0, 138936390, 0, 2, ''),
(1775, 0, 'Zun\'dartha', '', 60, 60, 29, 2, 0, 4555, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.35, 1, 2.4, 1.6, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 1, 0, 0, 1775, 0, 0, 0, 0, 0, 138412038, 0, 2, ''),
(1775, 1, 'Zun\'dartha', '', 60, 60, 29, 2, 0, 4555, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.35, 1, 2.4, 1.6, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 3, 0, 0, 1775, 0, 0, 0, 0, 0, 138936326, 0, 2, ''),
(1776, 0, 'Magtoor', '', 42, 42, 35, 2, 0, 11650, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1.11111, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.2, 1, 1, 1.05, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 1, 0, 0, 1776, 0, 0, 0, 0, 0, 102, 0, 2, ''),
(1776, 1, 'Magtoor', '', 42, 42, 35, 2, 0, 11650, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1.11111, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.2, 1, 1, 1.05, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 3, 0, 0, 1776, 0, 0, 0, 0, 0, 524390, 0, 2, ''),
(2058, 0, 'Deathstalker Faerleia', NULL, 18, 18, 68, 2, 0, 1679, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 6, 0, 0, 1, 1, 3, 1, 1, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20580, 0, 0, 0, NULL, 'EventAI', 0, 1, 0, 0, 2058, 0, 0, 0, 0, 0, 272629766, 0, 524288, ''),
(2058, 1, 'Deathstalker Faerleia', NULL, 18, 18, 68, 2, 0, 1679, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 6, 0, 0, 1, 1, 3, 1, 1, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20580, 0, 0, 0, NULL, 'EventAI', 0, 3, 0, 0, 2058, 0, 0, 0, 0, 0, 273154054, 0, 524288, ''),
(2058, 3, 'Deathstalker Faerleia', NULL, 18, 18, 68, 2, 0, 1679, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 3, 1, 1, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20580, 0, 0, 0, NULL, 'EventAI', 0, 3, 0, 0, 2058, 0, 0, 0, 0, 0, 273154054, 0, 524288, ''),
(2688, 0, 'Ruppo Zipcoil', 'Engineering Supplies', 52, 52, 35, 6, 0, 6545, 0, 0, 0, 1.15, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.3, 1, 0.85, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 102, 0, 2, ''),
(2688, 1, 'Ruppo Zipcoil', 'Engineering Supplies', 52, 52, 35, 6, 0, 6545, 0, 0, 0, 1.15, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.3, 1, 0.85, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 524390, 0, 2, ''),
(3097, 0, 'Bernard Brubaker', 'Leather Armor Merchant', 20, 20, 12, 16388, 0, 5013, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1, 1, 1, 0.85, 0.14, 0, 1000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 1, 1, 0, 3097, 0, 0, 0, 0, 0, 138412102, 0, 2, ''),
(3097, 1, 'Bernard Brubaker', 'Leather Armor Merchant', 20, 20, 12, 16388, 0, 5013, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1, 1, 1, 0.85, 0.14, 0, 1000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 3, 1, 0, 3097, 0, 0, 0, 0, 0, 138936390, 0, 2, ''),
(3678, 0, 'Disciple of Naralex', NULL, 20, 20, 35, 1, 201, 1941, 0, 0, 0, 1.62, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 20, 5, 0, 7, 0, 1, 2, 1, 3, 2, 1, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 1, 1, 0, 0, 3678, 0, 0, 529, 0, 0, 38, 4, 524288, 'npc_disciple_of_naralex'),
(3678, 1, 'Disciple of Naralex', NULL, 20, 20, 35, 1, 201, 1941, 0, 0, 0, 1.62, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 20, 5, 0, 7, 0, 1, 2, 1, 3, 2, 1, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 1, 3, 0, 0, 3678, 0, 0, 529, 0, 0, 524326, 4, 524288, 'npc_disciple_of_naralex'),
(3682, 0, 'Vrang Wildgore', 'Weaponsmith & Armorcrafter', 48, 48, 29, 16388, 0, 3878, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.25, 1, 1, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'EventAI', 0, 1, 0, 0, 3682, 0, 0, 0, 0, 0, 138412102, 0, 2, ''),
(3682, 1, 'Vrang Wildgore', 'Weaponsmith & Armorcrafter', 48, 48, 29, 16388, 0, 3878, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.25, 1, 1, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'EventAI', 0, 3, 0, 0, 3682, 0, 0, 0, 0, 0, 138936390, 0, 2, ''),
(5353, 0, 'Itharius', '', 45, 45, 35, 3, 1341, 4494, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.2, 1, 1, 0.95, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 110, 0, 2, ''),
(5353, 1, 'Itharius', '', 45, 45, 35, 3, 1341, 4494, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.2, 1, 1, 0.95, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 524398, 0, 2, ''),
(5591, 0, 'Dar', '', 40, 40, 29, 2, 0, 3508, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.15, 1, 1, 3.8, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 1, 0, 0, 5591, 0, 0, 0, 0, 0, 138412102, 0, 2, ''),
(5591, 1, 'Dar', '', 40, 40, 29, 2, 0, 3508, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.15, 1, 1, 3.8, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 3, 0, 0, 5591, 0, 0, 0, 0, 0, 138936390, 0, 2, ''),
(5748, 0, 'Killian Sanatha', 'Fisherman', 18, 20, 68, 4, 0, 7689, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1, 1, 1, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 1, 0, 0, 5748, 0, 0, 0, 0, 0, 138412102, 0, 2, ''),
(5748, 1, 'Killian Sanatha', 'Fisherman', 18, 20, 68, 4, 0, 7689, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1, 1, 1, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 3, 0, 0, 5748, 0, 0, 0, 0, 0, 138936390, 0, 2, ''),
(5878, 0, 'Thun\'grim Firegaze', NULL, 29, 29, 83, 2, 0, 4521, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.05, 1, 1, 0.95, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 1, 0, 0, 5878, 0, 0, 0, 0, 0, 138412102, 0, 2, ''),
(5878, 1, 'Thun\'grim Firegaze', NULL, 29, 29, 83, 2, 0, 4521, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.05, 1, 1, 0.95, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 3, 0, 0, 5878, 0, 0, 0, 0, 0, 138936390, 0, 2, ''),
(6026, 0, 'Breyk', 'Wind Rider Master', 55, 55, 29, 9, 6944, 4725, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 20, 5, 0, 7, 0, 1, 1, 1, 3, 3, 1.4, 3.25, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'EventAI', 0, 1, 0, 0, 6026, 0, 0, 1, 0, 0, 4194374, 0, 2, ''),
(6026, 1, 'Breyk', 'Wind Rider Master', 55, 55, 29, 9, 6944, 4725, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 20, 5, 0, 7, 0, 1, 1, 1, 3, 3, 1.4, 3.25, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'EventAI', 0, 3, 0, 0, 6026, 0, 0, 1, 0, 0, 4718662, 0, 2, ''),
(6930, 0, 'Innkeeper Karakul', 'Innkeeper', 30, 30, 29, 131, 441, 5707, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.05, 1, 1, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 1, 0, 0, 6930, 0, 0, 0, 0, 0, 138412102, 0, 2, ''),
(6930, 1, 'Innkeeper Karakul', 'Innkeeper', 30, 30, 29, 131, 441, 5707, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.05, 1, 1, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 3, 0, 0, 6930, 0, 0, 0, 0, 0, 138936390, 0, 2, ''),
(7623, 0, 'Dispatch Commander Ruag', '', 60, 60, 29, 2, 0, 6571, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.35, 1, 2.4, 1.6, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 1, 0, 0, 7623, 0, 0, 0, 0, 0, 138412102, 0, 2, ''),
(7623, 1, 'Dispatch Commander Ruag', '', 60, 60, 29, 2, 0, 6571, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.35, 1, 2.4, 1.6, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 3, 0, 0, 7623, 0, 0, 0, 0, 0, 138936390, 0, 2, ''),
(7643, 0, 'Bengor', '', 45, 45, 29, 2, 0, 6570, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.2, 1, 1, 0.95, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 138412102, 0, 2, ''),
(7643, 1, 'Bengor', '', 45, 45, 29, 2, 0, 6570, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.2, 1, 1, 0.95, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 138936390, 0, 2, ''),
(8177, 0, 'Rartar', 'Alchemy Supplies', 45, 45, 29, 4, 0, 7389, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.2, 1, 1, 0.95, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 1, 0, 0, 8177, 0, 0, 0, 0, 0, 138412102, 0, 2, ''),
(8177, 1, 'Rartar', 'Alchemy Supplies', 45, 45, 29, 4, 0, 7389, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.2, 1, 1, 0.95, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 3, 0, 0, 8177, 0, 0, 0, 0, 0, 138936390, 0, 2, ''),
(10049, 0, 'Hekkru', 'Stable Master', 30, 30, 29, 8192, 0, 9268, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.05, 1, 1, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 1, 0, 0, 10049, 0, 0, 0, 0, 0, 138412102, 0, 2, ''),
(10049, 1, 'Hekkru', 'Stable Master', 30, 30, 29, 8192, 0, 9268, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.05, 1, 1, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 3, 0, 0, 10049, 0, 0, 0, 0, 0, 138936390, 0, 2, ''),
(11140, 0, 'Egan', NULL, 59, 59, 35, 2, 0, 10644, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 100, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.35, 1, 1, 1.05, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 1, 0, 0, 11140, 0, 0, 0, 0, 0, 102, 0, 2, ''),
(11140, 1, 'Egan', NULL, 59, 59, 35, 2, 0, 10644, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 100, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.35, 1, 1, 1.05, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 3, 0, 0, 11140, 0, 0, 0, 0, 0, 524390, 0, 2, ''),
(11198, 0, 'Draenei Exile', '', 42, 42, 15, 0, 0, 11650, 11651, 11652, 0, 0, 0, 0, 0, 1, 1, 1, 0, 3, 0, 1.11111, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.2, 1, 1, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 102, 0, 2, ''),
(11198, 1, 'Draenei Exile', '', 42, 42, 15, 0, 0, 11650, 11651, 11652, 0, 0, 0, 0, 0, 1, 1, 1, 0, 3, 0, 1.11111, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.2, 1, 1, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 524390, 0, 2, ''),
(11706, 0, 'Adon', NULL, 60, 60, 35, 2, 0, 11671, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.35, 1, 2.4, 1.6, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 1, 0, 0, 11706, 0, 0, 0, 0, 0, 6, 0, 2, ''),
(11706, 1, 'Adon', NULL, 60, 60, 35, 2, 0, 11671, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.35, 1, 2.4, 1.6, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 3, 0, 0, 11706, 0, 0, 0, 0, 0, 524294, 0, 2, ''),
(11718, 0, 'Sar Browneye', NULL, 53, 53, 104, 2, 0, 11673, 0, 0, 0, 1.25, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 2, 1, 1, 1.05, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 1, 0, 0, 11718, 0, 0, 0, 0, 0, 4194374, 0, 0, ''),
(11718, 1, 'Sar Browneye', NULL, 53, 53, 104, 2, 0, 11673, 0, 0, 0, 1.25, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 2, 1, 1, 1.05, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 3, 0, 0, 11718, 0, 0, 0, 0, 0, 4718662, 0, 0, ''),
(11751, 0, 'Rilan Howard', NULL, 20, 20, 68, 2, 0, 11674, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 100, 0, 1, 1.14286, 18, 5, 0, 6, 0, 0, 1, 1, 1, 1, 1, 0.85, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 1, 1, 0, 11751, 0, 0, 0, 0, 0, 272629830, 0, 2, ''),
(11751, 1, 'Rilan Howard', NULL, 20, 20, 68, 2, 0, 11674, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 100, 0, 1, 1.14286, 18, 5, 0, 6, 0, 0, 1, 1, 1, 1, 1, 0.85, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 3, 1, 0, 11751, 0, 0, 0, 0, 0, 273154118, 0, 2, ''),
(11751, 3, 'Rilan Howard', NULL, 20, 20, 68, 2, 0, 11674, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 100, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1, 1, 1, 0.85, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 3, 1, 0, 11751, 0, 0, 0, 0, 0, 273154118, 0, 2, ''),
(11874, 0, 'Masat T\'andr', 'Superior Leatherworker', 44, 44, 35, 4, 0, 11650, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1.11111, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.2, 1, 1.05, 1.2, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 102, 0, 2, ''),
(11874, 1, 'Masat T\'andr', 'Superior Leatherworker', 44, 44, 35, 4, 0, 11650, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1.11111, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.2, 1, 1.05, 1.2, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 524390, 0, 2, ''),
(12384, 0, 'Augustus the Touched', NULL, 55, 55, 71, 7, 4085, 12470, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 100, 0, 1, 1.14286, 18, 5, 0, 6, 0, 0, 1, 1, 1.3, 1, 1.4, 1.05, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'EventAI', 0, 1, 0, 0, 12384, 0, 0, 0, 0, 0, 272629766, 0, 2, ''),
(12384, 1, 'Augustus the Touched', NULL, 55, 55, 71, 7, 4085, 12470, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 100, 0, 1, 1.14286, 18, 5, 0, 6, 0, 0, 1, 1, 1.3, 1, 1.4, 1.05, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'EventAI', 0, 3, 0, 0, 12384, 0, 0, 0, 0, 0, 273154054, 0, 2, ''),
(12384, 3, 'Augustus the Touched', NULL, 55, 55, 71, 7, 4085, 12470, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 100, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.3, 1, 1.4, 1.05, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'EventAI', 0, 3, 0, 0, 12384, 0, 0, 0, 0, 0, 273154054, 0, 2, ''),
(12384, 9, 'Augustus the Touched', NULL, 55, 55, 35, 7, 4085, 12470, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 100, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.3, 1, 1.4, 1.05, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'EventAI', 0, 3, 0, 0, 12384, 0, 0, 0, 0, 0, 273154054, 0, 2, ''),
(12958, 0, 'Gigget Zipcoil', 'Trade Supplies', 52, 52, 35, 6, 0, 12935, 0, 0, 0, 1.15, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.3, 1, 0.85, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 1, 0, 0, 12958, 0, 0, 0, 0, 0, 102, 0, 2, ''),
(12958, 1, 'Gigget Zipcoil', 'Trade Supplies', 52, 52, 35, 6, 0, 12935, 0, 0, 0, 1.15, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.3, 1, 0.85, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 3, 0, 0, 12958, 0, 0, 0, 0, 0, 524390, 0, 2, '');

-- Deatheye
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=8302; -- No Match

-- Daio the Decrepit
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=14463; -- No Match

-- Galen Goodward
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=5391; -- DB2 Matches (sniff both)

-- Lord Captain Wyrmak
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=14445; -- No Match

-- Mummified Atal'ai
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=5263; -- No Match

-- Witch Doctor Zum'rah
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~32 /*ImmunePC*/ WHERE `entry`=7271; -- DB2 Matches (sniff both)

-- Events list for Witch Doctor Zum'rah
DELETE FROM `creature_ai_events` WHERE `creature_id`=7271;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(727101, 7271, 0, 4, 0, 100, 0, 0, 0, 0, 0, 727101, 0, 0, 'Witch Doctor Zum\'rah - Yell on Aggro'),
(727102, 7271, 0, 5, 0, 100, 1, 10000, 10000, 1, 0, 727102, 0, 0, 'Witch Doctor Zum\'rah - Yell on Killed Player'),
(727103, 7271, 125, 0, 0, 100, 1, 1000, 5000, 18000, 18000, 727103, 0, 0, 'Witch Doctor Zum\'rah - Summon Zombies'),
(727104, 7271, 0, 6, 0, 100, 0, 0, 0, 0, 0, 727104, 0, 0, 'Witch Doctor Zum\'rah - Set Data on Death'),
(727105, 7271, 0, 11, 0, 100, 0, 0, 0, 0, 0, 727105, 0, 0, 'Witch Doctor Zum\'rah - Add Immune to Player Flag on Spawn');
DELETE FROM `creature_ai_scripts` WHERE `id`=727105;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(727105, 0, 0, 4, 46, 256, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Witch Doctor Zum\'rah - Add Immune to Player Flag');

-- Theka the Martyr
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=7272; -- No Match

-- Sul'lithuz Broodling
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=8138; -- No Match

-- Sul'lithuz Warder
-- By Anonymous on 06/30/2005 (Patch 1.5.1)
-- "We too ran into that basilisk that throws you back 40' at then end of the fight every time you try to leave the area. Turns out though that there's a path throgh the hills that allow you to bypass it and get back into the instance."
REPLACE INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (8149, 0, 'Sul\'lithuz Warder', '', 50, 50, 37, 0, 0, 7345, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.11111, 1.14286, 20, 5, 0, 10, 0, 1, 1, 1, 3, 1, 1, 2.8, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'EventAI', 0, 1, 0, 0, 0, 0, 0, 13376, 0, 4, 768, 0, 2048, '');
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `id5`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES (81639, 8149, 0, 0, 0, 0, 209, 1806.34, 809.973, 12.8754, 4.29351, 604800, 604800, 0, 100, 100, 0, 0, 0, 0, 9);

-- 8149: Target Is Within 8 Yards Of X 1804 Y 802 Z 13
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (8149, 54, 1804, 802, 13, 8, 0);

-- Events list for Sul'lithuz Warder
DELETE FROM `creature_ai_events` WHERE `creature_id`=8149;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(814901, 8149, 8149, 10, 0, 100, 1, 1, 15, 3000, 3000, 814901, 0, 0, 'Sul\'lithuz Warder - Cast Antu\'sul Blast on Move in LOS'),
(814902, 8149, 0, 0, 0, 100, 1, 10000, 10000, 10000, 10000, 814901, 0, 0, 'Sul\'lithuz Warder - Cast Antu\'sul Blast in Combat'),
(814903, 8149, 0, 8, 0, 100, 0, 11893, -1, 0, 0, 814903, 0, 0, 'Sul\'lithuz Warder - Despawn on Hit by Spell Warder Despawn');
DELETE FROM `creature_ai_scripts` WHERE `id`=814901;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(814901, 0, 0, 15, 11891, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sul\'lithuz Warder - Cast Spell Antu\'sul Blast');
DELETE FROM `creature_ai_scripts` WHERE `id`=814903;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(814903, 0, 0, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sul\'lithuz Warder - Despawn');

-- Antu'Sul script to cast Warder Despawn on Death.
DELETE FROM `creature_ai_scripts` WHERE `id`=812703;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(812703, 0, 0, 37, 5, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Antu\'sul - Set Data to Done'),
(812703, 0, 0, 15, 11893, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Antu\'sul - Cast Spell Warder Despawn');
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `conditionId`, `inverseEffectMask`, `build_min`, `build_max`) VALUES (11893, 1, 8149, 0, 0, 0, 5875);

-- Warpwood Tangler
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=11464; -- No Match

-- Warpwood Treant
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=11462; -- No Match

-- Phase Lasher
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=13196; -- No Match

-- Warpwood Crusher
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=13021; -- No Match

-- Death Lash
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=13285; -- No Match

-- Wildspawn Felsworn
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=11455; -- No Match

-- Wildspawn Satyr
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=11451; -- No Match

-- Fel Lash
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=13197; -- No Match

-- Wildspawn Rogue
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=11452; -- No Match

-- Wildspawn Trickster
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=11453; -- No Match

-- Wildspawn Hellcaller
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=11457; -- No Match

-- Wildspawn Imp
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=13276; -- No Match

-- Wildspawn Shadowstalker
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=11456; -- No Match

-- Diathorus the Seeker
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=6072; -- No Match

-- Foreman Silixiz
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4 /*No Loot*/ WHERE `entry`=7287; -- DB2 Matches

-- Pilot Wizzlecrank
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=3451; -- DB2 Matches (sniff agree)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=3451; -- DB2 Matches (sniff agree)

-- Sludge Beast
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=3295; -- No Match

-- Evolving Ectoplasm
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=3640; -- No Match

-- Lady Anacondra
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4096 /*CorpseRaid*/ WHERE `entry`=3671; -- No Match

-- Verdan the Everliving
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4096 /*CorpseRaid*/ WHERE `entry`=5775; -- No Match

-- Infiltrator Hameya
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=12248; -- No Match

-- Infected Mossflayer
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=12261; -- No Match

-- Haunting Vision
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=4472; -- No Match

-- Stratholme Trigger
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=14646; -- DB2 Matches (sniff agree)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 512 /*Uninteractible*/ WHERE `entry`=14646; -- DB2 Matches (sniff agree)

-- Bloodhound
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=8921; -- No Match

-- Blazing Fireguard
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=8910; -- No Match

-- Marshal Windsor
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4194304 /*PvP Enabling*/ WHERE `entry`=9023; -- No Match (sniff agree)

-- Hate'rel
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~32 /*ImmunePC*/, `faction`=54 WHERE `entry`=9034; -- DB2 Matches (sniff disagree)

-- Anger'rel
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~32 /*ImmunePC*/, `faction`=54 WHERE `entry`=9035; -- DB2 Matches (sniff disagree)

-- Dope'rel
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~32 /*ImmunePC*/, `faction`=54 WHERE `entry`=9040; -- DB2 Matches (sniff disagree)

-- Doom'rel
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~32 /*ImmunePC*/, `faction`=54 WHERE `entry`=9039; -- DB2 Matches (sniff disagree)

-- Seeth'rel
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~32 /*ImmunePC*/, `faction`=54 WHERE `entry`=9038; -- DB2 Matches (sniff disagree)

-- Gloom'rel
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~32 /*ImmunePC*/, `faction`=54 WHERE `entry`=9037; -- DB2 Matches (sniff disagree)

-- Vile'rel
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~32 /*ImmunePC*/, `faction`=54 WHERE `entry`=9036; -- DB2 Matches (sniff disagree)

-- Rhapsody Shindigger
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 134217728 /*Calls Guards*/ WHERE `entry`=5634; -- DB2 Matches

-- Revantusk Watcher
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~4 /*No Loot*/ WHERE `entry`=14730; -- No Match

-- Revantusk Drummer
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~4 /*No Loot*/ WHERE `entry`=14734; -- No Match

-- Mountaineer Kalmir
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4 /*No Loot*/ WHERE `entry`=1283 && `patch` > 0; -- DB2 Matches (progressive)

-- Obsidion
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~64 /*ImmuneNPC*/ WHERE `entry`=8400; -- DB2 Matches (sniff agree)

-- Scald
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=8281; -- No Match

-- Malfunctioning Reaver
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=8981; -- No Match

-- Nightmare Whelp
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=8319; -- No Match

-- Nightmare Scalebane
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=5277; -- No Match

-- Nightmare Wanderer
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=5283; -- No Match

-- Unliving Atal'ai
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=5267; -- No Match

-- Atal'ai Corpse Eater
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=5270; -- No Match

-- Nightmare Wyrmkin
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=5280; -- No Match

-- Hukku
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=5715; -- No Match

-- Loro
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=5714; -- No Match

-- Atal'ai Deathwalker
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=5271; -- No Match

-- Zul'Lor
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=5716; -- No Match

-- Mijan
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=5717; -- No Match

-- Hazzas
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=5722; -- No Match

-- Morphaz
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=5719; -- No Match

-- Gasher
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=5713; -- No Match

-- Zolo
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=5712; -- No Match

-- Shade of Eranikus
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=5709; -- DB2 Matches (sniff both)

-- Jammal'an the Prophet
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=5710; -- No Match (sniff both)

-- Ogom the Wretched
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=5711; -- No Match (sniff both)

-- Seeker Aqualon
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=14269; -- No Match

-- Keeg Gibn
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=1697; -- DB2 Matches (sniff agree)

-- Marleth Barleybrew
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=1375; -- DB2 Matches (sniff agree)

-- Rejold Barleybrew
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=1374; -- DB2 Matches (sniff agree)

-- Tundra MacGrann
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=1266; -- DB2 Matches (sniff agree)

-- Narm Faulk
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=6177; -- DB2 Matches (sniff agree)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=6177; -- DB2 Matches (sniff agree)

-- Mountaineer Zaren
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4 /*No Loot*/ WHERE `entry`=1281 && `patch` > 0; -- DB2 Matches (progressive)

-- Captain Rugelfuss
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=1092; -- DB2 Matches (sniff agree)

-- Mountaineer Cobbleflint
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=1089; -- DB2 Matches (sniff agree)

-- Mountaineer Wallbang
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=1090; -- DB2 Matches (sniff agree)

-- Mountaineer Gravelgaw
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=1091; -- DB2 Matches (sniff agree)

-- Jekyll Flandring
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~4 /*No Loot*/ WHERE `entry`=13219; -- No Match

-- Dillord Copperpinch
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 134217728 /*Calls Guards*/ WHERE `entry`=14962; -- DB2 Matches

-- Corporal Teeka Bloodsnarl
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~4 /*No Loot*/ WHERE `entry`=13776; -- No Match

-- Crystal Fang
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=10376; -- No Match

-- Accursed Slitherblade
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 268435456 /*Can Swim*/ WHERE `entry`=14229; -- DB2 Matches (sniff neither)

-- Unfettered Spirit
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=4308; -- No Match

-- Artorius the Amiable
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=14531; -- No Match

-- Glacier
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4194304 /*PvP Enabling*/ WHERE `entry`=10619; -- DB2 Matches (sniff disagree)

-- Rivern Frostwind
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4194304 /*PvP Enabling*/ WHERE `entry`=10618; -- DB2 Matches (sniff disagree)

-- Bolyun
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4194304 /*PvP Enabling*/ WHERE `entry`=3698; -- No Match (sniff agree)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 134217728 /*Calls Guards*/ WHERE `entry`=3698; -- No Match

-- Alenndaar Lapidaar
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4194304 /*PvP Enabling*/ WHERE `entry`=8308; -- No Match (sniff agree)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 134217728 /*Calls Guards*/ WHERE `entry`=8308; -- No Match

-- Harlown Darkweave
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4194304 /*PvP Enabling*/ WHERE `entry`=6731; -- No Match (sniff agree)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 134217728 /*Calls Guards*/ WHERE `entry`=6731; -- No Match

-- Ambassador Bloodrage
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=7895; -- No Match

-- Brimgore
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=4339; -- No Match

-- "Stinky" Ignatz
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=4880; -- No Match (sniff agree)

-- Skum
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4096 /*CorpseRaid*/ WHERE `entry`=3674; -- No Match
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=3674; -- No Match

-- Son of Hakkar
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~16 /*Tameable*/ WHERE `entry`=11357 && `patch`=5; -- No Match (progressive) (type_flag 1)

-- Karna Remtravel
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 134217728 /*Calls Guards*/ WHERE `entry`=9618; -- DB2 Matches

-- Larion
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4 /*No Loot*/ WHERE `entry`=9118; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4194304 /*PvP Enabling*/ WHERE `entry`=9118; -- No Match (sniff agree)

-- Gibbert
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4194304 /*PvP Enabling*/ WHERE `entry`=3000; -- No Match (sniff agree)

-- Nergal
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4194304 /*PvP Enabling*/ WHERE `entry`=12959; -- No Match (sniff agree)

-- Linken
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 134217728 /*Calls Guards*/ WHERE `entry`=8737; -- DB2 Matches

-- Muigin
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4194304 /*PvP Enabling*/ WHERE `entry`=9119; -- No Match (sniff agree)

-- Soriid the Devourer
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=8204; -- No Match

-- My'lanna
DELETE FROM `creature_template` WHERE `entry`=12026;
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (12026, 0, 'My\'lanna', 'Food & Drink Merchant', 51, 51, 994, 6, 0, 12050, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.3, 1, 1, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 'EventAI', 0, 1, 0, 0, 12026, 0, 0, 0, 0, 0, 134217798, 0, 2, '');
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (12026, 1, 'My\'lanna', 'Food & Drink Merchant', 51, 51, 994, 6, 0, 12050, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.3, 1, 1, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 'EventAI', 0, 3, 0, 0, 12026, 0, 0, 0, 0, 0, 134742086, 0, 2, '');
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (12026, 7, 'My\'lanna', 'Food & Drink Merchant', 51, 51, 994, 6, 0, 12050, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.3, 1, 1, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'EventAI', 0, 3, 0, 0, 12026, 0, 0, 0, 0, 0, 138936326, 0, 2, '');

-- Kelm Hargunth
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~4 /*No Loot*/ WHERE `entry`=14754; -- No Match

-- Hecht Copperpinch
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 134217728 /*Calls Guards*/ WHERE `entry`=14964; -- DB2 Matches

-- Captain Vanessa Beltis
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4 /*No Loot*/ WHERE `entry`=8380; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` | 2 WHERE `entry`=8380; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~4194304 /*PvP Enabling*/ WHERE `entry`=8380; -- DB2 Matches (sniff agree)

-- Antilos
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=6648; -- No Match

-- Makaba Flathoof
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=11857; -- DB2 Matches (sniff agree)

-- Seereth Stonebreak
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=4049; -- DB2 Matches (sniff agree)

-- Nal'taszar
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=4066; -- No Match

-- Piznik
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=4276; -- No Match (sniff agree)

-- Shay Leafrunner
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` | 2 WHERE `entry`=7774; -- DB2 Matches

-- Gregan Brewspewer
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 134217728 /*Calls Guards*/ WHERE `entry`=7775; -- DB2 Matches

-- Qirot
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=5350; -- No Match

-- Stinglasher
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=14661; -- No Match

-- Zukk'ash Stinger
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=5244; -- No Match

-- Zukk'ash Tunneler
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=5247; -- No Match

-- Zukk'ash Worker
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=5246; -- No Match

-- Zukk'ash Wasp
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=5245; -- No Match

-- Skarr the Unbreakable
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4096 /*CorpseRaid*/ WHERE `entry`=11498; -- No Match

-- Zorbin Fandazzle
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=14637; -- No Match

-- Frayfeather Hippogryph
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=5300; -- No Match

-- Frayfeather Stagwing
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=5304; -- No Match

-- Ralo'shan the Eternal Watcher
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15169; -- No Match


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
