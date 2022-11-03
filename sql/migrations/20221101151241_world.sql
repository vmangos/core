DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20221101151241');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20221101151241');
-- Add your query below.

-- Recipe: Mighty Rage Potion drop chance https://www.wowhead.com/classic/item=13476/recipe-mighty-rage-potion
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=4 WHERE `entry`=7027 AND `item`=13476;

-- Big-mouth Clam
-- loot and grouping https://www.wowhead.com/classic/item=7973/big-mouth-clam#contains, https://youtu.be/hGa3Q0bGd7s?t=501
UPDATE `item_loot_template` SET `ChanceOrQuestChance`=4, `maxcount`=2, `groupid`=1 WHERE `entry`=7973 AND `item`=7971; -- Black Pearl
UPDATE `item_loot_template` SET `ChanceOrQuestChance`=3, `groupid`=1 WHERE `entry`=7973 AND `item`=5500;               -- Iridescent Pearl
UPDATE `item_loot_template` SET `ChanceOrQuestChance`=1, `maxcount`=2, `groupid`=1 WHERE `entry`=7973 AND `item`=5498; -- Small Lustrous Pearl
UPDATE `item_loot_template` SET `ChanceOrQuestChance`=0.5,`groupid`=1 WHERE `entry`=7973 AND `item`=13926;             -- Golden Pearl

-- Big-mouth Clam drop chances https://www.wowhead.com/classic/item=7973/big-mouth-clam#dropped-by
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=83 WHERE `entry`=6371 AND `item`=7973; -- Storm Bay Warrior
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=83 WHERE `entry`=6370 AND `item`=7973; -- Makrinni Scrabbler
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=82 WHERE `entry`=7885 AND `item`=7973; -- Spitelash Battlemaster
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=82 WHERE `entry`=7886 AND `item`=7973; -- Spitelash Enchantress
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=82 WHERE `entry`=6351 AND `item`=7973; -- Storm Bay Oracle
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=82 WHERE `entry`=6372 AND `item`=7973; -- Makrinni Snapclaw
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=81 WHERE `entry`=6137 AND `item`=7973; -- Arkkoran Pincer
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=81 WHERE `entry`=6135 AND `item`=7973; -- Arkkoran Clacker
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=81 WHERE `entry`=6136 AND `item`=7973; -- Arkkoran Muckdweller
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=81 WHERE `entry`=6350 AND `item`=7973; -- Makrinni Razorclaw
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=80 WHERE `entry`=6138 AND `item`=7973; -- Arkkoran Oracle
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=80 WHERE `entry`=5327 AND `item`=7973; -- Coast Crawl Snapclaw
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=79 WHERE `entry`=6194 AND `item`=7973; -- Spitelash Serpent Guard
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=79 WHERE `entry`=6193 AND `item`=7973; -- Spitelash Screamer
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=79 WHERE `entry`=8409 AND `item`=7973; -- Caravan Master Tset
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=78 WHERE `entry`=6190 AND `item`=7973; -- Spitelash Warrior
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=75 WHERE `entry`=5328 AND `item`=7973; -- Coast Crawl Deepseer
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=74 WHERE `entry`=6195 AND `item`=7973; -- Spitelash Siren
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=74 WHERE `entry`=6196 AND `item`=7973; -- Spitelash Myrmidon
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=72 WHERE `entry`=4404 AND `item`=7973; -- Muckshell Scrabbler
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=71 WHERE `entry`=4405 AND `item`=7973; -- Muckshell Razorclaw
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=71 WHERE `entry`=4403 AND `item`=7973; -- Muckshell Pincer
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=63 WHERE `entry`=8408 AND `item`=7973; -- Warlord Krellian
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=61 WHERE `entry`=6143 AND `item`=7973; -- Servant of Arkkoroc
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=58 WHERE `entry`=4371 AND `item`=7973; -- Strashaz Siren
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=58 WHERE `entry`=6143 AND `item`=7973; -- Son of Arkkoroc
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=58 WHERE `entry`=16072 AND `item`=7973; -- Tidelord Rrurgaz
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=57 WHERE `entry`=5466 AND `item`=7973; -- Coast Strider
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=56 WHERE `entry`=5333 AND `item`=7973; -- Hatecrest Serpent Guard
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=56 WHERE `entry`=752 AND `item`=7973; -- Marsh Oracle
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=56 WHERE `entry`=4366 AND `item`=7973; -- Strashaz Serpent Guard
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=55 WHERE `entry`=5336 AND `item`=7973; -- Hatecrest Sorceress
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=54 WHERE `entry`=751 AND `item`=7973; -- Marsh Flesheater
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=53 WHERE `entry`=750 AND `item`=7973; -- Marsh Inkspewer
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=53 WHERE `entry`=5334 AND `item`=7973; -- Hatecrest Myrmidon
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=52 WHERE `entry`=4370 AND `item`=7973; -- Strashaz Sorceress
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=52 WHERE `entry`=4364 AND `item`=7973; -- Strashaz Warrior
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=50 WHERE `entry`=747 AND `item`=7973; -- Marsh Murloc
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=49 WHERE `entry`=4402 AND `item`=7973; -- Muckshell Snapclaw
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=46 WHERE `entry`=5331 AND `item`=7973; -- Hatecrest Warrior
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=46 WHERE `entry`=5337 AND `item`=7973; -- Hatecrest Siren
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=46 WHERE `entry`=4368 AND `item`=7973; -- Strashaz Myrmidon
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=44 WHERE `entry`=1907 AND `item`=7973; -- Naga Explorer
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=44 WHERE `entry`=1491 AND `item`=7973; -- Zanzil Naga
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=44 WHERE `entry`=5335 AND `item`=7973; -- Hatecrest Screamer
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=44 WHERE `entry`=5332 AND `item`=7973; -- Hatecrest Wave Rider
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=42 WHERE `entry`=950 AND `item`=7973; -- Swamp Talker
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=42 WHERE `entry`=4389 AND `item`=7973; -- Murk Thresher
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=41 WHERE `entry`=6348 AND `item`=7973; -- Wavethrasher
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=41 WHERE `entry`=6349 AND `item`=7973; -- Great Wavethrasher
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=41 WHERE `entry`=9916 AND `item`=7973; -- Jarquia
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=41 WHERE `entry`=4388 AND `item`=7973; -- Young Murk Thresher
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=41 WHERE `entry`=6347 AND `item`=7973; -- Young Wavethrasher
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=41 WHERE `entry`=6369 AND `item`=7973; -- Coralshell Tortoise
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=41 WHERE `entry`=6650 AND `item`=7973; -- General Fangferror
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=40 WHERE `entry`=8136 AND `item`=7973; -- Lord Shalzaru
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=40 WHERE `entry`=6649 AND `item`=7973; -- Lady Sesspira
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=39 WHERE `entry`=5360 AND `item`=7973; -- Deep Strider
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=39 WHERE `entry`=5359 AND `item`=7973; -- Shore Strider
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=38 WHERE `entry`=6352 AND `item`=7973; -- Coralshell Lurker
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=37 WHERE `entry`=2505 AND `item`=7973; -- Saltwater Snapjaw
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=37 WHERE `entry`=5361 AND `item`=7973; -- Wave Strider
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=37 WHERE `entry`=14446 AND `item`=7973; -- Fingat
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=36 WHERE `entry`=13896 AND `item`=7973; -- Scalebeard
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=35 WHERE `entry`=1088 AND `item`=7973; -- Monstrous Crawler
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=35 WHERE `entry`=5431 AND `item`=7973; -- Surf Glider
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=35 WHERE `entry`=14236 AND `item`=7973; -- Lord Angler
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=34 WHERE `entry`=4374 AND `item`=7973; -- Strashaz Hydra
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=34 WHERE `entry`=8213 AND `item`=7973; -- Ironback
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=33 WHERE `entry`=2544 AND `item`=7973; -- Southern Sand Crawler
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=33 WHERE `entry`=4399 AND `item`=7973; -- Mudrock Borer
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=33 WHERE `entry`=4390 AND `item`=7973; -- Elder Murk Thresher
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=33 WHERE `entry`=5467 AND `item`=7973; -- Deep Dweller
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=32 WHERE `entry`=14123 AND `item`=7973; -- Steeljaw Snapper
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=32 WHERE `entry`=2541 AND `item`=7973; -- Lord Sakrasis
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=32 WHERE `entry`=5343 AND `item`=7973; -- Lady Szallah
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=32 WHERE `entry`=14447 AND `item`=7973; -- Gilmorian
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=31 WHERE `entry`=922 AND `item`=7973; -- Silt Crawler
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=31 WHERE `entry`=5432 AND `item`=7973; -- Giant Surf Glider
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=30 WHERE `entry`=13599 AND `item`=7973; -- Stolid Snapjaw
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=30 WHERE `entry`=7977 AND `item`=7973; -- Gammerita
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=29 WHERE `entry`=1493 AND `item`=7973; -- Mok'rash
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=29 WHERE `entry`=4686 AND `item`=7973; -- Deepstrider Giant
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=27 WHERE `entry`=6140 AND `item`=7973; -- Hetaera
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=26 WHERE `entry`=4687 AND `item`=7973; -- Deepstrider Searcher
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=25 WHERE `entry`=12207 AND `item`=7973; -- Thessala Hydra
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=25 WHERE `entry`=1494 AND `item`=7973; -- Negolash
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=25 WHERE `entry`=2779 AND `item`=7973; -- Prince Nazjak
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=21 WHERE `entry`=1492 AND `item`=7973; -- Gorlash
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=20 WHERE `entry`=5345 AND `item`=7973; -- Diamond Head
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=9 WHERE `entry`=7273 AND `item`=7973; -- Gahz'rilla

-- Small Sack of Coins
-- loot https://www.wowhead.com/classic/item=11966/small-sack-of-coins#contains
-- money: https://www.wowhead.com/classic/item=11966/small-sack-of-coins#comments
UPDATE `item_template` SET `min_money_loot`=1500, `max_money_loot`=1500 WHERE `entry`=11966;
DELETE FROM `item_loot_template` WHERE `entry`=11966;
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES
(11966,11940,31,0,1,1,0,0,10),
(11966,11941,23,0,1,1,0,0,10),
(11966,5500,15,0,1,1,0,0,10),
(11966,818,15,0,1,2,0,0,10),
(11966,11942,8,0,1,1,0,0,10),
(11966,11938,8,0,1,1,0,0,10),
(11966,11939,8,0,1,1,0,0,10),
(11966,774,8,0,1,2,0,0,10),
(11966,1210,8,0,1,1,0,0,10),
(11966,5498,8,0,1,1,0,0,10),
(11966,1529,15,0,1,2,0,0,10),
(11966,1206,15,0,1,1,0,0,10),
(11966,3864,8,0,1,1,0,0,10),
(11966,1705,8,0,1,1,0,0,10);

-- Cuergo's Hidden Treasure 
-- loot and grouping https://www.wowhead.com/classic/item=9265/cuergos-hidden-treasure#contains, https://youtu.be/3UuPh5nqjCA?t=328
-- money https://www.wowhead.com/classic/item=9265/cuergos-hidden-treasure#comments
UPDATE `item_template` SET `min_money_loot`=300, `max_money_loot`=500 WHERE `entry`=9265;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`=24.5, `groupid`=1 WHERE `entry`=9265 AND `item`=9355; -- Hoop Earring
UPDATE `item_loot_template` SET `ChanceOrQuestChance`=24.5, `groupid`=1 WHERE `entry`=9265 AND `item`=9358; -- A Head Rag
UPDATE `item_loot_template` SET `ChanceOrQuestChance`=24.5, `groupid`=1 WHERE `entry`=9265 AND `item`=9357; -- A Parrot Skeleton
UPDATE `item_loot_template` SET `ChanceOrQuestChance`=24.5, `groupid`=1 WHERE `entry`=9265 AND `item`=9356; -- A Wooden Leg
UPDATE `item_loot_template` SET `ChanceOrQuestChance`=2, `groupid`=1 WHERE `entry`=9265 AND `item`=9359;  -- Southsea Lamp

UPDATE `item_loot_template` SET `ChanceOrQuestChance`=3, `groupid`=2 WHERE `entry`=9265 AND `item`=7909;  -- Aquamarine
UPDATE `item_loot_template` SET `ChanceOrQuestChance`=3, `groupid`=2 WHERE `entry`=9265 AND `item`=7910;  -- Star Ruby
UPDATE `item_loot_template` SET `ChanceOrQuestChance`=1, `groupid`=2 WHERE `entry`=9265 AND `item`=3864;  -- Citrine

UPDATE `item_loot_template` SET `ChanceOrQuestChance`=86, `groupid`=3 WHERE `entry`=9265 AND `item`=9360; -- Cuergo's Gold
UPDATE `item_loot_template` SET `ChanceOrQuestChance`=9, `groupid`=3 WHERE `entry`=9265 AND `item`=9361;  -- Cuergo's Gold with Worm

-- Cuergo's Gold with Worm does not drop from creatures https://www.wowhead.com/classic/item=9361/cuergos-gold-with-worm
DELETE FROM `creature_loot_template` WHERE `item`=9361;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
