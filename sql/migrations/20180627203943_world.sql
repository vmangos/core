DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180627203943');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180627203943');
-- Add your query below.


-- Battered Junkbox should drop money.
-- https://classicdb.ch/?item=16882#comments
-- "They also contain a few copper."
-- "don't let it get out, but some how i looted this boy twice! got 1s 23c twice from it. dunno how though."
-- "Even though they have a small chance of dropping a nice B.o.E weapon, most of the boxes contain a pitiful amount of cash"
-- "A sum total of 17 silver 69 copper (ranging between 25 copper and 1 silver 21 copper)"
-- https://web.archive.org/web/20071115120358/http://wow.allakhazam.com:80/db/item.html?witem=16882
-- "I have found these few things from them:
-- 1:some copper-few silver (less than 3s) "
UPDATE `item_template` SET `minMoneyLoot`=25, `maxMoneyLoot`=125 WHERE `entry`=16882;

-- There is a tiny chance to get a blue dagger. These 2 are missing, other 4 are there.
-- "I looted Blackvenom Blade from one of these today. I too didn't have the addon, so can't add to the statistics, but these are worth gathering and opening!"
-- "I got the ziggler from this "junkbox"... @ lvl 37 rouge this was much obliged^^"
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES
(1000, 4446, 0, 1, 1, 1, 0, 0, 10),
(1000, 8006, 0, 1, 1, 1, 0, 0, 10);

-- Recipes dropped from Battered Junkbox.
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES
(1005, 11098, 0, 1, 1, 1, 0, 0, 10),
(1005, 11039, 0, 1, 1, 1, 0, 0, 10),
(1005, 11038, 0, 1, 1, 1, 0, 0, 10),
(1005, 10316, 0, 1, 1, 1, 0, 0, 10),
(1005, 4348, 0, 1, 1, 1, 0, 0, 10),
(1005, 7363, 0, 1, 1, 1, 0, 0, 10),
(1005, 4350, 0, 1, 1, 1, 0, 0, 10),
(1005, 6391, 0, 1, 1, 1, 0, 0, 10),
(1005, 2883, 0, 1, 1, 1, 0, 0, 10),
(1005, 3608, 0, 1, 1, 1, 0, 0, 10),
(1005, 3874, 0, 1, 1, 1, 0, 0, 10),
(1005, 5578, 0, 1, 1, 1, 0, 0, 10),
(1005, 6046, 0, 1, 1, 1, 0, 0, 10),
(1005, 3393, 0, 1, 1, 1, 0, 0, 10),
(1005, 4412, 0, 1, 1, 1, 0, 0, 10),
(1005, 6044, 0, 1, 1, 1, 0, 0, 10),
(1005, 2601, 0, 1, 1, 1, 0, 0, 10),
(1005, 4296, 0, 1, 1, 1, 0, 0, 10),
(1005, 6375, 0, 1, 1, 1, 0, 0, 10),
(1005, 6211, 0, 1, 1, 1, 0, 0, 10),
(1005, 7360, 0, 1, 1, 1, 0, 0, 10),
(1005, 4410, 0, 1, 1, 1, 0, 0, 10);

-- Rings dropped from Battered Junkbox.
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES
(1006, 4998, 0, 1, 1, 1, 0, 0, 10),
(1006, 4999, 0, 1, 1, 1, 0, 0, 10),
(1006, 5001, 0, 1, 1, 1, 0, 0, 10),
(1006, 11967, 0, 1, 1, 1, 0, 0, 10),
(1006, 11968, 0, 1, 1, 1, 0, 0, 10),
(1006, 11982, 0, 1, 1, 1, 0, 0, 10),
(1006, 11983, 0, 1, 1, 1, 0, 0, 10),
(1006, 11984, 0, 1, 1, 1, 0, 0, 10),
(1006, 11993, 0, 1, 1, 1, 0, 0, 10),
(1006, 11994, 0, 1, 1, 1, 0, 0, 10),
(1006, 12006, 0, 1, 1, 1, 0, 0, 10),
(1006, 12007, 0, 1, 1, 1, 0, 0, 10),
(1006, 12008, 0, 1, 1, 1, 0, 0, 10),
(1006, 12052, 0, 1, 1, 1, 0, 0, 10),
(1006, 12053, 0, 1, 1, 1, 0, 0, 10),
(1006, 12054, 0, 1, 1, 1, 0, 0, 10);

-- Multiple missing items from cmangos and trinity.
DELETE FROM `item_loot_template` WHERE `entry`=16882;
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES
(16882, 1000, 0.5, 0, -1000, 1, 0),
(16882, 1005, 3, 0, -1005, 1, 0),
(16882, 1006, 3, 0, -1006, 1, 0),
(16882, 422, 0.05, 0, 1, 1, 0),
(16882, 929, 10.1, 0, 1, 1, 0),
(16882, 1206, 1.3, 0, 1, 1, 0),
(16882, 1529, 0.05, 0, 1, 1, 0),
(16882, 1705, 1.7, 0, 1, 1, 0),
(16882, 1710, 0.1, 0, 1, 1, 0),
(16882, 2836, 0.05, 0, 1, 1, 0),
(16882, 3013, 0.05, 0, 1, 1, 0),
(16882, 3357, 0.05, 0, 1, 1, 0),
(16882, 3864, 0.05, 0, 1, 1, 0),
(16882, 5374, 10.8, 0, 1, 1, 0),
(16882, 5498, 0.05, 0, 1, 1, 0),
(16882, 5500, 0.05, 0, 1, 1, 0),
(16882, 5503, 0.1, 0, 1, 1, 0),
(16882, 5504, 0.6, 0, 1, 1, 0),
(16882, 5568, 0.05, 0, 1, 1, 0),
(16882, 6409, 0.05, 0, 1, 1, 0),
(16882, 6613, 0.05, 0, 1, 1, 0),
(16882, 16882, 0.2, 0, 1, 1, 0),
(16882, 17124, 0.05, 0, 1, 1, 0);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
