DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250413165250');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250413165250');
-- Add your query below.


-- Wandering Forest Walker should be elite before patch 1.8.
-- https://web.archive.org/web/20050131185740/http://wow.allakhazam.com/db/mob.html?wmob=7584
-- https://www.wowhead.com/classic/npc=7584/wandering-forest-walker#comments:id=2906691
-- https://www.wowhead.com/classic/npc=7584/wandering-forest-walker#comments:id=2906690
-- https://www.wowhead.com/classic/npc=7584/wandering-forest-walker#comments:id=2906692
DELETE FROM `creature_template` WHERE `entry`=7584;
REPLACE INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_id1`, `spell_id2`, `spell_id3`, `spell_id4`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (7584, 0, 'Wandering Forest Walker', NULL, 44, 46, 7, 0, 0, 9592, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1.14286, 20, 5, 0, 4, 0, 1, 2, 1, 1.7, 1, 1, 2.5, 0.14, 0, 2000, 2000, 0, 0, 200, 0, 0, 0, 0, 0, 0, 0, 7584, 0, 0, 88, 434, 16561, 0, 0, 0, 0, 0, 0, NULL, 'EventAI', 1, 3, 0, 0, 0, 0, 0, 16384, 0, 0, 524288, 0, 0, '');
REPLACE INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_id1`, `spell_id2`, `spell_id3`, `spell_id4`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (7584, 6, 'Wandering Forest Walker', NULL, 44, 46, 7, 0, 0, 9592, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1.14286, 18, 5, 0, 4, 0, 0, 2, 1, 1.7, 1, 1, 1, 0.14, 0, 2000, 2000, 0, 0, 200, 0, 0, 0, 0, 0, 0, 0, 7584, 0, 0, 88, 434, 16561, 0, 0, 0, 0, 0, 0, NULL, 'EventAI', 1, 3, 0, 0, 0, 0, 0, 16384, 0, 0, 524288, 0, 0, '');


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
