DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20231003020047');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20231003020047');
-- Add your query below.


-- Assign script to quest Ammo for Rumbleshot.
DELETE FROM `quest_end_scripts` WHERE `id`=5541;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(5541, 0, 0, 61, 5541, 360, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Start Scripted Map Event'),
(5541, 1, 0, 39, 5541, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Start Script');
UPDATE `quest_template` SET `CompleteScript`=5541 WHERE `entry`=5541;

-- Main script
DELETE FROM `generic_scripts` WHERE `id`=5541;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(5541, 1, 0, 16, 6598, 0, 0, 0, 10610, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Angus - Play Sound B_MortarTeamYes4'),
(5541, 1, 0, 1, 1, 0, 0, 0, 10610, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Angus - Emote OneShotTalk'),
(5541, 4, 0, 3, 0, 9930, 1, 2, 10805, 100, 8, 2, 0, 0, 0, 0, -6022.7, -179.703, 411.123, 0, 0, 'Ammo for Rumbleshot: Spotter Klemmy - Move'),
(5541, 8, 0, 3, 0, 0, 1, 2, 10610, 100, 8, 2, 0, 0, 0, 0, -6014.13, -206.867, 408.041, 0, 0, 'Ammo for Rumbleshot: Angus - Move'),
(5541, 10, 0, 3, 0, 0, 1, 2, 10804, 100, 8, 2, 0, 0, 0, 0, -6016.43, -209.397, 408.8, 0, 0, 'Ammo for Rumbleshot: Rifleman Middlecamp - Move'),
(5541, 10, 0, 3, 0, 8016, 1, 2, 10610, 100, 8, 2, 0, 0, 0, 0, -6021.67, -218.564, 411.337, 0, 0, 'Ammo for Rumbleshot: Angus - Move'),
(5541, 12, 0, 3, 0, 0, 1, 2, 10611, 100, 8, 2, 0, 0, 0, 0, -6009.37, -204.8, 407.425, 0, 0, 'Ammo for Rumbleshot: Shorty - Move'),
(5541, 12, 0, 3, 0, 0, 1, 2, 10803, 100, 8, 2, 0, 0, 0, 0, -6012.57, -199.28, 407.022, 0, 0, 'Ammo for Rumbleshot: Rifleman Wheeler - Move'),
(5541, 12, 0, 3, 0, 9389, 1, 2, 10804, 100, 8, 2, 0, 0, 0, 0, -6029.31, -224.705, 412.964, 0, 0, 'Ammo for Rumbleshot: Rifleman Middlecamp - Move'),
(5541, 14, 0, 3, 0, 4223, 1, 2, 10611, 100, 8, 2, 0, 0, 0, 0, -6013.85, -207.432, 408.143, 0, 0, 'Ammo for Rumbleshot: Shorty - Move'),
(5541, 14, 0, 3, 0, 8585, 1, 2, 10803, 100, 8, 2, 0, 0, 0, 0, -6020.35, -212.33, 410.228, 0, 0, 'Ammo for Rumbleshot: Rifleman Wheeler - Move'),
(5541, 15, 0, 3, 0, 2673, 1, 2, 10805, 100, 8, 2, 0, 0, 0, 0, -6037.08, -192.324, 418.966, 0, 0, 'Ammo for Rumbleshot: Spotter Klemmy - Move'),
(5541, 15, 0, 3, 0, 6535, 1, 2, 10611, 100, 8, 2, 0, 0, 0, 0, -6017.99, -216.217, 410.498, 0, 0, 'Ammo for Rumbleshot: Shorty - Move'),
(5541, 17, 0, 3, 0, 7082, 1, 2, 10610, 100, 8, 2, 0, 0, 0, 0, -6027.43, -230.878, 413.652, 0, 0, 'Ammo for Rumbleshot: Angus - Move'),
(5541, 17, 0, 3, 0, 3183, 1, 2, 10805, 100, 8, 2, 0, 0, 0, 0, -6052.63, -198.484, 421.83, 0, 0, 'Ammo for Rumbleshot: Spotter Klemmy - Move'),
(5541, 19, 0, 3, 0, 3286, 1, 2, 10805, 100, 8, 2, 0, 0, 0, 0, -6065.43, -202.013, 424.483, 0, 0, 'Ammo for Rumbleshot: Spotter Klemmy - Move'),
(5541, 20, 0, 3, 0, 7743, 1, 2, 10611, 100, 8, 2, 0, 0, 0, 0, -6025.08, -229.169, 413.447, 0, 0, 'Ammo for Rumbleshot: Shorty - Move'),
(5541, 20, 0, 3, 0, 3360, 1, 2, 10804, 100, 8, 2, 0, 0, 0, 0, -6034.12, -223.338, 413.481, 0, 0, 'Ammo for Rumbleshot: Rifleman Middlecamp - Move'),
(5541, 20, 0, 3, 0, 6931, 1, 2, 10803, 100, 8, 2, 0, 0, 0, 0, -6027.47, -221.388, 412.622, 0, 0, 'Ammo for Rumbleshot: Rifleman Wheeler - Move'),
(5541, 22, 0, 3, 0, 4083, 1, 2, 10610, 100, 8, 2, 0, 0, 0, 0, -6031.16, -230.264, 414.361, 0, 0, 'Ammo for Rumbleshot: Angus - Move'),
(5541, 23, 0, 35, 1, 0, 0, 0, 10805, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 5.70723, 0, 'Ammo for Rumbleshot: Spotter Klemmy - Set Orientation'),
(5541, 23, 1, 34, 0, 0, 0, 0, 10805, 100, 8, 2, 0, 0, 0, 0, -6065.43, -202.013, 424.483, 5.70723, 0, 'Ammo for Rumbleshot: Spotter Klemmy - Set Home Position'),
(5541, 25, 0, 3, 0, 3912, 1, 2, 10803, 100, 8, 2, 0, 0, 0, 0, -6031.93, -221.088, 413.153, 0, 0, 'Ammo for Rumbleshot: Rifleman Wheeler - Move'),
(5541, 27, 0, 35, 1, 0, 0, 0, 10610, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 1.97406, 0, 'Ammo for Rumbleshot: Angus - Set Orientation'),
(5541, 27, 0, 35, 1, 0, 0, 0, 10804, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 2.21657, 0, 'Ammo for Rumbleshot: Rifleman Middlecamp - Set Orientation'),
(5541, 27, 0, 3, 0, 4017, 1, 2, 10611, 100, 8, 2, 0, 0, 0, 0, -6029.46, -234.346, 414.297, 0, 0, 'Ammo for Rumbleshot: Shorty - Move'),
(5541, 28, 0, 3, 0, 3960, 1, 2, 10611, 100, 8, 2, 0, 0, 0, 0, -6032.97, -235.862, 415.046, 0, 0, 'Ammo for Rumbleshot: Shorty - Move'),
(5541, 30, 0, 3, 0, 3741, 1, 2, 10611, 100, 8, 2, 0, 0, 0, 0, -6035.97, -234.216, 415.038, 0, 0, 'Ammo for Rumbleshot: Shorty - Move'),
(5541, 30, 0, 35, 1, 0, 0, 0, 10803, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 2.3911, 0, 'Ammo for Rumbleshot: Rifleman Wheeler - Set Orientation'),
(5541, 31, 0, 1, 25, 0, 0, 0, 10804, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Rifleman Middlecamp - Emote OneShotPoint'),
(5541, 31, 0, 3, 0, 4385, 1, 2, 10611, 100, 8, 2, 0, 0, 0, 0, -6033.03, -229.694, 414.447, 0, 0, 'Ammo for Rumbleshot: Shorty - Move'),
(5541, 32, 0, 0, 0, 0, 0, 0, 10804, 100, 8, 2, 6107, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Rifleman Middlecamp - Say Text'),
(5541, 33, 0, 3, 0, 3602, 1, 2, 10611, 100, 8, 2, 0, 0, 0, 0, -6031.59, -228.182, 414.403, 0, 0, 'Ammo for Rumbleshot: Shorty - Move'),
(5541, 35, 0, 3, 0, 2168, 1, 2, 10611, 100, 8, 2, 0, 0, 0, 0, -6031.9, -227.887, 414.42, 0, 0, 'Ammo for Rumbleshot: Shorty - Move'),
(5541, 35, 1, 34, 0, 0, 0, 0, 10611, 100, 8, 2, 0, 0, 0, 0, -6031.9, -227.887, 414.42, 2.0248, 0, 'Ammo for Rumbleshot: Shorty - Set Home Position'),
(5541, 38, 0, 35, 1, 0, 0, 0, 10804, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 2.21657, 0, 'Ammo for Rumbleshot: Rifleman Middlecamp - Set Orientation'),
(5541, 38, 0, 15, 16768, 0, 0, 0, 10804, 100, 8, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Rifleman Middlecamp - Cast Spell Shoot'),
(5541, 38, 0, 35, 1, 0, 0, 0, 10611, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 2.0248, 0, 'Ammo for Rumbleshot: Shorty - Set Orientation'),
(5541, 38, 0, 0, 0, 0, 0, 0, 10804, 100, 8, 2, 6140, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Rifleman Middlecamp - Say Text'),
(5541, 41, 0, 1, 6, 0, 0, 0, 10804, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Rifleman Middlecamp - Emote OneShotQuestion'),
(5541, 45, 0, 0, 0, 0, 0, 0, 10804, 100, 8, 2, 6106, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Rifleman Middlecamp - Say Text'),
(5541, 46, 0, 16, 6247, 0, 0, 0, 10804, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Rifleman Middlecamp - Play Sound B_RiflemanReady1'),
(5541, 49, 0, 15, 16772, 0, 0, 0, 10804, 100, 8, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Rifleman Middlecamp - Cast Spell Shoot'),
(5541, 49, 0, 0, 0, 0, 0, 0, 10804, 100, 8, 2, 6141, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Rifleman Middlecamp - Say Text'),
(5541, 49, 0, 35, 1, 0, 0, 0, 10804, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 2.21657, 0, 'Ammo for Rumbleshot: Rifleman Middlecamp - Set Orientation'),
(5541, 52, 0, 35, 1, 0, 0, 0, 10804, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0.799634, 0, 'Ammo for Rumbleshot: Rifleman Middlecamp - Set Orientation'),
(5541, 54, 0, 1, 11, 0, 0, 0, 10803, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Rifleman Wheeler - Emote OneShotLaugh'),
(5541, 54, 0, 1, 5, 0, 0, 0, 10804, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Rifleman Middlecamp - Emote OneShotExclamation'),
(5541, 57, 0, 1, 11, 0, 0, 0, 10805, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Spotter Klemmy - Emote OneShotLaugh'),
(5541, 57, 0, 1, 273, 0, 0, 0, 10610, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Angus - Emote OneShotYes'),
(5541, 57, 0, 1, 274, 0, 0, 0, 10611, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Shorty - Emote OneShotNo'),
(5541, 61, 0, 35, 1, 0, 0, 0, 10804, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 2.21657, 0, 'Ammo for Rumbleshot: Rifleman Middlecamp - Set Orientation'),
(5541, 62, 0, 0, 0, 0, 0, 0, 10803, 100, 8, 2, 6118, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Rifleman Wheeler - Say Text'),
(5541, 62, 0, 1, 25, 0, 0, 0, 10803, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Rifleman Wheeler - Emote OneShotPoint'),
(5541, 67, 0, 35, 1, 0, 0, 0, 10803, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 2.3911, 0, 'Ammo for Rumbleshot: Rifleman Wheeler - Set Orientation'),
(5541, 67, 0, 15, 16767, 0, 0, 0, 10803, 100, 8, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Rifleman Wheeler - Cast Spell Shoot'),
(5541, 67, 0, 0, 0, 0, 0, 0, 10803, 100, 8, 2, 6142, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Rifleman Wheeler - Say Text'),
(5541, 70, 0, 35, 1, 0, 0, 0, 10803, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 3.94123, 0, 'Ammo for Rumbleshot: Rifleman Wheeler - Set Orientation'),
(5541, 72, 0, 1, 21, 0, 0, 0, 10805, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Spotter Klemmy - Emote OneShotApplaud'),
(5541, 72, 0, 16, 6249, 0, 0, 0, 10803, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Rifleman Wheeler - Play Sound B_RiflemanWhat3'),
(5541, 72, 0, 1, 25, 0, 0, 0, 10803, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Rifleman Wheeler - Emote OneShotPoint'),
(5541, 73, 0, 1, 21, 0, 0, 0, 10610, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Angus - Emote OneShotApplaud'),
(5541, 73, 0, 1, 21, 0, 0, 0, 10611, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Shorty - Emote OneShotApplaud'),
(5541, 75, 0, 1, 23, 0, 0, 0, 10803, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Rifleman Wheeler - Emote OneShotFlex'),
(5541, 77, 0, 35, 1, 0, 0, 0, 10804, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 1.88496, 0, 'Ammo for Rumbleshot: Rifleman Middlecamp - Set Orientation'),
(5541, 78, 0, 35, 1, 0, 0, 0, 10803, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 2.44346, 0, 'Ammo for Rumbleshot: Rifleman Wheeler - Set Orientation'),
(5541, 78, 0, 0, 0, 0, 0, 0, 10804, 100, 8, 2, 6120, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Rifleman Middlecamp - Say Text'),
(5541, 82, 0, 35, 1, 0, 0, 0, 10804, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 1.88496, 0, 'Ammo for Rumbleshot: Rifleman Middlecamp - Set Orientation'),
(5541, 82, 0, 15, 16777, 0, 0, 0, 10804, 100, 8, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Rifleman Middlecamp - Cast Spell Shoot'),
(5541, 83, 0, 0, 0, 0, 0, 0, 10804, 100, 8, 2, 6140, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Rifleman Middlecamp - Say Text'),
(5541, 85, 0, 1, 15, 0, 0, 0, 10804, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Rifleman Middlecamp - Emote OneShotRoar'),
(5541, 88, 0, 35, 1, 0, 0, 0, 10803, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 3.94123, 0, 'Ammo for Rumbleshot: Rifleman Wheeler - Set Orientation'),
(5541, 88, 0, 1, 20, 0, 0, 0, 10804, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Rifleman Middlecamp - Emote OneShotBeg'),
(5541, 90, 0, 1, 6, 0, 0, 0, 10803, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Rifleman Wheeler - Emote OneShotQuestion'),
(5541, 90, 0, 16, 6248, 0, 0, 0, 10803, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Rifleman Wheeler - Play Sound B_RiflemanWhat2'),
(5541, 93, 0, 35, 1, 0, 0, 0, 10803, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 2.23402, 0, 'Ammo for Rumbleshot: Rifleman Wheeler - Set Orientation'),
(5541, 94, 0, 28, 2, 0, 0, 0, 10803, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Rifleman Wheeler - Set Stand State to UNIT_STAND_STATE_SIT_CHAIR'),
(5541, 95, 0, 0, 0, 0, 0, 0, 10804, 100, 8, 2, 6121, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Rifleman Middlecamp - Say Text'),
(5541, 98, 0, 0, 0, 0, 0, 0, 10804, 100, 8, 2, 6141, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Rifleman Middlecamp - Say Text'),
(5541, 98, 0, 15, 16780, 0, 0, 0, 10804, 100, 8, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Rifleman Middlecamp - Cast Spell Shoot'),
(5541, 98, 0, 35, 1, 0, 0, 0, 10804, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 1.88496, 0, 'Ammo for Rumbleshot: Rifleman Middlecamp - Set Orientation'),
(5541, 101, 0, 1, 18, 0, 0, 0, 10804, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Rifleman Middlecamp - Emote OneShotCry'),
(5541, 107, 0, 15, 16775, 0, 0, 0, 10803, 100, 8, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Rifleman Wheeler - Cast Spell Shoot'),
(5541, 107, 0, 35, 1, 0, 0, 0, 10803, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 2.23402, 0, 'Ammo for Rumbleshot: Rifleman Wheeler - Set Orientation'),
(5541, 108, 0, 28, 0, 0, 0, 0, 10803, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Rifleman Wheeler - Set Stand State to UNIT_STAND_STATE_STAND'),
(5541, 108, 0, 0, 0, 0, 0, 0, 10803, 100, 8, 2, 6124, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Rifleman Wheeler - Say Text'),
(5541, 109, 0, 35, 1, 0, 0, 0, 10803, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 2.07694, 0, 'Ammo for Rumbleshot: Rifleman Wheeler - Set Orientation'),
(5541, 109, 0, 0, 0, 0, 0, 0, 10803, 100, 8, 2, 6122, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Rifleman Wheeler - Say Text'),
(5541, 112, 0, 0, 0, 0, 0, 0, 10803, 100, 8, 2, 6123, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Rifleman Wheeler - Say Text'),
(5541, 112, 0, 35, 1, 0, 0, 0, 10803, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 2.07694, 0, 'Ammo for Rumbleshot: Rifleman Wheeler - Set Orientation'),
(5541, 112, 0, 15, 16778, 0, 0, 0, 10803, 100, 8, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Rifleman Wheeler - Cast Spell Shoot'),
(5541, 114, 0, 35, 1, 0, 0, 0, 10803, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 3.94123, 0, 'Ammo for Rumbleshot: Rifleman Wheeler - Set Orientation'),
(5541, 115, 0, 1, 5, 0, 0, 0, 10803, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Rifleman Wheeler - Emote OneShotExclamation'),
(5541, 117, 0, 35, 1, 0, 0, 0, 10804, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0.799634, 0, 'Ammo for Rumbleshot: Rifleman Middlecamp - Set Orientation'),
(5541, 119, 0, 1, 25, 0, 0, 0, 10804, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Rifleman Middlecamp - Emote OneShotPoint'),
(5541, 120, 0, 1, 11, 0, 0, 0, 10804, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Rifleman Middlecamp - Emote OneShotLaugh'),
(5541, 125, 0, 35, 1, 0, 0, 0, 10804, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 2.21657, 0, 'Ammo for Rumbleshot: Rifleman Middlecamp - Set Orientation'),
(5541, 127, 0, 35, 1, 0, 0, 0, 10804, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 2.21657, 0, 'Ammo for Rumbleshot: Rifleman Middlecamp - Set Orientation'),
(5541, 127, 0, 28, 2, 0, 0, 0, 10804, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Rifleman Middlecamp - Set Stand State to UNIT_STAND_STATE_SIT_CHAIR'),
(5541, 127, 0, 16, 6250, 0, 0, 0, 10804, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Rifleman Middlecamp - Play Sound B_RiflemanYesAttack1'),
(5541, 127, 0, 15, 16572, 0, 0, 0, 10804, 100, 8, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Rifleman Middlecamp - Cast Spell Shoot'),
(5541, 127, 0, 28, 0, 0, 0, 0, 10804, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Rifleman Middlecamp - Set Stand State to UNIT_STAND_STATE_STAND'),
(5541, 127, 0, 0, 0, 0, 0, 0, 10804, 100, 8, 2, 6137, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Rifleman Middlecamp - Say Text'),
(5541, 128, 0, 35, 1, 0, 0, 0, 10803, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 2.30383, 0, 'Ammo for Rumbleshot: Rifleman Wheeler - Set Orientation'),
(5541, 130, 0, 15, 16776, 0, 0, 0, 10804, 100, 8, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Rifleman Middlecamp - Cast Spell Shoot'),
(5541, 130, 0, 0, 0, 0, 0, 0, 10804, 100, 8, 2, 6136, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Rifleman Middlecamp - Say Text'),
(5541, 130, 0, 35, 1, 0, 0, 0, 10804, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 2.05949, 0, 'Ammo for Rumbleshot: Rifleman Middlecamp - Set Orientation'),
(5541, 130, 0, 35, 1, 0, 0, 0, 10804, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 2.05949, 0, 'Ammo for Rumbleshot: Rifleman Middlecamp - Set Orientation'),
(5541, 130, 0, 16, 6250, 0, 0, 0, 10804, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Rifleman Middlecamp - Play Sound B_RiflemanYesAttack1'),
(5541, 133, 0, 0, 0, 0, 0, 0, 10804, 100, 8, 2, 6138, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Rifleman Middlecamp - Say Text'),
(5541, 133, 0, 16, 6250, 0, 0, 0, 10804, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Rifleman Middlecamp - Play Sound B_RiflemanYesAttack1'),
(5541, 133, 0, 15, 16779, 0, 0, 0, 10804, 100, 8, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Rifleman Middlecamp - Cast Spell Shoot'),
(5541, 133, 0, 35, 1, 0, 0, 0, 10804, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 1.88496, 0, 'Ammo for Rumbleshot: Rifleman Middlecamp - Set Orientation'),
(5541, 133, 0, 35, 1, 0, 0, 0, 10804, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 1.88496, 0, 'Ammo for Rumbleshot: Rifleman Middlecamp - Set Orientation'),
(5541, 136, 0, 1, 71, 0, 0, 0, 10804, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Rifleman Middlecamp - Emote OneShotCheerNoSheathe'),
(5541, 136, 0, 16, 6246, 0, 0, 0, 10804, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Rifleman Middlecamp - Play Sound B_RiflemanPissed1'),
(5541, 141, 0, 35, 1, 0, 0, 0, 10804, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0.799634, 0, 'Ammo for Rumbleshot: Rifleman Middlecamp - Set Orientation'),
(5541, 144, 0, 35, 1, 0, 0, 0, 10803, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 3.94123, 0, 'Ammo for Rumbleshot: Rifleman Wheeler - Set Orientation'),
(5541, 144, 0, 1, 21, 0, 0, 0, 10805, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Spotter Klemmy - Emote OneShotApplaud'),
(5541, 144, 0, 1, 21, 0, 0, 0, 10611, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Shorty - Emote OneShotApplaud'),
(5541, 144, 0, 1, 21, 0, 0, 0, 10610, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Angus - Emote OneShotApplaud'),
(5541, 146, 0, 1, 2, 0, 0, 0, 10804, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Rifleman Middlecamp - Emote OneShotBow'),
(5541, 146, 0, 1, 21, 0, 0, 0, 10803, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Rifleman Wheeler - Emote OneShotApplaud'),
(5541, 149, 0, 35, 1, 0, 0, 0, 10804, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 5.1664, 0, 'Ammo for Rumbleshot: Rifleman Middlecamp - Set Orientation'),
(5541, 153, 0, 35, 1, 0, 0, 0, 10803, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 4.71734, 0, 'Ammo for Rumbleshot: Rifleman Wheeler - Set Orientation'),
(5541, 153, 0, 35, 1, 0, 0, 0, 10611, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 2.84489, 0, 'Ammo for Rumbleshot: Shorty - Set Orientation'),
(5541, 153, 0, 35, 1, 0, 0, 0, 10610, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 2.82743, 0, 'Ammo for Rumbleshot: Angus - Set Orientation'),
(5541, 156, 0, 3, 0, 8390, 1, 2, 10805, 100, 8, 2, 0, 0, 0, 0, -6077.43, -213.256, 424.05, 0, 0, 'Ammo for Rumbleshot: Spotter Klemmy - Move'),
(5541, 156, 0, 1, 4, 0, 0, 0, 10610, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Angus - Emote OneShotCheer'),
(5541, 156, 0, 1, 4, 0, 0, 0, 10611, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Shorty - Emote OneShotCheer'),
(5541, 156, 0, 16, 6256, 0, 0, 0, 10610, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Angus - Play Sound B_MortarTeamReady1'),
(5541, 166, 0, 15, 18634, 0, 0, 0, 10805, 100, 8, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Spotter Klemmy - Cast Spell Target Dummy - Event 001'),
(5541, 169, 0, 3, 0, 1999, 1, 2, 10805, 100, 8, 2, 0, 0, 0, 0, -6065.9, -202.298, 424.369, 0, 0, 'Ammo for Rumbleshot: Spotter Klemmy - Move'),
(5541, 172, 0, 35, 1, 0, 0, 0, 10805, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 5.60543, 0, 'Ammo for Rumbleshot: Spotter Klemmy - Set Orientation'),
(5541, 174, 0, 1, 3, 0, 0, 0, 10805, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Spotter Klemmy - Emote OneShotWave'),
(5541, 177, 0, 35, 1, 0, 0, 0, 10611, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 4.83533, 0, 'Ammo for Rumbleshot: Shorty - Set Orientation'),
(5541, 177, 0, 35, 1, 0, 0, 0, 10805, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 3.83972, 0, 'Ammo for Rumbleshot: Spotter Klemmy - Set Orientation'),
(5541, 177, 0, 3, 0, 359, 0, 2, 10611, 100, 8, 2, 0, 0, 0, 0, -6031.35, -228.597, 414.389, 0, 0, 'Ammo for Rumbleshot: Shorty - Move'),
(5541, 180, 0, 1, 69, 0, 0, 0, 10611, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Shorty - Set Emote State to STATE_USESTANDING'),
(5541, 180, 0, 1, 16, 0, 0, 0, 10611, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Shorty - Emote OneShotKneel'),
(5541, 185, 0, 1, 0, 0, 0, 0, 10611, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Shorty - Set Emote State to ONESHOT_NONE'),
(5541, 186, 0, 3, 0, 250, 0, 2, 10611, 100, 8, 2, 0, 0, 0, 0, -6031.53, -227.909, 414.404, 0, 0, 'Ammo for Rumbleshot: Shorty - Move'),
(5541, 188, 0, 35, 1, 0, 0, 0, 10611, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 2.87979, 0, 'Ammo for Rumbleshot: Shorty - Set Orientation'),
(5541, 190, 0, 15, 18655, 0, 0, 0, 10611, 100, 8, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Shorty - Cast Spell Mortar Animate'),
(5541, 190, 0, 35, 1, 0, 0, 0, 10804, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 2.9147, 0, 'Ammo for Rumbleshot: Rifleman Middlecamp - Set Orientation'),
(5541, 190, 0, 35, 1, 0, 0, 0, 10803, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 3.01942, 0, 'Ammo for Rumbleshot: Rifleman Wheeler - Set Orientation'),
(5541, 190, 0, 1, 25, 0, 0, 0, 10610, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Angus - Emote OneShotPoint'),
(5541, 193, 0, 15, 16786, 0, 0, 0, 10611, 100, 8, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Shorty - Cast Spell Mortar Shot'),
(5541, 193, 0, 35, 1, 0, 0, 0, 10611, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 2.87979, 0, 'Ammo for Rumbleshot: Shorty - Set Orientation'),
(5541, 196, 0, 1, 17, 0, 0, 0, 10611, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Shorty - Emote OneShotKiss'),
(5541, 199, 0, 1, 1, 0, 0, 0, 10610, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Angus - Emote OneShotTalk'),
(5541, 199, 0, 16, 6252, 0, 0, 0, 10610, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Angus - Play Sound B_MortarTeamPissed2'),
(5541, 199, 0, 35, 1, 0, 0, 0, 10611, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 4.86788, 0, 'Ammo for Rumbleshot: Shorty - Set Orientation'),
(5541, 200, 0, 3, 0, 7144, 1, 2, 10805, 100, 8, 2, 0, 0, 0, 0, -6075.23, -213.59, 423.508, 0, 0, 'Ammo for Rumbleshot: Spotter Klemmy - Move'),
(5541, 201, 0, 1, 4, 0, 0, 0, 10611, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Shorty - Emote OneShotCheer'),
(5541, 204, 0, 35, 1, 0, 0, 0, 10611, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 2.87979, 0, 'Ammo for Rumbleshot: Shorty - Set Orientation'),
(5541, 209, 0, 15, 18907, 0, 0, 0, 10805, 100, 8, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Spotter Klemmy - Cast Spell Target Dummy - Event 002'),
(5541, 212, 0, 3, 0, 1521, 1, 2, 10805, 100, 8, 2, 0, 0, 0, 0, -6071.88, -212.831, 422.929, 0, 0, 'Ammo for Rumbleshot: Spotter Klemmy - Move'),
(5541, 216, 0, 1, 66, 0, 0, 0, 10805, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Spotter Klemmy - Emote OneShotSalute'),
(5541, 219, 0, 3, 0, 1137, 1, 2, 10805, 100, 8, 2, 0, 0, 0, 0, -6067.04, -205.921, 423.301, 0, 0, 'Ammo for Rumbleshot: Spotter Klemmy - Move'),
(5541, 222, 0, 3, 0, 187, 0, 2, 10611, 100, 8, 2, 0, 0, 0, 0, -6031.62, -228.859, 414.397, 0, 0, 'Ammo for Rumbleshot: Shorty - Move'),
(5541, 222, 0, 35, 1, 0, 0, 0, 10611, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 4.56243, 0, 'Ammo for Rumbleshot: Shorty - Set Orientation'),
(5541, 222, 0, 35, 1, 0, 0, 0, 10805, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 4.10152, 0, 'Ammo for Rumbleshot: Spotter Klemmy - Set Orientation'),
(5541, 225, 0, 28, 8, 0, 0, 0, 10611, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Shorty - Set Stand State to UNIT_STAND_STATE_KNEEL'),
(5541, 227, 0, 16, 6254, 0, 0, 0, 10611, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Shorty - Play Sound B_MortarTeamPissed8'),
(5541, 230, 0, 1, 69, 0, 0, 0, 10611, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Shorty - Set Emote State to STATE_USESTANDING'),
(5541, 232, 0, 3, 0, 197, 0, 2, 10611, 100, 8, 2, 0, 0, 0, 0, -6031.5, -228.082, 414.401, 0, 0, 'Ammo for Rumbleshot: Shorty - Move'),
(5541, 232, 0, 1, 0, 0, 0, 0, 10611, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Shorty - Set Emote State to ONESHOT_NONE'),
(5541, 232, 0, 28, 0, 0, 0, 0, 10611, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Shorty - Set Stand State to UNIT_STAND_STATE_STAND'),
(5541, 233, 0, 35, 1, 0, 0, 0, 10611, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 2.87979, 0, 'Ammo for Rumbleshot: Shorty - Set Orientation'),
(5541, 235, 0, 1, 25, 0, 0, 0, 10611, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Shorty - Emote OneShotPoint'),
(5541, 235, 0, 16, 6255, 0, 0, 0, 10611, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Shorty - Play Sound B_MortarTeamPissed9'),
(5541, 237, 0, 15, 18655, 0, 0, 0, 10611, 100, 8, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Shorty - Cast Spell Mortar Animate'),
(5541, 240, 0, 15, 16786, 0, 0, 0, 10611, 100, 8, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Shorty - Cast Spell Mortar Shot'),
(5541, 240, 0, 35, 1, 0, 0, 0, 10611, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 2.87979, 0, 'Ammo for Rumbleshot: Shorty - Set Orientation'),
(5541, 241, 0, 35, 1, 0, 0, 0, 10611, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 4.86621, 0, 'Ammo for Rumbleshot: Shorty - Set Orientation'),
(5541, 241, 0, 35, 1, 0, 0, 0, 10610, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 1.72461, 0, 'Ammo for Rumbleshot: Angus - Set Orientation'),
(5541, 243, 0, 16, 6251, 0, 0, 0, 10611, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Shorty - Play Sound B_MortarTeamPissed1'),
(5541, 243, 0, 35, 1, 0, 0, 0, 10804, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 5.21647, 0, 'Ammo for Rumbleshot: Rifleman Middlecamp - Set Orientation'),
(5541, 243, 0, 1, 1, 0, 0, 0, 10610, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Angus - Emote OneShotTalk'),
(5541, 243, 0, 1, 25, 0, 0, 0, 10611, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Shorty - Emote OneShotPoint'),
(5541, 245, 0, 1, 21, 0, 0, 0, 10804, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Rifleman Middlecamp - Emote OneShotApplaud'),
(5541, 245, 0, 35, 1, 0, 0, 0, 10803, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 4.79595, 0, 'Ammo for Rumbleshot: Rifleman Wheeler - Set Orientation'),
(5541, 246, 0, 35, 1, 0, 0, 0, 10610, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 2.82743, 0, 'Ammo for Rumbleshot: Angus - Set Orientation'),
(5541, 246, 0, 35, 1, 0, 0, 0, 10611, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 2.87979, 0, 'Ammo for Rumbleshot: Shorty - Set Orientation'),
(5541, 246, 0, 3, 0, 6616, 1, 2, 10805, 100, 8, 2, 0, 0, 0, 0, -6077.06, -212.226, 423.851, 0, 0, 'Ammo for Rumbleshot: Spotter Klemmy - Move'),
(5541, 248, 0, 1, 4, 0, 0, 0, 10803, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Rifleman Wheeler - Emote OneShotCheer'),
(5541, 256, 0, 35, 1, 0, 0, 0, 10804, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 2.9147, 0, 'Ammo for Rumbleshot: Rifleman Middlecamp - Set Orientation'),
(5541, 256, 0, 35, 1, 0, 0, 0, 10803, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 3.01942, 0, 'Ammo for Rumbleshot: Rifleman Wheeler - Set Orientation'),
(5541, 258, 0, 15, 19723, 0, 0, 0, 10805, 100, 8, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Spotter Klemmy - Cast Spell Advanced Target Dummy - Event 003'),
(5541, 261, 0, 3, 0, 2275, 1, 2, 10805, 100, 8, 2, 0, 0, 0, 0, -6071.55, -212.96, 422.894, 0, 0, 'Ammo for Rumbleshot: Spotter Klemmy - Move'),
(5541, 264, 0, 35, 1, 0, 0, 0, 10805, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 5.92214, 0, 'Ammo for Rumbleshot: Spotter Klemmy - Set Orientation'),
(5541, 266, 0, 1, 25, 0, 0, 0, 10805, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Spotter Klemmy - Emote OneShotPoint'),
(5541, 267, 0, 1, 11, 0, 0, 0, 10805, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Spotter Klemmy - Emote OneShotLaugh'),
(5541, 267, 0, 35, 1, 0, 0, 0, 10611, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 2.78054, 0, 'Ammo for Rumbleshot: Shorty - Set Orientation'),
(5541, 267, 0, 35, 1, 0, 0, 0, 10610, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 2.73678, 0, 'Ammo for Rumbleshot: Angus - Set Orientation'),
(5541, 269, 0, 16, 6258, 0, 0, 0, 10611, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Shorty - Play Sound B_MortarTeamYesAttack4'),
(5541, 269, 0, 1, 15, 0, 0, 0, 10611, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Shorty - Emote OneShotRoar'),
(5541, 269, 0, 1, 5, 0, 0, 0, 10610, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Angus - Emote OneShotExclamation'),
(5541, 271, 0, 1, 5, 0, 0, 0, 10805, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Spotter Klemmy - Emote OneShotExclamation'),
(5541, 271, 0, 15, 18655, 0, 0, 0, 10611, 100, 8, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Shorty - Cast Spell Mortar Animate'),
(5541, 274, 0, 35, 1, 0, 0, 0, 10611, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 2.78054, 0, 'Ammo for Rumbleshot: Shorty - Set Orientation'),
(5541, 274, 0, 3, 0, 5521, 1, 2, 10805, 100, 8, 2, 0, 0, 0, 0, -6040.96, -221.929, 414.921, 0, 0, 'Ammo for Rumbleshot: Spotter Klemmy - Move'),
(5541, 274, 0, 15, 16786, 0, 0, 0, 10611, 100, 8, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Shorty - Cast Spell Mortar Shot'),
(5541, 275, 0, 1, 10, 0, 0, 0, 10610, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Angus - Set Emote State to STATE_DANCE'),
(5541, 275, 0, 1, 10, 0, 0, 0, 10611, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Shorty - Set Emote State to STATE_DANCE'),
(5541, 280, 0, 35, 1, 0, 0, 0, 10805, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 5.70657, 0, 'Ammo for Rumbleshot: Spotter Klemmy - Set Orientation'),
(5541, 282, 0, 1, 14, 0, 0, 0, 10805, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Spotter Klemmy - Emote OneShotRude'),
(5541, 285, 0, 35, 1, 0, 0, 0, 10611, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 2.56498, 0, 'Ammo for Rumbleshot: Shorty - Set Orientation'),
(5541, 285, 0, 1, 0, 0, 0, 0, 10611, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Shorty - Set Emote State to ONESHOT_NONE'),
(5541, 285, 0, 1, 0, 0, 0, 0, 10610, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Angus - Set Emote State to ONESHOT_NONE'),
(5541, 285, 0, 35, 1, 0, 0, 0, 10803, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 3.23445, 0, 'Ammo for Rumbleshot: Rifleman Wheeler - Set Orientation'),
(5541, 285, 0, 35, 1, 0, 0, 0, 10804, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 2.93859, 0, 'Ammo for Rumbleshot: Rifleman Middlecamp - Set Orientation'),
(5541, 285, 0, 35, 1, 0, 0, 0, 10610, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 2.43675, 0, 'Ammo for Rumbleshot: Angus - Set Orientation'),
(5541, 285, 0, 1, 14, 0, 0, 0, 10805, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Spotter Klemmy - Emote OneShotRude'),
(5541, 287, 0, 1, 11, 0, 0, 0, 10804, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Rifleman Middlecamp - Emote OneShotLaugh'),
(5541, 287, 0, 1, 11, 0, 0, 0, 10610, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Angus - Emote OneShotLaugh'),
(5541, 288, 0, 1, 11, 0, 0, 0, 10611, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Shorty - Emote OneShotLaugh'),
(5541, 288, 0, 1, 11, 0, 0, 0, 10803, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Rifleman Wheeler - Emote OneShotLaugh'),
(5541, 290, 0, 1, 11, 0, 0, 0, 10610, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Angus - Emote OneShotLaugh'),
(5541, 290, 0, 1, 11, 0, 0, 0, 10804, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Rifleman Middlecamp - Emote OneShotLaugh'),
(5541, 292, 0, 1, 11, 0, 0, 0, 10611, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Shorty - Emote OneShotLaugh'),
(5541, 292, 0, 1, 11, 0, 0, 0, 10803, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Rifleman Wheeler - Emote OneShotLaugh'),
(5541, 293, 0, 3, 0, 12018, 1, 2, 10805, 100, 8, 2, 0, 0, 0, 0, -6004.26, -199.009, 406.63, 0, 0, 'Ammo for Rumbleshot: Spotter Klemmy - Move'),
(5541, 295, 0, 3, 0, 3757, 1, 2, 10611, 100, 8, 2, 0, 0, 0, 0, -6025.35, -225.434, 412.854, 0, 0, 'Ammo for Rumbleshot: Shorty - Move'),
(5541, 295, 0, 3, 0, 3703, 1, 2, 10804, 100, 8, 2, 0, 0, 0, 0, -6025.15, -221.917, 412.408, 0, 0, 'Ammo for Rumbleshot: Rifleman Middlecamp - Move'),
(5541, 296, 0, 3, 0, 2647, 1, 2, 10803, 100, 8, 2, 0, 0, 0, 0, -6025.58, -219.791, 412.21, 0, 0, 'Ammo for Rumbleshot: Rifleman Wheeler - Move'),
(5541, 296, 0, 3, 0, 3394, 1, 2, 10610, 100, 8, 2, 0, 0, 0, 0, -6023.85, -227.594, 413.132, 0, 0, 'Ammo for Rumbleshot: Angus - Move'),
(5541, 296, 0, 3, 0, 4770, 1, 2, 10804, 100, 8, 2, 0, 0, 0, 0, -6020.98, -216.882, 411.052, 0, 0, 'Ammo for Rumbleshot: Rifleman Middlecamp - Move'),
(5541, 296, 0, 3, 0, 4096, 1, 2, 10611, 100, 8, 2, 0, 0, 0, 0, -6022.63, -221.544, 411.964, 0, 0, 'Ammo for Rumbleshot: Shorty - Move'),
(5541, 298, 0, 3, 0, 3090, 1, 2, 10803, 100, 8, 2, 0, 0, 0, 0, -6022.66, -215.729, 411.134, 0, 0, 'Ammo for Rumbleshot: Rifleman Wheeler - Move'),
(5541, 298, 0, 3, 0, 3433, 1, 2, 10610, 100, 8, 2, 0, 0, 0, 0, -6022.45, -223.844, 412.259, 0, 0, 'Ammo for Rumbleshot: Angus - Move'),
(5541, 300, 0, 3, 0, 3787, 1, 2, 10610, 100, 8, 2, 0, 0, 0, 0, -6019.88, -219.816, 411.273, 0, 0, 'Ammo for Rumbleshot: Angus - Move'),
(5541, 300, 0, 3, 0, 3962, 1, 2, 10803, 100, 8, 2, 0, 0, 0, 0, -6019.62, -210.561, 409.634, 0, 0, 'Ammo for Rumbleshot: Rifleman Wheeler - Move'),
(5541, 300, 0, 3, 0, 5287, 1, 2, 10804, 100, 8, 2, 0, 0, 0, 0, -6016.72, -208.953, 408.759, 0, 0, 'Ammo for Rumbleshot: Rifleman Middlecamp - Move'),
(5541, 300, 0, 3, 0, 3751, 1, 2, 10611, 100, 8, 2, 0, 0, 0, 0, -6018.57, -215.868, 410.484, 0, 0, 'Ammo for Rumbleshot: Shorty - Move'),
(5541, 301, 0, 3, 0, 5324, 1, 2, 10611, 100, 8, 2, 0, 0, 0, 0, -6014.18, -209.504, 408.665, 0, 0, 'Ammo for Rumbleshot: Shorty - Move'),
(5541, 301, 0, 3, 0, 5160, 1, 2, 10803, 100, 8, 2, 0, 0, 0, 0, -6016.22, -204.702, 407.772, 0, 0, 'Ammo for Rumbleshot: Rifleman Wheeler - Move'),
(5541, 301, 0, 3, 0, 4978, 1, 2, 10610, 100, 8, 2, 0, 0, 0, 0, -6016.5, -213.851, 409.876, 0, 0, 'Ammo for Rumbleshot: Angus - Move'),
(5541, 303, 0, 3, 0, 4648, 1, 2, 10804, 100, 8, 2, 0, 0, 0, 0, -6014.79, -202.942, 407.427, 0, 0, 'Ammo for Rumbleshot: Rifleman Middlecamp - Move'),
(5541, 304, 0, 3, 0, 5305, 1, 2, 10610, 100, 8, 2, 0, 0, 0, 0, -6011.84, -206.613, 407.865, 0, 0, 'Ammo for Rumbleshot: Angus - Move'),
(5541, 304, 0, 3, 0, 5653, 1, 2, 10611, 100, 8, 2, 0, 0, 0, 0, -6007.59, -203.733, 407.27, 0, 0, 'Ammo for Rumbleshot: Shorty - Move'),
(5541, 304, 0, 3, 0, 5430, 1, 2, 10803, 100, 8, 2, 0, 0, 0, 0, -6011.58, -197.707, 406.85, 0, 0, 'Ammo for Rumbleshot: Rifleman Wheeler - Move'),
(5541, 306, 0, 3, 0, 1332, 0, 2, 10805, 100, 8, 2, 0, 0, 0, 0, -6007.3, -200.348, 406.864, 0, 0, 'Ammo for Rumbleshot: Spotter Klemmy - Move'),
(5541, 308, 0, 3, 0, 684, 1, 2, 10804, 100, 8, 2, 0, 0, 0, 0, -6010.67, -199.434, 406.865, 0, 0, 'Ammo for Rumbleshot: Rifleman Middlecamp - Move'),
(5541, 308, 0, 35, 1, 0, 0, 0, 10805, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 3.29867, 0, 'Ammo for Rumbleshot: Spotter Klemmy - Set Orientation'),
(5541, 308, 1, 34, 2, 0, 0, 0, 10805, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Spotter Klemmy - Reset Home Position'),
(5541, 309, 0, 35, 1, 0, 0, 0, 10804, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 5.53269, 0, 'Ammo for Rumbleshot: Rifleman Middlecamp - Set Orientation'),
(5541, 311, 0, 3, 0, 604, 1, 2, 10610, 100, 8, 2, 0, 0, 0, 0, -6009.25, -202.65, 407.015, 0, 0, 'Ammo for Rumbleshot: Angus - Move'),
(5541, 311, 0, 3, 0, 1351, 0, 2, 10803, 100, 8, 2, 0, 0, 0, 0, -6008.53, -199.145, 406.857, 0, 0, 'Ammo for Rumbleshot: Rifleman Wheeler - Move'),
(5541, 311, 0, 3, 0, 637, 0, 2, 10611, 100, 8, 2, 0, 0, 0, 0, -6007.46, -202.158, 407.081, 0, 0, 'Ammo for Rumbleshot: Shorty - Move'),
(5541, 313, 0, 35, 1, 0, 0, 0, 10610, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 1.58825, 0, 'Ammo for Rumbleshot: Angus - Set Orientation'),
(5541, 313, 0, 35, 1, 0, 0, 0, 10611, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 2.47837, 0, 'Ammo for Rumbleshot: Shorty - Set Orientation'),
(5541, 313, 0, 35, 1, 0, 0, 0, 10803, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 4.24115, 0, 'Ammo for Rumbleshot: Rifleman Wheeler - Set Orientation'),
(5541, 317, 0, 35, 1, 0, 0, 0, 10611, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 2.4379, 0, 'Ammo for Rumbleshot: Shorty - Set Orientation'),
(5541, 317, 1, 34, 2, 0, 0, 0, 10611, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ammo for Rumbleshot: Shorty - Reset Home Position'),
(5541, 320, 0, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0349066, 0, 'Ammo for Rumbleshot: Hegnar Rumbleshot - Set Orientation');

-- Define correct coordinates for spells.
REPLACE INTO `spell_target_position` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`, `build_min`, `build_max`) VALUES (16768, 0, -6051.39, -206.749, 418.159, 0, 0, 5875);
REPLACE INTO `spell_target_position` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`, `build_min`, `build_max`) VALUES (16772, 0, -6046.84, -204.535, 416.897, 0, 0, 5875);
REPLACE INTO `spell_target_position` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`, `build_min`, `build_max`) VALUES (16767, 0, -6046.73, -207.159, 417.267, 0, 0, 5875);
REPLACE INTO `spell_target_position` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`, `build_min`, `build_max`) VALUES (16777, 0, -6044.53, -202.912, 416.756, 0, 0, 5875);
REPLACE INTO `spell_target_position` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`, `build_min`, `build_max`) VALUES (16780, 0, -6044.79, -196.959, 419.19, 0, 0, 5875);
REPLACE INTO `spell_target_position` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`, `build_min`, `build_max`) VALUES (16775, 0, -6044.47, -205.783, 417.267, 0, 0, 5875);
REPLACE INTO `spell_target_position` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`, `build_min`, `build_max`) VALUES (16778, 0, -6042.18, -204.949, 416.336, 0, 0, 5875);
REPLACE INTO `spell_target_position` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`, `build_min`, `build_max`) VALUES (16572, 0, -6046.85, -207.329, 418.304, 0, 0, 5875);
REPLACE INTO `spell_target_position` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`, `build_min`, `build_max`) VALUES (16776, 0, -6044.54, -205.562, 417.663, 0, 0, 5875);
REPLACE INTO `spell_target_position` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`, `build_min`, `build_max`) VALUES (16779, 0, -6042.02, -204.134, 416.894, 0, 0, 5875);
REPLACE INTO `spell_target_position` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`, `build_min`, `build_max`) VALUES (18634, 0, -6076, -215, 424, 6.06, 0, 5875);
REPLACE INTO `spell_target_position` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`, `build_min`, `build_max`) VALUES (16786, 0, -6078.3, -211.89, 424.197, 0, 0, 5875);
REPLACE INTO `spell_target_position` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`, `build_min`, `build_max`) VALUES (18907, 0, -6074, -215, 423, 6.06, 0, 5875);
REPLACE INTO `spell_target_position` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`, `build_min`, `build_max`) VALUES (19723, 0, -6074, -215, 423, 6.06, 0, 5875);

-- Events list for Mortar Team Target Dummy
DELETE FROM `creature_ai_events` WHERE `creature_id`=11875;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1187501, 11875, 0, 8, 0, 100, 0, 16786, -1, 0, 0, 1187501, 0, 0, 'Mortar Team Target Dummy - Cast Spell Quiet Suicide on Hit By Spell Mortar Shot');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1187502, 11875, 0, 1, 0, 100, 0, 0, 0, 0, 0, 1187502, 0, 0, 'Mortar Team Target Dummy - Stop Moving OOC');
DELETE FROM `creature_ai_scripts` WHERE `id`=1187501;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1187501, 0, 0, 15, 3617, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mortar Team Target Dummy - Cast Spell Quiet Suicide');
DELETE FROM `creature_ai_scripts` WHERE `id`=1187502;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1187502, 0, 0, 88, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mortar Team Target Dummy - Set Command State to Stay'),
(1187502, 0, 0, 20, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mortar Team Target Dummy - Move Idle');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=11875;

-- Events list for Mortar Team Advanced Target Dummy
DELETE FROM `creature_ai_events` WHERE `creature_id`=12385;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1238501, 12385, 0, 8, 0, 100, 0, 16786, -1, 0, 0, 1238501, 0, 0, 'Mortar Team Advanced Target Dummy - Cast Spell Quiet Suicide on Hit By Spell Mortar Shot');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1238502, 12385, 0, 1, 0, 100, 0, 0, 0, 0, 0, 1238502, 0, 0, 'Mortar Team Advanced Target Dummy - Stop Moving OOC');
DELETE FROM `creature_ai_scripts` WHERE `id`=1238501;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1238501, 0, 0, 15, 3617, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mortar Team Advanced Target Dummy - Cast Spell Quiet Suicide');
DELETE FROM `creature_ai_scripts` WHERE `id`=1238502;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1238502, 0, 0, 88, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mortar Team Advanced Target Dummy - Set Command State to Stay'),
(1238502, 0, 0, 20, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mortar Team Advanced Target Dummy - Move Idle');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=12385;

-- Remove old scripts.

-- go_mortar
UPDATE `gameobject_template` SET `script_name`='' WHERE `entry`=176557;
-- npc_angus
UPDATE `creature_template` SET `script_name`='' WHERE `entry`=10610;
-- npc_mortar_team_target_dummy
UPDATE `creature_template` SET `script_name`='' WHERE `entry`=11875;
UPDATE `creature_template` SET `script_name`='' WHERE `entry`=12385;
-- npc_mortar_team_watcher
DELETE FROM `creature` WHERE `id`=20113;
DELETE FROM `creature_template` WHERE `entry`=20113;
-- npc_rifleman_middlecamp
UPDATE `creature_template` SET `script_name`='' WHERE `entry`=10804;
-- npc_rifleman_wheeler
UPDATE `creature_template` SET `script_name`='' WHERE `entry`=10803;
-- npc_shorty
UPDATE `creature_template` SET `script_name`='' WHERE `entry`=10611;
-- npc_spotter_klemmy
UPDATE `creature_template` SET `script_name`='' WHERE `entry`=10805;

-- Remove not needed game event.
-- This script is triggered by turning in a quest, not periodically.
DELETE FROM `game_event` WHERE `entry`=67;
DELETE FROM `game_event_creature` WHERE `event`=67;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
