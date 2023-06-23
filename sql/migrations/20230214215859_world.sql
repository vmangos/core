DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230214215859');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230214215859');
-- Add your query below.


-- Start script for quest The Attack.
DELETE FROM `quest_start_scripts` WHERE `id`=434;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(434, 0, 0, 61, 434, 600, 0, 0, 0, 0, 0, 8, 0, 4340, 6306, 4341, 0, 0, 0, 0, 0, 'The Attack: Start Scripted Map Event'),
(434, 0, 1, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.8326, 0, 'The Attack: Tyrion - Set Orientation'),
(434, 0, 2, 1, 69, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Attack: Tyrion - Set Emote State to STATE_USESTANDING'),
(434, 0, 3, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Attack: Tyrion - Remove Npc Flags'),
(434, 1, 0, 71, 0, 0, 0, 0, 45707, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Attack: Tyrion\'s Spybot - Respawn'),
(434, 4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Attack: Tyrion - Set Emote State to ONESHOT_NONE'),
(434, 4, 0, 0, 0, 0, 0, 0, 45707, 0, 9, 2, 4593, 0, 0, 0, 0, 0, 0, 0, 0, 'The Attack: Tyrion\'s Spybot - Say Text'),
(434, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3761, 0, 0, 0, 0, 0, 0, 0, 0, 'The Attack: Tyrion - Say Text'),
(434, 7, 0, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5.7548, 0, 'The Attack: Tyrion - Set Orientation'),
(434, 7, 0, 74, 11048, 0, 0, 0, 45707, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Attack: Tyrion\'s Spybot - Add Aura Perm. Illusion Bishop Tyriona'),
(434, 7, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Attack: Tyrion - Emote OneShotTalk'),
(434, 9, 0, 27, 7779, 0, 0, 0, 45707, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Attack: Tyrion\'s Spybot - Update Entry to Priestess Tyriona'),
(434, 12, 0, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0523599, 0, 'The Attack: Tyrion - Set Orientation'),
(434, 14, 0, 60, 0, 0, 0, 0, 45707, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Attack: Tyrion\'s Spybot - Start Waypoints');

-- 6306: Target Is Dead Or Source Is Not Within 200 Yards Of Target
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (6306, 25, 2, 200, 0, 0, 0);

-- Waypoints for Priestess Tyriona.
DELETE FROM `creature_movement_template` WHERE `entry`=7779;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(7779, 1, -8408.253906, 451.895844, 123.792877, 100.000000, 0, 0.000000, 0),
(7779, 2, -8409.868164, 455.591522, 123.792885, 100.000000, 0, 0.000000, 0),
(7779, 3, -8410.325195, 462.069702, 123.792870, 100.000000, 0, 0.000000, 0),
(7779, 4, -8403.290039, 463.663361, 123.792877, 100.000000, 0, 0.000000, 0),
(7779, 5, -8392.573242, 452.644745, 123.792877, 100.000000, 9779, 0.000000, 777905),
(7779, 6, -8390.055664, 449.678314, 124.361198, 100.000000, 0, 0.000000, 0),
(7779, 7, -8377.914063, 434.564850, 122.392876, 100.000000, 0, 0.000000, 0),
(7779, 8, -8360.072266, 412.577209, 122.392876, 100.000000, 0, 0.000000, 0),
(7779, 9, -8358.130859, 409.342743, 122.440437, 100.000000, 0, 0.000000, 0),
(7779, 10, -8363.306641, 400.453583, 122.392876, 100.000000, 0, 0.000000, 0),
(7779, 11, -8364.642578, 397.474792, 122.392868, 100.000000, 0, 0.000000, 0),
(7779, 12, -8355.581055, 384.218781, 122.392876, 100.000000, 0, 0.000000, 0),
(7779, 13, -8352.449219, 382.286621, 122.392876, 100.000000, 0, 0.000000, 0),
(7779, 14, -8335.313477, 393.441193, 122.392868, 100.000000, 14603, 0.000000, 777914),
(7779, 15, -8345.407227, 387.284576, 122.390205, 100.000000, 0, 0.000000, 0),
(7779, 16, -8348.583984, 384.803223, 122.392876, 100.000000, 0, 0.000000, 0),
(7779, 17, -8355.529297, 385.912201, 122.392876, 100.000000, 0, 0.000000, 0),
(7779, 18, -8362.705078, 394.422333, 122.392876, 100.000000, 0, 0.000000, 0),
(7779, 19, -8364.512695, 398.679626, 122.392876, 100.000000, 0, 0.000000, 0),
(7779, 20, -8363.166992, 402.496643, 122.392876, 100.000000, 0, 0.000000, 0),
(7779, 21, -8360.108398, 404.770660, 122.410095, 100.000000, 0, 0.000000, 0),
(7779, 22, -8361.791016, 413.923706, 122.392876, 100.000000, 0, 0.000000, 0),
(7779, 23, -8372.695313, 427.346649, 122.392883, 100.000000, 0, 0.000000, 0),
(7779, 24, -8382.484375, 440.247101, 122.392868, 100.000000, 0, 0.000000, 0),
(7779, 25, -8385.573242, 441.892731, 122.392860, 100.000000, 0, 0.000000, 0),
(7779, 26, -8392.385742, 438.209808, 122.392876, 100.000000, 0, 0.000000, 0),
(7779, 27, -8404.444336, 427.246368, 122.392876, 100.000000, 0, 0.000000, 0),
(7779, 28, -8407.391602, 424.502655, 122.392868, 100.000000, 0, 0.000000, 0),
(7779, 29, -8411.315430, 425.203125, 122.392868, 100.000000, 0, 0.000000, 0),
(7779, 30, -8424.684570, 444.273010, 122.392860, 100.000000, 8474, 0.000000, 777930),
(7779, 31, -8435.206055, 442.783142, 122.504227, 100.000000, 0, 0.000000, 0),
(7779, 32, -8445.727539, 433.793304, 119.115593, 100.000000, 1000, 0.000000, 777932),
(7779, 33, -8445.727539, 433.793304, 119.115593, 100.000000, 0, 0.000000, 0);

-- Waypoint scripts for Priestess Tyriona.
DELETE FROM `creature_movement_scripts` WHERE `id` IN (777905, 777914, 777930, 777932);
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(777905, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Attack: Tyrion\'s Spybot - Emote OneShotTalk'),
(777905, 0, 35, 1, 0, 0, 0, 10524, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 3.25305, 0, 'The Attack: Stormwind Royal Guard - Set Orientation'),
(777905, 0, 35, 1, 0, 0, 0, 10523, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 1.13883, 0, 'The Attack: Stormwind Royal Guard - Set Orientation'),
(777905, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3781, 0, 0, 0, 0, 0, 0, 0, 0, 'The Attack: Tyrion\'s Spybot - Say Text'),
(777905, 1, 1, 16, 0, 0, 0, 10523, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Attack: Stormwind Royal Guard - Emote OneShotKneel'),
(777905, 1, 1, 16, 0, 0, 0, 10524, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Attack: Stormwind Royal Guard - Emote OneShotKneel'),
(777905, 4, 1, 1, 0, 0, 0, 10524, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Attack: Stormwind Royal Guard - Emote OneShotTalk'),
(777905, 4, 0, 0, 0, 0, 0, 10524, 0, 9, 2, 3783, 0, 0, 0, 0, 0, 0, 0, 0, 'The Attack: Stormwind Royal Guard - Say Text'),
(777905, 7, 35, 1, 0, 0, 0, 10524, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 3.80482, 0, 'The Attack: Stormwind Royal Guard - Set Orientation'),
(777905, 7, 35, 1, 0, 0, 0, 10523, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0.645772, 0, 'The Attack: Stormwind Royal Guard - Set Orientation'),
(777905, 8, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Attack: Tyrion\'s Spybot - Emote OneShotTalk'),
(777905, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3782, 0, 0, 0, 0, 0, 0, 0, 0, 'The Attack: Tyrion\'s Spybot - Say Text'),
(777914, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Attack: Tyrion\'s Spybot - Emote OneShotTalk'),
(777914, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3762, 0, 0, 0, 0, 0, 0, 0, 0, 'The Attack: Tyrion\'s Spybot - Say Text'),
(777914, 1, 35, 1, 0, 0, 0, 1754, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 3.66982, 0, 'The Attack: Lord Gregor Lescovar - Set Orientation'),
(777914, 5, 1, 1, 0, 0, 0, 1754, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Attack: Lord Gregor Lescovar - Emote OneShotTalk'),
(777914, 5, 0, 0, 0, 0, 0, 1754, 30, 8, 2, 3784, 0, 0, 0, 0, 0, 0, 0, 0, 'The Attack: Lord Gregor Lescovar - Say Text'),
(777914, 11, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Attack: Tyrion\'s Spybot - Emote OneShotBow'),
(777914, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3791, 0, 0, 0, 0, 0, 0, 0, 0, 'The Attack: Tyrion\'s Spybot - Say Text'),
(777914, 12, 60, 0, 0, 0, 0, 1754, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Attack: Lord Gregor Lescovar - Start Waypoints'),
(777930, 2, 15, 11067, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Attack: Tyrion\'s Spybot - Cast Spell Perm. Illusion Tyrion'),
(777930, 5, 27, 8856, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Attack: Tyrion\'s Spybot - Update Entry to Tyrion\'s Spybot'),
(777930, 6, 15, 11013, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Attack: Tyrion\'s Spybot - Cast Spell Sneak'),
(777932, 0, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Attack: Tyrion\'s Spybot - Despawn Creature');

-- Correct unit flags of Priestess Tyriona.
UPDATE `creature_template` SET `unit_flags`=768 WHERE `entry`=7779;

-- Assign quest scripts.
UPDATE `quest_template` SET `StartScript`=434 WHERE `entry`=434;
UPDATE `creature_template` SET `gossip_menu_id`=1761, `script_name`='' WHERE `entry`=7766;

-- 2394: Scripted Map Event 434 Is Active
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (2394, 36, 434, 0, 0, 0, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (1761, 2394, 2394);

-- Waypoints for Creature Lord Gregor Lescovar (Entry: 1754 Guid: 2843)
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(1754, 1, -8332.951172, 394.819672, 122.457764, 100.000000, 0, 0.000000, 0),
(1754, 2, -8335.584961, 397.395966, 122.392868, 100.000000, 0, 0.000000, 0),
(1754, 3, -8346.029297, 414.222961, 122.392876, 100.000000, 0, 0.000000, 0),
(1754, 4, -8354.932617, 410.085876, 122.396965, 100.000000, 0, 0.000000, 0),
(1754, 5, -8375.853516, 431.961426, 122.392883, 100.000000, 0, 0.000000, 0),
(1754, 6, -8392.416016, 452.595276, 123.792877, 100.000000, 5240, 0.000000, 175406),
(1754, 7, -8402.577148, 465.652008, 123.792877, 100.000000, 60000, 0.000000, 175407),
(1754, 8, -8392.416016, 452.595276, 123.792877, 100.000000, 0, 0.000000, 175408),
(1754, 9, -8375.853516, 431.961426, 122.392883, 100.000000, 0, 0.000000, 0),
(1754, 10, -8354.932617, 410.085876, 122.396965, 100.000000, 0, 0.000000, 0),
(1754, 11, -8346.029297, 414.222961, 122.392876, 100.000000, 0, 0.000000, 0),
(1754, 12, -8335.584961, 397.395966, 122.392868, 100.000000, 0, 0.000000, 0),
(1754, 13, -8332.951172, 394.819672, 122.457764, 100.000000, 0, 0.000000, 0);
DELETE FROM `script_waypoint` WHERE `entry`=1754;

-- Waypoint scripts for Lord Gregor Lescovar.
DELETE FROM `creature_movement_scripts` WHERE `id`=175406;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(175406, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Attack: Lord Gregor Lescovar - Emote OneShotTalk'),
(175406, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 322, 0, 0, 0, 0, 0, 0, 0, 0, 'The Attack: Lord Gregor Lescovar - Say Text'),
(175406, 3, 35, 1, 0, 0, 0, 10524, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 3.27191, 0, 'The Attack: Stormwind Royal Guard - Set Orientation'),
(175406, 3, 35, 1, 0, 0, 0, 10523, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 1.09244, 0, 'The Attack: Stormwind Royal Guard - Set Orientation'),
(175406, 5, 1, 66, 0, 0, 0, 10523, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Attack: Stormwind Royal Guard - Emote OneShotSalute'),
(175406, 5, 1, 66, 0, 0, 0, 10524, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Attack: Stormwind Royal Guard - Emote OneShotSalute'),
(175406, 5, 0, 0, 0, 0, 0, 10524, 0, 9, 2, 3690, 0, 0, 0, 0, 0, 0, 0, 0, 'The Attack: Stormwind Royal Guard - Say Text'),
(175406, 8, 3, 0, 11001, 1, 2, 10524, 0, 9, 2, 0, 0, 0, 0, -8375.29, 433.02, 122.393, 0, 0, 'The Attack: Stormwind Royal Guard - Move'),
(175406, 8, 3, 0, 12656, 1, 2, 10523, 0, 9, 2, 0, 0, 0, 0, -8374.25, 428.7, 122.393, 0, 0, 'The Attack: Stormwind Royal Guard - Move'),
(175406, 6, 3, 0, 15164, 1, 2, 10524, 0, 9, 2, 0, 0, 0, 0, -8353.65, 405.941, 122.344, 0, 0, 'The Attack: Stormwind Royal Guard - Move'),
(175406, 8, 3, 0, 13299, 1, 2, 10523, 0, 9, 2, 0, 0, 0, 0, -8356.38, 404.744, 122.384, 0, 0, 'The Attack: Stormwind Royal Guard - Move'),
(175406, 19, 3, 0, 7962, 1, 2, 10524, 0, 9, 2, 0, 0, 0, 0, -8342.47, 414.809, 122.393, 0, 0, 'The Attack: Stormwind Royal Guard - Move'),
(175406, 19, 3, 0, 7503, 1, 2, 10523, 0, 9, 2, 0, 0, 0, 0, -8367.22, 396.232, 122.393, 0, 0, 'The Attack: Stormwind Royal Guard - Move'),
(175406, 27, 35, 1, 0, 0, 0, 10524, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 3.76991, 0, 'The Attack: Stormwind Royal Guard - Set Orientation'),
(175406, 27, 35, 1, 0, 0, 0, 10523, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0.663225, 0, 'The Attack: Stormwind Royal Guard - Set Orientation');
DELETE FROM `creature_movement_scripts` WHERE `id`=175407;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(175407, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3721, 0, 0, 0, 0, 0, 0, 0, 0, 'The Attack: Lord Gregor Lescovar - Say Text'),
(175407, 23, 0, 10, 1755, 60000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, -8401.24, 491.133, 123.843, 4.03171, 0, 'The Attack: Summon Creature Marzon the Silent Blade'),
(175407, 24, 0, 3, 0, 4538, 1, 2, 1755, 30, 8, 2, 0, 0, 0, 0, -8406.11, 481.173, 123.793, 0, 0, 'The Attack: Marzon the Silent Blade - Move'),
(175407, 27, 0, 3, 0, 5330, 1, 2, 1755, 30, 8, 2, 0, 0, 0, 0, -8405.02, 470.18, 123.793, 0, 0, 'The Attack: Marzon the Silent Blade - Move'),
(175407, 33, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Attack: Lord Gregor Lescovar - Emote OneShotTalk'),
(175407, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 323, 0, 0, 0, 0, 0, 0, 0, 0, 'The Attack: Lord Gregor Lescovar - Say Text'),
(175407, 35, 0, 14, 7104, 0, 0, 0, 1755, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Attack: Marzon the Silent Blade - Remove Aura Sneak'),
(175407, 37, 0, 0, 0, 0, 0, 0, 1755, 30, 8, 2, 324, 0, 0, 0, 0, 0, 0, 0, 0, 'The Attack: Marzon the Silent Blade - Say Text'),
(175407, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 326, 0, 0, 0, 0, 0, 0, 0, 0, 'The Attack: Lord Gregor Lescovar - Say Text'),
(175407, 42, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Attack: Lord Gregor Lescovar - Emote OneShotTalk'),
(175407, 46, 0, 63, 434, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Attack: Lord Gregor Lescovar - Add Map Event Target'),
(175407, 46, 1, 22, 34, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Attack: Lord Gregor Lescovar - Set Faction to Defias Brotherhood'),
(175407, 47, 0, 0, 0, 0, 0, 0, 1755, 30, 8, 2, 325, 0, 0, 0, 0, 0, 0, 0, 0, 'The Attack: Marzon the Silent Blade - Say Text'),
(175407, 47, 1, 63, 434, 0, 0, 0, 1755, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Attack: Marzon the Silent Blade - Add Map Event Target'),
(175407, 47, 2, 22, 34, 3, 0, 0, 1755, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Attack: Marzon the Silent Blade - Set Faction to Defias Brotherhood'),
(175407, 47, 3, 7, 434, 80, 1, 0, 434, 0, 21, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Attack: Player - Complete Quest'),
(175407, 48, 0, 69, 434, 0, 0, 0, 434, 0, 21, 2, 4340, 4340, 6306, 4341, 0, 0, 0, 0, 0, 'The Attack: Player - Edit Map Event'),
(175407, 49, 0, 1, 23, 0, 0, 0, 7766, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Attack: Tyrion - Emote OneShotFlex'),
(175407, 49, 0, 0, 0, 0, 0, 0, 7766, 30, 8, 2, 4613, 0, 0, 0, 0, 0, 0, 0, 0, 'The Attack: Tyrion - Say Text');
DELETE FROM `creature_movement_scripts` WHERE `id`=175408;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(175408, 0, 0, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Attack: Lord Gregor Lescovar - Reset Faction'),
(175408, 0, 0, 18, 0, 0, 0, 0, 1755, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Attack: Marzon the Silent Blade - Despawn'),
(175408, 0, 0, 62, 434, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Attack: Marzon the Silent Blade - End Map Event');

-- Correct auras for Marzon the Silent Blade.
UPDATE `creature_template` SET `auras`='7104' WHERE `entry`=1755;

-- 4340: Extra Targets Of Scripted Map Event 434 Satisfy Condition (121:  Not (Target Is Alive))
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (4340, 47, 434, 121, 0, 0, 0);

-- Success script.
DELETE FROM `generic_scripts` WHERE `id`=4340;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(4340, 0, 0, 3, 0, 0, 3, 0, 10524, 0, 9, 2, 0, 0, 0, 0, -8388.84, 453.084, 123.76, 3.80482, 0, 'The Attack Success: Stormwind Royal Guard - Move'),
(4340, 0, 0, 3, 0, 0, 3, 0, 10523, 0, 9, 2, 0, 0, 0, 0, -8394.09, 449.427, 123.76, 0.645772, 0, 'The Attack Success: Stormwind Royal Guard - Move'),
(4340, 0, 0, 71, 1, 0, 0, 0, 45707, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Attack Success: Tyrion\'s Spybot - Respawn'),
(4340, 1, 0, 60, 0, 0, 0, 0, 45707, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Attack Success: Tyrion\'s Spybot - Start Waypoints');
-- Failure script.
DELETE FROM `generic_scripts` WHERE `id`=4341;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(4341, 0, 0, 70, 434, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Attack Fail: Player - Fail Quest'),
(4341, 0, 1, 20, 6, 0, 0, 0, 10523, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Attack Fail: Stormwind Royal Guard - Move Home'),
(4341, 0, 2, 20, 6, 0, 0, 0, 10524, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Attack Fail: Stormwind Royal Guard - Move Home'),
(4341, 0, 3, 71, 1, 1, 0, 0, 45707, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Attack Fail: Tyrion\'s Spybot - Respawn'),
(4341, 1, 0, 20, 0, 0, 0, 1, 45707, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Attack Fail: Tyrion\'s Spybot - Move Idle'),
(4341, 1, 1, 6, 0, 0, 0, 0, 45707, 0, 9, 2, 0, 0, 0, 0, -8408.25, 451.896, 123.76, 5.52986, 0, 'The Attack Fail: Tyrion\'s Spybot - Teleport'),
(4341, 1, 2, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Attack Fail: Tyrion - Add Quest Giver Flag');

-- Waypoints for Creature Tyrion's Spybot (Entry: 8856 Guid: 2852)
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(8856, 1, -8430.702148, 442.357544, 122.357765, 100.000000, 1000, 0.000000, 0),
(8856, 2, -8428.257813, 445.544373, 122.392868, 100.000000, 0, 0.000000, 0),
(8856, 3, -8420.607422, 453.409271, 124.281647, 100.000000, 0, 0.000000, 0),
(8856, 4, -8417.314453, 454.884155, 123.792870, 100.000000, 0, 0.000000, 0),
(8856, 5, -8408.253906, 451.895844, 123.792877, 100.000000, 10000, 0.000000, 885605),
(8856, 6, -8408.253906, 451.895844, 123.792877, 100.000000, 0, 0.000000, 0);
UPDATE `creature` SET `movement_type`=2, `position_x`=-8430.7, `position_y`=442.358, `position_z`=122.358, `orientation`=0.856207 WHERE `id`=8856;

-- Waypoint scripts
DELETE FROM `creature_movement_scripts` WHERE `id`=885605;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(885605, 0, 0, 20, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Attack: Tyrion\'s Spybot - Move Idle'),
(885605, 4, 0, 1, 4, 0, 0, 0, 7766, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Attack: Tyrion - Emote OneShotCheer'),
(885605, 4, 0, 35, 1, 0, 0, 0, 7766, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 1.82793, 0, 'The Attack: Tyrion - Set Orientation'),
(885605, 4, 0, 0, 0, 0, 0, 0, 7766, 30, 8, 2, 4612, 0, 0, 0, 0, 0, 0, 0, 0, 'The Attack: Tyrion - Say Text'),
(885605, 7, 0, 35, 1, 0, 0, 0, 7766, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0.0523599, 0, 'The Attack: Tyrion - Set Orientation'),
(885605, 7, 0, 4, 147, 2, 1, 0, 7766, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Attack: Tyrion - Add Quest Giver Flag');

-- Events list for Lord Gregor Lescovar
DELETE FROM `creature_ai_events` WHERE `creature_id`=1754;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (175401, 1754, 0, 4, 0, 100, 0, 0, 0, 0, 0, 175401, 0, 0, 'Lord Gregor Lescovar - Say Text on Aggro');
DELETE FROM `creature_ai_scripts` WHERE `id`=175401;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(175401, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3934, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Gregor Lescovar - Say Text');
UPDATE `creature_template` SET `ai_name`='EventAI', `script_name`='' WHERE `entry`=1754;

-- Events list for Marzon the Silent Blade
DELETE FROM `creature_ai_events` WHERE `creature_id`=1755;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (175501, 1755, 0, 4, 0, 100, 0, 0, 0, 0, 0, 175501, 0, 0, 'Marzon the Silent Blade - Say Text on Aggro');
DELETE FROM `creature_ai_scripts` WHERE `id`=175501;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(175501, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3936, 0, 0, 0, 0, 0, 0, 0, 0, 'Marzon the Silent Blade - Say Text');
UPDATE `creature_template` SET `ai_name`='EventAI', `script_name`='' WHERE `entry`=1755;

-- Remove script from Tyrion's Spybot.
UPDATE `creature_template` SET `script_name`='' WHERE `entry`=8856;
DELETE FROM `script_waypoint` WHERE `entry`=8856;

-- Priestess Tyriona should not be permanently spawned.
DELETE FROM `creature` WHERE `id`=7779;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
