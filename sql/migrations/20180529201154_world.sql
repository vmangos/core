DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180529201154');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180529201154');
-- Add your query below.


-- These creatures were added in 1.12.
UPDATE `creature_addon` SET `patch`=10 WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE `id` IN (17068, 17069, 17070, 17072, 17074, 17079, 17080, 17081, 17082, 17090, 17209, 17231, 17255, 17266, 17598, 17635, 17647, 17688, 17689, 17690, 17691, 17696, 17697, 17698, 17699, 17765, 17766, 17794, 17795, 17995, 17996, 17804));
UPDATE `creature_template` SET `patch`=10 WHERE `entry` IN (17068, 17069, 17070, 17072, 17074, 17079, 17080, 17081, 17082, 17090, 17209, 17231, 17255, 17266, 17598, 17635, 17647, 17688, 17689, 17690, 17691, 17696, 17697, 17698, 17699, 17765, 17766, 17794, 17795, 17995, 17996, 17804);
UPDATE `creature_template_addon` SET `patch`=10 WHERE `entry` IN (17068, 17069, 17070, 17072, 17074, 17079, 17080, 17081, 17082, 17090, 17209, 17231, 17255, 17266, 17598, 17635, 17647, 17688, 17689, 17690, 17691, 17696, 17697, 17698, 17699, 17765, 17766, 17794, 17795, 17995, 17996, 17804);
UPDATE `creature` SET `patch_min`=10 WHERE `id` IN (17068, 17069, 17070, 17072, 17074, 17079, 17080, 17081, 17082, 17090, 17209, 17231, 17255, 17266, 17598, 17635, 17647, 17688, 17689, 17690, 17691, 17696, 17697, 17698, 17699, 17765, 17766, 17794, 17795, 17995, 17996, 17804);
UPDATE `creature_loot_template` SET `patch_min`=10 WHERE `entry` IN (17070, 17079, 17080);

-- These creatures were added in TBC or are custom.
DELETE FROM `creature_addon` WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE `id` IN (17108, 17111, 17112, 17113, 17115, 17124, 17125, 17126, 17252, 17645, 19405, 19985, 19994, 20002, 20003, 20004, 20175));
DELETE FROM `creature` WHERE `id` IN (17108, 17111, 17112, 17113, 17115, 17124, 17125, 17126, 17252, 17645, 19405, 19985, 19994, 20002, 20003, 20004, 20175);
DELETE FROM `creature_template` WHERE `entry` IN (17108, 17111, 17112, 17113, 17115, 17124, 17125, 17126, 17252, 17645, 19405, 19985, 19994, 20002, 20003, 20004, 20175);
DELETE FROM `creature_template_addon` WHERE `entry` IN (17108, 17111, 17112, 17113, 17115, 17124, 17125, 17126, 17252, 17645, 19405, 19985, 19994, 20002, 20003, 20004, 20175);
DELETE FROM `creature_loot_template` WHERE `entry`=17115;
DELETE FROM `npc_vendor` WHERE `entry` IN (17108, 17111, 17112, 17113, 17115, 17124, 17125, 17126, 17252, 17645, 19405, 19985, 19994, 20002, 20003, 20004, 20175);
DELETE FROM `creature_movement` WHERE `id`=38909;

-- These gameobjects were added in 1.12.
UPDATE `gameobject_template` SET `patch`=10 WHERE `entry` IN (182106, 182075, 182076, 182077, 182078, 182079, 182080, 182081, 181598, 181603, 181617);
UPDATE `gameobject` SET `patch_min`=10 WHERE `id` IN (182106, 182075, 182076, 182077, 182078, 182079, 182080, 182081, 181598, 181603, 181617);

-- These gameobjects were added in TBC.
DELETE FROM `gameobject` WHERE `guid`=11755;
DELETE FROM `game_event_gameobject` WHERE guid IN (SELECT `guid` FROM `gameobject` WHERE `id` IN (181624, 181625, 181626, 181627, 181629, 181631, 181636, 181643, 181645, 181649, 181681, 181686, 181687, 181690, 181825, 181913, 181916, 181963, 182011, 182063, 182068, 182071, 182072, 184949, 185580, 186230, 186231, 186232, 186233, 186240, 186242, 186243, 186264, 186266, 186269, 186272, 186273, 186283, 186312, 186314, 186322, 186327, 186328, 186330, 186419, 186426, 186450, 186463, 186469, 186630, 186631, 186896, 186897, 186898, 186899, 186900, 186901, 186902, 186903, 186904));
DELETE FROM `gameobject` WHERE `id` IN (181624, 181625, 181626, 181627, 181629, 181631, 181636, 181643, 181645, 181649, 181681, 181686, 181687, 181690, 181825, 181913, 181916, 181963, 182011, 182063, 182068, 182071, 182072, 184949, 185580, 186230, 186231, 186232, 186233, 186240, 186242, 186243, 186264, 186266, 186269, 186272, 186273, 186283, 186312, 186314, 186322, 186327, 186328, 186330, 186419, 186426, 186450, 186463, 186469, 186630, 186631, 186896, 186897, 186898, 186899, 186900, 186901, 186902, 186903, 186904);
DELETE FROM `gameobject_template` WHERE `entry` IN (181624, 181625, 181626, 181627, 181629, 181631, 181636, 181643, 181645, 181649, 181681, 181686, 181687, 181690, 181825, 181913, 181916, 181963, 182011, 182063, 182068, 182071, 182072, 184949, 185580, 186230, 186231, 186232, 186233, 186240, 186242, 186243, 186264, 186266, 186269, 186272, 186273, 186283, 186312, 186314, 186322, 186327, 186328, 186330, 186419, 186426, 186450, 186463, 186469, 186630, 186631, 186896, 186897, 186898, 186899, 186900, 186901, 186902, 186903, 186904);

-- Add patch key to model info.
ALTER TABLE `creature_model_info`
	ADD COLUMN `patch` SMALLINT(4) UNSIGNED NOT NULL DEFAULT '0' AFTER `modelid`,
	DROP PRIMARY KEY,
	ADD PRIMARY KEY (`modelid`, `patch`);
UPDATE `creature_model_info` SET `patch`=5875 WHERE `modelid` IN (16786, 16793, 16794, 16806, 16834, 16835, 16836, 16837, 16908, 16941, 16942, 16943, 17008, 17144, 17146, 17158, 17166, 17202, 17203, 17250, 17251, 17273, 17328, 17404, 17405, 17445, 17548);

-- Remove Felguard TBC pet from pet level stats table.
DELETE FROM `pet_levelstats` WHERE `creature_entry`=17252;

-- Totem creature type added in 1.12.
DELETE FROM `creature_template` WHERE `entry` IN (14987, 15112);
INSERT INTO `creature_template` (`entry`, `patch`, `KillCredit1`, `KillCredit2`, `modelid_1`, `modelid_2`, `modelid_3`, `modelid_4`, `name`, `subname`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spells_template`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Civilian`, `RacialLeader`, `RegenHealth`, `equipment_id`, `trainer_id`, `vendor_id`, `MechanicImmuneMask`, `SchoolImmuneMask`, `flags_extra`, `ScriptName`) VALUES (14987, 5, 0, 0, 15292, 0, 0, 0, 'Powerful Healing Ward', '', 0, 62, 63, 2800, 2800, 2514, 2514, 4091, 28, 28, 0, 0, 0, 0, 0, 9, 9, 0, 290, 1, 1430, 1573, 0, 0, 0, 0, 0, 0, 0, 0, 70.4704, 96.8968, 100, 10, 0, 0, 0, 0, 0, 10, 10, 10, 10, 10, 24310, 0, 0, 0, 0, 0, 0, 0, 'TotemAI', 0, 3, 0, 0, 1, 0, 0, 0, 113458079, 0, 0, '');
INSERT INTO `creature_template` (`entry`, `patch`, `KillCredit1`, `KillCredit2`, `modelid_1`, `modelid_2`, `modelid_3`, `modelid_4`, `name`, `subname`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spells_template`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Civilian`, `RacialLeader`, `RegenHealth`, `equipment_id`, `trainer_id`, `vendor_id`, `MechanicImmuneMask`, `SchoolImmuneMask`, `flags_extra`, `ScriptName`) VALUES (14987, 10, 0, 0, 15292, 0, 0, 0, 'Powerful Healing Ward', '', 0, 62, 63, 2800, 2800, 2514, 2514, 4091, 28, 28, 0, 0, 0, 0, 0, 9, 9, 0, 290, 1, 1430, 1573, 0, 0, 0, 0, 0, 0, 0, 0, 70.4704, 96.8968, 100, 11, 0, 0, 0, 0, 0, 10, 10, 10, 10, 10, 24310, 0, 0, 0, 0, 0, 0, 0, 'TotemAI', 0, 3, 0, 0, 1, 0, 0, 0, 113458079, 0, 0, '');
INSERT INTO `creature_template` (`entry`, `patch`, `KillCredit1`, `KillCredit2`, `modelid_1`, `modelid_2`, `modelid_3`, `modelid_4`, `name`, `subname`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spells_template`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Civilian`, `RacialLeader`, `RegenHealth`, `equipment_id`, `trainer_id`, `vendor_id`, `MechanicImmuneMask`, `SchoolImmuneMask`, `flags_extra`, `ScriptName`) VALUES (15112, 5, 0, 0, 15291, 0, 0, 0, 'Brain Wash Totem', '', 0, 62, 63, 3952, 4080, 300, 300, 0, 28, 28, 0, 0, 0, 0, 0, 9, 9, 0, 290, 1, 1410, 1551, 0, 0, 0, 0, 0, 0, 0, 0, 74.448, 102.366, 100, 10, 0, 0, 0, 0, 0, 5, 5, 5, 5, 5, 24261, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 1, 0, 0, 0, 113458079, 0, 0, 'mob_brain_wash');
INSERT INTO `creature_template` (`entry`, `patch`, `KillCredit1`, `KillCredit2`, `modelid_1`, `modelid_2`, `modelid_3`, `modelid_4`, `name`, `subname`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spells_template`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Civilian`, `RacialLeader`, `RegenHealth`, `equipment_id`, `trainer_id`, `vendor_id`, `MechanicImmuneMask`, `SchoolImmuneMask`, `flags_extra`, `ScriptName`) VALUES (15112, 10, 0, 0, 15291, 0, 0, 0, 'Brain Wash Totem', '', 0, 62, 63, 3952, 4080, 300, 300, 0, 28, 28, 0, 0, 0, 0, 0, 9, 9, 0, 290, 1, 1410, 1551, 0, 0, 0, 0, 0, 0, 0, 0, 74.448, 102.366, 100, 11, 0, 0, 0, 0, 0, 5, 5, 5, 5, 5, 24261, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 1, 0, 0, 0, 113458079, 0, 0, 'mob_brain_wash');
UPDATE `creature_template_addon` SET `patch`=5 WHERE `entry` IN (14987, 15112);

-- Squire Rowe was added in patch 1.12.
-- Previously Windsor would be spawned by the areatrigger at the stormwind gates.
-- https://web.archive.org/web/20051223051648/http://www.thottbot.com/index.cgi?q=3835
INSERT INTO `scripted_areatrigger` VALUES (2786, 'at_stormwind_gates');

-- Aurora Skycaller and Kriss Goldenlight were spawned at the Northpass Tower before 1.12.
-- https://web.archive.org/web/20071105191002/http://wow.allakhazam.com:80/db/mob.html?wmob=11704
-- https://web.archive.org/web/20051206182956/http://wow.allakhazam.com:80/db/mob.html?wmob=10304
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (53732, 11704, 0, 0, 0, 3166.368, -4373.089, 139.631, 1.276, 345, 345, 0, 0, 3857, 0, 0, 0, 0, 0, 0, 9);
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (53733, 10304, 0, 0, 0, 3172.210, -4372.598, 139.632, 1.747, 345, 345, 0, 0, 4193, 0, 0, 0, 0, 0, 0, 9);
UPDATE `creature` SET `patch_min`=10 WHERE `guid` IN (53738, 53739);

-- Assign gossip menu for Aurora Skycaller.
DELETE FROM `npc_gossip` WHERE `npc_guid`=53739;
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (805, 8, 5245, 0);
UPDATE `gossip_menu` SET `condition_id`=2 WHERE `entry`=4743 && `text_id`=5795;
UPDATE `gossip_menu` SET `condition_id`=805 WHERE `entry`=4743 && `text_id`=5817;
UPDATE `creature_template` SET `gossip_menu_id`=4743 WHERE `entry`=10304;

-- The graveyard near Crown Guard Tower in EPL was added in 1.12.
ALTER TABLE `game_graveyard_zone`
	ADD COLUMN `build_min` SMALLINT(4) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Minimum game client build' AFTER `faction`;
UPDATE `game_graveyard_zone` SET `build_min`=5875 WHERE `id`=927;

-- These flight paths were added in 1.12.
ALTER TABLE `taxi_path_transitions`
	ADD COLUMN `build_min` SMALLINT(4) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Minimum game client build' AFTER `comment`;
UPDATE `taxi_path_transitions` SET `build_min`=5875 WHERE `inPath` IN (499, 500);
UPDATE `taxi_path_transitions` SET `build_min`=5875 WHERE `outPath` IN (499, 500);

-- This npc in Arathi Basin has waypoint movement type but no waypoints.
-- ERROR:WaypointMovementGenerator::LoadPath: Creature (Entry: 15086 Guid: 400086) doesn't have waypoint path 0
UPDATE `creature` SET `MovementType`=0, `spawndist`=0 WHERE `guid`=400086;

-- Remove Rapid Cast effectBasePoints hack.
DELETE FROM `spell_effect_mod` WHERE `Id`=8215;

-- Tome of Conjure Food VII was added in patch 1.11.
INSERT INTO `forbidden_items` VALUES (22897, 8, 1);

-- Patch 1.12: Lethargy Root has been removed from poison vendors and is now a gray item. 
-- https://web.archive.org/web/20070701202527/http://www.thottbot.com:80/i3777
-- https://web.archive.org/web/20070211010417/http://wow.allakhazam.com:80/db/item.html?witem=3777
DELETE FROM `item_template` WHERE `entry`=3777;
INSERT INTO `item_template` (`entry`, `patch`, `class`, `subclass`, `name`, `displayid`, `Quality`, `Flags`, `BuyCount`, `BuyPrice`, `SellPrice`, `InventoryType`, `AllowableClass`, `AllowableRace`, `ItemLevel`, `RequiredLevel`, `RequiredSkill`, `RequiredSkillRank`, `requiredspell`, `requiredhonorrank`, `RequiredCityRank`, `RequiredReputationFaction`, `RequiredReputationRank`, `maxcount`, `stackable`, `ContainerSlots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`, `dmg_min1`, `dmg_max1`, `dmg_type1`, `dmg_min2`, `dmg_max2`, `dmg_type2`, `dmg_min3`, `dmg_max3`, `dmg_type3`, `dmg_min4`, `dmg_max4`, `dmg_type4`, `dmg_min5`, `dmg_max5`, `dmg_type5`, `armor`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `delay`, `ammo_type`, `RangedModRange`, `spellid_1`, `spelltrigger_1`, `spellcharges_1`, `spellppmRate_1`, `spellcooldown_1`, `spellcategory_1`, `spellcategorycooldown_1`, `spellid_2`, `spelltrigger_2`, `spellcharges_2`, `spellppmRate_2`, `spellcooldown_2`, `spellcategory_2`, `spellcategorycooldown_2`, `spellid_3`, `spelltrigger_3`, `spellcharges_3`, `spellppmRate_3`, `spellcooldown_3`, `spellcategory_3`, `spellcategorycooldown_3`, `spellid_4`, `spelltrigger_4`, `spellcharges_4`, `spellppmRate_4`, `spellcooldown_4`, `spellcategory_4`, `spellcategorycooldown_4`, `spellid_5`, `spelltrigger_5`, `spellcharges_5`, `spellppmRate_5`, `spellcooldown_5`, `spellcategory_5`, `spellcategorycooldown_5`, `bonding`, `description`, `PageText`, `LanguageID`, `PageMaterial`, `startquest`, `lockid`, `Material`, `sheath`, `RandomProperty`, `block`, `itemset`, `MaxDurability`, `area`, `Map`, `BagFamily`, `ScriptName`, `DisenchantID`, `FoodType`, `minMoneyLoot`, `maxMoneyLoot`, `Duration`, `ExtraFlags`, `OtherTeamEntry`) VALUES (3777, 0, 7, 0, 'Lethargy Root', 6371, 1, 0, 1, 40, 10, 0, 8, -1, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 'Used by rogues to brew poison.', 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 1);
INSERT INTO `item_template` (`entry`, `patch`, `class`, `subclass`, `name`, `displayid`, `Quality`, `Flags`, `BuyCount`, `BuyPrice`, `SellPrice`, `InventoryType`, `AllowableClass`, `AllowableRace`, `ItemLevel`, `RequiredLevel`, `RequiredSkill`, `RequiredSkillRank`, `requiredspell`, `requiredhonorrank`, `RequiredCityRank`, `RequiredReputationFaction`, `RequiredReputationRank`, `maxcount`, `stackable`, `ContainerSlots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`, `dmg_min1`, `dmg_max1`, `dmg_type1`, `dmg_min2`, `dmg_max2`, `dmg_type2`, `dmg_min3`, `dmg_max3`, `dmg_type3`, `dmg_min4`, `dmg_max4`, `dmg_type4`, `dmg_min5`, `dmg_max5`, `dmg_type5`, `armor`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `delay`, `ammo_type`, `RangedModRange`, `spellid_1`, `spelltrigger_1`, `spellcharges_1`, `spellppmRate_1`, `spellcooldown_1`, `spellcategory_1`, `spellcategorycooldown_1`, `spellid_2`, `spelltrigger_2`, `spellcharges_2`, `spellppmRate_2`, `spellcooldown_2`, `spellcategory_2`, `spellcategorycooldown_2`, `spellid_3`, `spelltrigger_3`, `spellcharges_3`, `spellppmRate_3`, `spellcooldown_3`, `spellcategory_3`, `spellcategorycooldown_3`, `spellid_4`, `spelltrigger_4`, `spellcharges_4`, `spellppmRate_4`, `spellcooldown_4`, `spellcategory_4`, `spellcategorycooldown_4`, `spellid_5`, `spelltrigger_5`, `spellcharges_5`, `spellppmRate_5`, `spellcooldown_5`, `spellcategory_5`, `spellcategorycooldown_5`, `bonding`, `description`, `PageText`, `LanguageID`, `PageMaterial`, `startquest`, `lockid`, `Material`, `sheath`, `RandomProperty`, `block`, `itemset`, `MaxDurability`, `area`, `Map`, `BagFamily`, `ScriptName`, `DisenchantID`, `FoodType`, `minMoneyLoot`, `maxMoneyLoot`, `Duration`, `ExtraFlags`, `OtherTeamEntry`) VALUES (3777, 10, 7, 0, 'Lethargy Root', 6371, 0, 0, 1, 40, 10, 0, 8, -1, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 'Used by rogues to brew poison.', 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 1);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (1148, 3777, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (1286, 3777, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (2225, 3777, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (2821, 3777, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (3367, 3777, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (4229, 3777, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (4561, 3777, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (5135, 3777, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (5139, 3777, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (5817, 3777, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (8145, 3777, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (8363, 3777, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (9636, 3777, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (10364, 3777, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (11189, 3777, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12022, 3777, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12028, 3777, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12096, 3777, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12097, 3777, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12245, 3777, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12941, 3777, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12957, 3777, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12958, 3777, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (15179, 3777, 0, 0);
INSERT INTO `forbidden_items` VALUES (3777, 10, 0);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
