DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171127194205');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171127194205');
-- Add your query below.


-- Add missing quest to event AQ War Effort (PNJ + GO 'Initial')
-- Alliance version is already added, this is the Horde one.
INSERT INTO `game_event_quest` VALUES (8794, 22, 7);

-- Spawns for event Darkmoon Faire Building (Elwynn) (TODO), they seem to be incorrect. Don't match screenshots.
DELETE FROM `creature` WHERE `guid` IN (1182595, 1182596, 1182597, 1182598);
DELETE FROM `creature_movement` WHERE `id` IN (1182595, 1182596, 1182597, 1182598);
DELETE FROM `gameobject` WHERE `guid` IN (3995972, 3995973, 3995975, 3995982, 3995983, 3995984, 3995985, 3995987, 3995988, 3995989, 3995990, 3995991, 3995992, 3995993, 3995994, 3995995, 3995996, 3995997, 3995998, 3995999, 3996000, 3996001, 3996002, 3996003, 3996004, 3996005, 3996006, 3996007, 3996008, 3996009, 3996010, 3996011, 3996012, 3996013, 3996014, 3996015, 3996016, 3996017, 3996018, 3996019, 3996020, 3996021, 3996022, 3996023, 3996024, 3996025, 3996026, 3996027, 3996028, 3996029, 3996030, 3996031, 3996032, 3996033, 3996034, 3996035, 3996036, 3996037, 3996038, 3996039, 3996040, 3996041, 3996042, 3996043, 3996044, 3996045, 3996046, 3996047, 3996048, 3996050, 3996051, 3996052, 3996053, 3996054, 3996055, 3996056, 3996057, 3996058, 3996059, 3996060, 3996061, 3996062, 3996063, 3996064, 3996065, 3996066, 3996067, 3996068, 3996069, 3996070, 3996071, 3996072, 3996073, 3996074, 3996075, 3996076, 3996077, 3996078);
DELETE FROM `game_event_creature` WHERE `event`=100;
DELETE FROM `game_event_gameobject` WHERE `event`=100;

-- This event has no content, except for spawns that are for Darkmoon Faire Building (Elwynn).
DELETE FROM `game_event` WHERE `entry`=23;
UPDATE `game_event` SET `entry`=23 WHERE `entry`=100;

-- Event 24 is useless, never used.
DELETE FROM `game_event` WHERE `entry`=24;
-- Deleting gameobjects spawns for it (they are pvp sign posts).
-- These sign posts are already spawned for the call to arms events.
DELETE FROM `gameobject` WHERE `guid` IN (29295, 29296, 29297, 29298, 29302, 29303, 29593, 29594, 29595, 29596, 29597, 29598, 29968, 29969, 30653, 30654, 30688, 30689, 30690);
DELETE FROM `game_event_gameobject` WHERE `event`=24;

-- Change entry for event Darkmoon Faire Building (Mulgore) (TODO).
UPDATE `game_event` SET `entry`=24 WHERE `entry`=101;
UPDATE `game_event_creature` SET `event`=24 WHERE `event`=101;
UPDATE `game_event_gameobject` SET `event`=24 WHERE `event`=101;

-- PNJ means NPC in French.
UPDATE `game_event` SET `description`='AQ War Effort (NPC & GO \'Initial\')' WHERE `entry`=22;
UPDATE `game_event` SET `description`='AQ War Effort (NPC Reput \'Only War Effort\')' WHERE `entry`=52;
UPDATE `game_event` SET `description`='AQ War Effort (NPC Reput Named \'Officer\')' WHERE `entry`=53;
UPDATE `game_event` SET `description`='AQ War Troop Silithus (NPC & GO) DAY 1' WHERE `entry`=54;
UPDATE `game_event` SET `description`='AQ War Troop Silithus (NPC & GO) DAY 2' WHERE `entry`=55;
UPDATE `game_event` SET `description`='AQ War Troop Silithus (NPC & GO) DAY 3' WHERE `entry`=56;
UPDATE `game_event` SET `description`='AQ War Troop Silithus (NPC & GO) DAY 4' WHERE `entry`=57;
UPDATE `game_event` SET `description`='AQ War Troop Silithus (NPC & GO) DAY 5' WHERE `entry`=58;
UPDATE `game_event` SET `description`='AQ War Troop Silithus 3 (NPC & GO)' WHERE `entry`=60;
UPDATE `game_event` SET `description`='AQ War Final Battle (NPC)' WHERE `entry`=61;

-- Assign holiday ids from cMaNGOS & Trinity.
-- Midsummer Fire Festival
UPDATE `game_event` SET `holiday`=341 WHERE `entry`=1;
-- Darkmoon Faire (Elwynn)
UPDATE `game_event` SET `holiday`=374 WHERE `entry` IN (4, 23);
-- Darkmoon Faire (Mulgore)
UPDATE `game_event` SET `holiday`=375 WHERE `entry` IN (5, 24);
-- Lunar Festival
UPDATE `game_event` SET `holiday`=327 WHERE `entry`=7;
-- Love is in the Air
UPDATE `game_event` SET `holiday`=335 WHERE `entry`=8;
-- Noblegarden
UPDATE `game_event` SET `holiday`=181 WHERE `entry`=9;
-- Children's Week
UPDATE `game_event` SET `holiday`=201 WHERE `entry`=10;
-- Harvest Festival
UPDATE `game_event` SET `holiday`=321 WHERE `entry`=11;
-- Hallow's End
UPDATE `game_event` SET `holiday`=324 WHERE `entry`=12;
-- Stranglethorn Fishing Extravaganza: Tournament
UPDATE `game_event` SET `holiday`=301 WHERE `entry`=15;

-- Winter Veil event start time and duration.
UPDATE `game_event` SET `start_time`='2017-12-15 23:00:00' WHERE `entry`=2;

-- Add missing model ids for Darkmoon Faire Carnie.
UPDATE `creature_template` SET `modelid_2`=14913, `modelid_3`=14912, `modelid_4`=14890 WHERE `entry`=14849;
UPDATE `creature` SET `modelid`=0 WHERE `id`=14849;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
