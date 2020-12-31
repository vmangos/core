DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200521042923');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200521042923');
-- Add your query below.


-- ---------------
-- Holidays
-- ---------------

-- Lunar Festival
UPDATE `game_event` SET `start_time`="2020-01-24 22:00:00", `end_time`="2030-12-31 22:59:59" WHERE `entry`=7;
-- Love is in the Air
UPDATE `game_event` SET `start_time`="2020-02-08 22:00:00", `end_time`="2030-12-31 22:59:59" WHERE `entry`=8;
-- Love is in the Air - Kwee Peddlefeet Event
UPDATE `game_event` SET `start_time`="2020-02-15 04:00:00", `end_time`="2030-12-31 04:00:00" WHERE  `entry`=140;
-- Noblegarden
UPDATE `game_event` SET `start_time`="2020-04-13 20:00:00", `end_time`="2030-12-31 22:59:59" WHERE `entry`=9;
-- Children"s Week
UPDATE `game_event` SET `start_time`="2020-05-01 20:00:00", `end_time`="2030-12-31 22:59:59" WHERE `entry`=10;
-- Midsummer Fire Festival
UPDATE `game_event` SET `start_time`="2020-06-21 20:00:00", `end_time`="2030-12-31 22:59:59" WHERE `entry`=1;
-- Harvest Festival
UPDATE `game_event` SET `start_time`="2020-09-29 22:00:00", `end_time`="2030-12-31 22:59:59" WHERE `entry`=11;
-- Hallow"s End
UPDATE `game_event` SET `start_time`="2020-10-18 20:00:00", `end_time`="2030-12-31 22:59:59" WHERE `entry`=12;
-- Feast of Winter Veil
UPDATE `game_event` SET `start_time`="2020-12-16 23:00:00", `end_time`="2030-12-31 22:59:59" WHERE `entry`=2;
-- Feast of Winter Veil: Gifts
UPDATE `game_event` SET `start_time`="2020-12-25 00:00:00", `end_time`="2030-01-02 23:59:59" WHERE  `entry`=21;
-- New Year"s Eve
UPDATE `game_event` SET `start_time`="2020-12-31 06:00:00", `end_time`="2030-01-01 06:00:05" WHERE  `entry`=34;
-- Chinese New Year
UPDATE `game_event` SET `start_time`="2020-02-08 06:00:00", `end_time`="2030-02-09 06:00:00" WHERE  `entry`=38;

-- ---------------
-- Zul"Gurub
-- ---------------

-- Edge of Madness, Gri"lek
UPDATE `game_event` SET `start_time`="2020-06-10 00:00:01", `end_time`="2030-12-31 22:59:59" WHERE `entry`=29;
-- Edge of Madness, Hazza"rah
UPDATE `game_event` SET `start_time`="2020-06-23 00:00:01", `end_time`="2030-12-31 22:59:59" WHERE `entry`=30;
-- Edge of Madness, Renataki
UPDATE `game_event` SET `start_time`="2020-05-12 00:00:01", `end_time`="2030-12-31 22:59:59" WHERE `entry`=31;
-- Edge of Madness, Wushoolay
UPDATE `game_event` SET `start_time`="2020-05-26 00:00:01", `end_time`="2030-12-31 22:59:59" WHERE `entry`=32;

-- ---------------
-- Battlegrounds
-- ---------------

-- Call to Arms: Alterac Valley!
UPDATE `game_event` SET `start_time`="2020-05-01 00:00:01", `end_time`="2030-12-31 22:59:59" WHERE `entry`=18;
-- Call to Arms: Warsong Gulch!
UPDATE `game_event` SET `start_time`="2020-05-08 00:00:01", `end_time`="2030-12-31 22:59:59" WHERE `entry`=19;
-- Call to Arms: Arathi Basin! 20
UPDATE `game_event` SET `start_time`="2020-05-15 00:00:01", `end_time`="2030-12-31 22:59:59" WHERE `entry`=20;

-- ---------------
-- Misc
-- ---------------

-- Gurubashi Arena Booty Run
UPDATE `game_event` SET `start_time`="2020-12-31 23:00:00", `end_time`="2030-12-31 22:59:59" WHERE  `entry`=16;
-- Fishing: winter period (for Winter Squid)
UPDATE `game_event` SET `start_time`="2020-09-23 09:00:00", `end_time`="2030-01-01 04:00:00" WHERE  `entry`=46;
-- Fishing: summer period (for Raw Summer Bass)
UPDATE `game_event` SET `start_time`="2020-03-20 10:00:00", `end_time`="2030-01-01 04:00:00" WHERE  `entry`=45;
-- Event PVP Silithus
UPDATE `game_event` SET `start_time`="2020-09-08 04:00:00", `end_time`="2030-12-31 03:00:00" WHERE  `entry`=103;
-- Night
UPDATE `game_event` SET `start_time`="2020-01-02 00:00:00", `end_time`="2030-12-31 03:00:00" WHERE  `entry`=27;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
