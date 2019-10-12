DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20191012085609');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20191012085609');
-- Add your query below.


-- ALLIANCE VENDORS


/*
Captain Dirgehammer
Armor Quartermaster
no vendor id
12777, guid 52721
*/
-- Should be spawned on 1.12 too.
UPDATE `creature` SET `patch_max`=10 WHERE `id`=12777;
-- Assign pre and post 1.11 vendor templates.
DELETE FROM `creature_template` WHERE `entry`=12777;
INSERT INTO `creature_template` (`entry`, `patch`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `name`, `subname`, `gossip_menu_id`, `level_min`, `level_max`, `health_min`, `health_max`, `mana_min`, `mana_max`, `armor`, `faction`, `npc_flags`, `speed_walk`, `speed_run`, `scale`, `detection_range`, `call_for_help_range`, `leash_range`, `rank`, `xp_multiplier`, `dmg_min`, `dmg_max`, `dmg_school`, `attack_power`, `dmg_multiplier`, `base_attack_time`, `ranged_attack_time`, `unit_class`, `unit_flags`, `dynamic_flags`, `beast_family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `ranged_dmg_min`, `ranged_dmg_max`, `ranged_attack_power`, `type`, `type_flags`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `spell_id1`, `spell_id2`, `spell_id3`, `spell_id4`, `spell_list_id`, `pet_spell_list_id`, `gold_min`, `gold_max`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `regeneration`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `flags_extra`, `script_name`) VALUES (12777, 2, 12917, 0, 0, 0, 'Captain Dirgehammer', 'Armor Quartermaster', 0, 55, 55, 8075, 8075, 0, 0, 5234, 35, 4, 1.1, 1.14286, 1, 20, 5, 0, 0, 1, 200, 281, 0, 278, 1, 2000, 2000, 1, 4864, 0, 0, 0, 0, 0, 0, 166, 246, 35, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 12777, 0, 1277701, 0, 0, 524288, '');
INSERT INTO `creature_template` (`entry`, `patch`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `name`, `subname`, `gossip_menu_id`, `level_min`, `level_max`, `health_min`, `health_max`, `mana_min`, `mana_max`, `armor`, `faction`, `npc_flags`, `speed_walk`, `speed_run`, `scale`, `detection_range`, `call_for_help_range`, `leash_range`, `rank`, `xp_multiplier`, `dmg_min`, `dmg_max`, `dmg_school`, `attack_power`, `dmg_multiplier`, `base_attack_time`, `ranged_attack_time`, `unit_class`, `unit_flags`, `dynamic_flags`, `beast_family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `ranged_dmg_min`, `ranged_dmg_max`, `ranged_attack_power`, `type`, `type_flags`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `spell_id1`, `spell_id2`, `spell_id3`, `spell_id4`, `spell_list_id`, `pet_spell_list_id`, `gold_min`, `gold_max`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `regeneration`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `flags_extra`, `script_name`) VALUES (12777, 9, 12917, 0, 0, 0, 'Captain Dirgehammer', 'Armor Quartermaster', 0, 55, 55, 8075, 8075, 0, 0, 5234, 35, 4, 1.1, 1.14286, 1, 20, 5, 0, 0, 1, 200, 281, 0, 278, 1, 2000, 2000, 1, 4864, 0, 0, 0, 0, 0, 0, 166, 246, 35, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 12777, 0, 1277702, 0, 0, 524288, '');
-- Move npc_vendor items to vendor template.
DELETE FROM `npc_vendor` WHERE `entry`=12777;
UPDATE `npc_vendor_template` SET `entry`=1277702 WHERE `entry`=1278502;
INSERT INTO `npc_vendor_template` (`entry`, `item`, `maxcount`, `incrtime`, `itemflags`) VALUES 
(1277701, 16369, 0, 0, 0),
(1277701, 16391, 0, 0, 0),
(1277701, 16392, 0, 0, 0),
(1277701, 16393, 0, 0, 0),
(1277701, 16396, 0, 0, 0),
(1277701, 16397, 0, 0, 0),
(1277701, 16401, 0, 0, 0),
(1277701, 16403, 0, 0, 0),
(1277701, 16405, 0, 0, 0),
(1277701, 16406, 0, 0, 0),
(1277701, 16409, 0, 0, 0),
(1277701, 16410, 0, 0, 0),
(1277701, 16413, 0, 0, 0),
(1277701, 16414, 0, 0, 0),
(1277701, 16415, 0, 0, 0),
(1277701, 16416, 0, 0, 0),
(1277701, 16417, 0, 0, 0),
(1277701, 16418, 0, 0, 0),
(1277701, 16419, 0, 0, 0),
(1277701, 16420, 0, 0, 0),
(1277701, 16421, 0, 0, 0),
(1277701, 16422, 0, 0, 0),
(1277701, 16423, 0, 0, 0),
(1277701, 16424, 0, 0, 0),
(1277701, 16425, 0, 0, 0),
(1277701, 16426, 0, 0, 0),
(1277701, 16427, 0, 0, 0),
(1277701, 16428, 0, 0, 0),
(1277701, 16429, 0, 0, 0),
(1277701, 16430, 0, 0, 0),
(1277701, 16431, 0, 0, 0),
(1277701, 16432, 0, 0, 0),
(1277701, 16433, 0, 0, 0),
(1277701, 16434, 0, 0, 0),
(1277701, 16435, 0, 0, 0),
(1277701, 16436, 0, 0, 0),
(1277701, 16437, 0, 0, 0),
(1277701, 16440, 0, 0, 0),
(1277701, 16441, 0, 0, 0),
(1277701, 16442, 0, 0, 0),
(1277701, 16443, 0, 0, 0),
(1277701, 16444, 0, 0, 0),
(1277701, 16446, 0, 0, 0),
(1277701, 16448, 0, 0, 0),
(1277701, 16449, 0, 0, 0),
(1277701, 16450, 0, 0, 0),
(1277701, 16451, 0, 0, 0),
(1277701, 16452, 0, 0, 0),
(1277701, 16453, 0, 0, 0),
(1277701, 16454, 0, 0, 0),
(1277701, 16455, 0, 0, 0),
(1277701, 16456, 0, 0, 0),
(1277701, 16457, 0, 0, 0),
(1277701, 16459, 0, 0, 0),
(1277701, 16462, 0, 0, 0),
(1277701, 16463, 0, 0, 0),
(1277701, 16465, 0, 0, 0),
(1277701, 16466, 0, 0, 0),
(1277701, 16467, 0, 0, 0),
(1277701, 16468, 0, 0, 0),
(1277701, 16471, 0, 0, 0),
(1277701, 16472, 0, 0, 0),
(1277701, 16473, 0, 0, 0),
(1277701, 16474, 0, 0, 0),
(1277701, 16475, 0, 0, 0),
(1277701, 16476, 0, 0, 0),
(1277701, 16477, 0, 0, 0),
(1277701, 16478, 0, 0, 0),
(1277701, 16479, 0, 0, 0),
(1277701, 16480, 0, 0, 0),
(1277701, 16483, 0, 0, 0),
(1277701, 16484, 0, 0, 0),
(1277701, 17562, 0, 0, 0),
(1277701, 17564, 0, 0, 0),
(1277701, 17566, 0, 0, 0),
(1277701, 17567, 0, 0, 0),
(1277701, 17568, 0, 0, 0),
(1277701, 17569, 0, 0, 0),
(1277701, 17578, 0, 0, 0),
(1277701, 17579, 0, 0, 0),
(1277701, 17580, 0, 0, 0),
(1277701, 17581, 0, 0, 0),
(1277701, 17583, 0, 0, 0),
(1277701, 17584, 0, 0, 0),
(1277701, 17594, 0, 0, 0),
(1277701, 17596, 0, 0, 0),
(1277701, 17598, 0, 0, 0),
(1277701, 17599, 0, 0, 0),
(1277701, 17600, 0, 0, 0),
(1277701, 17601, 0, 0, 0),
(1277701, 17602, 0, 0, 0),
(1277701, 17603, 0, 0, 0),
(1277701, 17604, 0, 0, 0),
(1277701, 17605, 0, 0, 0),
(1277701, 17607, 0, 0, 0),
(1277701, 17608, 0, 0, 0);

/*
Sergeant Major Clate
Food and Drink -> Armor Quartermaster
vendor ids 1278501 -> 1278502
entry 12785, guid 13
*/
-- Remove entry for patch 1.11. Changed in TBC.
DELETE FROM `creature_template` WHERE `entry`=12785 && `patch`=9;

/*
Captain O Neal
Weapons Quartermaster
no vendor id
entry 12782, guid 52726
*/
-- Should be spawned on 1.12 too.
UPDATE `creature` SET `patch_max`=10 WHERE `id`=12782;
-- Assign pre and post 1.11 vendor templates.
DELETE FROM `creature_template` WHERE `entry`=12782;
INSERT INTO `creature_template` (`entry`, `patch`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `name`, `subname`, `gossip_menu_id`, `level_min`, `level_max`, `health_min`, `health_max`, `mana_min`, `mana_max`, `armor`, `faction`, `npc_flags`, `speed_walk`, `speed_run`, `scale`, `detection_range`, `call_for_help_range`, `leash_range`, `rank`, `xp_multiplier`, `dmg_min`, `dmg_max`, `dmg_school`, `attack_power`, `dmg_multiplier`, `base_attack_time`, `ranged_attack_time`, `unit_class`, `unit_flags`, `dynamic_flags`, `beast_family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `ranged_dmg_min`, `ranged_dmg_max`, `ranged_attack_power`, `type`, `type_flags`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `spell_id1`, `spell_id2`, `spell_id3`, `spell_id4`, `spell_list_id`, `pet_spell_list_id`, `gold_min`, `gold_max`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `regeneration`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `flags_extra`, `script_name`) VALUES (12782, 2, 12918, 0, 0, 0, 'Captain O\'Neal', 'Weapons Quartermaster', 0, 55, 55, 8075, 8075, 0, 0, 4500, 35, 4, 1.1, 1.14286, 0, 20, 5, 0, 0, 1, 373, 373, 0, 248, 1, 2000, 2000, 1, 4864, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 12782, 0, 1278201, 0, 0, 524288, '');
INSERT INTO `creature_template` (`entry`, `patch`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `name`, `subname`, `gossip_menu_id`, `level_min`, `level_max`, `health_min`, `health_max`, `mana_min`, `mana_max`, `armor`, `faction`, `npc_flags`, `speed_walk`, `speed_run`, `scale`, `detection_range`, `call_for_help_range`, `leash_range`, `rank`, `xp_multiplier`, `dmg_min`, `dmg_max`, `dmg_school`, `attack_power`, `dmg_multiplier`, `base_attack_time`, `ranged_attack_time`, `unit_class`, `unit_flags`, `dynamic_flags`, `beast_family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `ranged_dmg_min`, `ranged_dmg_max`, `ranged_attack_power`, `type`, `type_flags`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `spell_id1`, `spell_id2`, `spell_id3`, `spell_id4`, `spell_list_id`, `pet_spell_list_id`, `gold_min`, `gold_max`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `regeneration`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `flags_extra`, `script_name`) VALUES (12782, 9, 12918, 0, 0, 0, 'Captain O\'Neal', 'Weapons Quartermaster', 0, 55, 55, 8075, 8075, 0, 0, 4500, 35, 4, 1.1, 1.14286, 0, 20, 5, 0, 0, 1, 373, 373, 0, 248, 1, 2000, 2000, 1, 4864, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 12782, 0, 1278202, 0, 0, 524288, '');
-- Move npc_vendor items to vendor template.
DELETE FROM `npc_vendor` WHERE `entry`=12782;
UPDATE `npc_vendor_template` SET `entry`=1278202 WHERE `entry`=1278402;
INSERT INTO `npc_vendor_template` (`entry`, `item`, `maxcount`, `incrtime`, `itemflags`) VALUES 
(1278201, 12584, 0, 0, 0),
(1278201, 18825, 0, 0, 0),
(1278201, 18827, 0, 0, 0),
(1278201, 18830, 0, 0, 0),
(1278201, 18833, 0, 0, 0),
(1278201, 18836, 0, 0, 0),
(1278201, 18838, 0, 0, 0),
(1278201, 18843, 0, 0, 0),
(1278201, 18847, 0, 0, 0),
(1278201, 18855, 0, 0, 0),
(1278201, 18865, 0, 0, 0),
(1278201, 18867, 0, 0, 0),
(1278201, 18869, 0, 0, 0),
(1278201, 18873, 0, 0, 0),
(1278201, 18876, 0, 0, 0);

/*
Lieutenant Jackspring
Reagent Vendor -> Weapons Quartermaster
vendor ids 1278401 -> 1278402
entry 12784, guid 21
*/
-- Remove entry for patch 1.11. Changed in TBC.
DELETE FROM `creature_template` WHERE `entry`=12784 && `patch`=9;


-- HORDE VENDORS


/*
Lady Palanseer
Armor Quartermaster
no vendor id
entry 12792, guid 52722
*/
-- Should be spawned on 1.12 too.
UPDATE `creature` SET `patch_max`=10 WHERE `id`=12792;
-- Assign pre and post 1.11 vendor templates.
DELETE FROM `creature_template` WHERE `entry`=12792;
INSERT INTO `creature_template` (`entry`, `patch`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `name`, `subname`, `gossip_menu_id`, `level_min`, `level_max`, `health_min`, `health_max`, `mana_min`, `mana_max`, `armor`, `faction`, `npc_flags`, `speed_walk`, `speed_run`, `scale`, `detection_range`, `call_for_help_range`, `leash_range`, `rank`, `xp_multiplier`, `dmg_min`, `dmg_max`, `dmg_school`, `attack_power`, `dmg_multiplier`, `base_attack_time`, `ranged_attack_time`, `unit_class`, `unit_flags`, `dynamic_flags`, `beast_family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `ranged_dmg_min`, `ranged_dmg_max`, `ranged_attack_power`, `type`, `type_flags`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `spell_id1`, `spell_id2`, `spell_id3`, `spell_id4`, `spell_list_id`, `pet_spell_list_id`, `gold_min`, `gold_max`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `regeneration`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `flags_extra`, `script_name`) VALUES (12792, 2, 12674, 0, 0, 0, 'Lady Palanseer', 'Armor Quartermaster', 0, 55, 55, 7500, 7500, 0, 0, 5234, 85, 4, 1.1, 1.14286, 1, 20, 5, 0, 0, 1, 200, 281, 0, 278, 1, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 166, 246, 35, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 12792, 0, 1279201, 0, 0, 524288, '');
INSERT INTO `creature_template` (`entry`, `patch`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `name`, `subname`, `gossip_menu_id`, `level_min`, `level_max`, `health_min`, `health_max`, `mana_min`, `mana_max`, `armor`, `faction`, `npc_flags`, `speed_walk`, `speed_run`, `scale`, `detection_range`, `call_for_help_range`, `leash_range`, `rank`, `xp_multiplier`, `dmg_min`, `dmg_max`, `dmg_school`, `attack_power`, `dmg_multiplier`, `base_attack_time`, `ranged_attack_time`, `unit_class`, `unit_flags`, `dynamic_flags`, `beast_family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `ranged_dmg_min`, `ranged_dmg_max`, `ranged_attack_power`, `type`, `type_flags`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `spell_id1`, `spell_id2`, `spell_id3`, `spell_id4`, `spell_list_id`, `pet_spell_list_id`, `gold_min`, `gold_max`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `regeneration`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `flags_extra`, `script_name`) VALUES (12792, 9, 12674, 0, 0, 0, 'Lady Palanseer', 'Armor Quartermaster', 0, 55, 55, 7500, 7500, 0, 0, 5234, 85, 4, 1.1, 1.14286, 1, 20, 5, 0, 0, 1, 200, 281, 0, 278, 1, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 166, 246, 35, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 12792, 0, 1279202, 0, 0, 524288, '');
-- Move npc_vendor items to vendor template.
DELETE FROM `npc_vendor` WHERE `entry`=12792;
UPDATE `npc_vendor_template` SET `entry`=1279202 WHERE `entry`=1279502;
INSERT INTO `npc_vendor_template` (`entry`, `item`, `maxcount`, `incrtime`, `itemflags`) VALUES 
(1279201, 16485, 0, 0, 0),
(1279201, 16487, 0, 0, 0),
(1279201, 16489, 0, 0, 0),
(1279201, 16490, 0, 0, 0),
(1279201, 16491, 0, 0, 0),
(1279201, 16492, 0, 0, 0),
(1279201, 16494, 0, 0, 0),
(1279201, 16496, 0, 0, 0),
(1279201, 16498, 0, 0, 0),
(1279201, 16499, 0, 0, 0),
(1279201, 16501, 0, 0, 0),
(1279201, 16502, 0, 0, 0),
(1279201, 16503, 0, 0, 0),
(1279201, 16504, 0, 0, 0),
(1279201, 16505, 0, 0, 0),
(1279201, 16506, 0, 0, 0),
(1279201, 16507, 0, 0, 0),
(1279201, 16508, 0, 0, 0),
(1279201, 16509, 0, 0, 0),
(1279201, 16510, 0, 0, 0),
(1279201, 16513, 0, 0, 0),
(1279201, 16514, 0, 0, 0),
(1279201, 16515, 0, 0, 0),
(1279201, 16516, 0, 0, 0),
(1279201, 16518, 0, 0, 0),
(1279201, 16519, 0, 0, 0),
(1279201, 16521, 0, 0, 0),
(1279201, 16522, 0, 0, 0),
(1279201, 16523, 0, 0, 0),
(1279201, 16524, 0, 0, 0),
(1279201, 16525, 0, 0, 0),
(1279201, 16526, 0, 0, 0),
(1279201, 16527, 0, 0, 0),
(1279201, 16528, 0, 0, 0),
(1279201, 16530, 0, 0, 0),
(1279201, 16531, 0, 0, 0),
(1279201, 16533, 0, 0, 0),
(1279201, 16534, 0, 0, 0),
(1279201, 16535, 0, 0, 0),
(1279201, 16536, 0, 0, 0),
(1279201, 16539, 0, 0, 0),
(1279201, 16540, 0, 0, 0),
(1279201, 16541, 0, 0, 0),
(1279201, 16542, 0, 0, 0),
(1279201, 16543, 0, 0, 0),
(1279201, 16544, 0, 0, 0),
(1279201, 16545, 0, 0, 0),
(1279201, 16548, 0, 0, 0),
(1279201, 16549, 0, 0, 0),
(1279201, 16550, 0, 0, 0),
(1279201, 16551, 0, 0, 0),
(1279201, 16552, 0, 0, 0),
(1279201, 16554, 0, 0, 0),
(1279201, 16555, 0, 0, 0),
(1279201, 16558, 0, 0, 0),
(1279201, 16560, 0, 0, 0),
(1279201, 16561, 0, 0, 0),
(1279201, 16562, 0, 0, 0),
(1279201, 16563, 0, 0, 0),
(1279201, 16564, 0, 0, 0),
(1279201, 16565, 0, 0, 0),
(1279201, 16566, 0, 0, 0),
(1279201, 16567, 0, 0, 0),
(1279201, 16568, 0, 0, 0),
(1279201, 16569, 0, 0, 0),
(1279201, 16571, 0, 0, 0),
(1279201, 16573, 0, 0, 0),
(1279201, 16574, 0, 0, 0),
(1279201, 16577, 0, 0, 0),
(1279201, 16578, 0, 0, 0),
(1279201, 16579, 0, 0, 0),
(1279201, 16580, 0, 0, 0),
(1279201, 17570, 0, 0, 0),
(1279201, 17571, 0, 0, 0),
(1279201, 17572, 0, 0, 0),
(1279201, 17573, 0, 0, 0),
(1279201, 17576, 0, 0, 0),
(1279201, 17577, 0, 0, 0),
(1279201, 17586, 0, 0, 0),
(1279201, 17588, 0, 0, 0),
(1279201, 17590, 0, 0, 0),
(1279201, 17591, 0, 0, 0),
(1279201, 17592, 0, 0, 0),
(1279201, 17593, 0, 0, 0),
(1279201, 17610, 0, 0, 0),
(1279201, 17611, 0, 0, 0),
(1279201, 17612, 0, 0, 0),
(1279201, 17613, 0, 0, 0),
(1279201, 17616, 0, 0, 0),
(1279201, 17617, 0, 0, 0),
(1279201, 17618, 0, 0, 0),
(1279201, 17620, 0, 0, 0),
(1279201, 17622, 0, 0, 0),
(1279201, 17623, 0, 0, 0),
(1279201, 17624, 0, 0, 0),
(1279201, 17625, 0, 0, 0);

/*
First Sergeant Holamahi
Reagent Vendor -> Armor Quartermaster
vendor ids 1279501 -> 1279502
entry 12795, guid 52724
*/
-- Remove entry for patch 1.11. Changed in TBC.
DELETE FROM `creature_template` WHERE `entry`=12795 && `patch`=9;

/*
Sergeant Thunderhorn
Weapons Quartermaster
no vendor id
entry 14581, guid 52727
*/
-- Should be spawned on 1.12 too.
UPDATE `creature` SET `patch_max`=10 WHERE `id`=14581;
-- Assign pre and post 1.11 vendor templates.
DELETE FROM `creature_template` WHERE `entry`=14581;
INSERT INTO `creature_template` (`entry`, `patch`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `name`, `subname`, `gossip_menu_id`, `level_min`, `level_max`, `health_min`, `health_max`, `mana_min`, `mana_max`, `armor`, `faction`, `npc_flags`, `speed_walk`, `speed_run`, `scale`, `detection_range`, `call_for_help_range`, `leash_range`, `rank`, `xp_multiplier`, `dmg_min`, `dmg_max`, `dmg_school`, `attack_power`, `dmg_multiplier`, `base_attack_time`, `ranged_attack_time`, `unit_class`, `unit_flags`, `dynamic_flags`, `beast_family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `ranged_dmg_min`, `ranged_dmg_max`, `ranged_attack_power`, `type`, `type_flags`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `spell_id1`, `spell_id2`, `spell_id3`, `spell_id4`, `spell_list_id`, `pet_spell_list_id`, `gold_min`, `gold_max`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `regeneration`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `flags_extra`, `script_name`) VALUES (14581, 2, 14612, 0, 0, 0, 'Sergeant Thunderhorn', 'Weapons Quartermaster', 0, 55, 55, 7200, 7200, 0, 0, 3271, 85, 4, 1.1, 1.14286, 1.35, 20, 5, 0, 0, 1, 373, 373, 0, 248, 1, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 14581, 0, 1458101, 0, 0, 524288, '');
INSERT INTO `creature_template` (`entry`, `patch`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `name`, `subname`, `gossip_menu_id`, `level_min`, `level_max`, `health_min`, `health_max`, `mana_min`, `mana_max`, `armor`, `faction`, `npc_flags`, `speed_walk`, `speed_run`, `scale`, `detection_range`, `call_for_help_range`, `leash_range`, `rank`, `xp_multiplier`, `dmg_min`, `dmg_max`, `dmg_school`, `attack_power`, `dmg_multiplier`, `base_attack_time`, `ranged_attack_time`, `unit_class`, `unit_flags`, `dynamic_flags`, `beast_family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `ranged_dmg_min`, `ranged_dmg_max`, `ranged_attack_power`, `type`, `type_flags`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `spell_id1`, `spell_id2`, `spell_id3`, `spell_id4`, `spell_list_id`, `pet_spell_list_id`, `gold_min`, `gold_max`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `regeneration`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `flags_extra`, `script_name`) VALUES (14581, 9, 14612, 0, 0, 0, 'Sergeant Thunderhorn', 'Weapons Quartermaster', 0, 55, 55, 7200, 7200, 0, 0, 3271, 85, 4, 1.1, 1.14286, 1.35, 20, 5, 0, 0, 1, 373, 373, 0, 248, 1, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 14581, 0, 1458102, 0, 0, 524288, '');
-- Move npc_vendor items to vendor template.
DELETE FROM `npc_vendor` WHERE `entry`=14581;
UPDATE `npc_vendor_template` SET `entry`=1458102 WHERE `entry`=1279402;
INSERT INTO `npc_vendor_template` (`entry`, `item`, `maxcount`, `incrtime`, `itemflags`) VALUES 
(1458101, 16345, 0, 0, 0),
(1458101, 18826, 0, 0, 0),
(1458101, 18828, 0, 0, 0),
(1458101, 18831, 0, 0, 0),
(1458101, 18835, 0, 0, 0),
(1458101, 18837, 0, 0, 0),
(1458101, 18840, 0, 0, 0),
(1458101, 18844, 0, 0, 0),
(1458101, 18848, 0, 0, 0),
(1458101, 18860, 0, 0, 0),
(1458101, 18866, 0, 0, 0),
(1458101, 18868, 0, 0, 0),
(1458101, 18871, 0, 0, 0),
(1458101, 18874, 0, 0, 0),
(1458101, 18877, 0, 0, 0);

/*
Stone Guard Zarg
Food and Drink -> Weapons Quartermaster
vendor ids 1279401 -> 1279402
entry 12794, guid 86419
*/
-- Remove entry for patch 1.11. Changed in TBC.
DELETE FROM `creature_template` WHERE `entry`=12794 && `patch`=9;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
