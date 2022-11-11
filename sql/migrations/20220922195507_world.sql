DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220922195507');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220922195507');
-- Add your query below.

-- Red Cloud Mesa Graveyard can only be accessed while in Red Cloud Mesa
UPDATE `game_graveyard_zone` SET `ghost_zone`=220 WHERE `id`=34 AND `ghost_zone`=215;

-- Coldridge Valley Graveyard can only be accessed while in Coldridge Valley
UPDATE `game_graveyard_zone` SET `ghost_zone`=132 WHERE `id`=100 AND `ghost_zone`=1;

-- Shadowglen Graveyard can only be accessed while in Shadowglen
UPDATE `game_graveyard_zone` SET `ghost_zone`=188 WHERE `id`=93 AND `ghost_zone`=141;

-- Northshire Valley Graveyard can only be accessed while in Northshire Valley
UPDATE `game_graveyard_zone` SET `ghost_zone`=9 WHERE `id`=105 AND `ghost_zone`=12;

-- Valley of Trials Graveyard can only be accessed while in Valley of Trials
UPDATE `game_graveyard_zone` SET `ghost_zone`=363 WHERE `id`=709 AND `ghost_zone`=14;

-- Deathknell Graveyard can only be accessed while in Deathknell
UPDATE `game_graveyard_zone` SET `ghost_zone`=154 WHERE `id`=94 AND `ghost_zone`=85;

-- Gates of Ironforge Graveyard can only be accessed while in Gates of Ironforge
UPDATE `game_graveyard_zone` SET `ghost_zone`=809 WHERE `id`=852 AND `ghost_zone`=1;

-- Set Dun Morogh, Anvilmar GY for Coldridge Pass
INSERT INTO `game_graveyard_zone` (`id`, `ghost_zone`, `faction`, `build_min`) VALUES (100, 800, 469, 0);

-- Set Eastern Plaguelands, Darrowshire GY for The Fungal Vale
INSERT INTO `game_graveyard_zone` (`id`, `ghost_zone`, `faction`, `build_min`) VALUES (634, 2258, 0, 0);

-- Caer Darrow Graveyard can be accessed while in Caer Darrow
INSERT INTO `game_graveyard_zone` (`id`, `ghost_zone`, `faction`, `build_min`) VALUES (869, 2298, 0, 0);

-- Delete invalid neutral Darkshore Graveyard for Stonetalon Mountains
DELETE FROM `game_graveyard_zone` WHERE  `id`=469 AND `ghost_zone`=406;

-- Delete invalid Ratchet Graveyard for Mulgore 
DELETE FROM `game_graveyard_zone` WHERE  `id`=249 AND `ghost_zone`=215;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
