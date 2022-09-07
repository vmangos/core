DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220907004536');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220907004536');
-- Add your query below.


-- Duskwood, Darkshire GY is neutral
UPDATE `game_graveyard_zone` SET `faction`='0' WHERE  `id`=3 AND `ghost_zone`=10;
-- Loch Modan, Thelsamar GY is neutral
UPDATE `game_graveyard_zone` SET `faction`='0' WHERE  `id`=6 AND `ghost_zone`=38;
-- Delete Horde Badlands, Graveyard NE GY for Loch Modan
DELETE FROM `game_graveyard_zone` WHERE  `id`=8 AND `ghost_zone`=38;
-- The Barrens, The Crossroads GY is neutral
UPDATE `game_graveyard_zone` SET `faction`='0' WHERE  `id`=10 AND `ghost_zone`=17;
-- Darkshore, Auberdine GY is neutral
UPDATE `game_graveyard_zone` SET `faction`='0' WHERE  `id`=35 AND `ghost_zone`=148;
-- Badlands, Kargath GY is neutral
UPDATE `game_graveyard_zone` SET `faction`='0' WHERE  `id`=103 AND `ghost_zone`=3;
-- Delete invalid Horde Redridge Mountains, Lakeshire GY for Duskwood
DELETE FROM `game_graveyard_zone` WHERE  `id`=104 AND `ghost_zone`=10;
-- Elwynn Forest, Goldshire GY for The Stockades is Alliance only
UPDATE `game_graveyard_zone` SET `faction`='469' WHERE  `id`=106 AND `ghost_zone`=717;
INSERT INTO `game_graveyard_zone` (`id`, `ghost_zone`, `faction`, `build_min`) VALUES ('854', '717', '67', '0');
-- Delete invalid GY for Champions' Hall, use Elwynn Forest, Goldshire GY instead
DELETE FROM `game_graveyard_zone` WHERE  `id`=107 AND `ghost_zone`=2918;
INSERT INTO `game_graveyard_zone` (`id`, `ghost_zone`, `faction`, `build_min`) VALUES ('106', '2918', '469', '0');
-- Swamp of Sorrows, Stonard GY is neutral
UPDATE `game_graveyard_zone` SET `faction`='0' WHERE  `id`=108 AND `ghost_zone`=8;
-- Hillsbrad Foothills, Southshore GY is Alliance only, even for SFK
UPDATE `game_graveyard_zone` SET `faction`='469' WHERE  `id`=149 AND `ghost_zone`=209;
-- The Barrens, Camp Taurajo GY is neutral
UPDATE `game_graveyard_zone` SET `faction`='0' WHERE  `id`=229 AND `ghost_zone`=17;
-- Feralas, Camp Mojache GY is neutral
UPDATE `game_graveyard_zone` SET `faction`='0' WHERE  `id`=310 AND `ghost_zone`=357;
-- Delete Feralas, Feathermoon Stronghold GY for The Temple of Atal'Hakkar
DELETE FROM `game_graveyard_zone` WHERE  `id`=309 AND `ghost_zone`=1477;
-- Feralas, Feathermoon Stronghold GY is neutral
UPDATE `game_graveyard_zone` SET `faction`='0' WHERE  `id`=309 AND `ghost_zone`=357;
-- Thousand Needles, Shimmering Flats GY is Horde only
UPDATE `game_graveyard_zone` SET `faction`='67' WHERE  `id`=329 AND `ghost_zone`=400;
-- Delete Alliance Blasted Lands, Dreadmaul Hold GY for Swamp of Sorrows
DELETE FROM `game_graveyard_zone` WHERE  `id`=370 AND `ghost_zone`=8;
-- Delete invalid Horde Darkshore, Twilight Vale GY for Teldrassil and Darnassus
DELETE FROM `game_graveyard_zone` WHERE  `id`=469 AND `ghost_zone`=141;
DELETE FROM `game_graveyard_zone` WHERE  `id`=469 AND `ghost_zone`=1657;
-- Wetlands, Baradin Bay GY is Alliance only
UPDATE `game_graveyard_zone` SET `faction`='469' WHERE  `id`=489 AND `ghost_zone`=11;
-- Delete invalid Alliance Ashenvale, Kargathia GY for The Barrens
DELETE FROM `game_graveyard_zone` WHERE  `id`=512 AND `ghost_zone`=17;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
