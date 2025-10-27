DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250202121121');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250202121121');
-- Add your query below.

UPDATE `game_event` SET `end_time` = '2037-01-01 00:00:00' WHERE `entry` IN (
78,  -- Hourly Bells
83,  -- AQ Gate
84,  -- AQ War Effort (master event)
6,   -- Fireworks
14,  -- Stranglethorn Fishing Extravaganza: Announce
40,  -- Stranglethorn Fishing Extravaganza: The Crew
15); -- Stranglethorn Fishing Extravaganza: Tournament

UPDATE `game_event` SET `end_time` = '2037-06-05 02:00:00' WHERE `entry` = 41; -- July 4th Fireworks Spectacular (US Only)
UPDATE `game_event` SET `end_time` = '2037-09-30 02:00:00' WHERE `entry` = 42; -- September 30th Peon Day (EU Only)

UPDATE `game_event` SET `end_time` = '2037-01-01 05:00:00' WHERE `entry` IN (
35,  -- The Maul: Mushgog
36,  -- The Maul: Skarr the Unbreakable
37,  -- The Maul: Razza
45,  -- Fishing: summer period (for Raw Summer Bass)
46); -- Fishing: winter period (for Winter Squid)

UPDATE `game_event` SET `end_time` = '2037-01-01 07:00:05' WHERE `entry` = 34; -- New Year's Eve
UPDATE `game_event` SET `end_time` = '2037-01-03 00:59:59' WHERE `entry` = 21; -- Feast of Winter Veil: Gifts
UPDATE `game_event` SET `end_time` = '2037-02-09 07:00:00' WHERE `entry` = 38; -- Chinese New Year

UPDATE `game_event` SET `end_time` = '2037-02-11 23:00:00' WHERE `entry` IN (
113, -- Love is in the Air - Popularity Contest Winner: Orgrimmar
112, -- Love is in the Air - Popularity Contest Winner: Stormwind
114, -- Love is in the Air - Popularity Contest Winner: Thunder Bluff
111, -- Love is in the Air - Popularity Contest Winner: Ironforge
115, -- Love is in the Air - Popularity Contest Winner: Undercity
110, -- Love is in the Air - Popularity Contest Winner: Darnassus
8);  -- Love is in the Air

UPDATE `game_event` SET `end_time` = '2037-03-31 03:19:48' WHERE `entry` = 152; -- Southshore Assassins
UPDATE `game_event` SET `end_time` = '2037-12-31 01:00:00' WHERE `entry` = 47;  -- Fishing: Sunscale Cycle
UPDATE `game_event` SET `end_time` = '2037-12-31 04:00:00' WHERE `entry` = 22;  -- AQ War Effort (NPC & GO 'Initial')
UPDATE `game_event` SET `end_time` = '2037-12-31 04:00:00' WHERE `entry` = 103; -- Event PVP Silithus
UPDATE `game_event` SET `end_time` = '2037-12-31 06:30:00' WHERE `entry` = 49;  -- Pyrewood Village Night
UPDATE `game_event` SET `end_time` = '2037-12-31 09:00:00' WHERE `entry` = 27;  -- Night
UPDATE `game_event` SET `end_time` = '2037-12-31 13:00:00' WHERE `entry` = 48;  -- Fishing: Nightfin Cycle
UPDATE `game_event` SET `end_time` = '2037-12-31 23:59:59' WHERE `entry` = 18;  -- Call to Arms: Alterac Valley

UPDATE `game_event` SET `end_time` = '2037-12-31 23:59:59' WHERE `entry` IN (
18,  -- Call to Arms: Alterac Valley
19,  -- Call to Arms, Warsong Gulch
20,  -- Call to Arms, Arathi Basin
29,  -- Edge of Madness, Gri'lek
30,  -- Edge of Madness, Hazza'rah
31,  -- Edge of Madness, Renataki
32,  -- Edge of Madness, Wushoolay
1,   -- Midsummer Fire Festival
2,   -- Feast of Winter Veil
7,   -- Lunar Festival
10,  -- Children's Week
11,  -- Harvest Festival
16,  -- Gurubashi Arena Booty Run
12); -- Hallow's End

UPDATE `game_event` SET `end_time` = '2037-01-01 00:59:59' WHERE `entry` IN (
17,   -- Scourge Invasion
81,   -- Scourge Invasion - Boss in instance activation
90,   -- Scourge Invasion - Attacking Winterspring
91,   -- Scourge Invasion - Attacking Tanaris
92,   -- Scourge Invasion - Attacking Azshara
93,   -- Scourge Invasion - Attacking Blasted Lands
94,   -- Scourge Invasion - Attacking Eastern Plaguelands
95,   -- Scourge Invasion - Attacking Burning Steppes
96,   -- Scourge Invasion - 50 Invasions Done
97,   -- Scourge Invasion - 100 Invasions Done
98,   -- Scourge Invasion - 150 Invasions Done
99,   -- Scourge Invasion - Invasions Done
129,  -- Scourge Invasion - Phase 2 - Invasion Stormwind
130); -- Scourge Invasion - Phase 2 - Invasion Undercity

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
