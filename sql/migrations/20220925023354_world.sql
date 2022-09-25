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
ALTER TABLE `game_graveyard_zone`
	CHANGE COLUMN `build_min` `patch_min` SMALLINT(4) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Minimum content patch to load this entry' AFTER `faction`;

-- Set Silithus, Cenarion Hold GY to patch 1.8
UPDATE `game_graveyard_zone` SET `patch_min`='6' WHERE  `id`=910 AND `ghost_zone`=1377;

-- Delete incorrect zone Silithus for Silithus, Scarab Wall (AQ Only) GY
DELETE FROM `game_graveyard_zone` WHERE  `id`=913 AND `ghost_zone`=1377;
-- Delete incorrect zone Gates of Ahn'Qiraj for Silithus, Scarab Wall (AQ Only) GY
DELETE FROM `game_graveyard_zone` WHERE  `id`=913 AND `ghost_zone`=3478;
-- Add correct Silithus, Cenarion Hold GY for Gates of Ahn'Qiraj
INSERT INTO `game_graveyard_zone` (`id`, `ghost_zone`, `faction`, `patch_min`) VALUES (910, 3478, 0, 6);
-- Add Silithus, Valor's Rest GY for Gates of Ahn'Qiraj pre patch 1.8
INSERT INTO `game_graveyard_zone` (`id`, `ghost_zone`, `faction`, `patch_min`) VALUES (70, 3478, 0, 0);
-- Set Silithus, Scarab Wall (AQ Only) GY to patch 1.9
UPDATE `game_graveyard_zone` SET `patch_min`='7' WHERE  `id`=913;
-- Set Silithus, Scarab Wall (AQ Only) GY Spirit healer to patch 1.9
UPDATE `creature` SET `patch_min`='7' WHERE  `guid`=7716;

-- Set Duskwood, Ravenhill GY to patch patch 1.8
UPDATE `game_graveyard_zone` SET `patch_min`='6' WHERE  `id`=911 AND `ghost_zone`=10;

-- Set Eastern Plaguelands, Graveyard CG Tower GY to patch 1.12
UPDATE `game_graveyard_zone` SET `patch_min`='10' WHERE  `id`=927;
-- Set Eastern Plaguelands, Graveyard CG Tower GY Spirit Healer to patch 1.12
UPDATE `creature` SET `patch_min`='10' WHERE  `guid`=9386;

-- Set Durotar, Northern Durotar GY to patch 1.6
UPDATE `game_graveyard_zone` SET `patch_min`='4' WHERE  `id`=850;
UPDATE `game_graveyard_zone` SET `faction`='0' WHERE  `id`=32 AND `ghost_zone`=1637;
-- Set Durotar, Northern Durotar GY Spirit Healer to patch 1.6
UPDATE `creature` SET `patch_min`='4' WHERE  `guid`=40576;
-- Don't use Durotar, Northern Durotar GY for Alliance Ragefire Chasm
UPDATE `game_graveyard_zone` SET `faction`='67' WHERE  `id`=850 AND `ghost_zone`=2437;
-- Add Ragefire Chasm to Durotar, Razor Hill GY
INSERT INTO `game_graveyard_zone` (`id`, `ghost_zone`, `faction`, `patch_min`) VALUES (32, 2437, 0, 0);
-- Add Hall of Legends to Durotar, Razor Hill GY
INSERT INTO `game_graveyard_zone` (`id`, `ghost_zone`, `faction`, `patch_min`) VALUES (32, 2917, 0, 0);

-- Set Mulgore, Thunder Bluff GY to 1.6
UPDATE `game_graveyard_zone` SET `patch_min`='4' WHERE  `id`=851;
-- Set Mulgore, Thunder Bluff GY Spirit Healer to patch 1.6
UPDATE `creature` SET `patch_min`='4' WHERE  `guid`=40570;
-- Use Mulgore, Bloodhoof Village GY for Thunderbluff pre patch 1.6
UPDATE `game_graveyard_zone` SET `faction`='0' WHERE  `id`=89 AND `ghost_zone`=1638;

-- Set Teldrassil, Darnassus GY to patch 1.6
UPDATE `game_graveyard_zone` SET `patch_min`='4' WHERE  `id`=90;
-- Set Teldrassil, Darnassus GY Spirit Healer to patch 1.6
UPDATE `creature` SET `patch_min`='4' WHERE  `guid`=87049;
-- Use Teldrassil, Dolanaar GY for Darnassus pre patch 1.6
UPDATE `game_graveyard_zone` SET `faction`='0' WHERE  `id`=91 AND `ghost_zone`=1657;

-- Set Dun Morogh, Gates of Ironforge GY to patch 1.6
UPDATE `game_graveyard_zone` SET `patch_min`='4' WHERE  `id`=852;
-- Set Dun Morogh, Gates of Ironforge GY Spirit Healer to patch 1.6
UPDATE `creature` SET `patch_min`='4' WHERE  `guid`=87044;
-- Use Dun Morogh, Kharanos GY for Ironforge pre patch 1.6
UPDATE `game_graveyard_zone` SET `faction`='0' WHERE  `id`=101 AND `ghost_zone`=1537;

-- Set Tirisfal Glades, Ruins of Lordaeron GY to patch 1.6
UPDATE `game_graveyard_zone` SET `patch_min`='4' WHERE  `id`=853;
-- Set Tirisfal Glades, Ruins of Lordaeron GY Spirit Healer to patch 1.6
UPDATE `creature` SET `patch_min`='4' WHERE  `guid`=2065;
-- Use Tirisfal Glades, Brill GY for Undercity pre patch 1.6
INSERT INTO `game_graveyard_zone` (`id`, `ghost_zone`, `faction`, `patch_min`) VALUES (289, 1497, 0, 0);

-- Set Western Plaguelands, Caer Darrow GY to patch 1.6
UPDATE `game_graveyard_zone` SET `patch_min`='4' WHERE  `id`=869;
-- Set Western Plaguelands, Caer Darrow GY Spirit Healer to patch 1.6
UPDATE `creature` SET `patch_min`='4' WHERE  `guid`=40544;
-- Delete invalid graveyards for Caer Darrow
DELETE FROM `game_graveyard_zone` WHERE  `id`=429 AND `ghost_zone`=2057;
DELETE FROM `game_graveyard_zone` WHERE  `id`=629 AND `ghost_zone`=2057;
-- Set correct graveyards for Caer Darrow pre patch 1.6
INSERT INTO `game_graveyard_zone` (`id`, `ghost_zone`, `faction`, `patch_min`) VALUES (569, 2057, 67, 0);
INSERT INTO `game_graveyard_zone` (`id`, `ghost_zone`, `faction`, `patch_min`) VALUES (509, 2057, 469, 0);

-- Set Eastern Plaguelands, Blackwood Lake GY to patch 1.6
UPDATE `game_graveyard_zone` SET `patch_min`='4' WHERE  `id`=909;
-- Set Eastern Plaguelands, Blackwood Lake GY Spirit Healer to patch 1.6
UPDATE `creature` SET `patch_min`='4' WHERE  `guid`=40551;
-- Use Eastern Plaguelands, Light's Hope Chapel GY for Stratholm pre patch 1.6
INSERT INTO `game_graveyard_zone` (`id`, `ghost_zone`) VALUES ('510', '2017');

-- Set Feralas, Dire Maul GY to patch 1.6
UPDATE `game_graveyard_zone` SET `patch_min`='4' WHERE  `id`=849;
-- Set Feralas, Dire Maul GY Spirit Healer to patch 1.6
UPDATE `creature` SET `patch_min`='4' WHERE  `guid`=40561;
-- Use Feralas, Camp Mojache for Dire Maul GY pre patch 1.6
INSERT INTO `game_graveyard_zone` (`id`, `ghost_zone`) VALUES ('310', '2557');

-- Set The Hinterlands, The Overlook Cliffs GY to patch 1.6
UPDATE `game_graveyard_zone` SET `patch_min`='3' WHERE  `id`=789 AND `ghost_zone`=47;

-- Set Elwynn Forest, Eastvale Logging Camp GY to patch 1.6
UPDATE `game_graveyard_zone` SET `patch_min`='4' WHERE  `id`=854;
-- Set Elwynn Forest, Eastvale Logging Camp GY Spirit Healer to patch 1.6
UPDATE `creature` SET `patch_min`='4' WHERE  `guid`=17650;

-- Set min patch for Badlands, Graveyard NE GY
UPDATE `game_graveyard_zone` SET `patch_min`='10' WHERE  `id`=8;
-- Add Badlands and Uldaman to Loch Modan, Thelsamar GY
INSERT INTO `game_graveyard_zone` (`id`, `ghost_zone`, `faction`, `patch_min`) VALUES ('6', '3', '0', '0');
INSERT INTO `game_graveyard_zone` (`id`, `ghost_zone`, `faction`, `patch_min`) VALUES ('6', '1337', '0', '0');
-- Set Badlands, Graveyard NE GY Spirit Healer to patch 1.12
UPDATE `creature` SET `patch_min`='10' WHERE  `guid`=40593;

-- Add patch_max to game_graveyard_zone
ALTER TABLE `game_graveyard_zone`
	ADD COLUMN `patch_max` SMALLINT(4) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Maximum content patch to load this entry' AFTER `patch_min`;
-- Add primary key to patch_max
ALTER TABLE `game_graveyard_zone`
	DROP PRIMARY KEY,
	ADD PRIMARY KEY (`id`, `ghost_zone`, `patch_max`) USING BTREE;
-- Set max 1.12 patch to all GYs
UPDATE `game_graveyard_zone` SET `patch_max`='10' WHERE `patch_max`=0;

-- Set patch 1.6 for Alliance Deeprun Tram to Elwynn Forest, Goldshire GY
UPDATE `game_graveyard_zone` SET `patch_min`='4' WHERE  `id`=106 AND `ghost_zone`=2257 AND `patch_max`=10;
-- Set patch 1.6 for Alliance Stormwind City to Elwynn Forest, Goldshire GY
UPDATE `game_graveyard_zone` SET `patch_min`='4' WHERE  `id`=106 AND `ghost_zone`=1519 AND `patch_max`=10;
-- Set patch 1.6 patch for Alliance The Stockade to Elwynn Forest, Goldshire GY
UPDATE `game_graveyard_zone` SET `patch_min`='4' WHERE  `id`=106 AND `ghost_zone`=717 AND `patch_max`=10;
-- Set patch 1.6 patch for Alliance Elwynn Forest to Elwynn Forest, Goldshire GY
UPDATE `game_graveyard_zone` SET `patch_min`='4' WHERE  `id`=106 AND `ghost_zone`=12 AND `patch_max`=10;
-- Add neutral Elwynn Forest, Goldshire GY for pre patch 1.6
INSERT INTO `game_graveyard_zone` (`id`, `ghost_zone`, `patch_max`) VALUES ('106', '2257', '3');
INSERT INTO `game_graveyard_zone` (`id`, `ghost_zone`, `patch_max`) VALUES ('106', '1519', '3');
INSERT INTO `game_graveyard_zone` (`id`, `ghost_zone`, `patch_max`) VALUES ('106', '717', '3');
INSERT INTO `game_graveyard_zone` (`id`, `ghost_zone`, `patch_max`) VALUES ('106', '12', '3');

-- Don't use Durotar, Razor Hill GY for Hall of Legends after patch 1.6
UPDATE `game_graveyard_zone` SET `patch_max`='3' WHERE  `id`=32 AND `ghost_zone`=2917 AND `patch_max`=10;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
