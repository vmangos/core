INSERT INTO `migrations` VALUES ('20170407061445');

-- Fix loot template for Feralas Distress Beacon. Chance was mistakenly set to -100
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 1 WHERE `item` = 8705 AND `ChanceOrQuestChance` = -100;

-- Fix loot template for Hinterlands Distress Beacon. 
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 1 WHERE `item` = 8704 AND `ChanceOrQuestChance` = -100;

