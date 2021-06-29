DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210606150715');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210606150715');
-- Add your query below.

UPDATE `item_template` SET `min_money_loot` = 0, `max_money_loot` = 1500 WHERE `entry` = 20766; -- Slimy Bag
UPDATE `item_template` SET `min_money_loot` = 500, `max_money_loot` = 2000 WHERE `entry` = 20767; -- Scum Covered Bag
UPDATE `item_template` SET `min_money_loot` = 1000, `max_money_loot` = 2500 WHERE `entry` = 20768; -- Oozing Bag

UPDATE `item_loot_template` SET `groupid` = 1 WHERE `entry` IN (20766, 20767, 20768) AND `item` IN
 (929, 1710, 3385, 3827, 3928, 6149); -- Consumables
UPDATE `item_loot_template` SET `groupid` = 2 WHERE `entry` IN (20766, 20767, 20768) AND `item` IN
 (765, 785, 2447, 2449, 2450, 2452, 2453, 3356, 3357, 3818, 3819, 3820, 3821, 4625, 8831, 8838, 8839, 8845, 8846, 13463, 13464); -- Herbs
UPDATE `item_loot_template` SET `groupid` = 3 WHERE `entry` IN (20766, 20767, 20768) AND `item` IN
 (1529, 1705, 7909, 3864, 7910); -- Gems

-- Add missing recipes
DELETE FROM `item_loot_template` WHERE `entry` IN
 (20766, 20767, 20768) AND `item` IN
 (3608, 5774, 11167, 7090, 4300, 8029, 7993, 7975, 9295, 8389, 8387, 7992, 7990, 3395, 10312, 10315, 10301, 10320, 8386, 8390, 11225, 15746, 14496, 14466, 14474, 12704, 14504, 14506, 15737, 14470, 12683, 12684, 15757, 14484, 14494, 14508);

INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES
(20766, 3608,  0.24, 4, 1, 1, 0, 7, 10),
(20766, 5774,  0.24, 4, 1, 1, 0, 7, 10),
(20766, 11167, 0.24, 4, 1, 1, 0, 7, 10),
(20766, 7090,  0.24, 4, 1, 1, 0, 7, 10),
(20766, 4300,  0.24, 4, 1, 1, 0, 7, 10),
(20767, 8029,  0.20, 4, 1, 1, 0, 7, 10),
(20767, 7993,  0.11, 4, 1, 1, 0, 7, 10),
(20767, 7975,  0.11, 4, 1, 1, 0, 7, 10),
(20767, 9295,  0.11, 4, 1, 1, 0, 7, 10),
(20767, 8389,  0.10, 4, 1, 1, 0, 7, 10),
(20767, 8387,  0.09, 4, 1, 1, 0, 7, 10),
(20767, 7992,  0.08, 4, 1, 1, 0, 7, 10),
(20767, 7990,  0.07, 4, 1, 1, 0, 7, 10),
(20767, 3395,  0.06, 4, 1, 1, 0, 7, 10),
(20767, 10312, 0.06, 4, 1, 1, 0, 7, 10),
(20767, 10315, 0.06, 4, 1, 1, 0, 7, 10),
(20767, 10301, 0.06, 4, 1, 1, 0, 7, 10),
(20767, 10320, 0.06, 4, 1, 1, 0, 7, 10),
(20767, 8386,  0.06, 4, 1, 1, 0, 7, 10),
(20767, 8390,  0.06, 4, 1, 1, 0, 7, 10),
(20767, 11225, 0.06, 4, 1, 1, 0, 7, 10),
(20768, 15746, 0.13, 4, 1, 1, 0, 7, 10),
(20768, 14496, 0.11, 4, 1, 1, 0, 7, 10),
(20768, 14466, 0.09, 4, 1, 1, 0, 7, 10),
(20768, 14474, 0.09, 4, 1, 1, 0, 7, 10),
(20768, 12704, 0.09, 4, 1, 1, 0, 7, 10),
(20768, 14504, 0.09, 4, 1, 1, 0, 7, 10),
(20768, 14506, 0.09, 4, 1, 1, 0, 7, 10),
(20768, 15737, 0.07, 4, 1, 1, 0, 7, 10),
(20768, 14470, 0.07, 4, 1, 1, 0, 7, 10),
(20768, 12683, 0.07, 4, 1, 1, 0, 7, 10),
(20768, 12684, 0.07, 4, 1, 1, 0, 7, 10),
(20768, 15757, 0.07, 4, 1, 1, 0, 7, 10),
(20768, 14484, 0.07, 4, 1, 1, 0, 7, 10),
(20768, 14494, 0.07, 4, 1, 1, 0, 7, 10),
(20768, 14508, 0.07, 4, 1, 1, 0, 7, 10);

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
