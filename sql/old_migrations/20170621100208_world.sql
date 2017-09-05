INSERT INTO `migrations` VALUES ('20170621100208'); 

-- Remove existing rare drops from Ivus the Forest Lord and Lokholar the Ice Lord
DELETE FROM `creature_loot_template` WHERE `item` IN (19105, 19109, 19110, 19111, 19112, 19113);
-- Add new loot pool and re-add all items, along with Cold Forged Blade and Frost Runed Headdress
-- Drop rates are the average of the allakhazam tables redistributed to sum up to 100%
-- https://web.archive.org/web/20060526204612/http://wow.allakhazam.com:80/db/mob.html?wmob=13419
-- https://web.archive.org/web/20060524200137/http://wow.allakhazam.com:80/db/mob.html?wmob=13256
-- item - ivus - lok - avg - redist = 100 / sum(avg) = 0.889
-- 19105 - 24.56 - 18.47 - 21.52 - 19.13
-- 19109 - 16.38 - 12.93 - 14.66 - 13.03
-- 19110 - 20.4 - 17.28 - 18.84 - 16.75
-- 19111 - 18.79 - 14.38 - 16.59 - 14.75
-- 19112 - 19.60 - 24.8 - 22.2 - 19.74
-- 19113 - 22.28 - 15.04 - 18.66 - 16.59

-- This pool is unused in currently public world DB
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`)
    VALUES  (936305, 19105, '19.13', 4),
            (936305, 19109, '13.03', 4),
            (936305, 19110, '16.75', 4),
            (936305, 19111, '14.75', 4),
            (936305, 19112, '19.74', 4),
            (936305, 19113, '16.59', 4);

-- Add pool to Lok and Ivus. Can drop 2 items from the pool, may dupe
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `minCountOrRef`, `groupid`, `maxcount`)
    VALUES  (13419, 936305, 100, -936305, 4, 2),
            (13256, 936305, 100, -936305, 4, 2);

