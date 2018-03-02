DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180104200219');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180104200219');
-- Add your query below.

-- DB issues: mail items
-- https://github.com/LightsHope/server/issues/1122

-- Misc. "tarnished items"
DELETE FROM `creature_loot_template` WHERE `entry` = 11040;
UPDATE `creature_template` SET `lootid`=0 WHERE `entry`=11040;

-- Frostmane Chain Vest
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=1 WHERE `entry`=808 AND `item`=2109 AND `groupid`=0;

-- Mountaineer Chestpiece
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=4 WHERE `entry`=1196 AND `item`=2898 AND `groupid`=0;

-- Copper Chain Vest
DELETE FROM `creature_loot_template` WHERE `entry`=299 AND `item`=3471 AND `groupid`=0;

-- Light Chain Armor
DELETE FROM `creature_loot_template` WHERE `entry`=299 AND `item`=2398 AND `groupid`=0;

-- Perrine's Boots
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=4 WHERE `entry`=1662 AND `item`=3332 AND `groupid`=0;

-- Scalemail Boots
DELETE FROM `creature_loot_template` WHERE `entry`=11714 AND `item`=287 AND `groupid`=0;

-- Skullsplitter Helm
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=1 WHERE  `entry`=783 AND `item`=1624 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=1 WHERE  `entry`=781 AND `item`=1624 AND `groupid`=0;

-- Goblin Mail Leggings
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=4 WHERE `entry`=3947 AND `item`=1943 AND `groupid`=0;

-- Foreman's Leggings
DELETE FROM `reference_loot_template` WHERE `item` = 2166;
REPLACE INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`condition_id`)
VALUES (626, 2166, 1, 0, 1, 1, 0);

-- Golden Scale Shoulders
DELETE FROM `creature_loot_template` WHERE `entry`=11053 AND `item`=3841 AND `groupid`=0;

-- Silver Defias Belt
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=2.5 WHERE  `entry`=121 AND `item`=832 AND `groupid`=0;

-- Heavy Notched Belt
REPLACE INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`) 
VALUES (2845, 12257, 0, 0);

-- Beaststalker's Belt
DELETE FROM `creature_loot_template` WHERE `item` = 16680;
REPLACE INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`condition_id`) VALUES 
(9692, 16680, 1.0, 0, 1, 1, 0),
(9259, 16680, 0.75, 0, 1, 1, 0),
(9260, 16680, 1.75, 0, 1, 1, 0),
(9736, 16680, 0.75, 0, 1, 1, 0),
(10366, 16680, 1.0, 0, 1, 1, 0),
(9258, 16680, 1.75, 0, 1, 1, 0),
(9241, 16680, 2.0, 0, 1, 1, 0);

-- Cord of Elements
DELETE FROM `creature_loot_template` WHERE `item` = 16673;
REPLACE INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`condition_id`) VALUES 
(9693, 16673, 1.0, 0, 1, 1, 0),
(9262, 16673, 1.25, 0, 1, 1, 0),
(9264, 16673, 2.0, 0, 1, 1, 0),
(9736, 16673, 1.5, 0, 1, 1, 0),
(10083, 16673, 2.0, 0, 1, 1, 0),
(9257, 16673, 1.0, 0, 1, 1, 0),
(9266, 16673, 2.75, 0, 1, 1, 0);

-- Light Mail Bracers
DELETE FROM `creature_loot_template` WHERE `entry`=299 AND `item`=2396 AND `groupid`=0;

-- Marksman Bands
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=0.75 WHERE `entry`=11454 AND `item`=18296 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=0.75 WHERE `entry`=11455 AND `item`=18296 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=0.75 WHERE `entry`=11457 AND `item`=18296 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=0.75 WHERE `entry`=11452 AND `item`=18296 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=0.75 WHERE `entry`=11451 AND `item`=18296 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=0.75 WHERE `entry`=11456 AND `item`=18296 AND `groupid`=0;

-- Beaststalker's Bindings
DELETE FROM `creature_loot_template` WHERE `item` = 16681;
REPLACE INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`condition_id`) VALUES 
(9096, 16681, 2.0, 0, 1, 1, 0),
(10421, 16681, 1.75, 0, 1, 1, 0),
(10407, 16681, 1.5, 0, 1, 1, 0),
(10406, 16681, 1.75, 0, 1, 1, 0);

-- Bindings of Elements
DELETE FROM `creature_loot_template` WHERE `item` = 16671;
REPLACE INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`condition_id`) VALUES 
(10478, 16671, 1.5, 0, 1, 1, 0),
(11043, 16671, 3, 0, 1, 1, 0),
(10413, 16671, 1.5, 0, 1, 1, 0),
(10412, 16671, 1.25, 0, 1, 1, 0);

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
