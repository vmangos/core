DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220823140436');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220823140436');
-- Add your query below.


-- Add dungeon elders to Lunar Festival event.
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (52409, 7);
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (52410, 7);
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (52411, 7);
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (52412, 7);
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (52413, 7);
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (52414, 7);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
