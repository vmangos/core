DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171212194237');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171212194237');
-- Add your query below.

-- General DB issues part V: Cloth chests
-- https://github.com/LightsHope/server/issues/510

-- Stonesplinter Rags
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=2 WHERE `entry`=1398 AND `item`=5109 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=2 WHERE `entry`=1205 AND `item`=5109 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=2 WHERE `entry`=1206 AND `item`=5109 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=2 WHERE `entry`=1166 AND `item`=5109 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=2 WHERE `entry`=1163 AND `item`=5109 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=2 WHERE `entry`=1207 AND `item`=5109 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=2 WHERE `entry`=1167 AND `item`=5109 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=2 WHERE `entry`=1165 AND `item`=5109 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=2 WHERE `entry`=1161 AND `item`=5109 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=2 WHERE `entry`=1162 AND `item`=5109 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=2 WHERE `entry`=1197 AND `item`=5109 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=2 WHERE `entry`=1393 AND `item`=5109 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=2 WHERE `entry`=1164 AND `item`=5109 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=2 WHERE `entry`=1399 AND `item`=5109 AND `groupid`=0;

-- Noble's Robe
DELETE FROM `reference_loot_template` WHERE `item` = 3019;
REPLACE INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`condition_id`)
VALUES (599, 3019, 25, 5, 1, 1, 0);
-- Groupid 5 same as Walking Boots 4660

-- Dalaran Wizard's Robe
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=2 WHERE `entry`=3578 AND `item`=5110 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=2 WHERE `entry`=1913 AND `item`=5110 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=2 WHERE `entry`=1888 AND `item`=5110 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=2 WHERE `entry`=3577 AND `item`=5110 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=2 WHERE `entry`=1912 AND `item`=5110 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=2 WHERE `entry`=1915 AND `item`=5110 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=2 WHERE `entry`=1889 AND `item`=5110 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=2 WHERE `entry`=2120 AND `item`=5110 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=2 WHERE `entry`=1920 AND `item`=5110 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=2 WHERE `entry`=1867 AND `item`=5110 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=2 WHERE `entry`=1914 AND `item`=5110 AND `groupid`=0;

-- Scholarly Robes
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=0.75 WHERE `entry`=4810 AND `item`=2034 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=0.75 WHERE `entry`=4809 AND `item`=2034 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=0.75 WHERE `entry`=4813 AND `item`=2034 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=0.75 WHERE `entry`=4812 AND `item`=2034 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=0.75 WHERE `entry`=4811 AND `item`=2034 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=0.75 WHERE `entry`=4814 AND `item`=2034 AND `groupid`=0;

-- Smoldering Robe
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=0.25 WHERE `entry`=1044 AND `item`=3072 AND `groupid`=0;

-- Robes of the Shadowcaster
DELETE FROM `reference_loot_template` WHERE `item` = 1297;
REPLACE INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`condition_id`) VALUES
(2577, 1297, 0.6, 0, 1, 1, 0),
(2553, 1297, 0.5, 0, 1, 1, 0);

-- Pressed Felt Robe
DELETE FROM `creature_loot_template` WHERE `item` = 1997;
REPLACE INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`condition_id`)
VALUES (701, 1997, 0.6, 0, 1, 1, 0);



-- General DB issues part VI: Cloth feet, hands and heads
-- https://github.com/LightsHope/server/issues/522

-- Walking Boots
DELETE FROM `reference_loot_template` WHERE `item` = 4660;
REPLACE INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`condition_id`)
VALUES (599, 4660, 75, 5, 1, 1, 0); 
-- groupid 5 same as Noble's Robe 3019

-- Foreman's Boots
DELETE FROM `reference_loot_template` WHERE `item` = 2168;
REPLACE INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`condition_id`)
VALUES (626, 2168, 1, 0, 1, 1, 0);

-- Dark Runner Boots
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=0.5 WHERE `entry`=205 AND `item`=2232 AND `groupid`=0;

-- Coppercloth Gloves
DELETE FROM `reference_loot_template` WHERE `item` = 4767;
REPLACE INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`condition_id`)
VALUES (3578, 4767, 2.5, 0, 1, 1, 0);

-- First Mate Hat
DELETE FROM `reference_loot_template` WHERE `item` = 2955;
REPLACE INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`condition_id`) VALUES
(4505, 2955, 0.01, 0, 1, 1, 0),
(1562, 2955, 0.01, 0, 1, 1, 0),
(1565, 2955, 0.01, 0, 1, 1, 0),
(1653, 2955, 0.01, 0, 1, 1, 0),
(1561, 2955, 0.01, 0, 1, 1, 0),
(4506, 2955, 0.01, 0, 1, 1, 0),
(1564, 2955, 0.01, 0, 1, 1, 0);

-- Living Cowl
REPLACE INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`condition_id`)
VALUES (14448, 5608, 1.5, 0, 1, 1, 0);
-- Other current mob is correct, item should have 2 mobs dropping it



-- General DB issues part VII: Cloth legs, shoulders and waists
-- https://github.com/LightsHope/server/issues/616

-- Silk-threaded Trousers
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=4 WHERE `entry`=1729 AND `item`=1929 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=4 WHERE `entry`=4418 AND `item`=1929 AND `groupid`=0;

-- Smoldering Pants
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=0.5 WHERE `entry`=1069 AND `item`=3073 AND `groupid`=0;

-- Pale Leggings
REPLACE INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`) 
VALUES (3315, 12255, 0, 0);
-- Seems to give the intended behavior, is it correct?

-- Cindercloth Leggings
REPLACE INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`) 
VALUES (3316, 12256, 0, 0);

-- Lesser Belt of the Spire
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=1.5 WHERE `entry`=436 AND `item`=1299 AND `groupid`=0;

-- Devout Belt
DELETE FROM `creature_loot_template` WHERE `item` = 16696;
REPLACE INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`condition_id`) VALUES 
(9098, 16696, 1, 0, 1, 1, 0),
(9818, 16696, 3.5, 0, 1, 1, 0),
(9717, 16696, 1.5, 0, 1, 1, 0),
(9261, 16696, 1, 0, 1, 1, 0),
(9263, 16696, 2, 0, 1, 1, 0),
(9736, 16696, 0.5, 0, 1, 1, 0),
(9240, 16696, 2, 0, 1, 1, 0);

-- Dreadmist Belt
DELETE FROM `creature_loot_template` WHERE `item` = 16702;
REPLACE INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`condition_id`) VALUES 
(10477, 16702, 1.5, 0, 1, 1, 0),
(10419, 16702, 1, 0, 1, 1, 0),
(10400, 16702, 1, 0, 1, 1, 0),
(10398, 16702, 1, 0, 1, 1, 0);

-- Magister's Belt
DELETE FROM `creature_loot_template` WHERE `item` = 16685;
REPLACE INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`condition_id`) VALUES 
(9239, 16685, 2.5, 0, 1, 1, 0),
(10469, 16685, 1.5, 0, 1, 1, 0),
(10425, 16685, 3, 0, 1, 1, 0),
(10419, 16685, 1, 0, 1, 1, 0),
(10422, 16685, 2, 0, 1, 1, 0),
(10400, 16685, 1, 0, 1, 1, 0),
(10398, 16685, 1, 0, 1, 1, 0);



-- General DB issues part VIII: Cloth wrists and cloaks
-- https://github.com/LightsHope/server/issues/618

-- Devout Bracers
DELETE FROM `creature_loot_template` WHERE `item` = 16697;
REPLACE INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`condition_id`) VALUES 
(10419, 16697, 1, 0, 1, 1, 0),
(10420, 16697, 2, 0, 1, 1, 0),
(10423, 16697, 4, 0, 1, 1, 0),
(10400, 16697, 1, 0, 1, 1, 0),
(10398, 16697, 1, 0, 1, 1, 0);

-- Dreadmist Bracers
DELETE FROM `creature_loot_template` WHERE `item` = 16703;
REPLACE INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`condition_id`) VALUES 
(9817, 16703, 3.5, 0, 1, 1, 0),
(9717, 16703, 1.25, 0, 1, 1, 0),
(9261, 16703, 1, 0, 1, 1, 0),
(9263, 16703, 1.75, 0, 1, 1, 0),
(9736, 16703, 1.5, 0, 1, 1, 0),
(9257, 16703, 1, 0, 1, 1, 0),
(9269, 16703, 2, 0, 1, 1, 0),
(10680, 16703, 3.5, 0, 1, 1, 0);

-- Magister's Bindings
DELETE FROM `creature_loot_template` WHERE `item` = 16683;
REPLACE INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`condition_id`) VALUES 
(9098, 16683, 1, 0, 1, 1, 0),
(9693, 16683, 1.25, 0, 1, 1, 0),
(9262, 16683, 1, 0, 1, 1, 0),
(9264, 16683, 1.5, 0, 1, 1, 0),
(9736, 16683, 0.75, 0, 1, 1, 0),
(10372, 16683, 2.25, 0, 1, 1, 0);

-- Orphic Bracers
DELETE FROM `reference_loot_template` WHERE `item` = 18337;
REPLACE INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`condition_id`) VALUES 
(11480, 18337, 1, 0, 1, 1, 0),
(14399, 18337, 1, 0, 1, 1, 0),
(11484, 18337, 1, 0, 1, 1, 0),
(11483, 18337, 1, 0, 1, 1, 0);

-- Overseer's Cloak
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=0.5 WHERE `entry`=125 AND `item`=1190 AND `groupid`=0;

-- Cloak of Rot
UPDATE `item_template` SET `stat_value1`=-5 WHERE `entry` = 4462 AND `stat_type1`=7;

-- Eidolon Cloak
DELETE FROM `reference_loot_template` WHERE `item` = 18339;
REPLACE INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`condition_id`) VALUES 
(11471, 18339, 0.75, 0, 1, 1, 0),
(11475, 18339, 0.75, 0, 1, 1, 0),
(11473, 18339, 0.75, 0, 1, 1, 0),
(11472, 18339, 0.75, 0, 1, 1, 0);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
