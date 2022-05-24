DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220524062012');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220524062012');
-- Add your query below.


/*
- World of Warcraft Client Patch 1.4.0 (2005-04-19)
   * Prior to this patch, Molten Core boss creatures could drop items 
     from one of two different tiered sets for every character class. 
     The loot tables have been changed so Molten Core bosses will now 
     only drop items from the lower tier class sets. However, some of 
     the items from those sets were not previously dropping in Molten 
     Core. These missing class set items will now drop in Molten Core, 
     allowing players to complete their lower tier class sets. The 
     higher tier class set pieces that once dropped in Molten Core will 
     be found once again in Blackwing Lair, the next raiding zone 
     scheduled for release in a future patch. 
*/

-- Gehennas 12259
UPDATE `reference_loot_template` SET `patch_min`=2 WHERE `entry`=30365 && `patch_min` < 2;
UPDATE `reference_loot_template` SET `patch_min`=2 WHERE `entry`=30366 && `patch_min` < 2;
UPDATE `creature_loot_template` SET `patch_min`=2 WHERE `entry`=12259 && `item`=30365;
UPDATE `creature_loot_template` SET `patch_min`=2 WHERE `entry`=12259 && `item`=30366;
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES
(30564, 16959, 0, 1, 1, 1, 0, 0, 1), -- t2 warrior bracers
(30564, 16952, 0, 1, 1, 1, 3, 0, 1), -- t2 paladin belt
(30564, 16944, 0, 1, 1, 1, 2, 0, 1), -- t2 shaman belt
(30564, 16801, 0, 1, 1, 1, 0, 0, 1), -- t1 mage gloves
(30564, 16823, 0, 1, 1, 1, 0, 0, 1); -- t1 rogue shoulders
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES
(12259, 30564, 100, 0, -30564, 1, 0, 0, 1);

-- Baron Geddon 12056
UPDATE `reference_loot_template` SET `patch_min`=2 WHERE `entry`=30349 && `patch_min` < 2;
UPDATE `reference_loot_template` SET `patch_min`=2 WHERE `entry`=30350 && `patch_min` < 2;
UPDATE `reference_loot_template` SET `patch_min`=2 WHERE `entry`=30351 && `patch_min` < 2;
UPDATE `creature_loot_template` SET `patch_min`=2 WHERE `entry`=12056 && `item`=30349;
UPDATE `creature_loot_template` SET `patch_min`=2 WHERE `entry`=12056 && `item`=30350;
UPDATE `creature_loot_template` SET `patch_min`=2 WHERE `entry`=12056 && `item`=30351;
UPDATE `creature_loot_template` SET `entry`=12056 WHERE `entry`=12057 && `item`=17782;
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES
(30565, 16964, 0, 1, 1, 1, 0, 0, 1), -- t2 warrior gloves
(30565, 16906, 0, 1, 1, 1, 0, 0, 1), -- t2 rogue boots
(30565, 16937, 0, 1, 1, 1, 0, 0, 1), -- t2 hunter shoulders
(30565, 16932, 0, 1, 1, 1, 0, 0, 1), -- t2 warlock shoulders
(30565, 16925, 0, 1, 1, 1, 0, 0, 1), -- t2 priest belt
(30565, 16835, 0, 1, 1, 1, 0, 0, 1), -- t1 druid legs
(30565, 16859, 0, 1, 1, 1, 3, 0, 1), -- t1 paladin boots
(30565, 16837, 0, 1, 1, 1, 2, 0, 1), -- t1 shaman boots
(30565, 17110, 30, 1, 1, 1, 0, 0, 1); -- Seal of the Archmagus
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES
(12056, 30565, 100, 0, -30565, 1, 0, 0, 1);

-- Golemagg the Incinerator 11988
UPDATE `reference_loot_template` SET `patch_min`=2 WHERE `entry`=30343 && `patch_min` < 2;
UPDATE `reference_loot_template` SET `patch_min`=2 WHERE `entry`=30344 && `patch_min` < 2;
UPDATE `reference_loot_template` SET `patch_min`=2 WHERE `entry`=30345 && `patch_min` < 2;
UPDATE `creature_loot_template` SET `patch_min`=2 WHERE `entry`=11988 && `item`=30343;
UPDATE `creature_loot_template` SET `patch_min`=2 WHERE `entry`=11988 && `item`=30344;
UPDATE `creature_loot_template` SET `patch_min`=2 WHERE `entry`=11988 && `item`=30345;
-- Group 1
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES
(30566, 17103, 0, 1, 1, 1, 0, 0, 1), -- Azuresong Mageblade
(30566, 17072, 0, 1, 1, 1, 0, 0, 1), -- Blastershot Launcher
(30566, 16842, 0, 1, 1, 1, 2, 0, 1), -- t1 shaman helm
(30566, 16854, 0, 1, 1, 1, 3, 0, 1), -- t1 paladin helm
(30566, 16800, 0, 1, 1, 1, 0, 0, 1), -- t1 mage boots
(30566, 16913, 0, 1, 1, 1, 0, 0, 1), -- t2 mage gloves
(30566, 16960, 0, 1, 1, 1, 0, 0, 1); -- t2 warrior belt
-- Group 2
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES
(30567, 16815, 0, 1, 1, 1, 0, 0, 1), -- t1 priest chest
(30567, 16808, 0, 1, 1, 1, 0, 0, 1), -- t1 warlock helm
(30567, 16934, 0, 1, 1, 1, 0, 0, 1), -- t2 warlock bracers
(30567, 16898, 0, 1, 1, 1, 0, 0, 1), -- t2 druid boots
(30567, 16834, 0, 1, 1, 1, 0, 0, 1); -- t1 druid helm
-- Group 3
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES
(30568, 16940, 0, 1, 1, 1, 0, 0, 1), -- t2 hunter gloves
(30568, 16848, 0, 1, 1, 1, 0, 0, 1), -- t1 hunter shoulders
(30568, 16847, 0, 1, 1, 1, 0, 0, 1), -- t1 hunter legs
(30568, 16826, 0, 1, 1, 1, 0, 0, 1), -- t1 rogue gloves
(30568, 16911, 0, 1, 1, 1, 0, 0, 1); -- t2 rogue bracers
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES
(11988, 30566, 100, 0, -30566, 1, 0, 0, 1),
(11988, 30567, 100, 0, -30567, 1, 0, 0, 1),
(11988, 30568, 100, 0, -30568, 1, 0, 0, 1);

-- Shazzrah 12264
UPDATE `reference_loot_template` SET `patch_min`=2 WHERE `entry`=30367 && `patch_min` < 2;
UPDATE `reference_loot_template` SET `patch_min`=2 WHERE `entry`=30368 && `patch_min` < 2;
UPDATE `creature_loot_template` SET `patch_min`=2 WHERE `entry`=12264 && `item`=30367;
UPDATE `creature_loot_template` SET `patch_min`=2 WHERE `entry`=12264 && `item`=30368;
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES
(30569, 16910, 0, 1, 1, 1, 0, 0, 1), -- t2 rogue belt
(30569, 16951, 0, 1, 1, 1, 3, 0, 1), -- t2 paladin bracers
(30569, 16943, 0, 1, 1, 1, 2, 0, 1), -- t2 shaman bracers
(30569, 16805, 0, 1, 1, 1, 0, 0, 1), -- t1 warlock gloves
(30569, 16804, 0, 1, 1, 1, 0, 0, 1), -- t1 warlock bracers
(30569, 17077, 0, 1, 1, 1, 0, 0, 1); -- Crimson Shocker
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES
(12264, 30569, 100, 0, -30569, 1, 0, 0, 1);

-- Magmadar 11982
UPDATE `reference_loot_template` SET `patch_min`=2 WHERE `entry`=30338 && `patch_min` < 2;
UPDATE `reference_loot_template` SET `patch_min`=2 WHERE `entry`=30339 && `patch_min` < 2;
UPDATE `reference_loot_template` SET `patch_min`=2 WHERE `entry`=30340 && `patch_min` < 2;
UPDATE `creature_loot_template` SET `patch_min`=2 WHERE `entry`=11982 && `item`=30338;
UPDATE `creature_loot_template` SET `patch_min`=2 WHERE `entry`=11982 && `item`=30339;
UPDATE `creature_loot_template` SET `patch_min`=2 WHERE `entry`=11982 && `item`=30340;
-- Group 1
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES
(30570, 16917, 0, 1, 1, 1, 0, 0, 1), -- t2 mage shoulders
(30570, 16798, 0, 1, 1, 1, 0, 0, 1), -- t1 mage chest
(30570, 16816, 0, 1, 1, 1, 0, 0, 1), -- t1 priest shoulders
(30570, 16822, 0, 1, 1, 1, 0, 0, 1), -- t1 rogue legs
(30570, 16907, 0, 1, 1, 1, 0, 0, 1), -- t2 rogue gloves
(30570, 17069, 0, 1, 1, 1, 0, 0, 1); -- Striker's Mark
-- Group 2
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES
(30571, 16829, 0, 1, 1, 1, 0, 0, 1), -- t1 druid boots
(30571, 16949, 0, 1, 1, 1, 2, 0, 1), -- t2 shaman boots
(30571, 16957, 0, 1, 1, 1, 3, 0, 1), -- t2 paladin boots
(30571, 16936, 0, 1, 1, 1, 0, 0, 1), -- t2 hunter belt
(30571, 16865, 0, 1, 1, 1, 0, 0, 1), -- t1 warrior chest
(30571, 17065, 0, 1, 1, 1, 0, 0, 1), -- Medallion of Steadfast Might
(30571, 17073, 0, 1, 1, 1, 0, 0, 1); -- Earthshaker
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES
(11982, 30570, 100, 0, -30570, 1, 0, 0, 1),
(11982, 30571, 100, 0, -30571, 1, 0, 0, 1);

-- Sulfuron Harbinger 12098
UPDATE `reference_loot_template` SET `patch_min`=2 WHERE `entry`=30355 && `patch_min` < 2;
UPDATE `reference_loot_template` SET `patch_min`=2 WHERE `entry`=30356 && `patch_min` < 2;
UPDATE `creature_loot_template` SET `patch_min`=2 WHERE `entry`=12098 && `item`=30355;
UPDATE `creature_loot_template` SET `patch_min`=2 WHERE `entry`=12098 && `item`=30356;
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES
(30572, 16832, 0, 1, 1, 1, 0, 0, 1), -- t2 rogue shoulders
(30572, 16926, 0, 1, 1, 1, 0, 0, 1), -- t2 priest bracers
(30572, 16965, 0, 1, 1, 1, 0, 0, 1), -- t2 warrior boots
(30572, 16920, 0, 1, 1, 1, 0, 0, 1), -- t2 priest gloves
(30572, 16836, 0, 1, 1, 1, 0, 0, 1), -- t1 druid shoulders
(30572, 16803, 0, 1, 1, 1, 0, 0, 1), -- t1 warlock boots
(30572, 16860, 0, 1, 1, 1, 3, 0, 1), -- t1 paladin gloves
(30572, 16839, 0, 1, 1, 1, 2, 0, 1), -- t1 shaman gloves
(30572, 17071, 0, 1, 1, 1, 0, 0, 1), -- Gutgore Ripper
(30572, 17074, 0, 1, 1, 1, 0, 0, 1); -- Shadowstrike
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES
(12098, 30572, 100, 0, -30572, 1, 0, 0, 1);

-- Garr 12057
UPDATE `reference_loot_template` SET `patch_min`=2 WHERE `entry`=30352 && `patch_min` < 2;
UPDATE `reference_loot_template` SET `patch_min`=2 WHERE `entry`=30353 && `patch_min` < 2;
UPDATE `reference_loot_template` SET `patch_min`=2 WHERE `entry`=30354 && `patch_min` < 2;
UPDATE `creature_loot_template` SET `patch_min`=2 WHERE `entry`=12057 && `item`=30352;
UPDATE `creature_loot_template` SET `patch_min`=2 WHERE `entry`=12057 && `item`=30353;
UPDATE `creature_loot_template` SET `patch_min`=2 WHERE `entry`=12057 && `item`=30354;
-- Group 1
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES
(30573, 16902, 0, 1, 1, 1, 0, 0, 1), -- t2 druid shoulders
(30573, 16843, 0, 1, 1, 1, 2, 0, 1), -- t1 shaman legs
(30573, 16855, 0, 1, 1, 1, 3, 0, 1), -- t1 paladin legs
(30573, 16941, 0, 1, 1, 1, 0, 0, 1), -- t2 hunter boots
(30573, 16862, 0, 1, 1, 1, 0, 0, 1), -- t1 warrior boots
(30573, 17066, 0, 1, 1, 1, 0, 0, 1); -- Drillborer Disk
-- Group 1
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES
(30574, 16818, 0, 1, 1, 1, 0, 0, 1), -- t2 mage belt
(30574, 16928, 0, 1, 1, 1, 0, 0, 1), -- t2 warlock gloves
(30574, 16807, 0, 1, 1, 1, 0, 0, 1), -- t1 warlock shoulders
(30574, 16812, 0, 1, 1, 1, 0, 0, 1), -- t1 priest gloves
(30574, 16814, 0, 1, 1, 1, 0, 0, 1), -- t1 priest legs
(30574, 16821, 0, 1, 1, 1, 0, 0, 1), -- t1 rogue helm
(30574, 17105, 0, 1, 1, 1, 0, 0, 1); -- Aurastone Hammer
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES
(12057, 30573, 100, 0, -30573, 1, 0, 0, 1),
(12057, 30574, 100, 0, -30574, 1, 0, 0, 1);

-- Lucifron 12118
UPDATE `reference_loot_template` SET `patch_min`=2 WHERE `entry`=30357 && `patch_min` < 2;
UPDATE `reference_loot_template` SET `patch_min`=2 WHERE `entry`=30488 && `patch_min` < 2;
UPDATE `creature_loot_template` SET `patch_min`=2 WHERE `entry`=12118 && `item`=30357;
UPDATE `creature_loot_template` SET `patch_min`=2 WHERE `entry`=12118 && `item`=30488;
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES
(30575, 16868, 0, 1, 1, 1, 0, 0, 1), -- t1 warrior shoulders
(30575, 16831, 0, 1, 1, 1, 0, 0, 1), -- t1 druid gloves
(30575, 16811, 0, 1, 1, 1, 0, 0, 1), -- t1 priest boots
(30575, 17109, 0, 1, 1, 1, 0, 0, 1); -- Choker of Enlightenment
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES
(12118, 30575, 100, 0, -30575, 1, 0, 0, 1);

-- Onyxia 10184
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES
(30263, 16867, 0, 1, 1, 1, 0, 0, 1), -- t1 warrior legs
(30263, 16845, 0, 1, 1, 1, 0, 0, 1), -- t1 hunter chest
(30263, 16919, 0, 1, 1, 1, 0, 0, 1); -- t2 priest boots

-- Fix some startup error in patch 1.2.
-- ERROR:Table 'creature_loot_template' entry 14357 isn't creature entry and not referenced from loot, and then useless.
UPDATE `creature_loot_template` SET `patch_min`=1 WHERE `entry`=14357 && `item`=5516;
-- ERROR:`pool_gameobject` has a non existing gameobject spawn (GUID: 10295) defined for pool id (463), skipped.
UPDATE `pool_template` SET `patch_min`=7 WHERE `entry` IN (463, 464, 465, 466, 467, 468, 469);
UPDATE `pool_gameobject` SET `patch_min`=7 WHERE `pool_entry` IN (463, 464, 465, 466, 467, 468, 469);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
