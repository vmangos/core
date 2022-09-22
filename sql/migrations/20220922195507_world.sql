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
UPDATE `game_graveyard_zone` SET `ghost_zone`=220 WHERE `id`=34;

-- Coldridge Valley Graveyard can only be accessed while in Coldridge Valley
UPDATE `game_graveyard_zone` SET `ghost_zone`=132 WHERE `id`=100;

-- Shadowglen Graveyard can only be accessed while in Shadowglen
UPDATE `game_graveyard_zone` SET `ghost_zone`=188 WHERE `id`=93;

-- Northshire Valley Graveyard can only be accessed while in Northshire Valley
UPDATE `game_graveyard_zone` SET `ghost_zone`=9 WHERE `id`=105;

-- Valley of Trials Graveyard can only be accessed while in Valley of Trials
UPDATE `game_graveyard_zone` SET `ghost_zone`=363 WHERE `id`=709;

-- Deathknell Graveyard can only be accessed while in Deathknell
UPDATE `game_graveyard_zone` SET `ghost_zone`=154 WHERE `id`=94;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
