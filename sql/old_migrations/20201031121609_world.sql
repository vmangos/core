DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20201031121609');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20201031121609');
-- Add your query below.


-- Correct damage for bosses.
-- The Prophet Skeram
UPDATE `creature_template` SET `dmg_min`=2045, `dmg_max`=2707 WHERE `entry`=15263;
-- Battleguard Sartura
UPDATE `creature_template` SET `dmg_min`=1977, `dmg_max`=2621 WHERE `entry`=15516;
-- Fankriss the Unyielding
UPDATE `creature_template` SET `dmg_min`=2197, `dmg_max`=2912 WHERE `entry`=15510;
-- Princess Huhuran
UPDATE `creature_template` SET `dmg_min`=2746, `dmg_max`=3640 WHERE `entry`=15509;
-- Emperor Vek'lor
UPDATE `creature_template` SET `dmg_min`=3067, `dmg_max`=4060 WHERE `entry`=15276;
-- Emperor Vek'nilash
UPDATE `creature_template` SET `dmg_min`=3295, `dmg_max`=4368 WHERE `entry`=15275;
-- C'Thun
UPDATE `creature_template` SET `dmg_min`=110, `dmg_max`=146 WHERE `entry`=15727;
-- Princess Yauj
UPDATE `creature_template` SET `dmg_min`=2197, `dmg_max`=2912 WHERE `entry`=15543;
-- Vem
UPDATE `creature_template` SET `dmg_min`=2471, `dmg_max`=3276 WHERE `entry`=15544;
-- Lord Kri
UPDATE `creature_template` SET `dmg_min`=3432, `dmg_max`=4550 WHERE `entry`=15511;
-- Viscidus
UPDATE `creature_template` SET `dmg_min`=2356, `dmg_max`=3123 WHERE `entry`=15299;
-- Ouro
UPDATE `creature_template` SET `dmg_min`=5190, `dmg_max`=6880 WHERE `entry`=15517;

-- Correct damage for trash.
-- Vekniss Soldier
UPDATE `creature_template` SET `dmg_min`=847, `dmg_max`=1122 WHERE `entry`=15229;
-- Vekniss Warrior
UPDATE `creature_template` SET `dmg_min`=1270, `dmg_max`=1684 WHERE `entry`=15230;
-- Vekniss Guardian
UPDATE `creature_template` SET `dmg_min`=1587, `dmg_max`=2105 WHERE `entry`=15233;
-- Vekniss Stinger
UPDATE `creature_template` SET `dmg_min`=1295, `dmg_max`=1717 WHERE `entry`=15235;
-- Vekniss Wasp
UPDATE `creature_template` SET `dmg_min`=831, `dmg_max`=1103, `armor`=3791 WHERE `entry`=15236;
-- Vekniss Hive Crawler
UPDATE `creature_template` SET `dmg_min`=2158, `dmg_max`=2862 WHERE `entry`=15240;
-- Qiraji Mindslayer
UPDATE `creature_template` SET `dmg_min`=2116, `dmg_max`=2806 WHERE `entry`=15246;
-- Qiraji Brainwasher
UPDATE `creature_template` SET `dmg_min`=1270, `dmg_max`=1684 WHERE `entry`=15247;
-- Qiraji Lasher
UPDATE `creature_template` SET `dmg_min`=1524, `dmg_max`=2020, `armor`=4091 WHERE `entry`=15249;
-- Qiraji Slayer
UPDATE `creature_template` SET `dmg_min`=1971, `dmg_max`=2607, `armor`=3316 WHERE `entry`=15250;
-- Qiraji Champion
UPDATE `creature_template` SET `dmg_min`=2746, `dmg_max`=3640 WHERE `entry`=15252;
-- Obsidian Eradicator
UPDATE `creature_template` SET `dmg_min`=2310, `dmg_max`=2743 WHERE `entry`=15262;
-- Anubisath Sentinel
UPDATE `creature_template` SET `dmg_min`=1799, `dmg_max`=2385 WHERE `entry`=15264;
-- Anubisath Defender
UPDATE `creature_template` SET `dmg_min`=3237, `dmg_max`=4294 WHERE `entry`=15277;
-- Vekniss Drone
UPDATE `creature_template` SET `dmg_min`=208, `dmg_max`=276 WHERE `entry`=15300;
-- Anubisath Warder
UPDATE `creature_template` SET `dmg_min`=3075, `dmg_max`=4077 WHERE `entry`=15311;
-- Obsidian Nullifier
UPDATE `creature_template` SET `dmg_min`=2066, `dmg_max`=3241 WHERE `entry`=15312;
-- Qiraji Scarab
UPDATE `creature_template` SET `dmg_min`=104, `dmg_max`=138, `armor`=3791 WHERE `entry`=15316;
-- Qiraji Scorpion
UPDATE `creature_template` SET `dmg_min`=103, `dmg_max`=138, `armor`=3791 WHERE `entry`=15317;
-- Yauj Brood
UPDATE `creature_template` SET `dmg_min`=282, `dmg_max`=515 WHERE `entry`=15621;
-- Vekniss Borer
UPDATE `creature_template` SET `dmg_min`=601, `dmg_max`=1100, `level_min`=60, `level_max`=60, `health_min`=7630, `health_max`=7630 WHERE `entry`=15622;
-- Spawn of Fankriss
UPDATE `creature_template` SET `dmg_min`=2856, `dmg_max`=3786 WHERE `entry`=15630;
-- Vekniss Hatchling
UPDATE `creature_template` SET `dmg_min`=684, `dmg_max`=1238 WHERE `entry`=15962;
-- Sartura's Royal Guard
UPDATE `creature_template` SET `dmg_min`=1524, `dmg_max`=2020, `armor`=4091 WHERE `entry`=15984;
-- Anubisath Warrior
UPDATE `creature_template` SET `dmg_min`=324, `dmg_max`=429 WHERE `entry`=15537;
-- Anubisath Swarmguard
UPDATE `creature_template` SET `dmg_min`=1057, `dmg_max`=1386 WHERE `entry`=15538;
-- Ouro Scarab
UPDATE `creature_template` SET `dmg_min`=197, `dmg_max`=341 WHERE `entry`=15718;
-- Toxic Slime
UPDATE `creature_template` SET `level_min`=60, `level_max`=60, `health_min`=4120, `health_max`=4120 WHERE `entry`=15925;

-- These mobs were supposedly nerfed in patch 1.10.
-- Claw Tentacle
-- Eye Tentacle
-- Giant Claw Tentacle
-- Flesh Tentacle
-- Giant Eye Tentacle
DELETE FROM `creature_template` WHERE `entry` IN (15725, 15726, 15728, 15802, 15334);
INSERT INTO `creature_template` (`entry`, `patch`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `name`, `subname`, `gossip_menu_id`, `level_min`, `level_max`, `health_min`, `health_max`, `mana_min`, `mana_max`, `armor`, `faction`, `npc_flags`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `rank`, `xp_multiplier`, `dmg_min`, `dmg_max`, `dmg_school`, `attack_power`, `dmg_multiplier`, `base_attack_time`, `ranged_attack_time`, `unit_class`, `unit_flags`, `dynamic_flags`, `beast_family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `ranged_dmg_min`, `ranged_dmg_max`, `ranged_attack_power`, `type`, `type_flags`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `spell_id1`, `spell_id2`, `spell_id3`, `spell_id4`, `spell_list_id`, `pet_spell_list_id`, `gold_min`, `gold_max`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `regeneration`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `flags_extra`, `script_name`) VALUES (15334, 7, 15948, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 'Giant Eye Tentacle', '', 0, 60, 60, 36624, 36624, 0, 0, 4691, 91, 0, 1, 1, 20, 5, 0, 1, 1, 8500, 9500, 0, 272, 1, 2000, 2000, 1, 32768, 0, 0, 0, 0, 0, 0, 0, 1, 0, 10, 8, 0, 0, 0, 0, 75, 75, 75, 75, 75, 0, 0, 0, 0, 0, 0, 1, 8808, '', 0, 3, 0, 0, 3, 0, 0, 0, 4626, 0, 2097152, 'mob_giant_eye_tentacle');
INSERT INTO `creature_template` (`entry`, `patch`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `name`, `subname`, `gossip_menu_id`, `level_min`, `level_max`, `health_min`, `health_max`, `mana_min`, `mana_max`, `armor`, `faction`, `npc_flags`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `rank`, `xp_multiplier`, `dmg_min`, `dmg_max`, `dmg_school`, `attack_power`, `dmg_multiplier`, `base_attack_time`, `ranged_attack_time`, `unit_class`, `unit_flags`, `dynamic_flags`, `beast_family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `ranged_dmg_min`, `ranged_dmg_max`, `ranged_attack_power`, `type`, `type_flags`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `spell_id1`, `spell_id2`, `spell_id3`, `spell_id4`, `spell_list_id`, `pet_spell_list_id`, `gold_min`, `gold_max`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `regeneration`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `flags_extra`, `script_name`) VALUES (15725, 7, 15789, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'Claw Tentacle', '', 0, 60, 60, 1526, 1526, 0, 0, 4691, 14, 0, 2.4, 1.42857, 20, 5, 0, 0, 1, 500, 800, 0, 272, 1, 2000, 1500, 1, 32768, 0, 0, 0, 0, 0, 0, 0, 1, 0, 10, 8, 0, 0, 0, 0, 75, 75, 75, 75, 75, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 4626, 0, 2097152, 'mob_claw_tentacle');
INSERT INTO `creature_template` (`entry`, `patch`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `name`, `subname`, `gossip_menu_id`, `level_min`, `level_max`, `health_min`, `health_max`, `mana_min`, `mana_max`, `armor`, `faction`, `npc_flags`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `rank`, `xp_multiplier`, `dmg_min`, `dmg_max`, `dmg_school`, `attack_power`, `dmg_multiplier`, `base_attack_time`, `ranged_attack_time`, `unit_class`, `unit_flags`, `dynamic_flags`, `beast_family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `ranged_dmg_min`, `ranged_dmg_max`, `ranged_attack_power`, `type`, `type_flags`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `spell_id1`, `spell_id2`, `spell_id3`, `spell_id4`, `spell_list_id`, `pet_spell_list_id`, `gold_min`, `gold_max`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `regeneration`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `flags_extra`, `script_name`) VALUES (15726, 7, 15788, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Eye Tentacle', '', 0, 60, 60, 2289, 2289, 0, 0, 4691, 91, 0, 2.4, 1.42857, 20, 5, 0, 0, 1, 500, 800, 0, 272, 1, 2000, 1800, 1, 32768, 0, 0, 0, 0, 0, 0, 0, 1, 0, 10, 8, 0, 0, 0, 0, 75, 75, 75, 75, 75, 0, 0, 0, 0, 0, 0, 700, 4321, '', 0, 3, 0, 0, 3, 0, 0, 0, 2147488274, 0, 2129920, 'mob_eye_tentacle');
INSERT INTO `creature_template` (`entry`, `patch`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `name`, `subname`, `gossip_menu_id`, `level_min`, `level_max`, `health_min`, `health_max`, `mana_min`, `mana_max`, `armor`, `faction`, `npc_flags`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `rank`, `xp_multiplier`, `dmg_min`, `dmg_max`, `dmg_school`, `attack_power`, `dmg_multiplier`, `base_attack_time`, `ranged_attack_time`, `unit_class`, `unit_flags`, `dynamic_flags`, `beast_family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `ranged_dmg_min`, `ranged_dmg_max`, `ranged_attack_power`, `type`, `type_flags`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `spell_id1`, `spell_id2`, `spell_id3`, `spell_id4`, `spell_list_id`, `pet_spell_list_id`, `gold_min`, `gold_max`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `regeneration`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `flags_extra`, `script_name`) VALUES (15728, 7, 15790, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 'Giant Claw Tentacle', '', 0, 60, 60, 91560, 91560, 0, 0, 4691, 14, 0, 2.4, 1.42857, 20, 5, 0, 1, 1, 8500, 9500, 0, 272, 1, 2000, 2000, 1, 32769, 0, 0, 0, 0, 0, 0, 255, 325, 0, 10, 8, 0, 0, 0, 0, 75, 75, 75, 75, 75, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 4626, 0, 2097152, 'mob_giant_claw_tentacle');
INSERT INTO `creature_template` (`entry`, `patch`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `name`, `subname`, `gossip_menu_id`, `level_min`, `level_max`, `health_min`, `health_max`, `mana_min`, `mana_max`, `armor`, `faction`, `npc_flags`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `rank`, `xp_multiplier`, `dmg_min`, `dmg_max`, `dmg_school`, `attack_power`, `dmg_multiplier`, `base_attack_time`, `ranged_attack_time`, `unit_class`, `unit_flags`, `dynamic_flags`, `beast_family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `ranged_dmg_min`, `ranged_dmg_max`, `ranged_attack_power`, `type`, `type_flags`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `spell_id1`, `spell_id2`, `spell_id3`, `spell_id4`, `spell_list_id`, `pet_spell_list_id`, `gold_min`, `gold_max`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `regeneration`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `flags_extra`, `script_name`) VALUES (15802, 7, 15793, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Flesh Tentacle', '', 0, 60, 60, 24416, 24416, 0, 0, 4691, 14, 0, 2.4, 1.42857, 20, 5, 0, 0, 1, 1950, 1950, 0, 272, 1, 1500, 1500, 1, 32768, 0, 0, 0, 0, 0, 0, 0, 1, 0, 10, 8, 0, 0, 0, 0, 75, 75, 75, 75, 75, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 21010, 0, 2097152, 'mob_giant_flesh_tentacle');
INSERT INTO `creature_template` (`entry`, `patch`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `name`, `subname`, `gossip_menu_id`, `level_min`, `level_max`, `health_min`, `health_max`, `mana_min`, `mana_max`, `armor`, `faction`, `npc_flags`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `rank`, `xp_multiplier`, `dmg_min`, `dmg_max`, `dmg_school`, `attack_power`, `dmg_multiplier`, `base_attack_time`, `ranged_attack_time`, `unit_class`, `unit_flags`, `dynamic_flags`, `beast_family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `ranged_dmg_min`, `ranged_dmg_max`, `ranged_attack_power`, `type`, `type_flags`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `spell_id1`, `spell_id2`, `spell_id3`, `spell_id4`, `spell_list_id`, `pet_spell_list_id`, `gold_min`, `gold_max`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `regeneration`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `flags_extra`, `script_name`) VALUES (15334, 8, 15948, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 'Giant Eye Tentacle', '', 0, 60, 60, 36624, 36624, 0, 0, 4691, 91, 0, 1, 1, 20, 5, 0, 1, 1, 1024, 1375, 0, 272, 1, 2000, 2000, 1, 32768, 0, 0, 0, 0, 0, 0, 0, 1, 0, 10, 8, 0, 0, 0, 0, 75, 75, 75, 75, 75, 0, 0, 0, 0, 0, 0, 1, 8808, '', 0, 3, 0, 0, 3, 0, 0, 0, 4626, 0, 2097152, 'mob_giant_eye_tentacle');
INSERT INTO `creature_template` (`entry`, `patch`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `name`, `subname`, `gossip_menu_id`, `level_min`, `level_max`, `health_min`, `health_max`, `mana_min`, `mana_max`, `armor`, `faction`, `npc_flags`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `rank`, `xp_multiplier`, `dmg_min`, `dmg_max`, `dmg_school`, `attack_power`, `dmg_multiplier`, `base_attack_time`, `ranged_attack_time`, `unit_class`, `unit_flags`, `dynamic_flags`, `beast_family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `ranged_dmg_min`, `ranged_dmg_max`, `ranged_attack_power`, `type`, `type_flags`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `spell_id1`, `spell_id2`, `spell_id3`, `spell_id4`, `spell_list_id`, `pet_spell_list_id`, `gold_min`, `gold_max`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `regeneration`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `flags_extra`, `script_name`) VALUES (15725, 8, 15789, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'Claw Tentacle', '', 0, 60, 60, 1526, 1526, 0, 0, 4691, 14, 0, 2.4, 1.42857, 20, 5, 0, 0, 1, 208, 275, 0, 272, 1, 2000, 1500, 1, 32768, 0, 0, 0, 0, 0, 0, 0, 1, 0, 10, 8, 0, 0, 0, 0, 75, 75, 75, 75, 75, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 4626, 0, 2097152, 'mob_claw_tentacle');
INSERT INTO `creature_template` (`entry`, `patch`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `name`, `subname`, `gossip_menu_id`, `level_min`, `level_max`, `health_min`, `health_max`, `mana_min`, `mana_max`, `armor`, `faction`, `npc_flags`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `rank`, `xp_multiplier`, `dmg_min`, `dmg_max`, `dmg_school`, `attack_power`, `dmg_multiplier`, `base_attack_time`, `ranged_attack_time`, `unit_class`, `unit_flags`, `dynamic_flags`, `beast_family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `ranged_dmg_min`, `ranged_dmg_max`, `ranged_attack_power`, `type`, `type_flags`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `spell_id1`, `spell_id2`, `spell_id3`, `spell_id4`, `spell_list_id`, `pet_spell_list_id`, `gold_min`, `gold_max`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `regeneration`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `flags_extra`, `script_name`) VALUES (15726, 8, 15788, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Eye Tentacle', '', 0, 60, 60, 2289, 2289, 0, 0, 4691, 91, 0, 2.4, 1.42857, 20, 5, 0, 0, 1, 208, 275, 0, 272, 1, 2000, 1800, 1, 32768, 0, 0, 0, 0, 0, 0, 0, 1, 0, 10, 8, 0, 0, 0, 0, 75, 75, 75, 75, 75, 0, 0, 0, 0, 0, 0, 700, 4321, '', 0, 3, 0, 0, 3, 0, 0, 0, 2147488274, 0, 2129920, 'mob_eye_tentacle');
INSERT INTO `creature_template` (`entry`, `patch`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `name`, `subname`, `gossip_menu_id`, `level_min`, `level_max`, `health_min`, `health_max`, `mana_min`, `mana_max`, `armor`, `faction`, `npc_flags`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `rank`, `xp_multiplier`, `dmg_min`, `dmg_max`, `dmg_school`, `attack_power`, `dmg_multiplier`, `base_attack_time`, `ranged_attack_time`, `unit_class`, `unit_flags`, `dynamic_flags`, `beast_family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `ranged_dmg_min`, `ranged_dmg_max`, `ranged_attack_power`, `type`, `type_flags`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `spell_id1`, `spell_id2`, `spell_id3`, `spell_id4`, `spell_list_id`, `pet_spell_list_id`, `gold_min`, `gold_max`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `regeneration`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `flags_extra`, `script_name`) VALUES (15728, 8, 15790, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 'Giant Claw Tentacle', '', 0, 60, 60, 91560, 91560, 0, 0, 4691, 14, 0, 2.4, 1.42857, 20, 5, 0, 1, 1, 3804, 5755, 0, 272, 1, 2000, 2000, 1, 32769, 0, 0, 0, 0, 0, 0, 255, 325, 0, 10, 8, 0, 0, 0, 0, 75, 75, 75, 75, 75, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 4626, 0, 2097152, 'mob_giant_claw_tentacle');
INSERT INTO `creature_template` (`entry`, `patch`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `name`, `subname`, `gossip_menu_id`, `level_min`, `level_max`, `health_min`, `health_max`, `mana_min`, `mana_max`, `armor`, `faction`, `npc_flags`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `rank`, `xp_multiplier`, `dmg_min`, `dmg_max`, `dmg_school`, `attack_power`, `dmg_multiplier`, `base_attack_time`, `ranged_attack_time`, `unit_class`, `unit_flags`, `dynamic_flags`, `beast_family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `ranged_dmg_min`, `ranged_dmg_max`, `ranged_attack_power`, `type`, `type_flags`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `spell_id1`, `spell_id2`, `spell_id3`, `spell_id4`, `spell_list_id`, `pet_spell_list_id`, `gold_min`, `gold_max`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `regeneration`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `flags_extra`, `script_name`) VALUES (15802, 8, 15793, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Flesh Tentacle', '', 0, 60, 60, 24416, 24416, 0, 0, 4691, 14, 0, 2.4, 1.42857, 20, 5, 0, 0, 1, 348, 548, 0, 272, 1, 1500, 1500, 1, 32768, 0, 0, 0, 0, 0, 0, 0, 1, 0, 10, 8, 0, 0, 0, 0, 75, 75, 75, 75, 75, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 21010, 0, 2097152, 'mob_giant_flesh_tentacle');

-- Correct levels.
-- Dirt Mound
UPDATE `creature_template` SET `level_min`=60, `level_max`=60, `health_min`=3052, `health_max`=3052 WHERE `entry`=15712;
-- Exit Trigger
UPDATE `creature_template` SET `level_min`=60, `level_max`=60, `health_min`=2289, `health_max`=2289 WHERE `entry`=15800;
-- Tentacle Portal
UPDATE `creature_template` SET `level_min`=63, `level_max`=63, `health_min`=666200, `health_max`=666200 WHERE `entry`=15904;
-- Giant Tentacle Portal
UPDATE `creature_template` SET `level_min`=63, `level_max`=63, `health_min`=666200, `health_max`=666200 WHERE `entry`=15910;

-- Correct unit flags.
-- Exit Trigger
UPDATE `creature_template` SET `unit_flags`=33554432 WHERE `entry`=15800;
-- Toxic Slime
UPDATE `creature_template` SET `unit_flags`=33554432 WHERE `entry`=15925;

-- Correct factions.
UPDATE `creature_template` SET `faction`=370 WHERE `entry`=15334;
UPDATE `creature_template` SET `faction`=16 WHERE `entry`=15517;
UPDATE `creature_template` SET `faction`=310 WHERE `entry`=15537;
UPDATE `creature_template` SET `faction`=310 WHERE `entry`=15538;
UPDATE `creature_template` SET `faction`=16 WHERE `entry`=15712;
UPDATE `creature_template` SET `faction`=16 WHERE `entry`=15718;
UPDATE `creature_template` SET `faction`=16 WHERE `entry`=15725;
UPDATE `creature_template` SET `faction`=16 WHERE `entry`=15726;
UPDATE `creature_template` SET `faction`=370 WHERE `entry`=15728;
UPDATE `creature_template` SET `faction`=16 WHERE `entry`=15800;
UPDATE `creature_template` SET `faction`=16 WHERE `entry`=15802;
UPDATE `creature_template` SET `faction`=370 WHERE `entry`=15904;
UPDATE `creature_template` SET `faction`=370 WHERE `entry`=15910;
UPDATE `creature_template` SET `faction`=14 WHERE `entry`=15925;

-- Correct base attack speeds.
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=5924;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7467;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15463;
UPDATE `creature_template` SET `base_attack_time`=2700 WHERE `entry`=15517;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15667;
UPDATE `creature_template` SET `base_attack_time`=1000 WHERE `entry`=15718;
UPDATE `creature_template` SET `base_attack_time`=1000 WHERE `entry`=15725;
UPDATE `creature_template` SET `base_attack_time`=1000 WHERE `entry`=15726;
UPDATE `creature_template` SET `base_attack_time`=2500 WHERE `entry`=15728;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15802;

-- Correct ranged attack speeds.
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=5924;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=7467;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15463;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15517;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15667;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15718;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15725;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15726;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15802;

-- Correct run speeds.
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=15517;
UPDATE `creature_template` SET `speed_run`=0.142857 WHERE `entry`=15667;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=15712;
UPDATE `creature_template` SET `speed_run`=2.14286 WHERE `entry`=15718;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=15800;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=15904;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=15910;

-- Correct walk speeds.
UPDATE `creature_template` SET `speed_walk`=2.4 WHERE `entry`=15517;
UPDATE `creature_template` SET `speed_walk`=0.4 WHERE `entry`=15667;
UPDATE `creature_template` SET `speed_walk`=4.8 WHERE `entry`=15712;
UPDATE `creature_template` SET `speed_walk`=2.4 WHERE `entry`=15800;
UPDATE `creature_template` SET `speed_walk`=2.4 WHERE `entry`=15904;
UPDATE `creature_template` SET `speed_walk`=2.4 WHERE `entry`=15910;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15925;
UPDATE `creature_template` SET `speed_walk`=4 WHERE `entry`=15957;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
