DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20181205151128');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20181205151128');
-- Add your query below.


-- Quest: Operation Recombobulation (ID: 412)
UPDATE `quest_template` SET `CompleteScript` = 412 WHERE `entry` = 412;

DELETE FROM `quest_end_scripts` WHERE `id` = 412;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(412, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Operation Recombobulation: Razzle Sprysprocket - npc_flag questgiver removed'),
(412, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1883, 0, 0, 0, 0, 0, 0, 0, 0, 'Operation Recombobulation: Razzle Sprysprocket - Say Text'),
(412, 2, 60, 3, 1, 0, 0, 0, 0, 0, 0, 0, 1269, 0, 0, 0, 0, 0, 0, 0, 'Operation Recombobulation: Razzle Sprysprocket - Start Waypoints');

DELETE FROM `creature_movement_special` WHERE `id` = 1269;
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`) VALUES
(1269, 1, -5496.54, -455.453, 395.439, 1000, 0),
(1269, 2, -5496.54, -455.453, 395.439, 12000, 126901),
(1269, 3, -5499.83, -454.55, 395.439, 1000, 0),
(1269, 4, -5499.83, -454.55, 395.439, 15000, 126902),
(1269, 5, -5497.94, -455.835, 395.438, 1000, 0),
(1269, 6, -5497.94, -455.835, 395.438, 8000, 126903);

DELETE FROM `creature_movement_scripts` WHERE `id` IN (126901, 126902, 126903);
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(126901, 1, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.31425, 0, 'Razzle Sprysprocket - Set Orientation'),
(126901, 2, 1, 69, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Razzle Sprysprocket - Play Emote'),
(126901, 10, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Razzle Sprysprocket - Play Emote'),
(126901, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1884, 0, 0, 0, 0, 0, 0, 0, 0, 'Razzle Sprysprocket - Say Text'),

(126902, 1, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.27153, 0, 'Razzle Sprysprocket - Set Orientation'),
(126902, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1885, 0, 0, 0, 0, 0, 0, 0, 0, 'Razzle Sprysprocket - Say Text'),
(126902, 6, 1, 69, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Razzle Sprysprocket - Play Emote'),
(126902, 7, 15, 7344, 2, 0, 0, 5568, 25, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Razzle Sprysprocket - Cast Spell \'Recombobulate\' (Captured Leper Gnome)'),
(126902, 7, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Razzle Sprysprocket - Play Emote'),
(126902, 9, 0, 0, 0, 0, 0, 186, 0, 9, 2, 1886, 0, 0, 0, 0, 0, 0, 0, 0, 'Razzle Sprysprocket - Say Text (Captured Leper Gnome)'),
(126902, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1887, 0, 0, 0, 0, 0, 0, 0, 0, 'Razzle Sprysprocket - Say Text'),

(126903, 1, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5.63683, 0, 'Razzle Sprysprocket - Set Orientation'),
(126903, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1888, 1889, 1890, 0, 0, 0, 0, 0, 0, 'Razzle Sprysprocket - Say Text'),
(126903, 6, 14, 7344, 0, 0, 0, 5568, 25, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Razzle Sprysprocket - Remove Aura \'Recombobulate\' (Captured Leper Gnome)'),
(126903, 6, 39, 126801, 126802, 0, 0, 1268, 25, 8, 2, 50, 50, 0, 0, 0, 0, 0, 0, 0, 'Razzle Sprysprocket - Start Random Script (Ozzie Togglevolt)'),
(126903, 7, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Razzle Sprysprocket - npc_flag questgiver added');

DELETE FROM `event_scripts` WHERE `id` IN (126801, 126802);
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(126801, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1891, 1892, 1893, 0, 0, 0, 0, 0, 0, 'Ozzie Togglevolt - Say Random Text'),
(126802, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1894, 1895, 0, 0, 0, 0, 0, 0, 0, 'Ozzie Togglevolt - Say Random Text');

UPDATE `broadcast_text` SET `EmoteId0` = 5 WHERE `ID` = 1885;
UPDATE `broadcast_text` SET `EmoteId0` = 1 WHERE `ID` IN (1888, 1889, 1890);
UPDATE `broadcast_text` SET `EmoteId0` = 273 WHERE `ID` IN (1891, 1892, 1893, 1894, 1895);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
