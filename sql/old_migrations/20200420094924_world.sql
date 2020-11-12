DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200420094924');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200420094924');
-- Add your query below.


-- Call to Arms gameobjects added in 1.7.
UPDATE `gameobject_template` SET `patch`=5 WHERE `entry` IN (180396, 180397, 180398, 180394, 180400, 180395, 180399);
UPDATE `gameobject` SET `patch_min`=5 WHERE `id` IN (180396, 180397, 180398, 180394, 180400, 180395, 180399);

-- Display id of PVP HOLIDAY HORDE CTF changed in 1.11.
DELETE FROM `gameobject_template` WHERE `entry`=180394;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (180394, 5, 5, 2552, 'PVP HOLIDAY HORDE CTF', 1375, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (180394, 9, 5, 6707, 'PVP HOLIDAY HORDE CTF', 1375, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

-- GameObjects added in patch 1.5
UPDATE `gameobject_template` SET `patch`=3 WHERE `entry` IN (180101, 180102, 178925, 178927, 178929, 178932, 178935, 178936, 178940, 178943, 178944, 178945, 178946, 178947, 178948, 178955, 178956, 178957, 178958, 179044, 179064, 179424, 179425, 179435, 179436, 179439, 179440, 179441, 179442, 179443, 179444, 179445, 179446, 179449, 179450, 179453, 179454, 179458, 179945);
UPDATE `gameobject` SET `patch_min`=3 WHERE `patch_min` < 3 && `id` IN (180101, 180102, 178925, 178927, 178929, 178932, 178935, 178936, 178940, 178943, 178944, 178945, 178946, 178947, 178948, 178955, 178956, 178957, 178958, 179044, 179064, 179424, 179425, 179435, 179436, 179439, 179440, 179441, 179442, 179443, 179444, 179445, 179446, 179449, 179450, 179453, 179454, 179458, 179945);
-- GameObjects only found inside AV.
UPDATE `gameobject_template` SET `patch`=3 WHERE `entry` IN (3832, 3833, 3834, 3835, 3836, 3837, 3838, 29784, 177261, 177262, 177263, 177292, 177293, 177405, 177406, 177408, 177409, 177410, 177411, 177412, 177413, 178646, 178684, 178685, 179066, 179384, 179385, 179386, 179387, 179388, 179389, 179390, 179391, 179392, 179393, 179394, 179395, 179396, 179397, 179419, 179437, 179438, 180422, 180423, 180424, 300039, 300040, 300041, 300045, 300046, 300047);
UPDATE `gameobject` SET `patch_min`=3 WHERE `patch_min` < 3 && `id` IN (3832, 3833, 3834, 3835, 3836, 3837, 3838, 29784, 177261, 177262, 177263, 177292, 177293, 177405, 177406, 177408, 177409, 177410, 177411, 177412, 177413, 178646, 178684, 178685, 179066, 179384, 179385, 179386, 179387, 179388, 179389, 179390, 179391, 179392, 179393, 179394, 179395, 179396, 179397, 179419, 179437, 179438, 180422, 180423, 180424, 300039, 300040, 300041, 300045, 300046, 300047);
UPDATE `gameobject` SET `patch_min`=3 WHERE `map`=30 && `patch_min` < 3;
UPDATE `pool_template` SET `patch_min`=3 WHERE `entry` IN (1334, 1335);
UPDATE `pool_gameobject` SET `patch_min`=3 WHERE `pool_entry` IN (1334, 1335);
-- GameObjects only found inside WSG.
UPDATE `gameobject_template` SET `patch`=3 WHERE `entry` IN (179917, 179918, 179919, 179920, 179921);
UPDATE `gameobject` SET `patch_min`=3 WHERE `patch_min` < 3 && `id` IN (179917, 179918, 179919, 179920, 179921);
UPDATE `gameobject` SET `patch_min`=3 WHERE `map`=489 && `patch_min` < 3;
-- GameObjects only found inside AB.
UPDATE `gameobject_template` SET `patch`=5 WHERE `entry` IN (180218, 180220, 180223, 180226, 180227);
UPDATE `gameobject` SET `patch_min`=5 WHERE `id` IN (180218, 180220, 180223, 180226, 180227);
UPDATE `gameobject` SET `patch_min`=5 WHERE `map`=529 && `patch_min` < 5;
-- GameObjects only found in Dire Maul.
UPDATE `gameobject_template` SET `patch`=1 WHERE `entry` IN (176907, 177211, 177217, 177219, 177220, 177257, 177258, 177259, 179485, 179502, 179503, 179504, 179505, 179506, 179511, 179517, 179544, 179549, 179564, 300050, 300051, 300400, 300401, 300402, 300403, 300404, 300405, 300601);
-- GameObjects only found in Blackwing Lair.
UPDATE `gameobject_template` SET `patch`=4 WHERE `entry` IN (176964, 176965, 176966, 177808, 179115, 179116, 179117, 179148, 179364, 179365, 200000, 300500);
-- GameObjects only found in AQ Temple.
UPDATE `gameobject_template` SET `patch`=7 WHERE `entry` IN (180634, 180635, 180636, 180690, 180745);
-- GameObjects whose display id was added in patch 1.3.
UPDATE `gameobject_template` SET `patch`=1 WHERE `entry` IN (179147, 181099, 182535, 182536);
UPDATE `gameobject` SET `patch_min`=1 WHERE `patch_min` < 1 && `id` IN (179147, 181099, 182535, 182536);
UPDATE `gameobject_loot_template` SET `patch_min`=1 WHERE `patch_min` < 1 && `entry` IN (16464, 16465, 16466, 16467, 16577, 42901, 42902, 42903, 42904, 42905, 42906);

-- TBC gameobjects.
DELETE FROM `gameobject_template` WHERE `entry` IN (185222, 181447, 184450);

-- Nefarian's throne was added in 1.6.
UPDATE `gameobject_template` SET `patch`=4 WHERE `entry`=179118;
UPDATE `gameobject` SET `patch_min`=4 WHERE `id`=179118;

-- Alliance Banner Aura, Large display id changed in 1.9.
DELETE FROM `gameobject_template` WHERE `entry`=180421;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (180421, 3, 6, 2232, 'Alliance Banner Aura, Large', 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (180421, 7, 6, 6492, 'Alliance Banner Aura, Large', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
UPDATE `gameobject` SET `patch_min`=3 WHERE `id`=180421;

-- Snowfall Banner display id changed in 1.6. Original unknown. Picked unused banner display id.
DELETE FROM `gameobject_template` WHERE `entry`=180418;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (180418, 3, 1, 5211, 'Snowfall Banner', 0, 0, 1, 0, 1479, 196608, 180102, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (180418, 4, 1, 6211, 'Snowfall Banner', 0, 0, 1, 0, 1479, 196608, 180102, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
UPDATE `gameobject` SET `patch_min`=3 WHERE `id`=180418;

/*
 World of Warcraft Client Patch 1.3.0 (2005-03-22)
 - A number of areas in the world now have footlockers in them.  
   These areas are in place for rogues to visit to increase their 
   lockpicking skills. The contents of these footlockers are only token 
   amounts of treasure, but they should allow for a more interesting 
   experience while increasing lockpicking skill. The difficulty of the 
   locks in the area correspond to the level of the zone, so if your 
   lockpicking skill is around 100, you would go to Durnholde Keep in 
   Hillsbrad. But if your skill is 250, you might head to Tyrs Hand in 
   Eastern Plaguelands.
*/
UPDATE `gameobject_template` SET `patch`=1 WHERE `entry` IN (179486, 179487, 179488, 179489, 179490, 179491, 179492, 179493, 179494, 179496, 179497, 179498);
UPDATE `gameobject` SET `patch_min`=1 WHERE `patch_min`=0 && id IN (179486, 179487, 179488, 179489, 179490, 179491, 179492, 179493, 179494, 179496, 179497, 179498);

-- This is a Dire Maul quest, and thus added in 1.3.
UPDATE `quest_template` SET `patch`=1 WHERE `entry`=1193;
UPDATE `gameobject_questrelation` SET `patch_min`=1 WHERE `quest`=1193;
UPDATE `gameobject_involvedrelation` SET `patch_min`=1 WHERE `quest`=1193;

-- Correct patch and old display id of Derotain Mudsipper.
DELETE FROM `creature_template` WHERE `entry`=14567;
INSERT INTO `creature_template` (`entry`, `patch`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `name`, `subname`, `gossip_menu_id`, `level_min`, `level_max`, `health_min`, `health_max`, `mana_min`, `mana_max`, `armor`, `faction`, `npc_flags`, `speed_walk`, `speed_run`, `scale`, `detection_range`, `call_for_help_range`, `leash_range`, `rank`, `xp_multiplier`, `dmg_min`, `dmg_max`, `dmg_school`, `attack_power`, `dmg_multiplier`, `base_attack_time`, `ranged_attack_time`, `unit_class`, `unit_flags`, `dynamic_flags`, `beast_family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `ranged_dmg_min`, `ranged_dmg_max`, `ranged_attack_power`, `type`, `type_flags`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `spell_id1`, `spell_id2`, `spell_id3`, `spell_id4`, `spell_list_id`, `pet_spell_list_id`, `gold_min`, `gold_max`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `regeneration`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `flags_extra`, `script_name`) VALUES (14567, 2, 9969, 0, 0, 0, 'Derotain Mudsipper', 'The Thorium Brotherhood', 0, 52, 52, 3200, 3200, 0, 0, 2669, 35, 2, 1, 1.14286, 0, 20, 5, 0, 0, 1, 87, 113, 0, 234, 1, 2000, 2000, 1, 768, 0, 0, 0, 0, 0, 0, 68.1824, 93.7508, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 0, 0, 3, 14567, 0, 0, 0, 0, 2, '');
INSERT INTO `creature_template` (`entry`, `patch`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `name`, `subname`, `gossip_menu_id`, `level_min`, `level_max`, `health_min`, `health_max`, `mana_min`, `mana_max`, `armor`, `faction`, `npc_flags`, `speed_walk`, `speed_run`, `scale`, `detection_range`, `call_for_help_range`, `leash_range`, `rank`, `xp_multiplier`, `dmg_min`, `dmg_max`, `dmg_school`, `attack_power`, `dmg_multiplier`, `base_attack_time`, `ranged_attack_time`, `unit_class`, `unit_flags`, `dynamic_flags`, `beast_family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `ranged_dmg_min`, `ranged_dmg_max`, `ranged_attack_power`, `type`, `type_flags`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `spell_id1`, `spell_id2`, `spell_id3`, `spell_id4`, `spell_list_id`, `pet_spell_list_id`, `gold_min`, `gold_max`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `regeneration`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `flags_extra`, `script_name`) VALUES (14567, 3, 14668, 0, 0, 0, 'Derotain Mudsipper', 'The Thorium Brotherhood', 0, 52, 52, 3200, 3200, 0, 0, 2669, 1475, 2, 1, 1.14286, 0, 20, 5, 0, 0, 1, 87, 113, 0, 234, 1, 2000, 2000, 1, 768, 0, 0, 0, 0, 0, 0, 68.1824, 93.7508, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 0, 0, 3, 14567, 0, 0, 0, 0, 2, '');
UPDATE `creature_equip_template` SET `patch`=2 WHERE `entry`=14567;
UPDATE `creature` SET `patch_min`=2 WHERE `id`=14567;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
