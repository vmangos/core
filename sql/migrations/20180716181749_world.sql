DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180716181749');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180716181749');
-- Add your query below.


-- Add missing item template for Refined Scale of Onyxia. This item is unobtainable.
INSERT INTO `item_template` (`entry`, `patch`, `class`, `subclass`, `name`, `displayid`, `Quality`, `Flags`, `BuyCount`, `BuyPrice`, `SellPrice`, `InventoryType`, `AllowableClass`, `AllowableRace`, `ItemLevel`, `RequiredLevel`, `RequiredSkill`, `RequiredSkillRank`, `requiredspell`, `requiredhonorrank`, `RequiredCityRank`, `RequiredReputationFaction`, `RequiredReputationRank`, `maxcount`, `stackable`, `ContainerSlots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`, `dmg_min1`, `dmg_max1`, `dmg_type1`, `dmg_min2`, `dmg_max2`, `dmg_type2`, `dmg_min3`, `dmg_max3`, `dmg_type3`, `dmg_min4`, `dmg_max4`, `dmg_type4`, `dmg_min5`, `dmg_max5`, `dmg_type5`, `armor`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `delay`, `ammo_type`, `RangedModRange`, `spellid_1`, `spelltrigger_1`, `spellcharges_1`, `spellppmRate_1`, `spellcooldown_1`, `spellcategory_1`, `spellcategorycooldown_1`, `spellid_2`, `spelltrigger_2`, `spellcharges_2`, `spellppmRate_2`, `spellcooldown_2`, `spellcategory_2`, `spellcategorycooldown_2`, `spellid_3`, `spelltrigger_3`, `spellcharges_3`, `spellppmRate_3`, `spellcooldown_3`, `spellcategory_3`, `spellcategorycooldown_3`, `spellid_4`, `spelltrigger_4`, `spellcharges_4`, `spellppmRate_4`, `spellcooldown_4`, `spellcategory_4`, `spellcategorycooldown_4`, `spellid_5`, `spelltrigger_5`, `spellcharges_5`, `spellppmRate_5`, `spellcooldown_5`, `spellcategory_5`, `spellcategorycooldown_5`, `bonding`, `description`, `PageText`, `LanguageID`, `PageMaterial`, `startquest`, `lockid`, `Material`, `sheath`, `RandomProperty`, `block`, `itemset`, `MaxDurability`, `area`, `Map`, `BagFamily`, `ScriptName`, `DisenchantID`, `FoodType`, `minMoneyLoot`, `maxMoneyLoot`, `Duration`, `ExtraFlags`, `OtherTeamEntry`) VALUES (17967, 1, 7, 6, 'Refined Scale of Onyxia', 20914, 3, 0, 1, 20000, 5000, 0, -1, -1, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, '', 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 1);

-- Add missing item template for Onyxia Scale Breastplate. This item is unobtainable.
INSERT INTO `item_template` (`entry`, `patch`, `class`, `subclass`, `name`, `displayid`, `Quality`, `Flags`, `BuyCount`, `BuyPrice`, `SellPrice`, `InventoryType`, `AllowableClass`, `AllowableRace`, `ItemLevel`, `RequiredLevel`, `RequiredSkill`, `RequiredSkillRank`, `requiredspell`, `requiredhonorrank`, `RequiredCityRank`, `RequiredReputationFaction`, `RequiredReputationRank`, `maxcount`, `stackable`, `ContainerSlots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`, `dmg_min1`, `dmg_max1`, `dmg_type1`, `dmg_min2`, `dmg_max2`, `dmg_type2`, `dmg_min3`, `dmg_max3`, `dmg_type3`, `dmg_min4`, `dmg_max4`, `dmg_type4`, `dmg_min5`, `dmg_max5`, `dmg_type5`, `armor`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `delay`, `ammo_type`, `RangedModRange`, `spellid_1`, `spelltrigger_1`, `spellcharges_1`, `spellppmRate_1`, `spellcooldown_1`, `spellcategory_1`, `spellcategorycooldown_1`, `spellid_2`, `spelltrigger_2`, `spellcharges_2`, `spellppmRate_2`, `spellcooldown_2`, `spellcategory_2`, `spellcategorycooldown_2`, `spellid_3`, `spelltrigger_3`, `spellcharges_3`, `spellppmRate_3`, `spellcooldown_3`, `spellcategory_3`, `spellcategorycooldown_3`, `spellid_4`, `spelltrigger_4`, `spellcharges_4`, `spellppmRate_4`, `spellcooldown_4`, `spellcategory_4`, `spellcategorycooldown_4`, `spellid_5`, `spelltrigger_5`, `spellcharges_5`, `spellppmRate_5`, `spellcooldown_5`, `spellcategory_5`, `spellcategorycooldown_5`, `bonding`, `description`, `PageText`, `LanguageID`, `PageMaterial`, `startquest`, `lockid`, `Material`, `sheath`, `RandomProperty`, `block`, `itemset`, `MaxDurability`, `area`, `Map`, `BagFamily`, `ScriptName`, `DisenchantID`, `FoodType`, `minMoneyLoot`, `maxMoneyLoot`, `Duration`, `ExtraFlags`, `OtherTeamEntry`) VALUES (15141, 0, 4, 3, 'Onyxia Scale Breastplate', 27943, 4, 0, 1, 195509, 39101, 5, -1, -1, 62, 57, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 4, 15, 3, 15, 7, 15, 5, 14, 6, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 605, 0, 9, 0, 0, 0, 0, 0, 0, 0, 7597, 1, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 2, '', 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 140, 0, 0, 0, '', 65, 0, 0, 0, 0, 0, 1);


-- Fix by Daribon.
-- https://github.com/cmangos/tbc-db/pull/601

-- Fix spawn location for Undead players.
UPDATE `playercreateinfo` SET `position_x` = 1676.349976, `position_y` = 1677.449951, `position_z` = 121.669998, `orientation` = 2.705260 WHERE `race` = 5;
-- Fix spawn location for Night Elf players.
UPDATE `playercreateinfo` SET `position_x` = 10311.299805, `position_y` = 831.463013, `position_z` = 1326.410034, `orientation` = 5.480334 WHERE `race` = 4;

-- Fix by Daribon.
-- https://github.com/cmangos/classic-db/pull/184

-- These creatures had a different name in classic.
UPDATE `creature_template` SET `name` = 'Ghoul' WHERE `entry` = 846;
UPDATE `creature_template` SET `name` = 'Darkmist Lurker' WHERE `entry` = 4377;
UPDATE `creature_template` SET `name` = 'Sentry Point Captain' WHERE `entry` = 5086;
UPDATE `creature_template` SET `name` = 'Practice Dummy' WHERE `entry` = 5652;
UPDATE `creature_template` SET `name` = 'Felguard' WHERE `entry` = 6115;
UPDATE `creature_template` SET `name` = 'Abomination' WHERE `entry` = 8545;
UPDATE `creature_template` SET `name` = 'Crypt Fiend' WHERE `entry` = 8555;
UPDATE `creature_template` SET `name` = 'Tiny Walking Bomb' WHERE `entry` = 9656;
UPDATE `creature_template` SET `name` = 'Draenei Exile' WHERE `entry` = 11198;
UPDATE `creature_template` SET `name` = 'Horde Peon' WHERE `entry` =11656;
UPDATE `creature_template` SET `name` = 'Horde Grunt' WHERE `entry` =11682;
UPDATE `creature_template` SET `name` = 'Horde Shaman' WHERE `entry` =11683;
UPDATE `creature_template` SET `name` = 'Draka' WHERE `entry` = 12121;
UPDATE `creature_template` SET `name` = 'Elder Bladeleaf' WHERE `entry` = 15595;
UPDATE `creature_template` SET `name` = 'Kwee Q. Peddlefeet' WHERE `entry` = 16075;

-- These creatures had a different subname in classic.
-- General Goods Vendor
UPDATE `creature_template` SET `subname` = 'General Goods Vendor' WHERE `entry` IN (227, 1285, 3350, 4170, 4241, 4555, 5101, 8362, 12027, 12959);
-- Mining and Smithing Supplies
UPDATE `creature_template` SET `subname`= 'Mining and Smithing Supplies' WHERE `entry` = 790;
-- Arcane Goods Vendor
UPDATE `creature_template` SET `subname` = 'Arcane Goods Vendor' WHERE `entry` IN (983, 1257);
-- Trade Goods
UPDATE `creature_template` SET `subname` = 'Trade Goods' WHERE `entry` IN (989, 3556);
-- Reagent Vendor
UPDATE `creature_template` SET `subname` = 'Reagent Vendor' WHERE `entry` IN (1275, 1351, 1463, 1673, 3500, 3562, 3700, 4220, 4562, 5110, 5151, 8361, 12784, 12795, 14739, 15175);
-- Trade Supplier
UPDATE `creature_template` SET `subname` = 'Trade Supplier' WHERE `entry` IN (1286, 5100, 5163, 12957);
-- Herbalism Supplier
UPDATE `creature_template` SET `subname` = 'Herbalism Supplier' WHERE `entry` IN (1303, 3014, 3405, 4216, 4615, 5138, 5503);
-- Poison Supplier
UPDATE `creature_template` SET `subname` = 'Poison Supplier' WHERE `entry` IN (1326, 3090, 3135);
-- Engineering & General Goods Supplier
UPDATE `creature_template` SET `subname`= 'Engineering & General Goods Supplier' WHERE `entry` = 1448;
-- Ale and Wine
UPDATE `creature_template` SET `subname`= 'Ale and Wine' WHERE `entry` = 1697;
-- Tackle and Bait
UPDATE `creature_template` SET `subname`= 'Tackle and Bait' WHERE `entry` = 2383;
-- Fisherman
UPDATE `creature_template` SET `subname` = 'Fisherman' WHERE `entry` IN (2626, 3178, 3572);
-- Scrolls & Potions
UPDATE `creature_template` SET `subname`= 'Scrolls & Potions' WHERE `entry` = 2805;
-- Food and Drink
UPDATE `creature_template` SET `subname` = 'Food and Drink' WHERE `entry` IN (2832, 4255, 10367, 12785, 12794);
-- Cloth Armor and Accessories
UPDATE `creature_template` SET `subname`= 'Cloth Armor and Accessories' WHERE `entry` = 2849;
-- Mining Supplier
UPDATE `creature_template` SET `subname` = 'Mining Supplier' WHERE `entry` IN (3002, 3358, 4256, 4599, 5514, 6298);
-- Sword and Dagger Merchant
UPDATE `creature_template` SET `subname`= 'Sword and Dagger Merchant' WHERE `entry` = 3021;
-- Cooking Supplier
UPDATE `creature_template` SET `subname` = 'Cooking Supplier' WHERE `entry` IN (3027, 3400, 4223, 4553, 5160, 5483, 14738);
-- Fishing Supplier
UPDATE `creature_template` SET `subname` = 'Fishing Supplier' WHERE `entry` IN (3029, 4222, 4574, 5162, 5494);
-- Armorer and Shieldcrafter
UPDATE `creature_template` SET `subname` = 'Armorer and Shieldcrafter' WHERE `entry` IN (3075, 3080);
-- Engineering and Mining Supplies
UPDATE `creature_template` SET `subname`= 'Engineering and Mining Supplies' WHERE `entry` = 3133;
-- General Goods Merchant
UPDATE `creature_template` SET `subname`= 'General Goods Merchant' WHERE `entry` = 3313;
-- Guns and Ammo Merchant
UPDATE `creature_template` SET `subname`= 'Guns and Ammo Merchant' WHERE `entry` = 3322;
-- Reagents Vendor
UPDATE `creature_template` SET `subname` = 'Reagents Vendor' WHERE `entry` IN (3323, 3335, 3351);
-- Poison Vendor
UPDATE `creature_template` SET `subname` = 'Poison Vendor' WHERE `entry` IN (3334, 3561, 4585, 6779);
-- Blacksmithing Supplier
UPDATE `creature_template` SET `subname` = 'Blacksmithing Supplier' WHERE `entry` IN (3356, 3477, 4597);
-- General Trade Goods Merchant
UPDATE `creature_template` SET `subname` = 'General Trade Goods Merchant' WHERE `entry` IN (3367, 5817);
-- Reagents and Herbs
UPDATE `creature_template` SET `subname`= 'Reagents and Herbs' WHERE `entry` = 3490;
-- Engineering Goods
UPDATE `creature_template` SET `subname`= 'Engineering Goods' WHERE `entry` = 3495;
-- Trade Goods Supplies
UPDATE `creature_template` SET `subname` = 'Trade Goods Supplies' WHERE `entry` IN (3779, 11189);
-- General Trade Supplier
UPDATE `creature_template` SET `subname` = 'General Trade Supplier' WHERE `entry` IN (4229, 4561, 6301);
-- Reagent Supplier
UPDATE `creature_template` SET `subname`= 'Reagent Supplier' WHERE `entry` = 4575;
-- Engineering Supplier
UPDATE `creature_template` SET `subname` = 'Engineering Supplier' WHERE `entry` IN (4587, 5519, 8678);
-- General Trade Goods Vendor
UPDATE `creature_template` SET `subname` = 'General Trade Goods Vendor' WHERE `entry` IN (4775, 8934, 15179);
-- Food and Drinks
UPDATE `creature_template` SET `subname`= 'Food and Drinks' WHERE `entry` = 5620;
-- Blue Moon Odds and Ends
UPDATE `creature_template` SET `subname`= 'Blue Moon Odds and Ends' WHERE `entry` = 7683;
-- Superior Armor Crafter
UPDATE `creature_template` SET `subname`= 'Superior Armor Crafter' WHERE `entry` = 8129;
-- Trade Goods Supplier
UPDATE `creature_template` SET `subname`= 'Trade Goods Supplier' WHERE `entry` = 8363;
-- Fisherman Supplies
UPDATE `creature_template` SET `subname`= 'Fisherman Supplies' WHERE `entry` = 8508;
-- Demon Master
UPDATE `creature_template` SET `subname`= 'Demon Master' WHERE `entry` = 12807;
-- Potions, Scrolls and Reagents
UPDATE `creature_template` SET `subname`= 'Potions, Scrolls and Reagents' WHERE `entry` = 13476;
-- Zandalar Supplies and Repair
UPDATE `creature_template` SET `subname`= 'Zandalar Supplies and Repair' WHERE `entry` = 14921;
-- Bait and Tackle Supplier
UPDATE `creature_template` SET `subname`= 'Bait and Tackle Supplier' WHERE `entry` = 1678;
-- Classic Skinning trainer subnames
UPDATE `creature_template` SET `subname` = 'Skinner' WHERE `entry` IN (6287, 6288, 6289, 6290, 6306, 6387);
-- Classic Mining trainers subnames
UPDATE `creature_template` SET `subname` = 'Miner' WHERE `entry` IN (3175, 3555, 8128);
-- Classic Fishing trainers subnames
UPDATE `creature_template` SET `subname` = 'Fisherman' WHERE `entry` IN (1651, 1683, 1700, 2367, 3607, 5690, 5938, 5941, 7946, 12032, 12961);
UPDATE `creature_template` SET `subname` = 'Superior Fisherman' WHERE `entry` = 2834;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
