DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20211230201500');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20211230201500');
-- Add your query below.

-- Correct drop chance: [Recipe: Succulent Pork Ribs] https://classic.wowhead.com/item=2700/recipe-succulent-pork-ribs
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=0.3 WHERE`item`=2700 AND `entry`=1164;
-- Grizlak
DELETE FROM `creature_loot_template` WHERE `item`=2700 AND `entry`=1425;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES
(1425,2700,0.3,0,1,1,0,0,10);
-- Mo'grosh Enforcer, Mo'grosh Brute, Mo'grosh Shaman, Dark Iron Sapper
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=0.2 WHERE`item`=2700 AND `entry` IN (1179, 1180, 1181, 1222);

-- Correct drop chance: [A Letter to Yvette] https://classic.wowhead.com/item=2839/a-letter-to-yvette
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=4 WHERE `item`=2839 AND `entry`=1522;           -- Darkeye Bonecaster
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=3 WHERE `item`=2839 AND `entry` IN (1520,1523); -- Rattlecage Soldier, Cracked Skull Soldier

DELETE FROM `creature_loot_template` WHERE `item`=2839 AND `entry` IN (1664,1770,1548,1537,1530,1532);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES
(1664,2839,0.12,0,1,1,2,0,10), -- Captain Vachon - A Letter to Yvette
(1770,2839,0.05,0,1,1,2,0,10), -- Moonrage Darkrunner - A Letter to Yvette
(1548,2839,0.01,0,1,1,2,0,10), -- Cursed Darkhound - A Letter to Yvette
(1537,2839,0.01,0,1,1,2,0,10), -- Scarlet Zealot - A Letter to Yvette
(1530,2839,0.01,0,1,1,2,0,10), -- Rotting Ancestor - A Letter to Yvette
(1532,2839,0.01,0,1,1,2,0,10); -- Wandering Spirit - A Letter to Yvette

-- Correct drop chance: [Westfall Deed] https://classic.wowhead.com/item=1972/westfall-deed
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=4 WHERE `item`=1972 AND `entry` IN (6866,6846);
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=3 WHERE `item`=1972 AND `entry` IN (116,474,880,6927);

-- Correct drop chance: [Gold Pickup Schedule] https://classic.wowhead.com/item=1307/gold-pickup-schedule
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=86 WHERE `item`=1307 AND `entry`=100;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=3 WHERE `item`=1307 AND `entry` IN (478,97);
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=1.9 WHERE `item`=1307 AND `entry`=448;

-- Correct drop chance: [Unrefined Ore Sample] https://classic.wowhead.com/quest=1153/a-new-ore-sample
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-53 WHERE `item`=5842 AND `entry`=4116;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-48 WHERE `item`=5842 AND `entry`=4113;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-18 WHERE `item`=5842 AND `entry`=14427;

-- Correct drop chance: [Flayed Demon Skin] https://classic.wowhead.com/item=20310/flayed-demon-skin
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=5 WHERE `item`=20310 AND `entry` IN (4664,4663);
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=3 WHERE `item`=20310 AND `entry` IN (4666,4665,4705);
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=1.8 WHERE `item`=20310 AND `entry` IN (4668,4667);
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=1.4 WHERE `item`=20310 AND `entry`=13019;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
