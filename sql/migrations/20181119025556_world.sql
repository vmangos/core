DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20181119025556');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20181119025556');
-- Add your query below.


-- In older clients the xp bar is shown even on max level, and sending 0 bugs out the entire interface.
-- Correct required xp value for level 60 from retail video https://youtu.be/TW9wP0J--BM?t=4981
INSERT INTO `player_xp_for_level` (`lvl`, `xp_for_next_level`) VALUES (60, 217400);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
