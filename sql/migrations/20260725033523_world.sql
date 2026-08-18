DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260725033523');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260725033523');
-- Add your query below.


-- Delgren the Purifier
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 134217728 /*Calls Guards*/ WHERE `entry`=3663; -- DB2 Matches

-- Feero Ironhand
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 134217728 /*Calls Guards*/ WHERE `entry`=4484; -- DB2 Matches

-- Taneel Darkwood
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=3940; -- No Match

-- Uthil Mooncall
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=3941; -- No Match

-- Booty Bay Bruiser
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 2 /*No XP*/ WHERE `entry`=4624 && `patch` = 0;
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4 /*No Loot*/ WHERE `entry`=4624 && `patch` > 0; -- DB2 Matches

-- Auctioneer O'reely
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15681; -- No Match

-- Auctioneer Graves
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15677; -- No Match

-- Milli Featherwhistle
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=7955; -- DB2 Matches (sniff agree)

-- Shade of Jin'do
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 65536 /*Raid Boss Mob*/ WHERE `entry`=14986 && `rank`=3; -- No Match (type_flag 4) (progressive)

-- Poisonous Cloud
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=14989; -- DB2 Matches (sniff agree)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 512 /*Uninteractible*/ WHERE `entry`=14989; -- DB2 Matches (sniff agree)

-- Tiny Snowman (minipet)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=15710; -- DB2 Matches (sniff agree)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=15710; -- DB2 Matches (sniff agree)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~256 /*Sessile*/ WHERE `entry`=15710 && `patch` < 10; -- No Match

-- Silithis Teleporter
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 512 /*Uninteractible*/ WHERE `entry`=16092; -- DB2 Matches (sniff neither)

-- Kaldorei Elite
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~4 /*No Loot*/ WHERE `entry`=15473; -- No Match
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~64 /*ImmuneNPC*/ WHERE `entry`=15473; -- DB2 Matches (sniff both)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15473; -- No Match

-- Lieutenant General Andorov
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~4 /*No Loot*/ WHERE `entry`=15471; -- No Match
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~64 /*ImmuneNPC*/ WHERE `entry`=15471; -- DB2 Matches (sniff both)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15471; -- No Match

-- Connor Rivers
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=5081; -- DB2 Matches (sniff agree)

-- Marli Wishrunner
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 134217728 /*Calls Guards*/ WHERE `entry`=7773; -- DB2 Matches

-- Anachronos Quest Trigger Invisible
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~32 /*ImmunePC*/ WHERE `entry`=15454 && `patch` < 8; -- No Match (progressive) (sniff disagree)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~64 /*ImmuneNPC*/ WHERE `entry`=15454 && `patch` < 8; -- No Match (progressive) (sniff disagree)
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (15454, 8, 'Anachronos Quest Trigger Invisible', NULL, 1, 1, 35, 0, 0, 13069, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1.14286, 18, 5, 0, 10, 0, 0, 1, 1, 1, 1, 1, 1.3, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 614, 0, 130, '');

-- Warsong Shredder
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4194304 /*PvP Enabling*/ WHERE `entry`=11684; -- No Match (sniff agree)

-- Watcher Cutford
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4 /*No Loot*/ WHERE `entry`=1436 && `patch` > 0; -- DB2 Matches (progressive)

-- Watcher Blomberg
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4 /*No Loot*/ WHERE `entry`=1000 && `patch` > 0; -- DB2 Matches

-- Watcher Hutchins
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4 /*No Loot*/ WHERE `entry`=1001 && `patch` > 0; -- DB2 Matches

-- Zergling (minipet)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=11327; -- DB2 Matches (sniff agree)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=11327; -- DB2 Matches (sniff agree)

-- Qiraji Scorpion
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 2 /*No XP*/ WHERE `entry`=15317 && `patch` < 8; -- No Match (progressive)

-- Laziphus
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~4194304 /*PvP Enabling*/ WHERE `entry`=9985 && `patch` < 8; -- No Match (progressive) (sniff disagree)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~134217728 /*Calls Guards*/ WHERE `entry`=9985 && `patch` < 8; -- No Match (progressive)
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (9985, 8, 'Laziphus', 'Stable Master', 30, 30, 474, 8192, 0, 9259, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.05, 1, 1, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 3, 0, 0, 9985, 0, 0, 0, 0, 0, 138936326, 0, 2, '');

-- Spirit Of Redemption
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=12904; -- DB2 Matches (sniff neither)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=12904; -- DB2 Matches (sniff neither)

-- Herbalist Pomeroy
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=1218; -- DB2 Matches (sniff agree)

-- Core Rat
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 512 /*Uninteractible*/ WHERE `entry`=13338; -- DB2 Matches (sniff agree)

-- Hive'Zara Hatchling
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 2 /*No XP*/ WHERE `entry`=15521 && `patch` < 8; -- No Match
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15521; -- No Match
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (15521, 8, 'Hive\'Zara Hatchling', '', 59, 60, 310, 0, 0, 11095, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1.71429, 20, 5, 0, 10, 0, 1, 1, 1, 5, 1, 1.1, 6, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '9205', '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 2155876356, 0, 0, '');

-- Love Fool
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 8192 /*Creator Loot*/ WHERE `entry`=16111; -- No Match

-- Father Winter's Helper (minipet)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=15698; -- DB2 Matches (sniff agree)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=15698; -- DB2 Matches (sniff agree)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15698; -- No Match

-- Slim's Friend
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=4971; -- DB2 Matches (sniff agree)

-- Frankal Invisible Trigger
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~536870912 /*Floating <Don't Use>*/ WHERE `entry`=15221; -- DB2 Matches

-- Rutgar Invisible Trigger
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~536870912 /*Floating <Don't Use>*/ WHERE `entry`=15222; -- DB2 Matches

-- Hive'Zora Abomination
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4 /*No Loot*/ WHERE `entry`=15449; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=15449; -- DB2 Matches (sniff both)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=15449; -- DB2 Matches (sniff both)

-- Captain Blackanvil
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15440; -- No Match

-- Qiraji Scarab
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 2 /*No XP*/ WHERE `entry`=15316 && `patch` < 8; -- No Match (progressive)

-- Lil' Smoky (minipet)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=9657; -- DB2 Matches (sniff agree)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=9657; -- DB2 Matches (sniff agree)

-- Anaya
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 512 /*Uninteractible*/ WHERE `entry`=3843; -- DB2 Matches (sniff agree)

-- Meridith the Mermaiden
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=15526; -- DB2 Matches (sniff neither)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=15526; -- DB2 Matches (sniff neither)

-- Infernal Sentry
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=7136; -- No Match

-- Jack Sterling
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 134217728 /*Calls Guards*/ WHERE `entry`=11546; -- DB2 Matches

-- Innkeeper Vizzie
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~4194304 /*PvP Enabling*/ WHERE `entry`=11118 && `patch` < 8; -- No Match (sniff disagree)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~134217728 /*Calls Guards*/ WHERE `entry`=11118 && `patch` < 8; -- No Match
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (11118, 8, 'Innkeeper Vizzie', 'Innkeeper', 30, 30, 855, 135, 349, 10654, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.05, 1, 1, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 3, 0, 0, 11118, 0, 0, 0, 0, 0, 138936326, 0, 2, '');

-- Everlook Bruiser
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4 /*No Loot*/ WHERE `entry`=11190 && `patch` > 0; -- DB2 Matches

-- Legacki
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~4194304 /*PvP Enabling*/ WHERE `entry`=10978 && `patch` < 8; -- No Match (sniff disagree)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~134217728 /*Calls Guards*/ WHERE `entry`=10978 && `patch` < 8; -- No Match
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (10978, 8, 'Legacki', '', 57, 57, 855, 2, 0, 10651, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.35, 1, 1, 1.05, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 3, 0, 0, 10978, 0, 0, 0, 0, 0, 138936326, 0, 2, '');

-- Kilram
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~4194304 /*PvP Enabling*/ WHERE `entry`=11192 && `patch` < 8; -- No Match (sniff disagree)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~134217728 /*Calls Guards*/ WHERE `entry`=11192 && `patch` < 8; -- No Match
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (11192, 8, 'Kilram', '', 58, 58, 855, 3, 6089, 10726, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.35, 1, 1, 1.05, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 3, 0, 0, 11192, 0, 0, 0, 0, 0, 138936326, 0, 2, '');

-- Lilith the Lithe
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~4194304 /*PvP Enabling*/ WHERE `entry`=11191 && `patch` < 8; -- No Match (sniff disagree)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~134217728 /*Calls Guards*/ WHERE `entry`=11191 && `patch` < 8; -- No Match
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (11191, 8, 'Lilith the Lithe', '', 55, 55, 855, 3, 6090, 10725, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.3, 1, 1.4, 1.05, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 3, 0, 0, 11191, 0, 0, 0, 0, 0, 407371782, 0, 2, '');

-- Seril Scourgebane
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~4194304 /*PvP Enabling*/ WHERE `entry`=11193 && `patch` < 8; -- No Match (sniff disagree)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~134217728 /*Calls Guards*/ WHERE `entry`=11193 && `patch` < 8; -- No Match
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (11193, 8, 'Seril Scourgebane', '', 57, 57, 855, 3, 6091, 10724, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.35, 1, 1, 1.05, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 3, 0, 0, 11193, 0, 0, 0, 0, 0, 138936326, 0, 2, '');

-- Doctor Weavil
-- UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=15552; -- DB2 Matches (sniff disagree)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=15552; -- DB2 Matches (sniff agree)

-- Massive Geyser
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~8 /*Unkillable*/ WHERE `entry`=14122 && `patch` < 8; -- No Match
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (14122, 8, 'Massive Geyser', NULL, 60, 60, 16, 0, 0, 13069, 0, 0, 0, 0.85, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1.14286, 18, 5, 0, 10, 0, 0, 1, 1, 1, 1, 0.7, 2.2, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'EventAI', 1, 3, 0, 0, 0, 0, 0, 0, 41, 0, 1048846, 0, 128, '');

-- Stalvan Mistmantle
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=315; -- No Match

-- Sten Stoutarm
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=658; -- DB2 Matches (sniff agree)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=658; -- DB2 Matches (sniff agree)

-- Balir Frosthammer
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=713; -- DB2 Matches (sniff agree)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=713; -- DB2 Matches (sniff agree)

-- Adlin Pridedrift
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=829; -- DB2 Matches (sniff agree)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=829; -- DB2 Matches (sniff agree)

-- Yori Crackhelm
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=11941; -- DB2 Matches (sniff agree)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=11941; -- DB2 Matches (sniff agree)

-- Grundel Harkin
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=1104; -- DB2 Matches (sniff agree)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=1104; -- DB2 Matches (sniff agree)

-- Bromos Grummner
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=926; -- DB2 Matches (sniff agree)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=926; -- DB2 Matches (sniff agree)

-- Rybrad Coldbank
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=945; -- DB2 Matches (sniff agree)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=945; -- DB2 Matches (sniff agree)

-- Thran Khorman
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=912; -- DB2 Matches (sniff agree)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=912; -- DB2 Matches (sniff agree)

-- Thorgas Grimson
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=895; -- DB2 Matches (sniff agree)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=895; -- DB2 Matches (sniff agree)

-- Felix Whindlebolt
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=8416; -- DB2 Matches (sniff agree)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=8416; -- DB2 Matches (sniff agree)

-- Solm Hargrin
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=916; -- DB2 Matches (sniff agree)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=916; -- DB2 Matches (sniff agree)

-- Mountaineer Thalos
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=1965; -- DB2 Matches (sniff agree)

-- Hands Springsprocket
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=6782; -- DB2 Matches (sniff agree)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=6782; -- DB2 Matches (sniff agree)

-- Hegnar Rumbleshot
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=1243; -- DB2 Matches (sniff agree)

-- Rifleman Wheeler
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=10803; -- DB2 Matches (sniff agree)

-- Shorty
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=10611; -- DB2 Matches (sniff agree)

-- Rifleman Middlecamp
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=10804; -- DB2 Matches (sniff agree)

-- Angus
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=10610; -- DB2 Matches (sniff agree)

-- Spotter Klemmy
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=10805; -- DB2 Matches (sniff agree)

-- Father Gavin
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=1253; -- DB2 Matches (sniff agree)

-- Gnomeregan Commendation Officer
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15733; -- No Match

-- Darnassus Commendation Officer
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15731; -- No Match

-- Renato Gallina
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=1432 && `patch` < 7; -- No Match (progressive) (sniff disagree)
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (1432, 7, 'Renato Gallina', '', 45, 45, 12, 3, 6951, 5074, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.2, 1, 1, 0.95, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 'EventAI', 0, 3, 0, 0, 1432, 0, 0, 0, 0, 0, 138936326, 0, 2, '');

-- Master Sergeant Maclure
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15708; -- No Match

-- War Effort Volunteer
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15663; -- No Match

-- Sarah Sadwhistle
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15456; -- No Match

-- Slicky Gastronome
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15455; -- No Match

-- Sergeant Major Germaine
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15445; -- No Match

-- Private Draxlegauge
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15434; -- No Match

-- General Zog
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15539; -- No Match
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 134217728 /*Calls Guards*/ WHERE `entry`=15539; -- DB2 Matches

-- Stormwind Commendation Officer
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15735; -- No Match

-- Field Marshal Snowfall
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15701; -- No Match

-- Corporal Carnes
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15431; -- No Match

-- Dame Twinbraid
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15432; -- No Match

-- Sergeant Stonebrow
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15383; -- No Match

-- Keeper Moonshade
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15453; -- No Match

-- Sentinel Silversky
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15451; -- No Match

-- Nurse Stonefield
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15452; -- No Match

-- Private Porter
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15448; -- No Match

-- Bonnie Stoneflayer
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15446; -- No Match

-- Marta Finespindle
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15450; -- No Match

-- Ironforge Commendation Officer
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15734; -- No Match

-- Tortured Druid
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=12178; -- No Match

-- Tortured Sentinel
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=12179; -- No Match

-- Master Sergeant Fizzlebolt
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15707; -- No Match

-- Terrorspark
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=10078; -- No Match

-- Huntress Swiftriver
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15457; -- No Match

-- Master Nightsong
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15437; -- No Match

-- High Marshal Whirlaxis
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 2 /*No XP*/ WHERE `entry`=15204 && `patch` < 7; -- No Match (progressive)
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (15204, 7, 'High Marshal Whirlaxis', 'Abyssal High Council', 63, 63, 14, 0, 0, 7691, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2.28571, 20, 5, 0, 1, 0, 3, 1, 1, 293.9, 10, 1, 12.3, 0.14, 0, 1108, 2000, 0, 15, 15, 15, 15, 15, 0, 0, 0, 0, 15204, 0, 0, 4328, 218688, 152040, 0, 25035, 0, NULL, 'EventAI', 0, 3, 0, 0, 0, 0, 0, 650854235, 0, 8, 2156466208, 4, 32768, '');

-- Gilthares Firebough
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 134217728 /*Calls Guards*/ WHERE `entry`=3465; -- DB2 Matches

-- Mountaineer Barleybrew
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=1959; -- DB2 Matches (sniff agree)

-- Magmar Fellhew
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=1345; -- DB2 Matches (sniff agree)

-- Aldren Cordon
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=1214; -- DB2 Matches (sniff agree)

-- Kelt Thomasin
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=1155; -- DB2 Matches (sniff agree)

-- Daryl the Youngling
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=1187; -- DB2 Matches (sniff agree)

-- Kat Sampson
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=954; -- DB2 Matches (sniff agree)

-- Xandar Goodbeard
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=1685; -- DB2 Matches (sniff agree)

-- Irene Sureshot
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=1686; -- DB2 Matches (sniff agree)

-- Cliff Hadin
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=1687; -- DB2 Matches (sniff agree)

-- Marek Ironheart
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=1154; -- DB2 Matches (sniff agree)

-- Claude Erksine
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=3545; -- DB2 Matches (sniff agree)

-- Dargh Trueaim
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=10930; -- DB2 Matches (sniff agree)

-- Prospector Ironband
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=1344; -- DB2 Matches (sniff agree)

-- Shen'dralar Wisp
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~32 /*ImmunePC*/ WHERE `entry`=14361; -- DB2 Matches (sniff agree)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~512 /*Uninteractible*/ WHERE `entry`=14361; -- DB2 Matches (sniff agree)

-- Arcane Torrent
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=14399; -- No Match

-- Misha
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~64 /*ImmuneNPC*/ WHERE `entry`=10204; -- DB2 Matches (sniff agree)

-- Rexxar
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~64 /*ImmuneNPC*/ WHERE `entry`=10182; -- DB2 Matches (sniff agree)

-- Lunar Festival Emissary
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15892; -- No Match

-- Lunar Festival Vendor
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15898; -- No Match

-- Elder Bronzebeard
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15871; -- No Match

-- Lunar Festival Harbinger
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15895; -- No Match

-- Stormwind Reveler
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15694; -- No Match

-- Orgrimmar Reveler
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15908; -- No Match

-- Ironforge Reveler
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15906; -- No Match

-- Undercity Reveler
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15907; -- No Match

-- Thunder Bluff Reveler
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15719; -- No Match

-- Lunar Festival Sentinel
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15961; -- No Match

-- Darnassus Reveler
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15905; -- No Match

-- Fariel Starsong
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15909; -- No Match

-- Valadar Starsong
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15864; -- No Match

-- Elder Goldwell
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15569; -- No Match

-- Elder Ironband
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15567; -- No Match

-- Elder Stormbrow
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15565; -- No Match

-- Kalaran the Deceiver
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=8480; -- DB2 Matches (sniff agree)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=8480; -- DB2 Matches (sniff agree)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 512 /*Uninteractible*/ WHERE `entry`=8480; -- DB2 Matches (sniff agree)

-- Elder Runetotem
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15572; -- No Match

-- Soran
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 134217728 /*Calls Guards*/ WHERE `entry`=3320;

-- Karus
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 134217728 /*Calls Guards*/ WHERE `entry`=3309;

-- Koma
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 134217728 /*Calls Guards*/ WHERE `entry`=3318;

-- Lunar Festival Herald
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15891; -- No Match

-- Auctioneer Wabang
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 134217728 /*Calls Guards*/ WHERE `entry`=8724;

-- Warsong Emissary
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~32 /*ImmunePC*/ WHERE `entry`=15105; -- DB2 Matches (sniff agree)

-- Auctioneer Grimful
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 134217728 /*Calls Guards*/ WHERE `entry`=9856;

-- Auctioneer Thathung
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 134217728 /*Calls Guards*/ WHERE `entry`=8673;

-- Sprok
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=8320; -- DB2 Matches (sniff agree)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=8320; -- DB2 Matches (sniff agree)

-- Tink Sprocketwhistle
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4194304 /*PvP Enabling*/ WHERE `entry`=9676 && `patch` < 8; -- No Match (sniff disagree)
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (9676, 8, 'Tink Sprocketwhistle', 'Engineering Supplies', 24, 24, 875, 5, 2464, 9027, 0, 0, 0, 1.15, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.02, 1, 1, 0.9, 0.14, 0, 2000, 1947, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'EventAI', 1, 3, 0, 0, 9676, 0, 0, 0, 0, 0, 134742086, 0, 2, '');

-- Venture Co. Drone
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4 /*No Loot*/ WHERE `entry`=7067; -- DB2 Matches

-- Defias Tower Sentry
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4 /*No Loot*/ WHERE `entry`=7056; -- DB2 Matches

-- Defias Drone
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4 /*No Loot*/ WHERE `entry`=7050; -- DB2 Matches

-- Malformed Defias Drone
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4 /*No Loot*/ WHERE `entry`=7051; -- DB2 Matches

-- Defias Tower Patroller
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4 /*No Loot*/ WHERE `entry`=7052; -- DB2 Matches

-- Elder Winterhoof
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15576; -- No Match

-- Booty Bay Reveler
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15723; -- No Match

-- Drunken Bruiser
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=15724; -- DB2 Matches (sniff agree)

-- Elder Starweave
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15601; -- No Match

-- Elder Riversong
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15605; -- No Match

-- Severed Druid
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=3799; -- No Match

-- Severed Sleeper
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=3801; -- No Match

-- Severed Keeper
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=3803; -- No Match

-- Severed Dreamer
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=3802; -- No Match

-- Bleakheart Hellcaller
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=3771; -- No Match

-- Bleakheart Satyr
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=3765; -- No Match

-- Elder Moonstrike
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15594; -- No Match

-- Unliving Mossflayer
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=11291; -- No Match

-- Elder Snowcrown
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15566; -- No Match

-- Elder Dreamseer
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15586; -- No Match

-- Spirit Shade
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~64 /*ImmuneNPC*/ WHERE `entry`=15261; -- DB2 Matches (sniff agree)

-- Sul'lithuz Sandcrawler
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=8095; -- No Match

-- Scarab
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=7269; -- No Match

-- Sandfury Soul Eater
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~1024 /*No Automatic Regen*/ WHERE `entry`=7247; -- DB2 Matches

-- Elder Wildmane
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15578; -- No Match

-- Sul'lithuz Abomination
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=8120; -- No Match

-- Sergeant Bly
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~1024 /*No Automatic Regen*/ WHERE `entry`=7604; -- DB2 Matches

-- Oro Eyegouge
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~1024 /*No Automatic Regen*/ WHERE `entry`=7606; -- DB2 Matches

-- Weegli Blastfuse
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~1024 /*No Automatic Regen*/ WHERE `entry`=7607; -- DB2 Matches

-- Raven
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~1024 /*No Automatic Regen*/ WHERE `entry`=7605; -- DB2 Matches

-- Murta Grimgut
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~1024 /*No Automatic Regen*/ WHERE `entry`=7608; -- DB2 Matches

-- Sandfury Drudge
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4 /*No Loot*/ WHERE `entry`=7788; -- DB2 Matches

-- Sandfury Slave
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4 /*No Loot*/ WHERE `entry`=7787; -- DB2 Matches

-- Nekrum Gutchewer
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=7796; -- No Match

-- Sandfury Zealot
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4 /*No Loot*/ WHERE `entry`=8877; -- DB2 Matches

-- Fallen Hero
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=10996; -- No Match

-- Torwa Pathfinder
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 134217728 /*Calls Guards*/ WHERE `entry`=9619; -- DB2 Matches

-- Mor'vek
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=11701; -- DB2 Matches (sniff agree)

-- Tree Frog (minipet)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=7549; -- DB2 Matches (sniff agree)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=7549; -- DB2 Matches (sniff agree)

-- Master Sergeant Moonshadow
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15709; -- No Match

-- Elder Bladeswift
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15598; -- No Match

-- Elder Starglade
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15596; -- No Match

-- Darrowshire Spirit
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=11064; -- DB2 Matches (sniff agree)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=11064; -- DB2 Matches (sniff agree)

-- Ironbark Protector
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=11459; -- No Match

-- Dire Maul Crystal Totem
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=13916; -- DB2 Matches (sniff agree)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 512 /*Uninteractible*/ WHERE `entry`=13916; -- DB2 Matches (sniff agree)

-- Shen'dralar Ancient
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=14358; -- DB2 Matches (sniff agree)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=14358; -- DB2 Matches (sniff agree)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=14358; -- No Match

-- Ancient Equine Spirit
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=14566; -- DB2 Matches (sniff agree)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=14566; -- DB2 Matches (sniff agree)

-- Eldreth Spectre
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=11473; -- No Match

-- Illyanna Ravenoak
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4096 /*CorpseRaid*/ WHERE `entry`=11488; -- No Match
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=11488; -- No Match

-- Ferra
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=14308; -- No Match

-- Magister Kalendris
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4096 /*CorpseRaid*/ WHERE `entry`=11487; -- No Match
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=11487; -- No Match

-- Residual Monstrosity
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=11484; -- No Match

-- Mana Burst
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=14397; -- No Match

-- Lord Hel'nurath
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=14506; -- DB2 Matches (sniff agree)

-- Carrion Swarmer
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=13160; -- No Match

-- King Gordok
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4096 /*CorpseRaid*/ WHERE `entry`=11501; -- No Match

-- Cho'Rush the Observer
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4096 /*CorpseRaid*/ WHERE `entry`=14324; -- No Match

-- Gordok Spirit
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~64 /*ImmuneNPC*/ WHERE `entry`=11446; -- DB2 Matches (sniff both)

-- Elder Bladesing
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15599; -- No Match

-- Kosco Copperpinch
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 134217728 /*Calls Guards*/ WHERE `entry`=15125; -- DB2 Matches

-- Elder Silvervein
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15558; -- No Match

-- Mountaineer Bludd
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4 /*No Loot*/ WHERE `entry`=2511 && `patch` > 0; -- DB2 Matches (progressive)

-- Mountaineer Modax
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4 /*No Loot*/ WHERE `entry`=2514 && `patch` > 0; -- DB2 Matches (progressive)

-- Thorkaf Dragoneye
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` | 2 WHERE `entry`=7867; -- DB2 Matches

-- Emberstrife
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4 /*No Loot*/ WHERE `entry`=10321; -- DB2 Matches


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
