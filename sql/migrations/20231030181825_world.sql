DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20231030181825');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20231030181825');
-- Add your query below.


-- Highlord Bolvar Fordragon is a racial leader.
UPDATE `creature_template` SET `racial_leader`=1 WHERE `entry`=1748;

-- Archbishop Benedictus is NOT a racial leader.
UPDATE `creature_template` SET `racial_leader`=0 WHERE `entry`=1284;
-- Varimathras is NOT a racial leader.
UPDATE `creature_template` SET `racial_leader`=0 WHERE `entry`=2425;
-- High Tinker Mekkatorque is NOT a racial leader.
UPDATE `creature_template` SET `racial_leader`=0 WHERE `entry`=7937;
-- Vol'jin is NOT a racial leader.
UPDATE `creature_template` SET `racial_leader`=0 WHERE `entry`=10540;

/*
World of Warcraft Client Patch 1.7.0 (2005-09-13)
- Racial "Leaders" have been strengthened, and are now worth slightly
  less honor.
*/
DELETE FROM `creature_template` WHERE `entry` IN (1748, 2784, 3057, 3516, 4949, 10181);
INSERT INTO `creature_template` (`entry`, `patch`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `name`, `subname`, `gossip_menu_id`, `level_min`, `level_max`, `faction`, `npc_flags`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `rank`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `unit_class`, `unit_flags`, `pet_family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_id1`, `spell_id2`, `spell_id3`, `spell_id4`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `regeneration`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `flags_extra`, `script_name`) VALUES 
-- Pre 1.7 (guesswork)
-- Assuming 50% buff
-- health_multiplier 200->300
-- damage_multiplier 10->15
(1748, 0, 5566, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 'Highlord Bolvar Fordragon', NULL, 0, 63, 63, 12, 2, 1, 1.14286, 20, 5, 0, 3, 1, 200, 20, 1, 10, 0.14, 0, 2000, 2000, 0, 15, 15, 15, 15, 15, 2, 4096, 0, 0, 0, 0, 0, 7, 12, 0, 0, 0, 1, 866, 20683, 18819, 0, 0, 17480, 0, 0, '8990 18943', 'EventAI', 0, 3, 0, 1, 3, 1748, 0, 0, 1691041627, 0, 557064, ''),
(2784, 0, 3597, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 'King Magni Bronzebeard', 'Lord of Ironforge', 0, 63, 63, 55, 2, 1, 1.14286, 20, 5, 0, 3, 1, 200, 20, 1, 10, 0.14, 0, 2000, 2000, 0, 15, 15, 15, 15, 15, 1, 4160, 0, 0, 0, 0, 0, 7, 12, 0, 0, 0, 1, 866, 19135, 20685, 20686, 0, 27840, 0, 0, NULL, 'EventAI', 0, 3, 0, 1, 3, 2784, 0, 0, 1691041627, 0, 557064, ''),
(3057, 0, 4307, 0, 0, 0, 1.62, 0, 0, 0, 1, 0, 0, 0, 1, 0, 'Cairne Bloodhoof', 'High Chieftain', 5851, 63, 63, 104, 3, 1, 1.14286, 20, 5, 50, 3, 1, 200, 16, 1, 10, 0.14, 0, 2000, 2000, 0, 15, 15, 15, 15, 15, 1, 4160, 0, 0, 0, 0, 0, 7, 4, 0, 0, 0, 1, 866, 0, 0, 0, 0, 30570, 0, 0, NULL, 'EventAI', 0, 1, 0, 1, 3, 3057, 0, 0, 1691041627, 0, 557064, ''),
(3516, 0, 1542, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 'Arch Druid Fandral Staghelm', NULL, 1630, 63, 63, 80, 3, 1, 1.14286, 20, 5, 40, 3, 1, 200, 20, 1, 10, 0.14, 0, 2000, 2000, 0, 630, 504, 504, 504, 504, 2, 4160, 0, 0, 0, 0, 0, 7, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 35160, 0, 0, NULL, '', 0, 3, 0, 1, 3, 3516, 0, 0, 1691041627, 0, 557064, ''),
(4949, 0, 4527, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 100, 0, 'Thrall', 'Warchief', 3664, 63, 63, 125, 3, 1, 1.14286, 20, 5, 120, 3, 1, 200, 15, 1, 10, 0.14, 0, 2000, 2000, 0, 15, 15, 15, 15, 15, 2, 4160, 0, 0, 0, 0, 0, 7, 12, 0, 0, 0, 1, 866, 0, 0, 0, 0, 49490, 0, 0, NULL, 'EventAI', 0, 3, 0, 1, 3, 4949, 0, 0, 1691041627, 0, 557064, ''),
(10181, 0, 11657, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 100, 0, 'Lady Sylvanas Windrunner', 'Banshee Queen', 0, 63, 63, 118, 2, 1, 1.14286, 20, 5, 0, 3, 1, 200, 20, 1, 10, 0.14, 0, 2000, 2000, 0, 15, 15, 15, 15, 15, 2, 36928, 0, 0, 0, 0, 0, 7, 12, 0, 0, 0, 1, 866, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 3, 0, 1, 3, 10181, 0, 0, 1691041627, 0, 2654216, 'npc_lady_sylvanas_windrunner'),
-- Post 1.7
(1748, 5, 5566, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 'Highlord Bolvar Fordragon', NULL, 0, 63, 63, 12, 2, 1, 1.14286, 20, 5, 0, 3, 1, 300, 20, 1, 15, 0.14, 0, 2000, 2000, 0, 15, 15, 15, 15, 15, 2, 4096, 0, 0, 0, 0, 0, 7, 12, 0, 0, 0, 1, 866, 20683, 18819, 0, 0, 17480, 0, 0, '8990 18943', 'EventAI', 0, 3, 0, 1, 3, 1748, 0, 0, 1691041627, 0, 557064, ''),
(2784, 5, 3597, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 'King Magni Bronzebeard', 'Lord of Ironforge', 0, 63, 63, 55, 2, 1, 1.14286, 20, 5, 0, 3, 1, 300, 20, 1, 15, 0.14, 0, 2000, 2000, 0, 15, 15, 15, 15, 15, 1, 4160, 0, 0, 0, 0, 0, 7, 12, 0, 0, 0, 1, 866, 19135, 20685, 20686, 0, 27840, 0, 0, NULL, 'EventAI', 0, 3, 0, 1, 3, 2784, 0, 0, 1691041627, 0, 557064, ''),
(3057, 5, 4307, 0, 0, 0, 1.62, 0, 0, 0, 1, 0, 0, 0, 1, 0, 'Cairne Bloodhoof', 'High Chieftain', 5851, 63, 63, 104, 3, 1, 1.14286, 20, 5, 50, 3, 1, 300, 16, 1, 15, 0.14, 0, 2000, 2000, 0, 15, 15, 15, 15, 15, 1, 4160, 0, 0, 0, 0, 0, 7, 4, 0, 0, 0, 1, 866, 0, 0, 0, 0, 30570, 0, 0, NULL, 'EventAI', 0, 1, 0, 1, 3, 3057, 0, 0, 1691041627, 0, 557064, ''),
(3516, 5, 1542, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 'Arch Druid Fandral Staghelm', NULL, 1630, 63, 63, 80, 3, 1, 1.14286, 20, 5, 40, 3, 1, 300, 20, 1, 15, 0.14, 0, 2000, 2000, 0, 630, 504, 504, 504, 504, 2, 4160, 0, 0, 0, 0, 0, 7, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 35160, 0, 0, NULL, '', 0, 3, 0, 1, 3, 3516, 0, 0, 1691041627, 0, 557064, ''),
(4949, 5, 4527, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 100, 0, 'Thrall', 'Warchief', 3664, 63, 63, 125, 3, 1, 1.14286, 20, 5, 120, 3, 1, 300, 15, 1, 15, 0.14, 0, 2000, 2000, 0, 15, 15, 15, 15, 15, 2, 4160, 0, 0, 0, 0, 0, 7, 12, 0, 0, 0, 1, 866, 0, 0, 0, 0, 49490, 0, 0, NULL, 'EventAI', 0, 3, 0, 1, 3, 4949, 0, 0, 1691041627, 0, 557064, ''),
(10181, 5, 11657, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 100, 0, 'Lady Sylvanas Windrunner', 'Banshee Queen', 0, 63, 63, 118, 2, 1, 1.14286, 20, 5, 0, 3, 1, 300, 20, 1, 15, 0.14, 0, 2000, 2000, 0, 15, 15, 15, 15, 15, 2, 36928, 0, 0, 0, 0, 0, 7, 12, 0, 0, 0, 1, 866, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 3, 0, 1, 3, 10181, 0, 0, 1691041627, 0, 2654216, 'npc_lady_sylvanas_windrunner');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
