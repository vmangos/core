DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220925023354');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220925023354');
-- Add your query below.


-- Change build_min to patch_min
ALTER TABLE `game_graveyard_zone` CHANGE COLUMN `build_min` `patch_min` SMALLINT(4) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Minimum content patch to load this entry' AFTER `faction`;

-- Set Silithus, Cenarion Hold GY to patch 1.8
UPDATE `game_graveyard_zone` SET `patch_min`='6' WHERE  `id`=910 AND `ghost_zone`=1377;
-- Delete incorrect zone Silithus for Silithus, Scarab Wall (AQ Only) GY
DELETE FROM `game_graveyard_zone` WHERE  `id`=913 AND `ghost_zone`=1377;
-- Delete incorrect zone Gates of Ahn'Qiraj for Silithus, Scarab Wall (AQ Only) GY
DELETE FROM `game_graveyard_zone` WHERE  `id`=913 AND `ghost_zone`=3478;
-- Add correct Silithus, Cenarion Hold for Gates of Ahn'Qiraj
INSERT INTO `game_graveyard_zone` (`id`, `ghost_zone`, `faction`, `patch_min`) VALUES (910, 3478, 0, 6);
-- Add Silithus, Valor's Rest for Gates of Ahn'Qiraj below 1.8
INSERT INTO `game_graveyard_zone` (`id`, `ghost_zone`, `faction`, `patch_min`) VALUES (70, 3478, 0, 0);

-- Set Duskwood, Ravenhill GY to patch patch 1.8
UPDATE `game_graveyard_zone` SET `patch_min`='6' WHERE  `id`=911 AND `ghost_zone`=10;

-- Set Silithus, Scarab Wall (AQ Only) to patch 1.9
UPDATE `game_graveyard_zone` SET `patch_min`='7' WHERE  `id`=913;
-- Set Silithus, Scarab Wall (AQ Only) Spirit healer to 1.9
UPDATE `creature` SET `patch_min`='7' WHERE  `guid`=7716;

-- Set Eastern Plaguelands, Graveyard CG Tower to patch 1.12
UPDATE `game_graveyard_zone` SET `patch_min`='10' WHERE  `id`=927;

-- Set Durotar, Northern Durotar to patch 1.6.0
UPDATE `game_graveyard_zone` SET `patch_min`='4' WHERE  `id`=850;
UPDATE `game_graveyard_zone` SET `faction`='0' WHERE  `id`=32 AND `ghost_zone`=1637;
-- Don't use Durotar, Northern Durotar for Alliance Ragefire Chasm
UPDATE `game_graveyard_zone` SET `faction`='67' WHERE  `id`=850 AND `ghost_zone`=2437;
-- Add Ragefire Chasm to Durotar, Razor Hill
INSERT INTO `game_graveyard_zone` (`id`, `ghost_zone`, `faction`, `patch_min`) VALUES (32, 2437, 0, 0);
-- Add Hall of Legends to Durotar, Razor Hill
-- For some reason it wont use grave 850 at 1.12
-- even if looks exactly same as RFC and RFC works with 850 at 1.12
INSERT INTO `game_graveyard_zone` (`id`, `ghost_zone`, `faction`, `patch_min`) VALUES (32, 2917, 0, 0);

-- Set Mulgore, Thunder Bluff GY to 1.6
UPDATE `game_graveyard_zone` SET `patch_min`='4' WHERE  `id`=851;
-- Use Mulgore, Bloodhoof Village GY for Thunderbluff below 1.6
UPDATE `game_graveyard_zone` SET `faction`='0' WHERE  `id`=89 AND `ghost_zone`=1638;

-- Set Teldrassil, Darnassus GY to 1.6
UPDATE `game_graveyard_zone` SET `patch_min`='4' WHERE  `id`=90;
-- Use Teldrassil, Dolanaar GY for Darnassus below 1.6
UPDATE `game_graveyard_zone` SET `faction`='0' WHERE  `id`=91 AND `ghost_zone`=1657;

-- Set Dun Morogh, Gates of Ironforge GY to 1.6
UPDATE `game_graveyard_zone` SET `patch_min`='4' WHERE  `id`=852;
-- Use Dun Morogh, Kharanos GY for Ironforge below 1.6
UPDATE `game_graveyard_zone` SET `faction`='0' WHERE  `id`=101 AND `ghost_zone`=1537;

-- Set Tirisfal Glades, Ruins of Lordaeron GY to 1.6
UPDATE `game_graveyard_zone` SET `patch_min`='4' WHERE  `id`=853;
-- Use Tirisfal Glades, Brill GY for Undercity below 1.6
INSERT INTO `game_graveyard_zone` (`id`, `ghost_zone`, `faction`, `patch_min`) VALUES (289, 1497, 0, 0);

-- Set Western Plaguelands, Caer Darrow GY to 1.6
UPDATE `game_graveyard_zone` SET `patch_min`='4' WHERE  `id`=869;
-- Delete invalid graveyards for Caer Darrow
DELETE FROM `game_graveyard_zone` WHERE  `id`=429 AND `ghost_zone`=2057;
DELETE FROM `game_graveyard_zone` WHERE  `id`=629 AND `ghost_zone`=2057;
-- Set correct graveyards for Caer Darrow pre 1.6
INSERT INTO `game_graveyard_zone` (`id`, `ghost_zone`, `faction`, `patch_min`) VALUES (569, 2057, 67, 0);
INSERT INTO `game_graveyard_zone` (`id`, `ghost_zone`, `faction`, `patch_min`) VALUES (509, 2057, 469, 0);

-- Set Eastern Plaguelands, Blackwood Lake GY to 1.6
UPDATE `game_graveyard_zone` SET `patch_min`='4' WHERE  `id`=909;
-- Use Eastern Plaguelands, Light's Hope Chapel for Stratholm pre 1.6
INSERT INTO `game_graveyard_zone` (`id`, `ghost_zone`) VALUES ('510', '2017');

-- Set Feralas, Dire Maul GY to 1.6
UPDATE `game_graveyard_zone` SET `patch_min`='4' WHERE  `id`=849;
-- Use Feralas, Camp Mojache for Dire Maul pre 1.6
INSERT INTO `game_graveyard_zone` (`id`, `ghost_zone`) VALUES ('310', '2557');

-- Set The Hinterlands, The Overlook Cliffs to 1.6
UPDATE `game_graveyard_zone` SET `patch_min`='3' WHERE  `id`=789 AND `ghost_zone`=47;

-- Set Elwynn Forest, Eastvale Logging Camp to 1.6
UPDATE `game_graveyard_zone` SET `patch_min`='4' WHERE  `id`=854;

-- Set Goldshire to neutral pre 1.6
-- Horde should Goldshire for Stormwind, The Stockade and Deeprun Tram pre 1.6
-- WIP


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
