DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171214204502');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171214204502');
-- Add your query below.

-- General DB issues part II: Weapons
-- https://github.com/LightsHope/server/issues/407

-- Frostmane Hand Axe
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=4 WHERE `entry`=1123 AND `item`=2260 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=4 WHERE `entry`=1122 AND `item`=2260 AND `groupid`=0;

-- Slayer's Battle Axe
DELETE FROM `reference_loot_template` WHERE `item` = 1461;
REPLACE INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`condition_id`)
VALUES (431, 1461, 1.25, 0, 1, 1, 0);

-- The Minotaur
DELETE FROM `creature_loot_template` WHERE `item` = 9481;
REPLACE INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`condition_id`) VALUES
(7274, 9481, 0.0935, 0, 1, 1, 0),
(10082, 9481, 0.08, 0, 1, 1, 0),
(7608, 9481, 0.0609, 0, 1, 1, 0),
(7605, 9481, 0.06, 0, 1, 1, 0),
(7797, 9481, 0.03, 0, 1, 1, 0),
(7272, 9481, 0.02, 0, 1, 1, 0),
(7795, 9481, 0.02, 0, 1, 1, 0);

-- Vile Fin Battle Axe
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=4 WHERE `entry`=1545 AND `item`=3325 AND `groupid`=0;

-- Stonesplinter Mace
DELETE FROM `reference_loot_template` WHERE `item` = 2267;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=2 WHERE `entry`=1197 AND `item`=2267 AND `groupid`=0;

-- Gnoll Punisher
DELETE FROM `reference_loot_template` WHERE `item` = 1214;
REPLACE INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`condition_id`) VALUES
(14271, 1214, 1, 0, 1, 1, 0),
(426, 1214, 1, 0, 1, 1, 0);

-- Mo'grosh Masher
DELETE FROM `reference_loot_template` WHERE `item` = 2821;
REPLACE INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`condition_id`) VALUES
(14267, 2821, 2, 0, 1, 1, 0),
(1179, 2821, 2, 0, 1, 1, 0);

-- Wirt's third leg
DELETE FROM `reference_loot_template` WHERE `item` = 9359;

-- Large Bear Bone
DELETE FROM `reference_loot_template` WHERE `item` = 11411;
REPLACE INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`condition_id`) VALUES
(10806, 11411, 15, 0, 1, 1, 0),
(8956, 11411, 15, 0, 1, 1, 0),
(8957, 11411, 15, 0, 1, 1, 0),
(8958, 11411, 15, 0, 1, 1, 0),
(14344, 11411, 15, 0, 1, 1, 0),
(5272, 11411, 15, 0, 1, 1, 0),
(5274, 11411, 15, 0, 1, 1, 0),
(5274, 11411, 15, 0, 1, 1, 0),
(5268, 11411, 15, 0, 1, 1, 0),
(5352, 11411, 15, 0, 1, 1, 0),
(1815, 11411, 15, 0, 1, 1, 0),
(1816, 11411, 15, 0, 1, 1, 0),
(7445, 11411, 15, 0, 1, 1, 0),
(7446, 11411, 15, 0, 1, 1, 0),
(7444, 11411, 15, 0, 1, 1, 0),
(7443, 11411, 15, 0, 1, 1, 0),
(10806, 11411, 15, 0, 1, 1, 0);

-- Pitchfork
DELETE FROM `reference_loot_template` WHERE `item` = 1485;
REPLACE INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`condition_id`) VALUES
(232, 1485, 10, 0, 1, 1, 0),
(2403, 1485, 10, 0, 1, 1, 0),
(2451, 1485, 10, 0, 1, 1, 0),
(2266, 1485, 10, 0, 1, 1, 0);

-- Headhunting Spear
DELETE FROM `reference_loot_template` WHERE `item` = 1522;
REPLACE INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`condition_id`) 
VALUES (671, 1522, 1, 0, 1, 1, 0);

-- Frostmane Shortsword
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=4 WHERE `entry`=1120 AND `item`=2258 AND `groupid`=0;

-- Short Sabre
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=4 WHERE `entry`=1529 AND `item`=3319 AND `groupid`=0;

-- Rodentia Shortsword
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=2 WHERE `entry`=1172 AND `item`=2282 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=2 WHERE `entry`=1173 AND `item`=2282 AND `groupid`=0;

-- Stonesplinter Blade
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=2 WHERE `entry`=1162 AND `item`=2268 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=2 WHERE `entry`=1161 AND `item`=2268 AND `groupid`=0;

-- Feral Blade
DELETE FROM `creature_loot_template` WHERE `item` = 4766;

-- Redridge Machete
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=1 WHERE `entry`=424 AND `item`=1219 AND `groupid`=0;

-- Blackwater Cutlass
DELETE FROM `reference_loot_template` WHERE `item` = 1951;
REPLACE INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`condition_id`) VALUES
(657, 1951, 3.5, 0, 1, 1, 0),
(1732, 1951, 3.5, 0, 1, 1, 0);

-- Scimitar of Atun
DELETE FROM `reference_loot_template` WHERE `item` = 1469;
REPLACE INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`condition_id`) VALUES
(578, 1469, 1, 0, 1, 1, 0),
(14270, 1469, 1, 0, 1, 1, 0);

-- Black Metal Greatsword
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=0.5 WHERE `entry`=1270 AND `item`=2014 AND `groupid`=0;

-- Farmer's Broom
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=4 WHERE `entry`=1935 AND `item`=3335 AND `groupid`=0;

-- Vile Fin Oracle Staff
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=4 WHERE `entry`=1544 AND `item`=3327 AND `groupid`=0;

-- Driftwood Branch
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=2 WHERE `entry`=2030 AND `item`=7094 AND `groupid`=0;

-- Frostbit Staff
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=4 WHERE `entry`=1117 AND `item`=2067 AND `groupid`=0;

-- Frostmane Staff
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=4 WHERE `entry`=1124 AND `item`=2257 AND `groupid`=0;

-- Staff of Conjuring
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=3.5 WHERE `entry`=619 AND `item`=1933 AND `groupid`=0;

-- Defias Mage Staff
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=3 WHERE `entry`=1726 AND `item`=1928 AND `groupid`=0;

-- Foamspittle Staff
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=1 WHERE `entry`=517 AND `item`=1405 AND `groupid`=0;

-- Riverpaw Mystic Staff
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=1 WHERE `entry`=453 AND `item`=1391 AND `groupid`=0;

-- Riverside Staff
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=1 WHERE `entry`=545 AND `item`=1473 AND `groupid`=0;

-- Staff of Horrors
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=1 WHERE `entry`=202 AND `item`=880 AND `groupid`=0;

-- Ogremage Staff
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=0.5 WHERE `entry`=891 AND `item`=2226 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=0.5 WHERE `entry`=1251 AND `item`=2226 AND `groupid`=0;

-- Blacksmith Hammer
DELETE FROM `creature_loot_template` WHERE `item` = 5956;

-- Mining Pick
DELETE FROM `creature_loot_template` WHERE `item` = 2901;
REPLACE INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`condition_id`) 
VALUES (3578, 2901, 100, 0, 1, 1, 0);

-- Small Hand Blade
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=2 WHERE `entry`=36 AND `item`=816 AND `groupid`=0;

-- Goblin Screwdriver
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=2.5 WHERE `entry`=622 AND `item`=1936 AND `groupid`=0;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
