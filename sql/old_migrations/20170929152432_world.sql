INSERT INTO `migrations` VALUES ('20170929152432'); 

-- Some items have wrong or reversed sell and buy prices.
-- https://github.com/elysium-project/database/issues/79

-- Spire of Twilight
-- https://web.archive.org/web/20061005153438/http://wow.allakhazam.com:80/db/item.html?witem=22801
UPDATE `item_template` SET `BuyPrice`=1232201 WHERE `entry`=22801;
-- Brimstone Staff
-- https://web.archive.org/web/20061005015752/http://wow.allakhazam.com:80/db/item.html?witem=22800
UPDATE `item_template` SET `BuyPrice`=1227490 WHERE `entry`=22800;
-- Soulseeker
-- https://web.archive.org/web/20061005090202/http://wow.allakhazam.com:80/db/item.html?witem=22799
UPDATE `item_template` SET `BuyPrice`=1638641 WHERE `entry`=22799;
-- Stormrage's Talisman of Seething
-- https://web.archive.org/web/20061005020352/http://wow.allakhazam.com:80/db/item.html?witem=23053
UPDATE `item_template` SET `BuyPrice`=345774, `SellPrice`=86443 WHERE `entry`=23053;
-- Shroud of Dominion
-- https://web.archive.org/web/20061126130257/http://wow.allakhazam.com:80/db/item.html?witem=23045
UPDATE `item_template` SET `BuyPrice`=412894, `SellPrice`=82578 WHERE `entry`=23045;
-- Slayer's Crest
-- https://web.archive.org/web/20061005020312/http://wow.allakhazam.com:80/db/item.html?witem=23041
UPDATE `item_template` SET `BuyPrice`=364641, `SellPrice`=91160 WHERE `entry`=23041;
-- Soulstring
-- https://web.archive.org/web/20061005090226/http://wow.allakhazam.com:80/db/item.html?witem=22811
UPDATE `item_template` SET `BuyPrice`=787600, `SellPrice`=157520 WHERE `entry`=22811;
-- Sadist's Collar
-- https://web.archive.org/web/20070219010450/http://wow.allakhazam.com:80/db/item.html?witem=23023
UPDATE `item_template` SET `BuyPrice`=345774, `SellPrice`=86443 WHERE `entry`=23023;
-- Leggings of Apocalypse
-- https://web.archive.org/web/20061005155546/http://wow.allakhazam.com:80/db/item.html?witem=23071
UPDATE `item_template` SET `BuyPrice`=513709, `SellPrice`=102741 WHERE `entry`=23071;
-- Seal of the Damned
-- https://web.archive.org/web/20070311014952/http://wow.allakhazam.com:80/db/item.html?witem=23025
UPDATE `item_template` SET `BuyPrice`=241024, `SellPrice`=60256 WHERE `entry`=23025;
-- Warmth of Forgiveness
-- https://web.archive.org/web/20070221232534/http://wow.allakhazam.com:80/db/item.html?witem=23027
UPDATE `item_template` SET `BuyPrice`=364641, `SellPrice`=91160 WHERE `entry`=23027;
-- Necklace of Necropsy
-- https://web.archive.org/web/20061206001351/http://wow.allakhazam.com:80/db/item.html?witem=23036
UPDATE `item_template` SET `BuyPrice`=353421, `SellPrice`=88355 WHERE `entry`=23036;
-- Loatheb's Reflection
-- https://web.archive.org/web/20060821020854/http://wow.allakhazam.com:80/db/item.html?witem=23042
UPDATE `item_template` SET `BuyPrice`=364641, `SellPrice`=91160 WHERE `entry`=23042;
-- Ring of Spiritual Fervor
-- https://web.archive.org/web/20060901012822/http://wow.allakhazam.com:80/db/item.html?witem=23037
UPDATE `item_template` SET `BuyPrice`=241024, `SellPrice`=60256 WHERE `entry`=23037;
-- Claw of the Frost Wyrm
-- https://web.archive.org/web/20061119063036/http://wow.allakhazam.com:80/db/item.html?witem=23242
UPDATE `item_template` SET `BuyPrice`=1335716, `SellPrice`=267143 WHERE `entry`=23242;
-- Cloak of the Necropolis
-- https://web.archive.org/web/20061206150910/http://wow.allakhazam.com:80/db/item.html?witem=23050
UPDATE `item_template` SET `BuyPrice`=432199, `SellPrice`=86439 WHERE `entry`=23050;
-- Eye of the Dead
-- https://web.archive.org/web/20061206014456/http://wow.allakhazam.com:80/db/item.html?witem=23047
UPDATE `item_template` SET `BuyPrice`=364641, `SellPrice`=91160 WHERE `entry`=23047;
-- Sapphiron's Left Eye
-- https://web.archive.org/web/20070210011143/http://wow.allakhazam.com:80/db/item.html?witem=23049
UPDATE `item_template` SET `BuyPrice`=290604, `SellPrice`=72651 WHERE `entry`=23049;
-- Sapphiron's Right Eye
-- https://web.archive.org/web/20061005020336/http://wow.allakhazam.com:80/db/item.html?witem=23048
UPDATE `item_template` SET `BuyPrice`=290604, `SellPrice`=72651 WHERE `entry`=23048;
-- The Restrained Essence of Sapphiron
-- https://web.archive.org/web/20061005155509/http://wow.allakhazam.com:80/db/item.html?witem=23046
UPDATE `item_template` SET `BuyPrice`=364641, `SellPrice`=91160 WHERE `entry`=23046;
-- Gem of Trapped Innocents
-- https://web.archive.org/web/20061005090509/http://wow.allakhazam.com:80/db/item.html?witem=23057
UPDATE `item_template` SET `BuyPrice`=411111, `SellPrice`=102777 WHERE `entry`=23057;
-- Might of Menethil
-- https://web.archive.org/web/20071106120240/http://wow.allakhazam.com:80/db/itemhistory.html?witem=22798
UPDATE `item_template` SET `BuyPrice`=1632328, `SellPrice`=326465 WHERE `entry`=22798;
-- Nerubian Slavemaker
-- https://web.archive.org/web/20061005015856/http://wow.allakhazam.com:80/db/item.html?witem=22812
UPDATE `item_template` SET `BuyPrice`=1059247, `SellPrice`=211849 WHERE `entry`=22812;
-- Icy Scale Coif
-- https://web.archive.org/web/20061206150841/http://wow.allakhazam.com:80/db/item.html?witem=23033
UPDATE `item_template` SET `BuyPrice`=465822, `SellPrice`=93164 WHERE `entry`=23033;
-- Maul of the Redeemed Crusader and The Eye of Nerub
-- No data from allakhazam but probably reversed, would be highest selling items in the game otherwise.
UPDATE `item_template` SET `BuyPrice`=1303372, `SellPrice`=260674 WHERE `entry`=22809;
UPDATE `item_template` SET `BuyPrice`=1321961, `SellPrice`=264392 WHERE `entry`=23039;

-- Add missing item template for unobtainable mount Fluorescent Green Mechanostrider.
-- http://www.wowhead.com/item=13325/fluorescent-green-mechanostrider
INSERT INTO `item_template` (`entry`, `class`, `subclass`, `name`, `displayid`, `Quality`, `Flags`, `BuyCount`, `BuyPrice`, `SellPrice`, `InventoryType`, `AllowableClass`, `AllowableRace`, `ItemLevel`, `RequiredLevel`, `RequiredSkill`, `RequiredSkillRank`, `requiredspell`, `requiredhonorrank`, `RequiredCityRank`, `RequiredReputationFaction`, `RequiredReputationRank`, `maxcount`, `stackable`, `ContainerSlots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`, `dmg_min1`, `dmg_max1`, `dmg_type1`, `dmg_min2`, `dmg_max2`, `dmg_type2`, `dmg_min3`, `dmg_max3`, `dmg_type3`, `dmg_min4`, `dmg_max4`, `dmg_type4`, `dmg_min5`, `dmg_max5`, `dmg_type5`, `armor`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `delay`, `ammo_type`, `RangedModRange`, `spellid_1`, `spelltrigger_1`, `spellcharges_1`, `spellppmRate_1`, `spellcooldown_1`, `spellcategory_1`, `spellcategorycooldown_1`, `spellid_2`, `spelltrigger_2`, `spellcharges_2`, `spellppmRate_2`, `spellcooldown_2`, `spellcategory_2`, `spellcategorycooldown_2`, `spellid_3`, `spelltrigger_3`, `spellcharges_3`, `spellppmRate_3`, `spellcooldown_3`, `spellcategory_3`, `spellcategorycooldown_3`, `spellid_4`, `spelltrigger_4`, `spellcharges_4`, `spellppmRate_4`, `spellcooldown_4`, `spellcategory_4`, `spellcategorycooldown_4`, `spellid_5`, `spelltrigger_5`, `spellcharges_5`, `spellppmRate_5`, `spellcooldown_5`, `spellcategory_5`, `spellcategorycooldown_5`, `bonding`, `description`, `PageText`, `LanguageID`, `PageMaterial`, `startquest`, `lockid`, `Material`, `sheath`, `RandomProperty`, `block`, `itemset`, `MaxDurability`, `area`, `Map`, `BagFamily`, `ScriptName`, `DisenchantID`, `FoodType`, `minMoneyLoot`, `maxMoneyLoot`, `Duration`, `ExtraFlags`, `OtherTeamEntry`) VALUES (13325, 15, 0, 'Fluorescent Green Mechanostrider', 17785, 3, 64, 1, 100000, 0, 0, -1, 77, 40, 40, 762, 75, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 17458, 0, 0, 0, 0, 330, 3000, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 1);

-- Fix vendor list for Lokhtos Darkbargainer. Some items are limited supply.
DELETE FROM `npc_vendor` WHERE `entry`=12944;
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12944, 17017, 1, 9000);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12944, 17018, 1, 9000);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12944, 17022, 1, 9000);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12944, 17023, 1, 9000);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12944, 17025, 1, 9000);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12944, 17049, 1, 9000);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12944, 17051, 1, 9000);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12944, 17052, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12944, 17053, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12944, 17059, 1, 9000);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12944, 17060, 1, 9000);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12944, 19206, 1, 9000);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12944, 19207, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12944, 19208, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12944, 19209, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12944, 19210, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12944, 19211, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12944, 19212, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12944, 19219, 1, 9000);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12944, 19220, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12944, 19330, 1, 9000);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12944, 19331, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12944, 19332, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12944, 19333, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12944, 19444, 1, 9000);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12944, 19448, 1, 9000);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12944, 19449, 1, 9000);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12944, 20040, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12944, 20761, 1, 9000);
