DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200617221051');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200617221051');
-- Add your query below.


-- Shaethis Darkoak <Hippogryph Master>
-- .go xyzo -6422.4 -319.6 -0.9 4.9 1
UPDATE `creature` SET `position_x`=-6422.4, `position_y`=-319.6, `position_z`=-0.9, `orientation`=4.9 WHERE `id`=1233; 
UPDATE `creature_template` SET `faction`=80, `ai_name`='ReactorAI' WHERE `entry`=1233;

-- Sulhasa <Wind Rider Master>
-- .go xyzo -6353.5 -249.8 -1.9 4.3 1
INSERT INTO `creature` VALUES (18, 14242, 0, 0, 0, 1, 0, 0, -6353.5, -249.8, -1.9, 4.3, 420, 420, 0, 100, 100, 0, 0, 0, 0, 5);
INSERT INTO `creature_template` (`entry`, `patch`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `name`, `subname`, `gossip_menu_id`, `level_min`, `level_max`, `health_min`, `health_max`, `mana_min`, `mana_max`, `armor`, `faction`, `npc_flags`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `rank`, `xp_multiplier`, `dmg_min`, `dmg_max`, `dmg_school`, `attack_power`, `dmg_multiplier`, `base_attack_time`, `ranged_attack_time`, `unit_class`, `unit_flags`, `dynamic_flags`, `beast_family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `ranged_dmg_min`, `ranged_dmg_max`, `ranged_attack_power`, `type`, `type_flags`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `spell_id1`, `spell_id2`, `spell_id3`, `spell_id4`, `spell_list_id`, `pet_spell_list_id`, `gold_min`, `gold_max`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `regeneration`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `flags_extra`, `script_name`) VALUES (14242, 0, 14306, 0, 0, 0, 1.25, 0, 0, 0, 1, 0, 0, 0, 1, 'Sulhasa', 'Wind Rider Master', 0, 55, 55, 7842, 7842, 0, 0, 0, 29, 11, 1, 1.14286, 20, 5, 0, 1, 1, 298, 427, 0, 100, 1, 1216, 1338, 1, 0, 0, 0, 0, 0, 0, 0, 58.872, 80.949, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 774, 'ReactorAI', 0, 3, 1, 0, 3, 1233, 0, 0, 0, 0, 0, '');
INSERT INTO `creature_template` (`entry`, `patch`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `name`, `subname`, `gossip_menu_id`, `level_min`, `level_max`, `health_min`, `health_max`, `mana_min`, `mana_max`, `armor`, `faction`, `npc_flags`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `rank`, `xp_multiplier`, `dmg_min`, `dmg_max`, `dmg_school`, `attack_power`, `dmg_multiplier`, `base_attack_time`, `ranged_attack_time`, `unit_class`, `unit_flags`, `dynamic_flags`, `beast_family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `ranged_dmg_min`, `ranged_dmg_max`, `ranged_attack_power`, `type`, `type_flags`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `spell_id1`, `spell_id2`, `spell_id3`, `spell_id4`, `spell_list_id`, `pet_spell_list_id`, `gold_min`, `gold_max`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `regeneration`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `flags_extra`, `script_name`) VALUES (14242, 6, 14306, 0, 0, 0, 1.25, 0, 0, 0, 1, 0, 0, 0, 1, '[UNUSED] Sulhasa', 'Wind Rider Master', 0, 55, 55, 7842, 7842, 0, 0, 0, 29, 11, 1, 1.14286, 20, 5, 0, 1, 1, 298, 427, 0, 100, 1, 1216, 1338, 1, 0, 0, 0, 0, 0, 0, 0, 58.872, 80.949, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 774, 'ReactorAI', 0, 3, 1, 0, 3, 1233, 0, 0, 0, 0, 0, '');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
