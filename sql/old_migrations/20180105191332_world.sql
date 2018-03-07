DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180105191332');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180105191332');
-- Add your query below.

-- Missing item in loot tables of Pirate Footlocker.
-- https://github.com/LightsHope/server/issues/1072

DELETE FROM `creature_loot_template` WHERE `item`=9249 AND `groupid`=0;
REPLACE INTO `item_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`condition_id`) 
VALUES (9276, 9249, 10, 0, 1, 1, 0);


-- The 3 quests Assisting Arch Druid Staghelm are a small mess.
-- https://github.com/LightsHope/server/issues/748

UPDATE `creature_questrelation` SET `quest`=3789 WHERE `id`=6740 AND `quest`=3790 AND `patch`=0;
UPDATE `creature_questrelation` SET `quest`=3790 WHERE `id`=5111 AND `quest`=3789 AND `patch`=0;


-- Leonid Bartolomew Quest opens too early
-- https://github.com/LightsHope/server/issues/1138
-- Set quest 5522 to require 4735 instead of 4734 also change 4735 to the 3rd quest in a chain following 4734

UPDATE `quest_template` SET `PrevQuestId`=4735 WHERE `entry`=5522 AND `patch`=0;
UPDATE `quest_template` SET `NextQuestInChain`=4735 WHERE `entry`=4734 AND `patch`=0;


-- Quest Prerequisite: The Real Threat
-- https://github.com/elysium-project/bug-tracker/issues/247
-- Source: http://web.archive.org/web/20070115075621/http://www.thottbot.com:80/?qu=680

UPDATE `quest_template` SET `PrevQuestId`=678 WHERE `entry`=680 AND `patch`=0;


-- Quest Prerequisite: Continued Threat
-- https://github.com/elysium-project/bug-tracker/issues/252
-- Source: http://web.archive.org/web/20070310141812/http://www.thottbot.com:80/?qu=1427

UPDATE `quest_template` SET `PrevQuestId`=1427 WHERE `entry`=1428 AND `patch`=0;
UPDATE `quest_template` SET `NextQuestInChain`=1428 WHERE `entry`=1427 AND `patch`=0;


-- Quest: Creeper Ichor droprate
-- https://github.com/elysium-project/bug-tracker/issues/194
-- Source: https://web.archive.org/web/20070319184622/http://www.thottbot.com:80/i3477 "circled the camp 3 times" does not sound like a 100% droprate --> 15%

UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-15 WHERE `entry`=2348 AND `item`=3477 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-15 WHERE `entry`=2349 AND `item`=3477 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-15 WHERE `entry`=2350 AND `item`=3477 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-15 WHERE `entry`=14279 AND `item`=3477 AND `groupid`=0;


-- Quest: Unrefined Ore Sample drop rate
-- https://github.com/elysium-project/bug-tracker/issues/181
-- Source: https://web.archive.org/web/20070515082823/http://www.thottbot.com:80/i5842 --> 15%

UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-15 WHERE `entry`=4116 AND `item`=5842 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-15 WHERE `entry`=14427 AND `item`=5842 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-15 WHERE `entry`=4113 AND `item`=5842 AND `groupid`=0;


-- Quest: Befouled by Satyr
-- https://github.com/elysium-project/bug-tracker/issues/210
-- Source:	https://web.archive.org/web/20070714183751/http://wow.allakhazam.com:80/db/quest.html?wquest=1434	1434 after 1432
-- Source:	https://web.archive.org/web/20070810103630/http://wow.allakhazam.com:80/db/quest.html?wquest=1436	1436 after both 1434 and 1435

UPDATE `quest_template` SET `PrevQuestId`=1432 WHERE `entry`=1434 AND `patch`=0;

UPDATE `quest_template` SET `ExclusiveGroup`=-1434 WHERE `entry`=1434 AND `patch`=0;
UPDATE `quest_template` SET `NextQuestId`=1436 WHERE `entry`=1434 AND `patch`=0;

UPDATE `quest_template` SET `ExclusiveGroup`=-1434 WHERE `entry`=1435 AND `patch`=0;
UPDATE `quest_template` SET `NextQuestId`=1436 WHERE `entry`=1435 AND `patch`=0;


-- Mistress Natalia Mar'alith should be elite, not rare elite.
-- https://github.com/LightsHope/server/issues/1141

UPDATE `creature_template` SET `rank`=1 WHERE `entry`=15215 AND `patch`=0;


-- Bloodstained Coif not in loot table
-- https://github.com/LightsHope/server/issues/1111

REPLACE INTO `reference_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`condition_id`) VALUES 
(324532, 19875, 0, 2, 1, 1, 0),
(324533, 19875, 0, 3, 1, 1, 0);

-- Bone Collector [Quest] 
-- https://github.com/LightsHope/server/issues/147 

-- Add trap object casting correct spell to summon creature id 11521 (Kodo Apparition)
INSERT INTO `gameobject_template` (`entry`,`type`, `displayId`, `name`, `faction`, `flags`, `size`, `data3`, `data4`) VALUES (176750, 6, 1287, 'Kodo Bones Trap', 14, 4, 0.5, 17960, 1);

-- Add Guid for trap objects corresponding to object guids and their locations with re-spawn timer of 2x of kodo bones
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawnFlags`) VALUES 
(31700, 176750, 1, -1258.74, 1856.7, 50.1442, 1.8326, 0.793353, 0.608761, 1000, 1000, 100, 1, 8),
(31701, 176750, 1, -1303.66, 1887.6, 50.3437, -1.50098, 0.681998, -0.731354, 1000, 1000, 100, 1, 8),
(31702, 176750, 1, -1307.84, 1949.76, 51.0022, -0.034907, 0.017452, -0.999848, 1000, 1000, 100, 1, 8),
(31703, 176750, 1, -1310.88, 2035.5, 50.1442, -2.77507, 0.983255, -0.182235, 1000, 1000, 100, 1, 8),
(31704, 176750, 1, -1315.02, 1796.78, 50.1442, -1.0821, 0.515038, -0.857167, 1000, 1000, 100, 1, 8),
(31705, 176750, 1, -1349.28, 2031.71, 50.1442, -0.942478, 0.453991, -0.891006, 1000, 1000, 100, 1, 8),
(31706, 176750, 1, -1358.2, 1787.12, 50.1443, -2.40855, 0.93358, -0.358368, 1000, 1000, 100, 1, 8),
(31707, 176750, 1, -1383.97, 1838.74, 50.1442, -3.10669, 0.999848, -0.017452, 1000, 1000, 100, 1, 8),
(31708, 176750, 1, -1386.78, 2157.37, 66.9486, -1.85005, 0.798635, -0.601815, 1000, 1000, 100, 1, 8),
(31709, 176750, 1, -1461.4, 1785.83, 50.2736, -2.37365, 0.927184, -0.374607, 1000, 1000, 100, 1, 8);

-- Summons should not have item drops
DELETE FROM `creature_loot_template` WHERE `entry`=11521 AND `item`=3369 AND `groupid`=0; 
UPDATE `creature_template` SET `lootid`=0 WHERE `entry`=11521;

-- Quest: Westbrook Garrison Needs Help! prereq
-- https://github.com/elysium-project/bug-tracker/issues/283
-- Source1: https://web.archive.org/web/20070311052407/http://www.thottbot.com:80/?qu=239
-- Source2: https://web.archive.org/web/20071031053402/http://wow.allakhazam.com:80/db/quest.html?wquest=239

UPDATE `quest_template` SET `PrevQuestId`=76 WHERE `entry`=239 AND `patch`=0;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
