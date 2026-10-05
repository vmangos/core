DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260724063021');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260724063021');
-- Add your query below.


-- Silver Tabby (minipet)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~2048 /*Despawn Instantly*/ WHERE `entry`=7381; -- No Match

-- Mr. Wiggles (minipet)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=16548; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=16548; -- DB2 Matches

-- C'Thun
-- UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 512 /*Uninteractible*/ WHERE `entry`=15727; -- DB2 Matches
-- UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 33554432 /*Ignore Combat*/ WHERE `entry`=15727; -- DB2 Matches

-- Kandrostrasz
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15503; -- No Match

-- Andorgos
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15502; -- No Match

-- Vethsera
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15504; -- No Match

-- World Trigger
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~536870912 /*Floating <Don't Use>*/ WHERE `entry`=15384; -- No Match

-- Windcaller Yessendra
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15498; -- No Match

-- Keyl Swiftclaw
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15500; -- No Match

-- Windcaller Kaldon
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15540; -- No Match

-- Cenarion Hold Infantry
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=15184; -- DB2 Matches

-- 1383: Saved Variable In Index 30050 Is Equal Or Greater Than 7
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1383, 11, 30050, 7, 1, 0, 0);
-- 1384: Saved Variable In Index 30050 Is Equal Or Less Than 11
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1384, 11, 30050, 11, 2, 0, 0);
-- 1385: (1383: Saved Variable In Index 30050 Is Equal Or Greater Than 7) And (1384: Saved Variable In Index 30050 Is Equal Or Less Than 11)
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1385, -1, 1383, 1384, 0, 0, 0);

-- Events list for Cenarion Hold Infantry
DELETE FROM `creature_ai_events` WHERE `creature_id`=15184;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(1518401, 15184, 0, 9, 0, 100, 13, 15, 85, 7500, 16000, 1518401, 0, 0, 'Cenarion Hold Infantry - Cast Summon Player'),
(1518402, 15184, 1385, 1, 0, 100, 1, 1000, 1000, 1000, 1000, 1518402, 0, 0, 'Cenarion Hold Infantry - Remove Immune to NPC flag OOC (AQ Opening)'),
(1518403, 15184, 85, 4, 0, 50, 2, 0, 0, 0, 0, 1518403, 1518404, 0, 'Cenarion Hold Infantry - Say Text on Aggro');
DELETE FROM `creature_ai_scripts` WHERE `id`=1518401;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1518401, 0, 0, 15, 26229, 1, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 84, 'Cenarion Hold Infantry - Cast Spell Summon Player');
DELETE FROM `creature_ai_scripts` WHERE `id`=1518402;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1518402, 0, 0, 4, 46, 512, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cenarion Hold Infantry - Remove Immune to NPC Flag');
DELETE FROM `creature_ai_scripts` WHERE `id`=1518403;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1518403, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10948, 10949, 10950, 10951, 0, 0, 0, 0, 0, 'Cenarion Hold Infantry - Say Text');
DELETE FROM `creature_ai_scripts` WHERE `id`=1518404;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1518404, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 10952, 10953, 10954, 10955, 0, 0, 0, 0, 0, 'Cenarion Hold Infantry - Say Text');

-- Kania
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15419; -- No Match

-- J.D. Shadesong
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15614; -- No Match

-- Warden Haro
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15499; -- No Match

-- Dark Whelpling (minipet)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=7543; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=7543; -- DB2 Matches

-- Squire Leoren Mal'derath
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15722; -- No Match

-- Runk Windtamer
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~4194304 /*PvP Enabling*/ WHERE `entry`=15178; -- No Match

-- Krakle's Thermometer
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~536870912 /*Floating <Don't Use>*/ WHERE `entry`=10541; -- DB2 Matches

-- Gadgetzan Bruiser
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4 /*No Loot*/ WHERE `entry`=9460 && `patch` > 0; -- DB2 Matches

-- Chief Engineer Bilgewhizzle
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 134217728 /*Calls Guards*/ WHERE `entry`=7407; -- No Match

-- Innkeeper Fizzgrimble
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~4194304 /*PvP Enabling*/ WHERE `entry`=7733 && `patch` < 9; -- No Match
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~134217728 /*Calls Guards*/ WHERE `entry`=7733 && `patch` < 9; -- No Match
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (7733, 9, 'Innkeeper Fizzgrimble', 'Innkeeper', 30, 30, 474, 135, 2890, 7346, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.05, 1, 1, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 3, 0, 0, 7733, 0, 0, 0, 0, 0, 138936326, 0, 2, '');

-- Theramore Lieutenant
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=4947; -- DB2 Matches

-- Officer Ironbeard
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15764; -- No Match

-- Gurky (minipet)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 268435456 /*Can Swim*/ WHERE `entry`=16069; -- DB2 Matches

-- Warsong Gulch Herald
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=14645; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=14645; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 512 /*Uninteractible*/ WHERE `entry`=14645; -- DB2 Matches

-- PvP CTF Credit Marker
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=14732; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=14732; -- DB2 Matches

-- Spotlight
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=15631; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=15631; -- DB2 Matches

-- Horde Battle Standard
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~64 /*ImmuneNPC*/ WHERE `entry`=14466; -- DB2 Matches

-- Smolderweb Hatchling (minipet)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=10598; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=10598; -- DB2 Matches

-- Yarr Hammerstone
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=5392; -- DB2 Matches

-- Loslor Rudge
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=1694; -- DB2 Matches

-- Lothos Riftwaker
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~2097152 /*Visible to Ghosts*/ WHERE `entry`=14387 && `patch` < 9; -- No Match
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (14387, 9, 'Lothos Riftwaker', NULL, 60, 60, 35, 3, 5750, 7010, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1.14286, 20, 5, 0, 7, 0, 1, 2, 1, 1, 1, 1.35, 5.4, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 2097254, 0, 2, '');

-- Orb of Domination
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=14453; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=14453; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 512 /*Uninteractible*/ WHERE `entry`=14453; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 2147483648 /*Large (AOI): Caution, Expensive*/ WHERE `entry`=14453; -- DB2 Matches

-- Blackwing Orb Trigger
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=14449; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 512 /*Uninteractible*/ WHERE `entry`=14449; -- DB2 Matches

-- Blackwing Trigger
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=12999; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=12999; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 512 /*Uninteractible*/ WHERE `entry`=12999; -- DB2 Matches

-- Nefarian's Troops
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=14459; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=14459; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 512 /*Uninteractible*/ WHERE `entry`=14459; -- DB2 Matches

-- Tortured Drake
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=13976; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=13976; -- DB2 Matches

-- Officer Porterhouse
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15763; -- No Match

-- Fizzlebang Booms
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=5569; -- DB2 Matches

-- Green Wing Macaw (minipet)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=7387; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=7387; -- DB2 Matches

-- Mini Diablo (minipet)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=11326; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=11326; -- DB2 Matches

-- Herald
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=14848; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=14848; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 512 /*Uninteractible*/ WHERE `entry`=14848; -- DB2 Matches

-- Spike
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=15072; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=15072; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~512 /*Uninteractible*/ WHERE `entry`=15072; -- DB2 Matches

-- Underfoot
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=15071; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=15071; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~512 /*Uninteractible*/ WHERE `entry`=15071; -- DB2 Matches

-- Speedy (minipet)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=16547; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=16547; -- DB2 Matches

-- Comar Villard
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4194304 /*PvP Enabling*/ WHERE `entry`=5683; -- No Match

-- Leonid Barthalomew the Revered
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=11036; -- DB2 Matches

-- Lord Maxwell Tyrosus
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=11034; -- DB2 Matches

-- Pilot Stonegear
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=1377; -- DB2 Matches

-- Pilot Bellowfiz
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=1378; -- DB2 Matches

-- Franclorn Forgewright
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=8888; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=8888; -- DB2 Matches

-- Crimson Whelpling (minipet)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=7544; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=7544; -- DB2 Matches

-- Green Drakonid Spawner
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=14310; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=14310; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 512 /*Uninteractible*/ WHERE `entry`=14310; -- DB2 Matches

-- Blue Drakonid Spawner
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=14312; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=14312; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 512 /*Uninteractible*/ WHERE `entry`=14312; -- DB2 Matches

-- Silverwing Emissary
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~4194304 /*PvP Enabling*/ WHERE `entry`=15102; -- No Match

-- Veron Amberstill
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=1261; -- DB2 Matches

-- Injured Alliance Soldier
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=12938; -- DB2 Matches

-- Critically Injured Alliance Soldier
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=12937; -- DB2 Matches

-- Badly Injured Alliance Soldier
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=12936; -- DB2 Matches

-- Fizzles
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=1419; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=1419; -- DB2 Matches

-- Clavicus Knavingham
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=14722; -- No Match

-- Officer Maloof
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15766; -- No Match

-- Miss Danna
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~32 /*ImmunePC*/ WHERE `entry`=3513; -- No Match
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~64 /*ImmuneNPC*/ WHERE `entry`=3513; -- No Match
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4194304 /*PvP Enabling*/ WHERE `entry`=3513; -- No Match

-- Geoff
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=3509; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=3509; -- DB2 Matches

-- Stormwind Royal Guard
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4 /*No Loot*/ WHERE `entry`=1756 && `patch` > 0; -- DB2 Matches

-- Aedis Brom
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4 /*No Loot*/ WHERE `entry`=1478 && `patch` > 0; -- DB2 Matches

-- Christoph Faral
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4 /*No Loot*/ WHERE `entry`=1477 && `patch` > 0; -- DB2 Matches

-- Cleo
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=15066; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=15066; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~512 /*Uninteractible*/ WHERE `entry`=15066; -- DB2 Matches

-- Lady
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=15065; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=15065; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~512 /*Uninteractible*/ WHERE `entry`=15065; -- DB2 Matches

-- Shahram
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 512 /*Uninteractible*/ WHERE `entry`=10718; -- DB2 Matches

-- Lifelike Toad (minipet)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=12419; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=12419; -- DB2 Matches

-- Emerald Whelpling (minipet)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=7545; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=7545; -- DB2 Matches

-- Prairie Chicken (minipet)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=7392; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=7392; -- DB2 Matches

-- Peddlefeet (minipet)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=16085; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=16085; -- DB2 Matches

-- Sprite Darter Hatchling (minipet)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=9662; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=9662; -- DB2 Matches

-- Gapp Jinglepocket
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 134217728 /*Calls Guards*/ WHERE `entry`=14963; -- DB2 Matches

-- Siamese (minipet)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=7380; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=7380; -- DB2 Matches

-- Ancona Chicken (minipet)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=7394; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=7394; -- DB2 Matches

-- Mountaineer Droken
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4 /*No Loot*/ WHERE `entry`=1280 && `patch` > 0; -- DB2 Matches

-- Mountaineer Stenn
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4 /*No Loot*/ WHERE `entry`=1278 && `patch` > 0; -- DB2 Matches

-- Shadowmage Vivian Lagrave
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` | 2 WHERE `entry`=9078; -- DB2 Matches

-- Brown Prairie Dog (minipet)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=14421; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=14421; -- DB2 Matches

-- Mechanical Squirrel (minipet)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=2671; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=2671; -- DB2 Matches

-- Worg Pup (minipet)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=10259; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=10259; -- DB2 Matches

-- Whiskers the Rat (minipet)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=16549; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=16549; -- DB2 Matches

-- Snowshoe Rabbit (minipet)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=7560; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=7560; -- DB2 Matches

-- Qiraji Wasp
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=15414; -- DB2 Matches

-- Qiraji Tank
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=15422; -- DB2 Matches

-- Qiraji Drone
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=15421; -- DB2 Matches

-- Caelestrasz
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=15379; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15379; -- No Match

-- Merithra of the Dream
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=15378; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15378; -- No Match

-- Arygos
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=15380; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15380; -- No Match

-- Disgusting Oozeling (minipet)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=15429; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=15429; -- DB2 Matches

-- Cenarion Outrider
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15545; -- No Match

-- Theramore Combat Dummy
-- UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=4952; -- No Match

-- Jonathan the Revelator
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15693; -- No Match

-- Emperor Vek'lor
-- UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~1048576 /*No Melee (Flee)*/ WHERE `entry`=15276; -- No Match

-- Advisor Belgrum
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=2918; -- DB2 Matches

-- Jubling (minipet)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=14878; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=14878; -- DB2 Matches

-- Panda Cub (minipet)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=11325; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=11325; -- DB2 Matches

-- Sand Vortex
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 512 /*Uninteractible*/ WHERE `entry`=15428; -- DB2 Matches

-- Hive'Zara Wasp
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~1 /*Mountable*/ WHERE `entry`=15325; -- No Match

-- Vem
-- UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 8 /*Unkillable*/ WHERE `entry`=15544; -- No Match

-- Lord Kri
-- UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 8 /*Unkillable*/ WHERE `entry`=15511; -- No Match

-- Princess Yauj
-- UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 8 /*Unkillable*/ WHERE `entry`=15543; -- No Match

-- Field Repair Bot 74A
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=14337; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=14337; -- DB2 Matches

-- Eye Tentacle
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 2 /*No XP*/ WHERE `entry`=15726; -- No Match

-- Blood Parrot (minipet)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=11236; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=11236; -- DB2 Matches

-- Bronk Guzzlegear
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=1702; -- DB2 Matches

-- Beldin Steelgrill
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=1376; -- DB2 Matches

-- Orange Tabby (minipet)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~2048 /*Despawn Instantly*/ WHERE `entry`=7382; -- No Match

-- Cornish Rex (minipet)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~2048 /*Despawn Instantly*/ WHERE `entry`=7384; -- No Match

-- Alchemist Mallory
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=1215; -- DB2 Matches

-- Watcher Ladimore
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=576; -- DB2 Matches

-- Town Crier
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~64 /*ImmuneNPC*/ WHERE `entry`=468; -- DB2 Matches

-- Watcher Dodds
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=888; -- DB2 Matches

-- Jaquilina Dramet
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 134217728 /*Calls Guards*/ WHERE `entry`=2483; -- DB2 Matches

-- Barnil Stonepot
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 134217728 /*Calls Guards*/ WHERE `entry`=716; -- DB2 Matches

-- Sir S. J. Erlgadin
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 134217728 /*Calls Guards*/ WHERE `entry`=718; -- DB2 Matches

-- Ajeck Rouack
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 134217728 /*Calls Guards*/ WHERE `entry`=717; -- DB2 Matches

-- Hemet Nesingwary
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 134217728 /*Calls Guards*/ WHERE `entry`=715; -- DB2 Matches

-- Hyacinth Macaw (minipet)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=7391; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=7391; -- DB2 Matches

-- Bronze Drakonid Spawner
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=14311; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=14311; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 512 /*Uninteractible*/ WHERE `entry`=14311; -- DB2 Matches

-- Targot Jinglepocket
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 134217728 /*Calls Guards*/ WHERE `entry`=15124; -- DB2 Matches

-- Hive'Ashi Worker
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~64 /*ImmuneNPC*/ WHERE `entry`=11721; -- DB2 Matches

-- Stormpike Battleguard
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=14284; -- DB2 Matches

-- Irondeep Skullthumper
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~4 /*No Loot*/ WHERE `entry`=11602; -- No Match

-- Irondeep Shaman
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~4 /*No Loot*/ WHERE `entry`=11600; -- No Match

-- Tranquil Mechanical Yeti (minipet)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=15699; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=15699; -- DB2 Matches

-- Stormpike Bowman
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=13358; -- DB2 Matches

-- Trigger Guse
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=14026; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=14026; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 512 /*Uninteractible*/ WHERE `entry`=14026; -- DB2 Matches

-- Frostwolf Bowman
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=13359; -- DB2 Matches

-- Wood Frog (minipet)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=7550; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=7550; -- DB2 Matches

-- Slidore's Gryphon
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=14946; -- DB2 Matches

-- Trigger Slidore
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=14030; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=14030; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 512 /*Uninteractible*/ WHERE `entry`=14030; -- DB2 Matches

-- Vipore's Gryphon
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=14948; -- DB2 Matches

-- Whitewhisker Overseer
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~4 /*No Loot*/ WHERE `entry`=11605; -- No Match

-- Trigger Vipore
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=14031; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=14031; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 512 /*Uninteractible*/ WHERE `entry`=14031; -- DB2 Matches

-- Grelkor
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` | 2 WHERE `entry`=3343; -- DB2 Matches

-- Guse's War Rider
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=14943; -- DB2 Matches

-- Jeztor's War Rider
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=14944; -- DB2 Matches

-- Kurdrum Barleybeard
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` | 2 WHERE `entry`=5139; -- DB2 Matches

-- PvP Mine Credit Marker
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=13796; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=13796; -- DB2 Matches

-- PvP Tower Credit Marker
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=13778; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=13778; -- DB2 Matches

-- PvP Graveyard Credit Marker
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=13756; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=13756; -- DB2 Matches

-- Tower Point Marshal
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=14767; -- No Match
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~4194304 /*PvP Enabling*/ WHERE `entry`=14767; -- No Match

-- Dun Baldar South Marshal
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=14763; -- No Match
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~4194304 /*PvP Enabling*/ WHERE `entry`=14763; -- No Match

-- Stonehearth Marshal
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=14765; -- No Match
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~4194304 /*PvP Enabling*/ WHERE `entry`=14765; -- No Match

-- Iceblood Marshal
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=14766; -- No Match
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~4194304 /*PvP Enabling*/ WHERE `entry`=14766; -- No Match

-- Dun Baldar North Marshal
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=14762; -- No Match
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~4194304 /*PvP Enabling*/ WHERE `entry`=14762; -- No Match

-- Trigger Mulverick
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=14027; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=14027; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 512 /*Uninteractible*/ WHERE `entry`=14027; -- DB2 Matches

-- Snowblind Ambusher
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` | 2 WHERE `entry`=11678; -- No Match

-- Hawk Owl (minipet)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~2048 /*Despawn Instantly*/ WHERE `entry`=7555; -- No Match

-- Winter Reindeer (minipet)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=15706; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=15706; -- DB2 Matches

-- Binjy Featherwhistle
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=7954; -- DB2 Matches

-- Razorgore the Untamed
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4 /*No Loot*/ WHERE `entry`=12435; -- DB2 Matches

-- Monster Generator (Blackwing)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 512 /*Uninteractible*/ WHERE `entry`=12434; -- DB2 Matches

-- Yarlyn Amberstill
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=1263; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=1263; -- DB2 Matches

-- The Master's Eye
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=15963; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=15963; -- DB2 Matches

-- Melnan Darkstone
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=14842; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=14842; -- DB2 Matches

-- Irondeep Miner
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~4 /*No Loot*/ WHERE `entry`=13396; -- No Match

-- Champion Irondeep Guard
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~4 /*No Loot*/ WHERE `entry`=13554; -- No Match

-- Champion Irondeep Surveyor
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~4 /*No Loot*/ WHERE `entry`=13557; -- No Match

-- Greishan Ironstove
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=3291; -- DB2 Matches

-- Trigger Ichman
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=14029; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=14029; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 512 /*Uninteractible*/ WHERE `entry`=14029; -- DB2 Matches

-- Ivus the Forest Lord
-- UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~64 /*ImmuneNPC*/ WHERE `entry`=13419; -- No Match

-- Red Drakonid Spawner
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=14309; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=14309; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 512 /*Uninteractible*/ WHERE `entry`=14309; -- DB2 Matches

-- Voodoo Spirit
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 512 /*Uninteractible*/ WHERE `entry`=15009; -- DB2 Matches

-- Razzashi Cobra
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4 /*No Loot*/ WHERE `entry`=11373; -- DB2 Matches

-- Chained Spirit
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=15117; -- DB2 Matches

-- Matt
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=794; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=794; -- DB2 Matches

-- Officer Lunalight
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15762; -- No Match

-- Auctioneer Silva'las
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15678; -- No Match

-- Auctioneer Cazarez
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15679; -- No Match

-- Curgle Cranklehop
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 134217728 /*Calls Guards*/ WHERE `entry`=7763; -- DB2 Matches

-- Sprinkle
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~4194304 /*PvP Enabling*/ WHERE `entry`=7583 && `patch` < 9; -- No Match
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~134217728 /*Calls Guards*/ WHERE `entry`=7583 && `patch` < 9; -- No Match
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (7583, 9, 'Sprinkle', '', 30, 30, 474, 2, 0, 7175, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 8, 1, 1.05, 1, 1, 1.35, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 3, 0, 0, 7583, 0, 0, 0, 0, 0, 138936326, 0, 2, '');

-- Andi Lynn
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 134217728 /*Calls Guards*/ WHERE `entry`=11758; -- DB2 Matches

-- Turuk Amberstill
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=3177; -- DB2 Matches

-- Rudra Amberstill
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=1265; -- DB2 Matches

-- Stormpike Emissary
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~32 /*ImmunePC*/ WHERE `entry`=15103; -- DB2 Matches

-- Icewing Marshal
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=14764; -- No Match
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~4194304 /*PvP Enabling*/ WHERE `entry`=14764; -- No Match

-- Mirvyna Jinglepocket
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 134217728 /*Calls Guards*/ WHERE `entry`=14961; -- DB2 Matches

-- Mountaineer Brokk
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4 /*No Loot*/ WHERE `entry`=1276 && `patch` > 0; -- DB2 Matches

-- Deeprun Diver
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=14121; -- DB2 Matches

-- East Frostwolf Marshal
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=14768; -- No Match
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~4194304 /*PvP Enabling*/ WHERE `entry`=14768; -- No Match

-- Prospector Ironboot
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~4194304 /*PvP Enabling*/ WHERE `entry`=10460 && `patch` < 9; -- No Match
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~134217728 /*Calls Guards*/ WHERE `entry`=10460 && `patch` < 9; -- No Match
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `totem_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES (10460, 9, 'Prospector Ironboot', '', 48, 48, 474, 2, 0, 10195, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 100, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.25, 1, 0.25, 0.95, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 3, 0, 0, 10460, 0, 0, 0, 0, 0, 138936390, 0, 2, '');

-- Yeh'kinya
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 134217728 /*Calls Guards*/ WHERE `entry`=8579; -- DB2 Matches

-- Sergeant Carnes
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15903; -- No Match

-- Ironforge Brigade Footman
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15442; -- No Match

-- Arcanist Nozzlespring
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15444; -- No Match

-- Janela Stouthammer
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15443; -- No Match

-- Nelson the Nice
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=14536; -- No Match

-- Precious
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~4 /*No Loot*/ WHERE `entry`=14528; -- No Match

-- Simone the Inconspicuous
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=14527; -- No Match

-- Winter's Little Helper (minipet)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=15705; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=15705; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=15705; -- No Match

-- Theldurin the Lost
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` | 2 WHERE `entry`=2785; -- DB2 Matches

-- Dank Drizzlecut
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=1701; -- DB2 Matches

-- Quarrymaster Thesten
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=1256; -- DB2 Matches

-- Foreman Stonebrow
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=1254; -- DB2 Matches

-- Senator Mehr Stonehallow
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=1977; -- DB2 Matches

-- Prospector Gehn
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=1255; -- DB2 Matches

-- Frast Dokner
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=1698; -- DB2 Matches

-- Kazan Mogosh
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=1237; -- DB2 Matches

-- Cook Ghilm
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=1355; -- DB2 Matches

-- Spectral Stalker
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=16093; -- No Match

-- Dream Vision
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=7863; -- DB2 Matches

-- Quentin
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~64 /*ImmuneNPC*/ WHERE `entry`=9238; -- DB2 Matches

-- Captured Sprite Darter
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=7997; -- DB2 Matches

-- Feathermoon Sentinel
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 4 /*No Loot*/ WHERE `entry`=7939 && `patch` > 0; -- DB2 Matches

-- Unliving Resident
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=12380; -- No Match

-- Restless Shade
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=7370; -- No Match

-- Unliving Caretaker
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=12379; -- No Match

-- Damned Soul
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=12378; -- No Match

-- Wailing Spectre
UPDATE `creature_template` SET `static_flags1` = `static_flags1` & ~524288 /*Amphibious*/, `inhabit_type` = `inhabit_type` & ~2 WHERE `entry`=12377; -- No Match

-- Lady Onyxia
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 134217728 /*Calls Guards*/ WHERE `entry`=12756; -- DB2 Matches

-- Dwarven Farmer
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=12998; -- DB2 Matches

-- Mechanical Chicken (minipet)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=8376; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=8376; -- DB2 Matches

-- Black Tabby (minipet)
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=7383; -- DB2 Matches
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 64 /*ImmuneNPC*/ WHERE `entry`=7383; -- DB2 Matches


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
