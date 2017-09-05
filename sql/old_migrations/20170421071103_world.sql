INSERT INTO `migrations` VALUES ('20170421071103'); 

-- Modify primary key to allow for the same item to appear in different groups
ALTER TABLE `creature_loot_template` 
DROP PRIMARY KEY,
ADD PRIMARY KEY (`entry`, `item`, `groupid`);

-- Dump existing carapace fragment drop data
DELETE FROM creature_loot_template WHERE item = 20384 AND entry IN (11698, 11721, 11722, 11723, 11724, 11725, 11726, 11728, 11729, 11730, 11731, 11732, 11733, 11734, 13301, 13136, 11727);

-- Elites, except 15759
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES ('11734', '20384', '100', '0', '1', '3', '22');
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES ('11733', '20384', '100', '0', '1', '3', '22');
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES ('11732', '20384', '100', '0', '1', '3', '22');
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES ('11731', '20384', '100', '0', '1', '3', '22');
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES ('11730', '20384', '100', '0', '1', '3', '22');
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES ('11729', '20384', '100', '0', '1', '3', '22');
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES ('11728', '20384', '100', '0', '1', '3', '22');
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES ('11726', '20384', '100', '0', '1', '3', '22');
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES ('11725', '20384', '100', '0', '1', '3', '22');
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES ('11724', '20384', '100', '0', '1', '3', '22');
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES ('11723', '20384', '100', '0', '1', '3', '22');
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES ('11722', '20384', '100', '0', '1', '3', '22');
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES ('11721', '20384', '100', '0', '1', '3', '22');
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES ('11698', '20384', '100', '0', '1', '3', '22');

-- Hive'Regal extra drop chance (multiple sources from 2006 - hive closest to Horde - added to counteract Diplomacy rep bonus?)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES ('11730', '20384', '10', '1', '1', '1', '22');
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES ('11731', '20384', '10', '1', '1', '1', '22');
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES ('11732', '20384', '10', '1', '1', '1', '22');
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES ('11733', '20384', '10', '1', '1', '1', '22');
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES ('11734', '20384', '10', '1', '1', '1', '22');

-- Hive'Ashi Ambusher (non-elite, fast respawn)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES ('13301', '20384', '15', '0', '1', '1', '22');

-- Hive'Ashi Drone (non-elite)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES ('13136', '20384', '40', '0', '1', '1', '22');

-- Hive'Zora Wasp (non-elite)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES ('11727', '20384', '40', '0', '1', '1', '22');