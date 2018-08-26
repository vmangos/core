DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180718200009');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180718200009');
-- Add your query below.


-- Add random properties for the ring based on comments.
-- https://classicdb.ch/?item=17982#comments
-- https://web.archive.org/web/20060713041709/http://wow.allakhazam.com:80/db/item.html?witem=17982
INSERT INTO `item_enchantment_template` VALUES (453, 927, 1.6, 0, 10);
INSERT INTO `item_enchantment_template` VALUES (453, 928, 1.6, 0, 10);
INSERT INTO `item_enchantment_template` VALUES (453, 929, 1.6, 0, 10);
INSERT INTO `item_enchantment_template` VALUES (453, 930, 1.6, 0, 10);
INSERT INTO `item_enchantment_template` VALUES (453, 757, 1.6, 0, 10);
INSERT INTO `item_enchantment_template` VALUES (453, 758, 1.6, 0, 10);
INSERT INTO `item_enchantment_template` VALUES (453, 759, 1.6, 0, 10);
INSERT INTO `item_enchantment_template` VALUES (453, 760, 1.6, 0, 10);
INSERT INTO `item_enchantment_template` VALUES (453, 95, 1.6, 0, 10);
INSERT INTO `item_enchantment_template` VALUES (453, 113, 1.6, 0, 10);
INSERT INTO `item_enchantment_template` VALUES (453, 232, 1.6, 0, 10);
INSERT INTO `item_enchantment_template` VALUES (453, 233, 1.6, 0, 10);
INSERT INTO `item_enchantment_template` VALUES (453, 234, 1.6, 0, 10);
INSERT INTO `item_enchantment_template` VALUES (453, 238, 1.6, 0, 10);
INSERT INTO `item_enchantment_template` VALUES (453, 502, 1.6, 0, 10);
INSERT INTO `item_enchantment_template` VALUES (453, 503, 1.6, 0, 10);
INSERT INTO `item_enchantment_template` VALUES (453, 504, 1.6, 0, 10);
INSERT INTO `item_enchantment_template` VALUES (453, 505, 1.6, 0, 10);
INSERT INTO `item_enchantment_template` VALUES (453, 1748, 0.8, 0, 10);
INSERT INTO `item_enchantment_template` VALUES (453, 587, 1.6, 0, 10);
INSERT INTO `item_enchantment_template` VALUES (453, 588, 1.6, 0, 10);
INSERT INTO `item_enchantment_template` VALUES (453, 589, 1.6, 0, 10);
INSERT INTO `item_enchantment_template` VALUES (453, 590, 1.6, 0, 10);
INSERT INTO `item_enchantment_template` VALUES (453, 1449, 1.6, 0, 10);
INSERT INTO `item_enchantment_template` VALUES (453, 1450, 1.6, 0, 10);
INSERT INTO `item_enchantment_template` VALUES (453, 842, 1.6, 0, 10);
INSERT INTO `item_enchantment_template` VALUES (453, 843, 1.6, 0, 10);
INSERT INTO `item_enchantment_template` VALUES (453, 844, 1.6, 0, 10);
INSERT INTO `item_enchantment_template` VALUES (453, 845, 1.6, 0, 10);
INSERT INTO `item_enchantment_template` VALUES (453, 672, 1.6, 0, 10);
INSERT INTO `item_enchantment_template` VALUES (453, 673, 1.6, 0, 10);
INSERT INTO `item_enchantment_template` VALUES (453, 674, 1.6, 0, 10);
INSERT INTO `item_enchantment_template` VALUES (453, 675, 1.6, 0, 10);
INSERT INTO `item_enchantment_template` VALUES (453, 1403, 1.6, 0, 10);
INSERT INTO `item_enchantment_template` VALUES (453, 1404, 1.6, 0, 10);
INSERT INTO `item_enchantment_template` VALUES (453, 1311, 1.6, 0, 10);
INSERT INTO `item_enchantment_template` VALUES (453, 1312, 1.6, 0, 10);
INSERT INTO `item_enchantment_template` VALUES (453, 1097, 1.6, 0, 10);
INSERT INTO `item_enchantment_template` VALUES (453, 1098, 1.6, 0, 10);
INSERT INTO `item_enchantment_template` VALUES (453, 1099, 1.6, 0, 10);
INSERT INTO `item_enchantment_template` VALUES (453, 1100, 1.6, 0, 10);
INSERT INTO `item_enchantment_template` VALUES (453, 1357, 1.6, 0, 10);
INSERT INTO `item_enchantment_template` VALUES (453, 1358, 1.6, 0, 10);
INSERT INTO `item_enchantment_template` VALUES (453, 2070, 1.6, 0, 10);
INSERT INTO `item_enchantment_template` VALUES (453, 96, 1.6, 0, 10);
INSERT INTO `item_enchantment_template` VALUES (453, 114, 1.6, 0, 10);
INSERT INTO `item_enchantment_template` VALUES (453, 1182, 1.6, 0, 10);
INSERT INTO `item_enchantment_template` VALUES (453, 1183, 1.6, 0, 10);
INSERT INTO `item_enchantment_template` VALUES (453, 1184, 1.6, 0, 10);
INSERT INTO `item_enchantment_template` VALUES (453, 1185, 1.6, 0, 10);
INSERT INTO `item_enchantment_template` VALUES (453, 1012, 1.6, 0, 10);
INSERT INTO `item_enchantment_template` VALUES (453, 1013, 1.6, 0, 10);
INSERT INTO `item_enchantment_template` VALUES (453, 1014, 1.6, 0, 10);
INSERT INTO `item_enchantment_template` VALUES (453, 1015, 1.6, 0, 10);
INSERT INTO `item_enchantment_template` VALUES (453, 97, 1.6, 0, 10);
INSERT INTO `item_enchantment_template` VALUES (453, 115, 1.6, 0, 10);
INSERT INTO `item_enchantment_template` VALUES (453, 1495, 1.6, 0, 10);
INSERT INTO `item_enchantment_template` VALUES (453, 1496, 1.6, 0, 10);
INSERT INTO `item_enchantment_template` VALUES (453, 2105, 1.6, 0, 10);
INSERT INTO `item_enchantment_template` VALUES (453, 93, 1.6, 0, 10);
INSERT INTO `item_enchantment_template` VALUES (453, 111, 1.6, 0, 10);
INSERT INTO `item_enchantment_template` VALUES (453, 94, 1.6, 0, 10);
INSERT INTO `item_enchantment_template` VALUES (453, 112, 1.6, 0, 10);
UPDATE `item_template` SET `RandomProperty`=453 WHERE `entry`=17982;

-- Before 1.4 it had a 95% drop chance from Ragnaros according to Allakhazam.
-- https://web.archive.org/web/20050528191038/http://wow.allakhazam.com:80/db/mob.html?wmob=11502
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (11502, 17982, 95, 0, 1, 1, 0, 0, 1);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
