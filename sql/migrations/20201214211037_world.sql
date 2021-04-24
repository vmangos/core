DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20201214211037');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20201214211037');
-- Add your query below.


-- remove lvl 50 scrolls from wendigos
DELETE FROM `creature_loot_template` WHERE `entry`=1135 && `item`=10306 && `groupid`=0;
DELETE FROM `creature_loot_template` WHERE `entry`=1135 && `item`=10308 && `groupid`=0;

-- deviate lurkers shouldn't drop crisp spider meat
DELETE FROM `creature_loot_template` WHERE  `entry`=3641 && `item`=1081 && `groupid`=0;

-- deviate lurkers should drop Threshadon Fang
INSERT INTO `creature_loot_template` VALUES (3641, 5516, 19, 0, 1, 1, 0, 0, 10);

-- defias cutpurse drop stacks of 3 inen instead of 2
UPDATE `creature_loot_template` SET `maxcount`=2 WHERE `entry`=94 && `item`=2589;

-- defias bandit drops 4 linen instead of 2
UPDATE `creature_loot_template` SET `maxcount`=2 WHERE `entry`=116 && `item`=2589;

-- riverpaw gnoll shouldn't drop wool
DELETE FROM `creature_loot_template` WHERE `entry`=117 && `item`=2592 && `groupid`=0;

-- slightly increased drop rate of linen for riverpaw gnoll
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=45 WHERE `entry`=117 && `item`=2589;

-- remove all loot from stratholme phantoms
DELETE FROM `creature_loot_template` WHERE entry = 10389;
UPDATE `creature_template` SET `loot_id`=0 WHERE `entry`=10389;
DELETE FROM `creature_loot_template` WHERE entry = 10388;
UPDATE `creature_template` SET `loot_id`=0 WHERE `entry`=10388;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
