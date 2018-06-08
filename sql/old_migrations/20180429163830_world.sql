DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180429163830');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180429163830');
-- Add your query below.


-- Add missing weather for Zul'Gurub from mangoszero.
-- There is a chance to rain https://www.youtube.com/watch?v=ZghY5CxFoMg
INSERT INTO `game_weather` (`zone`, `spring_rain_chance`, `spring_snow_chance`, `spring_storm_chance`, `summer_rain_chance`, `summer_snow_chance`, `summer_storm_chance`, `fall_rain_chance`, `fall_snow_chance`, `fall_storm_chance`, `winter_rain_chance`, `winter_snow_chance`, `winter_storm_chance`) VALUES (1977, 15, 0, 0, 5, 0, 0, 15, 0, 0, 15, 0, 0);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
