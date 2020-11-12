DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200515224641');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200515224641');
-- Add your query below.


-- Spirit Healer in Blackwood Lake, Eastern Plaguelands
UPDATE `creature` SET `position_x`=2659.49, `position_y`=-4017.2, `position_z`=103.632, `orientation`=2.9147 WHERE `guid`=40551;

-- Spirit Healer in Ruins of Lordaeron, Undercity
UPDATE `creature` SET `position_x`=1788.53, `position_y`=221.621, `position_z`=59.7428, `orientation`=3.19755 WHERE `guid`=2065;

-- Use the real undercity graveyard
UPDATE `game_graveyard_zone` SET `id`='853' WHERE  `id`=96 AND `ghost_zone`=1497;
UPDATE `game_graveyard_zone` SET `id`='853' WHERE  `id`=96 AND `ghost_zone`=85;

-- Spirit Healer in Irontree Woodsm, Felwood
UPDATE `creature` SET `position_x`=5957.41, `position_y`=-1207.79, `position_z`=380.815, `orientation`=3.56047 WHERE `guid`=40584;

-- Horde Spirit Healer in Dustwallow Marsh
UPDATE `creature` SET `position_x`=-3110.26, `position_y`=-3059.42, `position_z`=33.7547, `orientation`=2.60054 WHERE `guid`=84826;

-- Alliance Spirit Healer in Dustwallow Marsh
UPDATE `creature` SET `position_x`=-3540.33, `position_y`=-4313.3, `position_z`=7.21279, `orientation`=6.0912 WHERE `guid`=84656;

-- Spirit Healer in Thorium Point, Searing Gorge
UPDATE `creature` SET `position_x`=-6439.12, `position_y`=-1114.68, `position_z`=312.16, `orientation`=3.01942 WHERE `guid`=29802;

-- Spirit Healer in middle of Wetlands
UPDATE `creature` SET `position_x`=-3297.61, `position_y`=-2430.98, `position_z`=18.6799, `orientation`=5.69145 WHERE `guid`=40536;

-- Spirit Healer in Crossroads, Barrens
UPDATE `creature` SET `position_x`=-590.535, `position_y`=-2516.93, `position_z`=91.8409, `orientation`=4.59022 WHERE `guid`=40573;

-- Spirit Healer in Light's Hope Chapel, Eastern Plaguelands
UPDATE `creature` SET `position_x`=2132.51, `position_y`=-5287.04, `position_z`=84.4393, `orientation`=3.01942 WHERE `guid`=40548;

-- Spirit Healer in Brill, Tirisfal Glades
UPDATE `creature` SET `position_x`=2349.71, `position_y`=484.75, `position_z`=33.4543, `orientation`=1.68764 WHERE `guid`=40549;

-- Spirit Healer in The Sepulcher, Silverpine Forest
UPDATE `creature` SET `position_x`=504.524, `position_y`=1589.08, `position_z`=126.79, `orientation`=0.0981192 WHERE `guid`=40542;

-- Spirit Healer in Everlook, Winterspring
UPDATE `creature` SET `position_x`=6889.73, `position_y`=-4661.07, `position_z`=701.771, `orientation`=3.22886 WHERE `guid`=40586;

-- Spirit Healer in Camp Taurajo, Barrens
UPDATE `creature` SET `position_x`=-2515.88, `position_y`=-1963.74, `position_z`=91.867, `orientation`=4.46804 WHERE `guid`=40566;

-- Spirit Healer in Caer Darrow, Western Plaguelands
UPDATE `creature` SET `position_x`=1227.82, `position_y`=-2404.1, `position_z`=60.6439, `orientation`=5.65487 WHERE `guid`=40544;

-- Spirit Healer in The Bulwark, Tirisfal Glades
UPDATE `creature` SET `position_x`=1737.57, `position_y`=-673.117, `position_z`=45.3156, `orientation`=6.26573 WHERE `guid`=40546;

-- Spirit Healer in Faol's Rest, Tirisfal Glades
UPDATE `creature` SET `position_x`=2611.59, `position_y`=-534.314, `position_z`=89.0829, `orientation`=4.06662 WHERE `guid`=40550;

-- Spirit Healer in Eastvale Logging Camp, Elwynn Forest
UPDATE `creature` SET `position_x`=-9553.85, `position_y`=-1365.24, `position_z`=51.0326, `orientation`=4.76322 WHERE `guid`=17650;

-- Spirit Healer in Stonard, Swamp of Sorrows
UPDATE `creature` SET `position_x`=-10575.2, `position_y`=-3377.45, `position_z`=22.3438, `orientation`=0.0174533 WHERE `guid`=40523;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
