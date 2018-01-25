DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180121154509');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180121154509');
-- Add your query below.


-- School of Tastyfish
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`=0 WHERE `entry`=17280 AND `item`=19807;

-- Beggar's Haunt
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`) VALUES (576, 6308, 0, 1);
UPDATE `fishing_loot_template` SET `groupid`=1 WHERE `entry`=576 AND `item`=6289;

-- Deadwind Pass
UPDATE `fishing_loot_template` SET `ChanceOrQuestChance`=0 WHERE `entry`=41 AND `item`=13889;

-- Dreadmaul Rock
UPDATE `fishing_loot_template` SET `ChanceOrQuestChance`=8.3 WHERE `entry`=249 AND `item`=13759;
UPDATE `fishing_loot_template` SET `ChanceOrQuestChance`=0 WHERE `entry`=249 AND `item`=13758;

-- Zul Gurub
UPDATE `fishing_loot_template` SET `ChanceOrQuestChance`=0 WHERE `entry`=19 AND `item`=13889;

-- Noxious Glade
-- Copied from EPL table
DELETE FROM `fishing_loot_template` WHERE `entry`=2270;
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES 
(2270, 4603, 0.2722, 1, 1, 1, 0),
(2270, 6358, 0.9618, 1, 1, 1, 0),
(2270, 6362, 0.1361, 1, 1, 1, 0),
(2270, 8365, 0.8348, 1, 1, 1, 0),
(2270, 13443, 0.2631, 1, 1, 1, 0),
(2270, 13446, 0.3266, 1, 1, 1, 0),
(2270, 13757, 9.1734, 1, 1, 1, 81),
(2270, 13758, 9.5545, 1, 1, 1, 0),
(2270, 13759, 12.4036, 1, 1, 1, 82),
(2270, 13760, 18.8458, 1, 1, 1, 81),
(2270, 13889, 0, 1, 1, 1, 0),
(2270, 13890, 10.1896, 1, 1, 1, 82);

-- The Veiled Sea
-- Copied from Darkshore table
DELETE FROM `fishing_loot_template` WHERE `entry`=2477;
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES 
(2477, 3820, 0.8371, 1, 1, 3, 0),
(2477, 6289, 7.4902, 1, 1, 1, 0),
(2477, 6291, 2.0018, 1, 1, 1, 0),
(2477, 6303, 16.1003, 1, 1, 1, 0),
(2477, 6307, 0.2603, 1, 1, 1, 0),
(2477, 6308, 2.6969, 1, 1, 1, 0),
(2477, 6351, 0.2367, 1, 1, 1, 0),
(2477, 6353, 0.2167, 1, 1, 1, 0),
(2477, 6358, 11.9547, 1, 1, 1, 0),
(2477, 6361, 24.0128, 1, 1, 1, 0),
(2477, 6717, 2.5686, 1, 1, 1, 0),
(2477, 6718, 6.2031, 1, 1, 1, 0),
(2477, 12238, 0, 1, 1, 1, 0),
(2477, 20708, 1.4437, 1, 1, 1, 0),
(2477, 20709, 0.5269, 1, 1, 3, 0);

-- Dire Maul
UPDATE `fishing_loot_template` SET `ChanceOrQuestChance`=15.7576 WHERE  `entry`=2557 AND `item`=13760;
UPDATE `fishing_loot_template` SET `ChanceOrQuestChance`=0 WHERE  `entry`=2557 AND `item`=13889;



-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
