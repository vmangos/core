DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240424032507');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20240424032507');
-- Add your query below.


-- Table `spell_script_target`: spellId 4170 listed for TargetEntry 2595 does not have any implicit target TARGET_UNIT_SCRIPT_NEAR_CASTER(38) or TARGET_LOCATION_SCRIPT_NEAR_CASTER (46) or TARGET_GAMEOBJECT_SCRIPT_NEAR_CASTER (40).
-- Table `spell_script_target`: spellId 4170 listed for TargetEntry 2596 does not have any implicit target TARGET_UNIT_SCRIPT_NEAR_CASTER(38) or TARGET_LOCATION_SCRIPT_NEAR_CASTER (46) or TARGET_GAMEOBJECT_SCRIPT_NEAR_CASTER (40).
-- Table `spell_script_target`: spellId 4170 listed for TargetEntry 11054 does not have any implicit target TARGET_UNIT_SCRIPT_NEAR_CASTER(38) or TARGET_LOCATION_SCRIPT_NEAR_CASTER (46) or TARGET_GAMEOBJECT_SCRIPT_NEAR_CASTER (40).
DELETE FROM `spell_script_target` WHERE `entry`=4170;

-- ERROR: Table `locales_gossip_menu_option` has data for nonexistent gossip menu 3142 item 0, skipped.
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=3142;

-- Unknown item (entry=24418) in creature_equip_template.item1 for entry = 7013, forced to 0.
-- Unknown item (entry=24418) in creature_equip_template.item2 for entry = 7013, forced to 0.
DELETE FROM `creature_template` WHERE `entry`=7013;
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_id1`, `spell_id2`, `spell_id3`, `spell_id4`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (7013, 0, 'Blackrock Rampager', '', 17, 18, 35, 0, 0, 6035, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1, 1, 1, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 268959744, 0, 0, '');
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_id1`, `spell_id2`, `spell_id3`, `spell_id4`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (7013, 9, 'Blackrock Rampager', '', 17, 18, 35, 0, 0, 6035, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1, 1, 1, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 3, 0, 0, 7013, 0, 0, 0, 0, 0, 268959744, 0, 0, '');
UPDATE `creature_equip_template` SET `patch_min`=9 WHERE  `entry`=7013 AND `item1`=24418 AND `item2`=24418 AND `item3`=0;

-- Table `creature` has creature (GUID: 160009) with non existing creature entry 16232, skipped.
-- Table `creature` has creature (GUID: 160010) with non existing creature entry 16232, skipped.
-- Table `creature` has creature (GUID: 160011) with non existing creature entry 16232, skipped.
-- Table `creature` has creature (GUID: 160012) with non existing creature entry 16232, skipped.
-- Table `creature` has creature (GUID: 160013) with non existing creature entry 16232, skipped.
UPDATE `creature` SET `patch_min`=9 WHERE `id`=16232;

-- Table 'creature_loot_template' entry 14682 isn't creature entry and not referenced from loot, and then useless.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `entry`=14682 && `patch_min` < 9;

-- Table 'creature_loot_template' entry 14686 isn't creature entry and not referenced from loot, and then useless.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `entry`=14686 && `patch_min` < 9;

-- Table 'creature_loot_template' entry 15980 isn't creature entry and not referenced from loot, and then useless.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `entry`=15980 && `patch_min` < 9;

-- Table 'creature_loot_template' entry 16154 isn't creature entry and not referenced from loot, and then useless.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `entry`=16154 && `patch_min` < 9;

-- Fix missing min patch for gameobjects in pools.
UPDATE `pool_gameobject_template` SET `patch_min`=3 WHERE `id`=179908; -- Hinterlands - Slagtree's Lost Tools
UPDATE `pool_template` SET `patch_min`=3 WHERE `entry`=158;
UPDATE `pool_gameobject_template` SET `patch_min`=3 WHERE `id`=179922; -- Hinterlands - Vessel of Tainted Blood
UPDATE `pool_template` SET `patch_min`=3 WHERE `entry`=155;
UPDATE `pool_gameobject_template` SET `patch_min`=5 WHERE `id`=180215; -- Zul'Gurub - Hakkari Thorium Vein
UPDATE `pool_template` SET `patch_min`=5 WHERE `entry`=21401;
UPDATE `pool_gameobject_template` SET `patch_min`=8 WHERE `id`=181098; -- Burning Steppes - Volcanic Ash
UPDATE `pool_template` SET `patch_min`=8 WHERE `entry`=160;
UPDATE `pool_gameobject_template` SET `patch_min`=8 WHERE `id`=181053; -- Dustwallow Marsh - Basket of Bloodkelp
UPDATE `pool_template` SET `patch_min`=8 WHERE `entry`=159;
UPDATE `gameobject` SET `patch_min`=0 WHERE `id`=153556;
UPDATE `gameobject` SET `patch_min`=0 WHERE `id`=13359;
UPDATE `gameobject` SET `patch_min`=0 WHERE `id`=13873;

-- ERROR: Gameobject (Entry: 180053 GoType: 8) have data2=181029 but trap GO (Entry 181029) not exist in `gameobject_template`.
DELETE FROM `gameobject_template` WHERE `entry`=180053;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (180053, 0, 5, 197, 'Brazier', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (180053, 8, 8, 197, 'Brazier', 0, 0, 1, 4, 10, 181029, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

-- Table 'creature_loot_template' entry 15807 isn't creature entry and not referenced from loot, and then useless.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `entry`=15807 && `patch_min` < 7;

-- Table 'creature_loot_template' entry 15808 isn't creature entry and not referenced from loot, and then useless.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `entry`=15808 && `patch_min` < 7;

-- Table 'creature_loot_template' entry 15810 isn't creature entry and not referenced from loot, and then useless.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `entry`=15810 && `patch_min` < 7;

-- Table 'creature_loot_template' entry 15811 isn't creature entry and not referenced from loot, and then useless.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `entry`=15811 && `patch_min` < 7;

-- Table 'creature_loot_template' entry 15812 isn't creature entry and not referenced from loot, and then useless.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `entry`=15812 && `patch_min` < 7;

-- Table 'pickpocketing_loot_template' entry 14342 (creature pickpocket lootid) not exist but used as loot id in DB.
UPDATE `pickpocketing_loot_template` SET `patch_min`=5 WHERE `entry`=14342;

-- Table `creature` has creature (GUID: 42945) with non existing creature entry 15213, skipped.
-- Table `creature` has creature (GUID: 42946) with non existing creature entry 15213, skipped.
-- Table `creature` has creature (GUID: 42954) with non existing creature entry 15213, skipped.
-- Table `creature` has creature (GUID: 42986) with non existing creature entry 15213, skipped.
-- Table `creature` has creature (GUID: 42987) with non existing creature entry 15213, skipped.
UPDATE `creature` SET `patch_min`=6 WHERE `id2`=15213;

-- Table `gameobject` has gameobject (GUID: 234879) with non existing gameobject entry 180632, skipped.
UPDATE `gameobject` SET `patch_min`=6 WHERE `id`=180632;

-- Table `gameobject` has gameobject (GUID: 234878) with non existing gameobject entry 180631, skipped.
UPDATE `gameobject` SET `patch_min`=6 WHERE `id`=180631;

-- Table `gameobject` has gameobject (GUID: 55704) with non existing gameobject entry 180754, skipped.
-- Table `gameobject` has gameobject (GUID: 55705) with non existing gameobject entry 180754, skipped.
-- Table `gameobject` has gameobject (GUID: 55706) with non existing gameobject entry 180754, skipped.
-- Table `gameobject` has gameobject (GUID: 55707) with non existing gameobject entry 180754, skipped.
-- Table `gameobject` has gameobject (GUID: 55708) with non existing gameobject entry 180754, skipped.
-- Table `gameobject` has gameobject (GUID: 55709) with non existing gameobject entry 180754, skipped.
-- Table `gameobject` has gameobject (GUID: 55710) with non existing gameobject entry 180754, skipped.
-- Table `gameobject` has gameobject (GUID: 55711) with non existing gameobject entry 180754, skipped.
-- Table `gameobject` has gameobject (GUID: 55712) with non existing gameobject entry 180754, skipped.
-- Table `gameobject` has gameobject (GUID: 55713) with non existing gameobject entry 180754, skipped.
-- Table `gameobject` has gameobject (GUID: 55714) with non existing gameobject entry 180754, skipped.
-- Table `gameobject` has gameobject (GUID: 55715) with non existing gameobject entry 180754, skipped.
-- Table `gameobject` has gameobject (GUID: 55716) with non existing gameobject entry 180754, skipped.
-- Table `gameobject` has gameobject (GUID: 55717) with non existing gameobject entry 180754, skipped.
-- Table `gameobject` has gameobject (GUID: 55718) with non existing gameobject entry 180754, skipped.
-- Table `gameobject` has gameobject (GUID: 55719) with non existing gameobject entry 180754, skipped.
-- Table `gameobject` has gameobject (GUID: 55720) with non existing gameobject entry 180754, skipped.
-- Table `gameobject` has gameobject (GUID: 55721) with non existing gameobject entry 180754, skipped.
-- Table `gameobject` has gameobject (GUID: 55722) with non existing gameobject entry 180754, skipped.
-- Table `gameobject` has gameobject (GUID: 55723) with non existing gameobject entry 180754, skipped.
-- Table `gameobject` has gameobject (GUID: 55724) with non existing gameobject entry 180754, skipped.
-- Table `gameobject` has gameobject (GUID: 55725) with non existing gameobject entry 180754, skipped.
-- Table `gameobject` has gameobject (GUID: 55726) with non existing gameobject entry 180754, skipped.
-- Table `gameobject` has gameobject (GUID: 55727) with non existing gameobject entry 180754, skipped.
-- Table `gameobject` has gameobject (GUID: 55728) with non existing gameobject entry 180754, skipped.
-- Table `gameobject` has gameobject (GUID: 55729) with non existing gameobject entry 180754, skipped.
-- Table `gameobject` has gameobject (GUID: 55730) with non existing gameobject entry 180754, skipped.
-- Table `gameobject` has gameobject (GUID: 55731) with non existing gameobject entry 180754, skipped.
-- Table `gameobject` has gameobject (GUID: 55732) with non existing gameobject entry 180754, skipped.
-- Table `gameobject` has gameobject (GUID: 55733) with non existing gameobject entry 180754, skipped.
-- Table `gameobject` has gameobject (GUID: 55734) with non existing gameobject entry 180754, skipped.
-- Table `gameobject` has gameobject (GUID: 55735) with non existing gameobject entry 180754, skipped.
-- Table `gameobject` has gameobject (GUID: 55736) with non existing gameobject entry 180754, skipped.
-- Table `gameobject` has gameobject (GUID: 55737) with non existing gameobject entry 180754, skipped.
-- Table `gameobject` has gameobject (GUID: 55738) with non existing gameobject entry 180754, skipped.
-- Table `gameobject` has gameobject (GUID: 55739) with non existing gameobject entry 180754, skipped.
-- Table `gameobject` has gameobject (GUID: 55740) with non existing gameobject entry 180754, skipped.
UPDATE `gameobject` SET `patch_min`=6 WHERE `id`=180754;

-- Table `gameobject` has gameobject (GUID: 55741) with non existing gameobject entry 180700, skipped.
UPDATE `gameobject` SET `patch_min`=6 WHERE `id`=180700;

-- Table `gameobject` has gameobject (GUID: 68914) with non existing gameobject entry 180164, skipped.
-- Table `gameobject` has gameobject (GUID: 68913) with non existing gameobject entry 180164, skipped.
-- Table `gameobject` has gameobject (GUID: 67157) with non existing gameobject entry 180164, skipped.
-- Table `gameobject` has gameobject (GUID: 67156) with non existing gameobject entry 180164, skipped.
-- Table `gameobject` has gameobject (GUID: 67155) with non existing gameobject entry 180164, skipped.
UPDATE `gameobject` SET `patch_min`=5 WHERE `id`=180164;

-- Table `gameobject` has gameobject (GUID: 68543) with non existing gameobject entry 180168, skipped.
-- Table `gameobject` has gameobject (GUID: 68542) with non existing gameobject entry 180168, skipped.
-- Table `gameobject` has gameobject (GUID: 68541) with non existing gameobject entry 180168, skipped.
-- Table `gameobject` has gameobject (GUID: 68540) with non existing gameobject entry 180168, skipped.
-- Table `gameobject` has gameobject (GUID: 68539) with non existing gameobject entry 180168, skipped.
-- Table `gameobject` has gameobject (GUID: 67132) with non existing gameobject entry 180168, skipped.
-- Table `gameobject` has gameobject (GUID: 67131) with non existing gameobject entry 180168, skipped.
-- Table `gameobject` has gameobject (GUID: 67130) with non existing gameobject entry 180168, skipped.
-- Table `gameobject` has gameobject (GUID: 67129) with non existing gameobject entry 180168, skipped.
-- Table `gameobject` has gameobject (GUID: 67128) with non existing gameobject entry 180168, skipped.
-- Table `gameobject` has gameobject (GUID: 67127) with non existing gameobject entry 180168, skipped.
-- Table `gameobject` has gameobject (GUID: 67126) with non existing gameobject entry 180168, skipped.
-- Table `gameobject` has gameobject (GUID: 67125) with non existing gameobject entry 180168, skipped.
UPDATE `gameobject` SET `patch_min`=5 WHERE `id`=180168;

-- Table `gameobject` has gameobject (GUID: 68701) with non existing gameobject entry 180167, skipped.
-- Table `gameobject` has gameobject (GUID: 68700) with non existing gameobject entry 180167, skipped.
-- Table `gameobject` has gameobject (GUID: 68699) with non existing gameobject entry 180167, skipped.
-- Table `gameobject` has gameobject (GUID: 68698) with non existing gameobject entry 180167, skipped.
-- Table `gameobject` has gameobject (GUID: 67141) with non existing gameobject entry 180167, skipped.
-- Table `gameobject` has gameobject (GUID: 67140) with non existing gameobject entry 180167, skipped.
-- Table `gameobject` has gameobject (GUID: 67139) with non existing gameobject entry 180167, skipped.
-- Table `gameobject` has gameobject (GUID: 67138) with non existing gameobject entry 180167, skipped.
-- Table `gameobject` has gameobject (GUID: 67137) with non existing gameobject entry 180167, skipped.
-- Table `gameobject` has gameobject (GUID: 67136) with non existing gameobject entry 180167, skipped.
-- Table `gameobject` has gameobject (GUID: 67135) with non existing gameobject entry 180167, skipped.
-- Table `gameobject` has gameobject (GUID: 67134) with non existing gameobject entry 180167, skipped.
-- Table `gameobject` has gameobject (GUID: 67133) with non existing gameobject entry 180167, skipped.
UPDATE `gameobject` SET `patch_min`=5 WHERE `id`=180167;

-- Table `gameobject` has gameobject (GUID: 67154) with non existing gameobject entry 180165, skipped.
-- Table `gameobject` has gameobject (GUID: 67153) with non existing gameobject entry 180165, skipped.
-- Table `gameobject` has gameobject (GUID: 67152) with non existing gameobject entry 180165, skipped.
-- Table `gameobject` has gameobject (GUID: 67151) with non existing gameobject entry 180165, skipped.
-- Table `gameobject` has gameobject (GUID: 67150) with non existing gameobject entry 180165, skipped.
-- Table `gameobject` has gameobject (GUID: 68867) with non existing gameobject entry 180165, skipped.
UPDATE `gameobject` SET `patch_min`=5 WHERE `id`=180165;

-- Table `gameobject` has gameobject (GUID: 67149) with non existing gameobject entry 180166, skipped.
-- Table `gameobject` has gameobject (GUID: 67148) with non existing gameobject entry 180166, skipped.
-- Table `gameobject` has gameobject (GUID: 67147) with non existing gameobject entry 180166, skipped.
-- Table `gameobject` has gameobject (GUID: 67146) with non existing gameobject entry 180166, skipped.
-- Table `gameobject` has gameobject (GUID: 67145) with non existing gameobject entry 180166, skipped.
-- Table `gameobject` has gameobject (GUID: 67144) with non existing gameobject entry 180166, skipped.
-- Table `gameobject` has gameobject (GUID: 67143) with non existing gameobject entry 180166, skipped.
-- Table `gameobject` has gameobject (GUID: 67142) with non existing gameobject entry 180166, skipped.
UPDATE `gameobject` SET `patch_min`=5 WHERE `id`=180166;

-- Table `gameobject` has gameobject (GUID: 99915) with non existing gameobject entry 180401, skipped.
UPDATE `gameobject` SET `patch_min`=5 WHERE `id`=180401;

-- Table `gameobject` has gameobject (GUID: 99914) with non existing gameobject entry 180250, skipped.
UPDATE `gameobject` SET `patch_min`=5 WHERE `id`=180250;

-- Table `gameobject` has gameobject (GUID: 99913) with non existing gameobject entry 180249, skipped.
UPDATE `gameobject` SET `patch_min`=5 WHERE `id`=180249;

-- Table `gameobject` has gameobject (GUID: 99912) with non existing gameobject entry 180402, skipped.
UPDATE `gameobject` SET `patch_min`=5 WHERE `id`=180402;

-- Table `gameobject` has gameobject (GUID: 25458) with non existing gameobject entry 180215, skipped.
-- Table `gameobject` has gameobject (GUID: 48962) with non existing gameobject entry 180215, skipped.
-- Table `gameobject` has gameobject (GUID: 48963) with non existing gameobject entry 180215, skipped.
-- Table `gameobject` has gameobject (GUID: 48964) with non existing gameobject entry 180215, skipped.
-- Table `gameobject` has gameobject (GUID: 48965) with non existing gameobject entry 180215, skipped.
-- Table `gameobject` has gameobject (GUID: 48966) with non existing gameobject entry 180215, skipped.
-- Table `gameobject` has gameobject (GUID: 48967) with non existing gameobject entry 180215, skipped.
-- Table `gameobject` has gameobject (GUID: 48968) with non existing gameobject entry 180215, skipped.
-- Table `gameobject` has gameobject (GUID: 48969) with non existing gameobject entry 180215, skipped.
-- Table `gameobject` has gameobject (GUID: 48970) with non existing gameobject entry 180215, skipped.
-- Table `gameobject` has gameobject (GUID: 48971) with non existing gameobject entry 180215, skipped.
-- Table `gameobject` has gameobject (GUID: 48972) with non existing gameobject entry 180215, skipped.
UPDATE `gameobject` SET `patch_min`=5 WHERE `id`=180215;

-- `pool_gameobject` has a non existing gameobject spawn (GUID: 67148) defined for pool id (1035), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 67149) defined for pool id (1035), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 67150) defined for pool id (1035), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 67151) defined for pool id (1035), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 67152) defined for pool id (1035), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 67153) defined for pool id (1035), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 67154) defined for pool id (1035), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 67155) defined for pool id (1035), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 67156) defined for pool id (1035), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 67157) defined for pool id (1035), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 67125) defined for pool id (1035), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 67134) defined for pool id (1035), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 68867) defined for pool id (1035), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 67130) defined for pool id (1035), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 68698) defined for pool id (1035), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 68543) defined for pool id (1035), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 68542) defined for pool id (1035), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 67143) defined for pool id (1035), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 67141) defined for pool id (1035), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 67132) defined for pool id (1035), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 68541) defined for pool id (1035), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 68540) defined for pool id (1035), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 68539) defined for pool id (1035), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 67145) defined for pool id (1035), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 67144) defined for pool id (1035), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 67142) defined for pool id (1035), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 67140) defined for pool id (1035), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 67139) defined for pool id (1035), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 67138) defined for pool id (1035), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 67137) defined for pool id (1035), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 67136) defined for pool id (1035), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 67135) defined for pool id (1035), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 67133) defined for pool id (1035), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 67131) defined for pool id (1035), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 67129) defined for pool id (1035), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 67128) defined for pool id (1035), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 67127) defined for pool id (1035), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 67146) defined for pool id (1035), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 68700) defined for pool id (1035), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 68699) defined for pool id (1035), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 67147) defined for pool id (1035), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 67126) defined for pool id (1035), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 68701) defined for pool id (1035), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 68913) defined for pool id (1035), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 68914) defined for pool id (1035), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 28715) defined for pool id (1035), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 28712) defined for pool id (1035), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 28763) defined for pool id (1035), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 28757) defined for pool id (1035), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 28761) defined for pool id (1035), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 28711) defined for pool id (1035), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 28714) defined for pool id (1035), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 28756) defined for pool id (1035), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 28713) defined for pool id (1035), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 28718) defined for pool id (1035), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 28758) defined for pool id (1035), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 28755) defined for pool id (1035), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 28716) defined for pool id (1035), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 28717) defined for pool id (1035), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 28759) defined for pool id (1035), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 28760) defined for pool id (1035), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 28762) defined for pool id (1035), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 28710) defined for pool id (1035), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 28709) defined for pool id (1035), skipped.
UPDATE `pool_gameobject` SET `patch_min`=5 WHERE `pool_entry`=1035;
UPDATE `pool_template` SET `patch_min`=5 WHERE `entry`=1035;

-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38277) defined for pool id (4033), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38274) defined for pool id (4030), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38273) defined for pool id (4029), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 29691) defined for pool id (4055), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 29690) defined for pool id (4053), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38265) defined for pool id (4021), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38263) defined for pool id (4019), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38261) defined for pool id (4017), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38259) defined for pool id (4015), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38257) defined for pool id (4013), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38245) defined for pool id (4001), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38252) defined for pool id (4008), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38251) defined for pool id (4007), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38249) defined for pool id (4005), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38247) defined for pool id (4003), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38266) defined for pool id (4022), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38262) defined for pool id (4018), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38256) defined for pool id (4012), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38271) defined for pool id (4027), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38270) defined for pool id (4026), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38280) defined for pool id (4036), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38282) defined for pool id (4038), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38283) defined for pool id (4039), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38285) defined for pool id (4041), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38286) defined for pool id (4042), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38288) defined for pool id (4044), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38290) defined for pool id (4046), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38291) defined for pool id (4047), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38293) defined for pool id (4049), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38295) defined for pool id (4051), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38296) defined for pool id (4052), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38297) defined for pool id (4053), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38299) defined for pool id (4055), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38300) defined for pool id (4056), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38302) defined for pool id (4058), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38303) defined for pool id (4059), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38306) defined for pool id (4062), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38307) defined for pool id (4063), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38308) defined for pool id (4064), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38312) defined for pool id (4068), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38314) defined for pool id (4070), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38315) defined for pool id (4071), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38316) defined for pool id (4072), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38319) defined for pool id (4075), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38322) defined for pool id (4078), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38323) defined for pool id (4079), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38324) defined for pool id (4080), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38325) defined for pool id (4081), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38326) defined for pool id (4082), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38327) defined for pool id (4083), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38328) defined for pool id (4084), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38330) defined for pool id (4086), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38333) defined for pool id (4089), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38334) defined for pool id (4090), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38335) defined for pool id (4091), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38336) defined for pool id (4092), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38338) defined for pool id (4094), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38340) defined for pool id (4096), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38342) defined for pool id (4098), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38343) defined for pool id (4099), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38344) defined for pool id (4100), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38345) defined for pool id (4001), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38347) defined for pool id (4003), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38349) defined for pool id (4005), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38351) defined for pool id (4007), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38352) defined for pool id (4008), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38356) defined for pool id (4012), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38357) defined for pool id (4013), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38359) defined for pool id (4015), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38361) defined for pool id (4017), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38362) defined for pool id (4018), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38363) defined for pool id (4019), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38365) defined for pool id (4021), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38366) defined for pool id (4022), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38370) defined for pool id (4026), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38371) defined for pool id (4027), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38373) defined for pool id (4029), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38374) defined for pool id (4030), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38377) defined for pool id (4033), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38380) defined for pool id (4036), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38382) defined for pool id (4038), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38383) defined for pool id (4039), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38385) defined for pool id (4041), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38386) defined for pool id (4042), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38388) defined for pool id (4044), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38390) defined for pool id (4046), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38391) defined for pool id (4047), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38393) defined for pool id (4049), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38395) defined for pool id (4051), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38396) defined for pool id (4052), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38397) defined for pool id (4053), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38399) defined for pool id (4055), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38400) defined for pool id (4056), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38402) defined for pool id (4058), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38403) defined for pool id (4059), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38406) defined for pool id (4062), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38407) defined for pool id (4063), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38408) defined for pool id (4064), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38412) defined for pool id (4068), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38414) defined for pool id (4070), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38415) defined for pool id (4071), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38416) defined for pool id (4072), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38419) defined for pool id (4075), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38422) defined for pool id (4078), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38423) defined for pool id (4079), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38424) defined for pool id (4080), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38425) defined for pool id (4081), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38426) defined for pool id (4082), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38427) defined for pool id (4083), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38428) defined for pool id (4084), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38430) defined for pool id (4086), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38433) defined for pool id (4089), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38434) defined for pool id (4090), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38435) defined for pool id (4091), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38436) defined for pool id (4092), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38438) defined for pool id (4094), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38440) defined for pool id (4096), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38442) defined for pool id (4098), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38443) defined for pool id (4099), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 38444) defined for pool id (4100), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 26364) defined for pool id (4022), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 26365) defined for pool id (4027), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 26366) defined for pool id (4030), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 26367) defined for pool id (4062), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 26368) defined for pool id (4089), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 26369) defined for pool id (4001), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 29692) defined for pool id (4059), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 29693) defined for pool id (4071), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 29694) defined for pool id (4072), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 29695) defined for pool id (4081), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 29697) defined for pool id (4086), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 29698) defined for pool id (4089), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 29699) defined for pool id (4098), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 26370) defined for pool id (4053), skipped.
-- `pool_gameobject` has a non existing gameobject spawn (GUID: 26371) defined for pool id (4028), skipped.
UPDATE `gameobject` SET `patch_min`=0 WHERE `guid` IN (38277, 38274, 38273, 29691, 29690, 38265, 38263, 38261, 38259, 38257, 38245, 38252, 38251, 38249, 38247, 38266, 38262, 38256, 38271, 38270, 38280, 38282, 38283, 38285, 38286, 38288, 38290, 38291, 38293, 38295, 38296, 38297, 38299, 38300, 38302, 38303, 38306, 38307, 38308, 38312, 38314, 38315, 38316, 38319, 38322, 38323, 38324, 38325, 38326, 38327, 38328, 38330, 38333, 38334, 38335, 38336, 38338, 38340, 38342, 38343, 38344, 38345, 38347, 38349, 38351, 38352, 38356, 38357, 38359, 38361, 38362, 38363, 38365, 38366, 38370, 38371, 38373, 38374, 38377, 38380, 38382, 38383, 38385, 38386, 38388, 38390, 38391, 38393, 38395, 38396, 38397, 38399, 38400, 38402, 38403, 38406, 38407, 38408, 38412, 38414, 38415, 38416, 38419, 38422, 38423, 38424, 38425, 38426, 38427, 38428, 38430, 38433, 38434, 38435, 38436, 38438, 38440, 38442, 38443, 38444, 26364, 26365, 26366, 26367, 26368, 26369, 29692, 29693, 29694, 29695, 29697, 29698, 29699, 26370, 26371);

-- Table 'creature_loot_template' entry 11351 isn't creature entry and not referenced from loot, and then useless.
UPDATE `creature_loot_template` SET `patch_min`=5 WHERE `entry`=11351 && `patch_min` < 5;

-- Table 'creature_loot_template' entry 15111 isn't creature entry and not referenced from loot, and then useless.
UPDATE `creature_loot_template` SET `patch_min`=5 WHERE `entry`=15111 && `patch_min` < 5;

-- Unknown item (entry=19214) in creature_equip_template.item1 for entry = 3794, forced to 0.
DELETE FROM `creature_template` WHERE `entry`=3794;
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_id1`, `spell_id2`, `spell_id3`, `spell_id4`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (3794, 0, 'Druid of the Talon', '', 60, 60, 35, 0, 0, 2572, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1, 1, 1, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 8912896, 0, 0, '');
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_id1`, `spell_id2`, `spell_id3`, `spell_id4`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (3794, 4, 'Druid of the Talon', '', 60, 60, 35, 0, 0, 2572, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1, 1, 1, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 3, 0, 0, 3794, 0, 0, 0, 0, 0, 8912896, 0, 0, '');
UPDATE `creature_equip_template` SET `patch_min`=4 WHERE `entry`=3794 AND `item1`=19214 AND `item2`=0 AND `item3`=0;

-- Table `creature_template` have creature (Entry: 10162) with equipment_id 10162 not found in table `creature_equip_template`, set to no equipment.
DELETE FROM `creature_template` WHERE `entry`=10162;
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_id1`, `spell_id2`, `spell_id3`, `spell_id4`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (10162, 0, 'Lord Victor Nefarius', 'Lord of Blackrock', 63, 63, 14, 0, 5981, 9472, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 20, 5, 0, 2, 0, 3, 2, 1, 115, 100, 1.6, 16.85, 0.14, 0, 2000, 2000, 0, 15, 15, 15, 15, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 3, 0, 0, 0, 0, 0, 617299803, 0, 8, 2147549220, 78, 32770, 'boss_victor_nefarius');
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_id1`, `spell_id2`, `spell_id3`, `spell_id4`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (10162, 4, 'Lord Victor Nefarius', 'Lord of Blackrock', 63, 63, 14, 0, 5981, 9472, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 20, 5, 0, 2, 0, 3, 2, 1, 115, 100, 1.6, 16.85, 0.14, 0, 2000, 2000, 0, 15, 15, 15, 15, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 3, 0, 0, 10162, 0, 0, 617299803, 0, 8, 2147549220, 78, 32770, 'boss_victor_nefarius');

-- Table `creature_template` have creature (Entry: 11656) with equipment_id 11656 not found in table `creature_equip_template`, set to no equipment.
INSERT INTO `creature_equip_template` (`entry`, `probability`, `item1`, `item2`, `item3`, `patch_min`, `patch_max`) VALUES (11656, 1, 1902, 0, 0, 0, 2);

-- Table 'skinning_loot_template' entry 10990 isn't creature skinning id and not referenced from loot, and then useless.
UPDATE `skinning_loot_template` SET `patch_min`=3 WHERE `entry`=10990 && `patch_min` < 3;

-- Table `gameobject` has gameobject (GUID: 99896) with non existing gameobject entry 179675, skipped.
UPDATE `gameobject` SET `patch_min`=2 WHERE `id`=179675;

-- Table `gameobject` has gameobject (GUID: 99895) with non existing gameobject entry 179701, skipped.
UPDATE `gameobject` SET `patch_min`=2 WHERE `id`=179701;

-- Table `gameobject` has gameobject (GUID: 99894) with non existing gameobject entry 179677, skipped.
UPDATE `gameobject` SET `patch_min`=2 WHERE `id`=179677;

-- Table `gameobject` has gameobject (GUID: 3226) with non existing gameobject entry 179707, skipped.
UPDATE `gameobject` SET `patch_min`=2 WHERE `id`=179707;

-- Table `gameobject` has gameobject (GUID: 563) with non existing gameobject entry 179552, skipped.
UPDATE `gameobject` SET `patch_min`=1 WHERE `id`=179552;

-- Table 'creature_loot_template' entry 11487 isn't creature entry and not referenced from loot, and then useless.
UPDATE `creature_loot_template` SET `patch_min`=1 WHERE `entry`=11487 && `patch_min` < 1;

-- Table 'creature_loot_template' entry 12397 isn't creature entry and not referenced from loot, and then useless.
UPDATE `creature_loot_template` SET `patch_min`=1 WHERE `entry`=12397 && `patch_min` < 1;

-- Table 'creature_loot_template' entry 14321 isn't creature entry and not referenced from loot, and then useless.
UPDATE `creature_loot_template` SET `patch_min`=1 WHERE `entry`=14321 && `patch_min` < 1;

-- Table 'creature_loot_template' entry 14327 isn't creature entry and not referenced from loot, and then useless.
UPDATE `creature_loot_template` SET `patch_min`=1 WHERE `entry`=14327 && `patch_min` < 1;

-- Table 'skinning_loot_template' entry 10184 (creature skinning id) not exist but used as loot id in DB.
UPDATE `skinning_loot_template` SET `patch_min`=0 WHERE `entry`=10184;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
