DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210222003351');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210222003351');
-- Add your query below.


-- Omusa Thunderhorn was an unused Gun Trainer before patch 1.6.
-- https://web.archive.org/web/20050227202324/http://wow.allakhazam.com/db/mob.html?wmob=10378
UPDATE `creature` SET `patch_min`=4 WHERE `id`=10378;
DELETE FROM `creature_template` WHERE `entry`=10378;
INSERT INTO `creature_template` (`entry`, `patch`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `name`, `subname`, `gossip_menu_id`, `level_min`, `level_max`, `health_min`, `health_max`, `mana_min`, `mana_max`, `armor`, `faction`, `npc_flags`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `rank`, `xp_multiplier`, `dmg_min`, `dmg_max`, `dmg_school`, `attack_power`, `dmg_multiplier`, `base_attack_time`, `ranged_attack_time`, `unit_class`, `unit_flags`, `dynamic_flags`, `beast_family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `ranged_dmg_min`, `ranged_dmg_max`, `ranged_attack_power`, `type`, `type_flags`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `spell_id1`, `spell_id2`, `spell_id3`, `spell_id4`, `spell_list_id`, `pet_spell_list_id`, `auras`, `gold_min`, `gold_max`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `regeneration`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `flags_extra`, `script_name`) VALUES (10378, 0, 9771, 0, 0, 0, 1.35, 0, 0, 0, 100, 0, 0, 0, 100, 0, 'Omusa Thunderhorn', 'Gun Trainer', 6162, 40, 40, 4572, 4572, 0, 0, 1890, 29, 16, 1, 1.14286, 20, 5, 0, 0, 1, 61, 78, 0, 156, 1, 2000, 2000, 1, 4608, 0, 0, 0, 0, 0, 0, 58.872, 80.949, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, '', 0, 1, 0, 0, 3, 10378, 0, 0, 1, 0, 524298, '');
INSERT INTO `creature_template` (`entry`, `patch`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `name`, `subname`, `gossip_menu_id`, `level_min`, `level_max`, `health_min`, `health_max`, `mana_min`, `mana_max`, `armor`, `faction`, `npc_flags`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `rank`, `xp_multiplier`, `dmg_min`, `dmg_max`, `dmg_school`, `attack_power`, `dmg_multiplier`, `base_attack_time`, `ranged_attack_time`, `unit_class`, `unit_flags`, `dynamic_flags`, `beast_family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `ranged_dmg_min`, `ranged_dmg_max`, `ranged_attack_power`, `type`, `type_flags`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `spell_id1`, `spell_id2`, `spell_id3`, `spell_id4`, `spell_list_id`, `pet_spell_list_id`, `auras`, `gold_min`, `gold_max`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `regeneration`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `flags_extra`, `script_name`) VALUES (10378, 4, 9771, 0, 0, 0, 1.35, 0, 0, 0, 100, 0, 0, 0, 100, 0, 'Omusa Thunderhorn', 'Wind Rider Master', 6162, 55, 55, 7842, 7842, 0, 0, 4500, 104, 9, 1, 1.14286, 20, 5, 0, 1, 1, 310, 400, 0, 248, 1, 2000, 2000, 1, 4608, 0, 0, 0, 0, 0, 0, 58.872, 80.949, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 'EventAI', 0, 1, 0, 0, 3, 10378, 0, 0, 1, 0, 524298, '');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
