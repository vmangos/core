DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260721030857');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260721030857');
-- Add your query below.


-- Mo'grosh Ogre
UPDATE `creature_template` SET `display_id1` = 740 WHERE `entry`=1178 && `patch`=0;

-- Mo'grosh Enforcer
UPDATE `creature_template` SET `display_id1` = 645 WHERE `entry`=1179 && `patch`=0;

-- Chok'sul
UPDATE `creature_template` SET `display_id1` = 8431 WHERE `entry`=1210 && `patch`=0;

-- Dreadmaul Brute
UPDATE `creature_template` SET `display_id1` = 11535 WHERE `entry`=5976 && `patch`=0;

-- Spirestone Battle Mage
DELETE FROM `creature_template` WHERE `entry`=9197;
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (9197, 0, 'Spirestone Battle Mage', NULL, 57, 58, 40, 0, 0, 11575, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.6, 1.14286, 20, 5, 0, 7, 0, 1, 2, 1, 5, 5, 1, 5, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9197, 9197, 0, 561, 2274, 91970, 0, 0, 0, NULL, 'EventAI', 1, 3, 0, 0, 9197, 0, 0, 0, 0, 0, 524288, 0, 0, '');
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (9197, 1, 'Spirestone Battle Mage', NULL, 57, 58, 40, 0, 0, 11543, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.6, 1.14286, 20, 5, 0, 7, 0, 1, 2, 1, 5, 5, 1, 5, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9197, 9197, 0, 561, 2274, 91970, 0, 0, 0, NULL, 'EventAI', 1, 3, 0, 0, 9197, 0, 0, 0, 0, 0, 524288, 0, 0, '');

-- Spirestone Ogre Magus
DELETE FROM `creature_template` WHERE `entry`=9201;
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (9201, 0, 'Spirestone Ogre Magus', NULL, 54, 55, 40, 0, 0, 11580, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.6, 1.14286, 20, 5, 0, 7, 0, 1, 2, 1, 5, 5, 1, 5, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9201, 9201, 0, 518, 1687, 92010, 0, 0, 0, NULL, '', 1, 3, 0, 0, 9201, 0, 0, 0, 0, 0, 524288, 0, 0, '');
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (9201, 1, 'Spirestone Ogre Magus', NULL, 54, 55, 40, 0, 0, 11562, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.6, 1.14286, 20, 5, 0, 7, 0, 1, 2, 1, 5, 5, 1, 5, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9201, 9201, 0, 518, 1687, 92010, 0, 0, 0, NULL, '', 1, 3, 0, 0, 9201, 0, 0, 0, 0, 0, 524288, 0, 0, '');

-- Brackenwall Enforcer
UPDATE `creature_template` SET `display_id1` = 8432 WHERE `entry`=10036 && `patch`=0;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
