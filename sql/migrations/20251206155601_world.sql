DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20251206155601');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20251206155601');
-- Add your query below.


-- Shambling Skeleton UNUSED - Skeleton Finger
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (200, 2378, -80, 0, 1, 1, 0, 0, 10);

-- Brittlebones Skeleton UNUSED - Skeleton Finger
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (201, 2378, -80, 0, 1, 1, 0, 0, 10);

-- Nightbane Dark Runner - Worgen Skull
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (205, 895, -80, 0, 1, 1, 0, 0, 10);

-- Nightbane Dark Runner - Worgen Fang
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (205, 896, -80, 0, 1, 1, 0, 0, 10);

-- Nightbane Vile Fang - Worgen Fang
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (206, 896, -80, 0, 1, 1, 0, 0, 10);

-- Gath'Ilzogg - Horns of Nez'ra
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (334, 7906, -20, 0, 1, 1, 0, 0, 10);

-- Tharil'zun - Horns of Nez'ra
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (486, 7906, -20, 0, 1, 1, 0, 0, 10);

-- Nightbane Shadow Weaver - Worgen Fang
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (533, 896, -80, 0, 1, 1, 0, 0, 10);

-- V'rex - Gnoll Paw
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (566, 725, -80, 0, 1, 1, 0, 0, 10);

-- Blacknails - Gnoll Paw
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (567, 725, -80, 0, 1, 1, 0, 0, 10);

-- [UNUSED] Skeletal Enforcer - Skeleton Finger
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (725, 2378, -80, 0, 1, 1, 0, 0, 10);

-- Nightbane Worgen - Worgen Fang
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (898, 896, -80, 0, 1, 1, 0, 0, 10);

-- Nightbane Tainted One - Worgen Skull
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (920, 895, -80, 0, 1, 1, 0, 0, 10);

-- Nightbane Tainted One - Worgen Fang
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (920, 896, -80, 0, 1, 1, 0, 0, 10);

-- Mottled Riptooth - Stone of Relu
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (1066, 5233, -8, 0, 1, 1, 0, 0, 10);

-- Riverpaw Scavenger - Gnoll Paw
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (1067, 725, -80, 0, 1, 1, 0, 0, 10);

-- Black Bear - Thick Bear Fur
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (1129, 6952, -80, 0, 1, 1, 0, 0, 10);

-- Vile Fin Murloc - Vile Fin Scale
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (1541, 2859, -40, 0, 1, 1, 0, 0, 10);

-- Rotting Condor - Bloodshot Spider Eye
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (1810, 20610, -2, 0, 1, 1, 0, 6, 10);

-- Rotting Condor - Thick Black Claw
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (1810, 20611, -2, 0, 1, 1, 0, 6, 10);

-- Plaguewing Vulture - Bloodshot Spider Eye
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (1811, 20610, -2, 0, 1, 1, 0, 6, 10);

-- Plaguewing Vulture - Thick Black Claw
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (1811, 20611, -2, 0, 1, 1, 0, 6, 10);

-- TEST WOLF (ALPHA FIRST) - Tough Wolf Meat
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (1979, 750, -80, 0, 1, 1, 0, 0, 10);

-- TEST WOLF (ALPHA SECOND) - Tough Wolf Meat
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (1980, 750, -80, 0, 1, 1, 0, 0, 10);

-- Webwood Creeper UNUSED - Webwood Venom Sac
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (1987, 5166, -80, 0, 1, 1, 0, 0, 10);

-- Grell - Hyacinth Mushroom
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (1988, 10639, -80, 0, 1, 1, 0, 0, 10);

-- Gremlin - Fel Moss
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (1990, 3297, -80, 0, 1, 1, 0, 0, 10);

-- Gnarlpine Ursa - Gnarlpine Fang
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (2006, 5220, -80, 0, 1, 1, 0, 0, 10);

-- Gnarlpine Gardener - Gnarlpine Fang
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (2007, 5220, -80, 0, 1, 1, 0, 0, 10);

-- Gnarlpine Warrior - Gnarlpine Fang
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (2008, 5220, -80, 0, 1, 1, 0, 0, 10);

-- Gnarlpine Shaman - Gnarlpine Fang
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (2009, 5220, -80, 0, 1, 1, 0, 0, 10);

-- Gnarlpine Defender - Gnarlpine Fang
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (2010, 5220, -80, 0, 1, 1, 0, 0, 10);

-- Gnarlpine Augur - Gnarlpine Fang
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (2011, 5220, -80, 0, 1, 1, 0, 0, 10);

-- Gnarlpine Pathfinder - Gnarlpine Fang
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (2012, 5220, -80, 0, 1, 1, 0, 0, 10);

-- Gnarlpine Avenger - Gnarlpine Fang
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (2013, 5220, -80, 0, 1, 1, 0, 0, 10);

-- Gnarlpine Totemic - Gnarlpine Fang
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (2014, 5220, -80, 0, 1, 1, 0, 0, 10);

-- Gnarlpine Ambusher - Gnarlpine Fang
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (2152, 5220, -80, 0, 1, 1, 0, 0, 10);

-- Henchman Valik - Hillsbrad Human Skull
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (2333, 3692, -80, 0, 1, 1, 0, 0, 10);

-- Farmer Kent - Hillsbrad Human Skull
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (2436, 3692, -80, 0, 1, 1, 0, 0, 10);

-- Skeletal Fiend (Enraged Form) - Rot Blossom
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (2454, 1598, -80, 0, 1, 1, 0, 0, 10);

-- Skeletal Fiend (Enraged Form) - Skeleton Finger
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (2454, 2378, -80, 0, 1, 1, 0, 0, 10);

-- "Pretty Boy" Duncan - Dizzy's Eye
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (2545, 3897, -10, 0, 1, 1, 0, 0, 10);

-- Ironpatch - Dizzy's Eye
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (2547, 3897, -10, 0, 1, 1, 0, 0, 10);

-- Zalas Witherbark - Witherbark Totem Stick
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (2605, 7273, -80, 0, 1, 1, 0, 0, 10);

-- Shadowforge Excavator - Ryedol's Lucky Pick
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (2741, 4616, -5, 0, 1, 1, 0, 0, 10);

-- Shadowforge Commander - Ryedol's Lucky Pick
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (2744, 4616, -5, 0, 1, 1, 0, 0, 10);

-- Stonevault Trogg - Carved Stone Urn
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (2889, 4610, -1, 0, 1, 1, 0, 0, 10);

-- Stonevault Trogg - Indurium Flake
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (2889, 5797, -80, 0, 1, 1, 0, 0, 10);

-- Stonevault Scout - Carved Stone Urn
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (2890, 4610, -1, 0, 1, 1, 0, 0, 10);

-- Stonevault Scout - Indurium Flake
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (2890, 5797, -80, 0, 1, 1, 0, 0, 10);

-- Stonevault Skullthumper - Indurium Flake
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (2891, 5797, -80, 0, 1, 1, 0, 0, 10);

-- Bristleback Defender - Bristleback Quilboar Tusk
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (3259, 5085, -80, 0, 1, 1, 0, 0, 10);

-- Bristleback Mystic - Bristleback Quilboar Tusk
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (3262, 5085, -80, 0, 1, 1, 0, 0, 10);

-- Razormane Seer - Fire Tar
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (3458, 5026, -25, 0, 1, 1, 0, 0, 10);

-- Blackmoss the Fetid - Timberling Seed
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (3535, 5168, -80, 0, 1, 1, 0, 0, 10);

-- Deviate Horror - Deviate Hide
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (3642, 6443, -80, 0, 1, 1, 0, 0, 10);

-- Ran Bloodtooth - Corrupted Furbolg Totem
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (3696, 5389, -100, 0, 1, 1, 0, 0, 10);

-- Corrosive Sap Beast - Corrosive Sap
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (4021, 5681, -100, 0, 1, 1, 0, 0, 10);

-- Pesterhide Hyena - Spotted Hyena Pelt
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (4248, 11507, -80, 0, 1, 1, 0, 0, 10);

-- Pesterhide Snarler - Spotted Hyena Pelt
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (4249, 11507, -80, 0, 1, 1, 0, 0, 10);

-- Strashaz Myrmidon - Bloodkelp
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (4368, 22094, -15, 0, 1, 1, 0, 8, 10);

-- Blind Hunter - Kraul Guano
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (4425, 5801, -80, 0, 1, 1, 0, 0, 10);

-- [UNUSED] Charlga's Bodyguard - Treshala's Pendant
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (4439, 5825, -10, 0, 1, 1, 0, 0, 10);

-- Geltharis - Uncloven Satyr Hoof
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (4619, 7128, -80, 0, 1, 1, 0, 0, 10);

-- Doomwarder Lord - Doomwarder Blood
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (4683, 6252, -80, 0, 1, 1, 0, 0, 10);

-- Aged Kodo - Flawless Ivory Tusk
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (4700, 7271, -20, 0, 1, 1, 0, 0, 10);

-- Dying Kodo - Flawless Ivory Tusk
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (4701, 7271, -20, 0, 1, 1, 0, 0, 10);

-- Ancient Kodo - Flawless Ivory Tusk
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (4702, 7271, -20, 0, 1, 1, 0, 0, 10);

-- Raging Kodo - Flawless Ivory Tusk
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (4703, 7271, -20, 0, 1, 1, 0, 0, 10);

-- Maraudine Pack Runner - Centaur Ear
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (4704, 6067, -80, 0, 1, 1, 0, 0, 10);

-- Maraudine Pack Runner - War Horn Mouthpiece
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (4704, 6074, -8, 0, 1, 1, 0, 0, 10);

-- Slitherblade Tide Priestess - Rackmore's Golden Key
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (4717, 15881, -55, 0, 1, 1, 0, 0, 10);

-- Shrike Bat - Shrike Bat Fang
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (4861, 7679, -80, 0, 1, 1, 0, 0, 10);

-- Rabid Shrike Bat - Shrike Bat Fang
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (4862, 7679, -80, 0, 1, 1, 0, 0, 10);

-- Jadespine Basilisk - Jadespine Basilisk Scale
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (4863, 7680, -100, 0, 1, 1, 0, 0, 10);

-- Galthogran the Callous - Centaur Ear
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (5059, 6067, -80, 0, 1, 1, 0, 0, 10);

-- Groddoc Chestpounder - Groddoc Liver
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (5264, 6259, -80, 0, 1, 1, 0, 0, 10);

-- Jademir Dragonspawn - Fragment of the Nightmare's Corruption
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (5315, 21148, -5, 0, 1, 1, 0, 7, 10);

-- Old Grizzlegut - Ironfur Liver
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (5352, 6258, -80, 0, 1, 1, 0, 0, 10);

-- Cobrahn Snake Form - Gem of Cobrahn
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (5791, 9738, -100, 0, 1, 1, 0, 0, 10);

-- Corrupt Tyranis Malem - Tyranis' Pendant
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (5825, 6767, -100, 0, 1, 1, 0, 0, 10);

-- Thunderstomp - Thunder Lizard Horn
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (5832, 4895, -80, 0, 1, 1, 0, 0, 10);

-- Evil Squirrel - Indurium Flake
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (5868, 5797, -80, 0, 1, 1, 0, 0, 10);

-- Wayward Buzzard - Buzzard Gizzard
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (6013, 7847, -80, 0, 1, 1, 0, 0, 10);

-- Gutspill - Worgen Skull
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (6170, 895, -80, 0, 1, 1, 0, 0, 10);

-- Gutspill - Worgen Fang
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (6170, 896, -80, 0, 1, 1, 0, 0, 10);

-- Irradiated Burrower - Robo-mechanical Guts
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (6214, 9309, -5, 0, 1, 1, 0, 0, 10);

-- Big Will - Big Will's Ear
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (6238, 6927, -100, 0, 1, 1, 0, 0, 10);

-- Overseer Glibby - Overseer's Whistle
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (6606, 7333, -100, 0, 1, 1, 0, 0, 10);

-- Defias Bodyguard - Defias Script
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (6866, 6846, -100, 0, 1, 1, 0, 0, 10);

-- Condemned Acolyte - Soul Ashes of the Banished
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (7068, 22229, -100, 0, 1, 1, 4018, 8, 10);

-- Condemned Monk - Soul Ashes of the Banished
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (7069, 22229, -100, 0, 1, 1, 4018, 8, 10);

-- Condemned Cleric - Soul Ashes of the Banished
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (7070, 22229, -100, 0, 1, 1, 4018, 8, 10);

-- Arados the Damned - Hillsbrad Human Skull
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (7073, 3692, -80, 0, 1, 1, 0, 0, 10);

-- Gnarlpine Mystic - Gnarlpine Fang
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (7235, 5220, -80, 0, 1, 1, 0, 0, 10);

-- Sandfury Zombie - Troll Temper
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (7270, 9523, -55, 0, 1, 1, 0, 0, 10);

-- Theka the Martyr Shapeshift - Troll Temper
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (7791, 9523, -55, 0, 1, 1, 0, 0, 10);

-- Theka the Martyr Shapeshift - First Mosh'aru Tablet
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (7791, 10660, -100, 0, 1, 1, 0, 0, 10);

-- Southsea Pirate - Gold Pirate Earring
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (7855, 20021, -20, 0, 1, 1, 0, 5, 10);

-- Southsea Freebooter - Gold Pirate Earring
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (7856, 20021, -20, 0, 1, 1, 0, 5, 10);

-- Southsea Dock Worker - Gold Pirate Earring
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (7857, 20021, -20, 0, 1, 1, 0, 5, 10);

-- Southsea Swashbuckler - Gold Pirate Earring
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (7858, 20021, -20, 0, 1, 1, 0, 5, 10);

-- Southsea Buccaneer - Gold Pirate Earring
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (7896, 20021, -20, 0, 1, 1, 0, 5, 10);

-- Atal'ai Deathwalker's Spirit - Fetish of Hakkar
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (8317, 6181, -80, 0, 1, 1, 0, 0, 10);

-- Dark Iron Marksman - Thorium Plated Dagger
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (8338, 10551, -80, 0, 1, 1, 0, 0, 10);

-- Shade of Hakkar - Essence of Hakkar
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (8440, 10663, -100, 0, 1, 1, 0, 0, 10);

-- Anvilrage Overseer - Dark Iron Fanny Pack
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (8889, 11468, -80, 0, 1, 1, 0, 0, 10);

-- Angerclaw Grizzly - Angerclaw Grizzly Hide
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (8957, 20018, -100, 0, 1, 1, 0, 5, 10);

-- Scarshield Grunt - Blackrock Bracer
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (9043, 22138, -80, 0, 1, 1, 0, 8, 10);

-- Warlord Krom'zar - Head of Krom'zar
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (9456, 11222, -100, 0, 1, 1, 0, 0, 10);

-- Blackrock Ambusher - Blackrock Medallion
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (9522, 11467, -80, 0, 1, 1, 0, 0, 10);

-- Blackrock Raider - Blackrock Medallion
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (9605, 11467, -80, 0, 1, 1, 0, 0, 10);

-- Gorishi Hive Queen - Gorishi Scent Gland
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (10041, 11837, -15, 0, 1, 1, 0, 0, 10);

-- Wep - Centaur Ear
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (10236, 6067, -80, 0, 1, 1, 0, 0, 10);

-- Yor - Centaur Ear
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (10237, 6067, -80, 0, 1, 1, 0, 0, 10);

-- Staggon - Centaur Ear
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (10238, 6067, -80, 0, 1, 1, 0, 0, 10);

-- Tepolar - Centaur Ear
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (10239, 6067, -80, 0, 1, 1, 0, 0, 10);

-- [UNUSED] Cannibal Wight - Plagued Flesh Sample
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (10402, 13174, -80, 0, 1, 1, 0, 0, 10);

-- [UNUSED] Devouring Wight - Plagued Flesh Sample
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (10403, 13174, -80, 0, 1, 1, 0, 0, 10);

-- [UNUSED] Fetid Wight - Plagued Flesh Sample
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (10404, 13174, -80, 0, 1, 1, 0, 0, 10);

-- Urok Enforcer - Ogre Warbeads
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (10601, 21982, -5, 0, 1, 1, 0, 8, 10);

-- Urok Ogre Magus - Ogre Warbeads
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (10602, 21982, -5, 0, 1, 1, 0, 8, 10);

-- Prince Raze - Uncloven Satyr Hoof
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (10647, 7128, -80, 0, 1, 1, 0, 0, 10);

-- Blackhand Armorsmith - Blackrock Bracer
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (10898, 22138, -80, 0, 1, 1, 0, 8, 10);

-- [UNUSED] Eldreth Lichling - Jeering Spectre's Essence
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (11468, 22224, -20, 0, 1, 1, 0, 8, 10);

-- Eldreth Seether - Jeering Spectre's Essence
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (11469, 22224, -20, 0, 1, 1, 0, 8, 10);

-- Eldreth Wraith - Jeering Spectre's Essence
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (11474, 22224, -20, 0, 1, 1, 0, 8, 10);

-- Undead Ravager - Ravager's Skull
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (11561, 2477, -100, 0, 1, 1, 0, 0, 10);

-- Cheveyo - Aged Kodo Hide
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (11597, 6249, -100, 0, 1, 1, 0, 0, 10);

-- Cheveyo - Flawless Ivory Tusk
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (11597, 7271, -20, 0, 1, 1, 0, 0, 10);

-- Flamewaker Healer - Narain's Scrying Goggles
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (11663, 20951, -1, 0, 1, 1, 0, 7, 10);

-- Flamewaker Elite - Narain's Scrying Goggles
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (11664, 20951, -1, 0, 1, 1, 0, 7, 10);

-- Shadowshard Thunderer - Shadowshard Fragment
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (11779, 17756, -80, 0, 1, 1, 0, 0, 10);

-- Guardian of Elune - Blue-feathered Amulet
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (12140, 12524, -100, 0, 1, 1, 0, 0, 10);

-- Kyle Blackthorne - Theradric Crystal Carving
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (12177, 17684, -80, 0, 1, 1, 0, 0, 10);

-- Spirit of Gelk - Theradric Crystal Carving
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (12239, 17684, -80, 0, 1, 1, 0, 0, 10);

-- Spirit of Kolk - Theradric Crystal Carving
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (12240, 17684, -80, 0, 1, 1, 0, 0, 10);

-- Spirit of Magra - Theradric Crystal Carving
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (12241, 17684, -80, 0, 1, 1, 0, 0, 10);

-- Spirit of Maraudos - Theradric Crystal Carving
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (12242, 17684, -80, 0, 1, 1, 0, 0, 10);

-- Spirit of Veng - Theradric Crystal Carving
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (12243, 17684, -80, 0, 1, 1, 0, 0, 10);

-- Onyxia's Elite Guard - Black Dragonspawn Eye
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (12739, 16786, -40, 0, 1, 1, 0, 0, 10);

-- Accursed Slitherblade - Rackmore's Golden Key
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (14229, 15881, -55, 0, 1, 1, 0, 0, 10);

-- Jimmy the Bleeder - Hillsbrad Human Skull
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (14281, 3692, -80, 0, 1, 1, 0, 0, 10);

-- Alshirr Banebreath - Jadefire Felbind
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (14340, 11674, -80, 0, 1, 1, 0, 0, 10);

-- Roving Kodo - Flawless Ivory Tusk
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (14406, 7271, -20, 0, 1, 1, 0, 0, 10);

-- Uruson - Gnarlpine Fang
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (14428, 5220, -80, 0, 1, 1, 0, 0, 10);

-- Grimmaw - Gnarlpine Fang
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (14429, 5220, -80, 0, 1, 1, 0, 0, 10);

-- Molt Thorn - Khadgar's Essays on Dimensional Convergence
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (14448, 6065, -5, 0, 1, 1, 0, 2, 10);

-- Simone the Inconspicuous - Simone's Head
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (14527, 18952, -100, 0, 1, 1, 0, 3, 10);

-- Franklin the Friendly - Klinfran's Head
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (14529, 18953, -100, 0, 1, 1, 0, 3, 10);

-- Artorius the Amiable - Artorius's Head
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (14531, 18955, -100, 0, 1, 1, 0, 3, 10);

-- Nelson the Nice - Solenor's Head
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (14536, 18954, -100, 0, 1, 1, 0, 3, 10);

-- Revanchion - Jeering Spectre's Essence
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (14690, 22224, -20, 0, 1, 1, 0, 9, 10);

-- Skeletal Magelord - Skeletal Fragments
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (15121, 14619, -80, 0, 1, 1, 0, 5, 10);

-- Southsea Kidnapper - Gold Pirate Earring
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (15685, 20021, -20, 0, 1, 1, 0, 6, 10);

-- Thaddius - Fate of Ramaladni
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (15928, 22708, -1, 0, 1, 1, 0, 9, 10);

-- Grobbulus - Fate of Ramaladni
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (15931, 22708, -1, 0, 1, 1, 0, 9, 10);

-- Gluth - Fate of Ramaladni
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (15932, 22708, -1, 0, 1, 1, 0, 9, 10);

-- Heigan the Unclean - Fate of Ramaladni
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (15936, 22708, -1, 0, 1, 1, 0, 9, 10);

-- Maexxna - Fate of Ramaladni
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (15952, 22708, -1, 0, 1, 1, 0, 9, 10);

-- Grand Widow Faerlina - Fate of Ramaladni
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (15953, 22708, -1, 0, 1, 1, 0, 9, 10);

-- Noth the Plaguebringer - Fate of Ramaladni
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (15954, 22708, -1, 0, 1, 1, 0, 9, 10);

-- Anub'Rekhan - Fate of Ramaladni
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (15956, 22708, -1, 0, 1, 1, 0, 9, 10);

-- Loatheb - Fate of Ramaladni
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (16011, 22708, -1, 0, 1, 1, 0, 9, 10);

-- Bile Retcher - Fate of Ramaladni
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (16018, 22708, -1, 0, 1, 1, 0, 9, 10);

-- Stitched Spewer - Fate of Ramaladni
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (16025, 22708, -1, 0, 1, 1, 0, 9, 10);

-- Patchwerk - Fate of Ramaladni
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (16028, 22708, -1, 0, 1, 1, 0, 9, 10);

-- Plague Beast - Fate of Ramaladni
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (16034, 22708, -1, 0, 1, 1, 0, 9, 10);

-- Gothik the Harvester - Fate of Ramaladni
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (16060, 22708, -1, 0, 1, 1, 0, 9, 10);

-- Instructor Razuvious - Fate of Ramaladni
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (16061, 22708, -1, 0, 1, 1, 0, 9, 10);

-- Tidelord Rrurgaz - Bloodkelp
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (16072, 22094, -15, 0, 1, 1, 0, 8, 10);

-- Doom Touched Warrior - Fate of Ramaladni
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (16157, 22708, -1, 0, 1, 1, 0, 9, 10);

-- Death Touched Warrior - Fate of Ramaladni
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (16158, 22708, -1, 0, 1, 1, 0, 9, 10);

-- Unholy Staff - Fate of Ramaladni
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (16215, 22708, -1, 0, 1, 1, 0, 9, 10);

-- Unholy Swords - Fate of Ramaladni
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (16216, 22708, -1, 0, 1, 1, 0, 9, 10);

-- Plagued Deathhound - Fate of Ramaladni
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (16448, 22708, -1, 0, 1, 1, 0, 9, 10);

-- Necro Knight Guardian - Fate of Ramaladni
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (16452, 22708, -1, 0, 1, 1, 0, 9, 10);

-- Naxxramas Follower - Fate of Ramaladni
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (16505, 22708, -1, 0, 1, 1, 0, 9, 10);

-- Naxxramas Worshipper - Fate of Ramaladni
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (16506, 22708, -1, 0, 1, 1, 0, 9, 10);

-- Deathknight Understudy - Fate of Ramaladni
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (16803, 22708, -1, 0, 1, 1, 0, 9, 10);

-- Assign loot id to creature if it had no loot previously.
UPDATE `creature_template` SET `loot_id`=`entry` WHERE `loot_id`=0 && `entry` IN (200, 201, 205, 206, 334, 486, 533, 566, 567, 725, 898, 920, 1066, 1067, 1129, 1541, 1810, 1811, 1979, 1980, 1987, 1988, 1990, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2152, 2333, 2436, 2454, 2545, 2547, 2605, 2741, 2744, 2889, 2890, 2891, 3259, 3262, 3458, 3535, 3642, 3696, 4021, 4248, 4249, 4368, 4425, 4439, 4619, 4683, 4700, 4701, 4702, 4703, 4704, 4717, 4861, 4862, 4863, 5059, 5264, 5315, 5352, 5791, 5825, 5832, 5868, 6013, 6170, 6214, 6238, 6606, 6866, 7068, 7069, 7070, 7073, 7235, 7270, 7791, 7855, 7856, 7857, 7858, 7896, 8317, 8338, 8440, 8889, 8957, 9043, 9456, 9522, 9605, 10041, 10236, 10237, 10238, 10239, 10402, 10403, 10404, 10601, 10602, 10647, 10898, 11468, 11469, 11474, 11561, 11597, 11663, 11664, 11779, 12140, 12177, 12239, 12240, 12241, 12242, 12243, 12739, 14229, 14281, 14340, 14406, 14428, 14429, 14448, 14527, 14529, 14531, 14536, 14690, 15121, 15685, 15928, 15931, 15932, 15936, 15952, 15953, 15954, 15956, 16011, 16018, 16025, 16028, 16034, 16060, 16061, 16072, 16157, 16158, 16215, 16216, 16448, 16452, 16505, 16506, 16803);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
