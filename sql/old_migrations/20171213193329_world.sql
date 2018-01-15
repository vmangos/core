DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171213193329');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171213193329');
-- Add your query below.


-- General DB issues part IV: Misc items
-- https://github.com/LightsHope/server/issues/461

-- Brawler's Boots
DELETE FROM `creature_loot_template` WHERE `item` = 140;

-- Cubic Zirconia Ring
DELETE FROM `gameobject_loot_template` WHERE `item` = 7341;

-- Black Widow Band
UPDATE `item_template` SET `stat_value1`=-5 WHERE `entry` = 6199 AND `stat_type1`=7;

-- Defias Renegade Ring
DELETE FROM `reference_loot_template` WHERE `item` = 1076;
REPLACE INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`condition_id`) VALUES 
(1706, 1076, 0.6, 0, 1, 1, 0),
(1707, 1076, 0.6, 0, 1, 1, 0),
(1708, 1076, 0.6, 0, 1, 1, 0),
(1711, 1076, 0.6, 0, 1, 1, 0),
(1715, 1076, 0.6, 0, 1, 1, 0);

-- Ogremind Ring
REPLACE INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`condition_id`) VALUES 
(2255, 1993, 1.5, 0, 1, 1, 0),
(2907, 1993, 0.5, 0, 1, 1, 0);

-- Cold Basilisk Eye
DELETE FROM `reference_loot_template` WHERE `item` = 5079;
REPLACE INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`condition_id`) 
VALUES (690, 5079, 0.75, 0, 1, 1, 0);

-- Shriveled Heart
UPDATE `item_template` SET `stat_value1`='-5', `stat_value2`='-5' WHERE  `entry`=9243 AND `patch`=0;

-- Brainlash
UPDATE `item_template` SET `stat_value3`='-10' WHERE  `entry`=6440 AND `patch`=0;

-- Runed Ring
REPLACE INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`condition_id`) VALUES 
(7274, 862, 0.0935, 0, 1, 1, 0),
(10082, 862, 0.08, 0, 1, 1, 0),
(7608, 862, 0.0609, 0, 1, 1, 0),
(7605, 862, 0.06, 0, 1, 1, 0),
(7797, 862, 0.03, 0, 1, 1, 0),
(7272, 862, 0.02, 0, 1, 1, 0),
(7795, 862, 0.02, 0, 1, 1, 0);

-- Petrified Band
DELETE FROM `reference_loot_template` WHERE `item` = 18343;
REPLACE INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`condition_id`) VALUES 
(11459, 18343, 0.5, 0, 1, 1, 0),
(14303, 18343, 0.5, 0, 1, 1, 0),
(11458, 18343, 0.5, 0, 1, 1, 0);

-- Checked

-- General DB issues part IX: Leather chests, feet, hands and head
-- https://github.com/LightsHope/server/issues/691

-- Lumberjack Jerkin
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=4 WHERE `entry`=1689 AND `item`=2112 AND `groupid`=0;

-- Embossed Leather Vest
DELETE FROM `reference_loot_template` WHERE `item` = 2300;

-- Hard Crawler Carapace
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=2.5 WHERE `entry`=830 AND `item`=2087 AND `groupid`=0;

-- Riverpaw Leather Vest
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=2.5 WHERE `entry`=123 AND `item`=821 AND `groupid`=0;

-- Agile Boots
DELETE FROM `reference_loot_template` WHERE `item` = 4788;

-- Foreman's Gloves
DELETE FROM `reference_loot_template` WHERE `item` = 2167;
REPLACE INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`condition_id`)
VALUES (626, 2167, 1, 0, 1, 1, 0);

-- Humbert's Helm
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=2 WHERE `entry`=2345 AND `item`=4724 AND `groupid`=0;



-- General DB issues part X: Leather legs, shoulders, waists and wrists
-- https://github.com/LightsHope/server/issues/709

-- Rugged Leather Pants
DELETE FROM `creature_loot_template` WHERE `item` = 7280;

-- Stonemason Trousers
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=3.5 WHERE `entry`=636 AND `item`=1934 AND `groupid`=0;

-- Unbridled Leggings
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=0.75 WHERE `entry`=11454 AND `item`=18298 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=0.75 WHERE `entry`=11455 AND `item`=18298 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=0.75 WHERE `entry`=11456 AND `item`=18298 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=0.75 WHERE `entry`=11452 AND `item`=18298 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=0.75 WHERE `entry`=11457 AND `item`=18298 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=0.75 WHERE `entry`=11451 AND `item`=18298 AND `groupid`=0;

-- Bashing Pauldrons
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=100 WHERE `entry`=2478 AND `item`=5319 AND `groupid`=0;

-- Guardsman Belt
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=0.75 WHERE `entry`=2427 AND `item`=3429 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=0.75 WHERE `entry`=2428 AND `item`=3429 AND `groupid`=0;

-- Wendigo Collar
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=2 WHERE `entry`=1271 AND `item`=2899 AND `groupid`=0;

-- Shadowcraft Belt
DELETE FROM `creature_loot_template` WHERE `item` = 16713;
REPLACE INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`condition_id`) VALUES 
(10318, 16713, 3, 0, 1, 1, 0),
(9716, 16713, 1, 0, 1, 1, 0),
(9259, 16713, 0.75, 0, 1, 1, 0),
(9260, 16713, 1.5, 0, 1, 1, 0),
(9736, 16713, 1.5, 0, 1, 1, 0),
(9097, 16713, 1, 0, 1, 1, 0),
(9265, 16713, 2.25, 0, 1, 1, 0);

-- Wildheart Belt
DELETE FROM `reference_loot_template` WHERE `item` = 16716;
DELETE FROM `creature_loot_template` WHERE `item` = 16716;
REPLACE INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`condition_id`) VALUES 
(9692, 16716, 1.25, 0, 1, 1, 0),
(9736, 16716, 1.5, 0, 1, 1, 0),
(9258, 16716, 1.25, 0, 1, 1, 0),
(11257, 16716, 2, 0, 1, 1, 0),
(10499, 16716, 1.5, 0, 1, 1, 0),
(10500, 16716, 1.5, 0, 1, 1, 0),
(10507, 16716, 3.5, 0, 1, 1, 0);

-- Deepwood Bracers
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=1.25 WHERE `entry`=2372 AND `item`=3204 AND `groupid`=0;

-- Shadowcraft Bracers
DELETE FROM `reference_loot_template` WHERE `item` = 16710;
DELETE FROM `creature_loot_template` WHERE `item` = 16710;
REPLACE INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`condition_id`) VALUES 
(11284, 16710, 1.5, 0, 1, 1, 0),
(10505, 16710, 3.5, 0, 1, 1, 0),
(10488, 16710, 1.5, 0, 1, 1, 0),
(10472, 16710, 2.25, 0, 1, 1, 0),
(10405, 16710, 1.5, 0, 1, 1, 0);

-- Wildheart Bracers
DELETE FROM `creature_loot_template` WHERE `item` = 16714;
REPLACE INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`condition_id`) VALUES 
(10495, 16714, 1.5, 0, 1, 1, 0),
(10426, 16714, 1.75, 0, 1, 1, 0),
(10463, 16714, 1.5, 0, 1, 1, 0),
(10464, 16714, 1.75, 0, 1, 1, 0);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
