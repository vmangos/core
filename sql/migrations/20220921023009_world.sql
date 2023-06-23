DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220921023009');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220921023009');
-- Add your query below.

-- Dolanaar, Teldrassil GY is neutral.
UPDATE `game_graveyard_zone` SET `faction`='0' WHERE  `id`=91 AND `ghost_zone`=141;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
