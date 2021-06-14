DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210213141421');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210213141421');
-- Add your query below.


/*
 The Eye of Shadow and Mature Blue Dragon Sinew only dropped from Kazzak and Azuregos before 1.5.
 https://web.archive.org/web/20060410021222/http://wow.allakhazam.com/db/item.html?witem=18665
 https://web.archive.org/web/20050501151312/http://wow.allakhazam.com/db/item.html?witem=18704
 
 The Eye of Shadow had a lower drop chance until late vanilla. (probably 1.10 when other loot changes where made)
 https://us.forums.blizzard.com/en/wow/t/wow-classic-%E2%80%9Cnot-a-bug%E2%80%9D-list-updated-dec-3-2020/175887
 "The Eye of Shadow has a higher drop rate than many players expect."
 "Note: This was changed late in Original WoW to have a much higher drop rate."

 World of Warcraft Client Patch 1.5.0 (2005-06-07)
 - Mature Blue Dragon Sinew and The Eye of Shadow can both now drop off 
   appropriate level demonic and blue dragonkin monsters. It should be 
   noted that both Lord Kazzak and Azuregos will guarantee a drop of the 
   aforementioned items but to get the items from the lesser creatures 
   will be a much rarer occurrence.
*/
DELETE FROM `creature_loot_template` WHERE `item`=18665;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES 
(7461, 18665, 0.6, 0, 1, 1, 0, 3, 7),
(7461, 18665, 2, 0, 1, 1, 0, 8, 10),
(7463, 18665, 0.6, 0, 1, 1, 0, 3, 7),
(7463, 18665, 2, 0, 1, 1, 0, 8, 10),
(8716, 18665, 0.6, 0, 1, 1, 0, 3, 7),
(8716, 18665, 4, 0, 1, 1, 0, 8, 10),
(8717, 18665, 0.6, 0, 1, 1, 0, 3, 7),
(8717, 18665, 3, 0, 1, 1, 0, 8, 10),
(8718, 18665, 0.6, 0, 1, 1, 0, 3, 7),
(8718, 18665, 3, 0, 1, 1, 0, 8, 10),
(12397, 18665, 100, 0, 1, 1, 0, 2, 10),
(12396, 18665, 0.6, 0, 1, 1, 0, 3, 7),
(12396, 18665, 2, 0, 1, 1, 0, 8, 10);
DELETE FROM `creature_loot_template` WHERE `item`=18704;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES 
(6109, 18704, 100, 0, 1, 1, 0, 2, 10),
(7435, 18704, 0.5, 0, 1, 1, 0, 3, 10),
(7436, 18704, 0.5, 0, 1, 1, 0, 3, 10),
(7437, 18704, 0.5, 0, 1, 1, 0, 3, 10),
(10196, 18704, 0.3, 0, 1, 1, 0, 3, 10),
(10663, 18704, 1, 0, 1, 1, 0, 3, 10),
(10664, 18704, 0.1, 0, 1, 1, 0, 3, 10);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
