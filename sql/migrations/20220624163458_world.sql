DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220624163458');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220624163458');
-- Add your query below.


-- Misc
UPDATE `gameobject_template` SET `faction` = 14 WHERE `entry` IN (180249, 180250, 180401);
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` IN (180402, 180404);
UPDATE `creature_template` SET `script_name`='' WHERE `entry` IN (14875, 15069, 15080);
UPDATE `creature` SET `spawn_flags` = 1 WHERE `guid` IN (391, 385, 723, 436);
UPDATE `quest_template` SET `CompleteScript` = 8183 WHERE `entry` = 8183;
DELETE FROM `script_waypoint` WHERE `entry` = 14875;
UPDATE `broadcast_text` SET `chat_type` = 1 WHERE `entry` = 10612;

-- GameObjects spawned during script.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `spawn_flags`) VALUES
(99908, 180404, 0, -11831.6, 1331.36, 1.85519, 5.74214, 0, 0, -0.267238, 0.963631, -1, -1, 1, 100, 1),
(99909, 180404, 0, -11817.8, 1324.95, 1.47568, 6.05629, 0, 0, -0.113203, 0.993572, -1, -1, 1, 100, 1),
(99910, 180404, 0, -11801.3, 1335.25, 1.33491, 0.261798, 0, 0, 0.130526, 0.991445, -1, -1, 1, 100, 1),
(99911, 180404, 0, -11835.1, 1349.48, 2.13036, 3.01941, 0, 0, 0.998135, 0.0610518, -1, -1, 1, 100, 1),
(99912, 180402, 0, -11818.4, 1344.86, 4.26675, 0, 0, 0, 0, 1, -1, -1, 1, 100, 1),
(99913, 180249, 0, -11818.3, 1345.13, 8.0145, 1.32645, 0, 0, 0.615661, 0.788011, -1, -1, 1, 100, 1),
(99914, 180250, 0, -11818.3, 1345.13, 8.0145, 1.32645, 0, 0, 0.615661, 0.788011, -1, -1, 1, 100, 1),
(99915, 180401, 0, -11818.3, 1345.13, 8.0145, 1.32645, 0, 0, 0.615661, 0.788011, -1, -1, 1, 100, 1),
(99916, 180391, 0, -11866.5, 1299.45, 2.09667, 0.209439, 0, 0, 0.104528, 0.994522, -1, -1, 1, 100, 1),
(99917, 180391, 0, -11800.3, 1233.46, -0.576672, 3.6652, 0, 0, -0.965925, 0.258821, -1, -1, 1, 100, 1),
(99918, 180391, 0, -11866.7, 1233.16, 3.90082, 2.11185, 0, 0, 0.870356, 0.492424, -1, -1, 1, 100, 1),
(99919, 180391, 0, -14474.6, 456.099, 30.455, 2.61799, 0, 0, 0.965925, 0.258821, -1, -1, 1, 100, 1),
(99920, 180391, 0, -14456.5, 419.375, 25.0717, 3.56047, 0, 0, -0.978148, 0.207912, -1, -1, 1, 100, 1),
(99921, 180391, 0, -14452.6, 468.902, 15.2266, 4.55531, 0, 0, -0.760406, 0.649449, -1, -1, 1, 100, 1),
(100001, 180391, 0, -14445.8, 492.904, 37.0182, 4.76475, 0, 0, -0.688354, 0.725374, -1, -1, 1, 100, 1),
(100002, 180391, 0, -14436, 440.761, 15.9439, 4.06662, 0, 0, -0.894934, 0.446199, -1, -1, 1, 100, 1),
(100003, 180391, 0, -14428, 521.74, 4.98022, 3.22886, 0, 0, -0.999048, 0.0436193, -1, -1, 1, 100, 1),
(100004, 180391, 0, -14390.2, 415.434, 22.7543, 1.0472, 0, 0, 0.5, 0.866025, -1, -1, 1, 100, 1),
(100005, 180391, 0, -14358.1, 377.618, 23.4272, 2.53072, 0, 0, 0.953716, 0.300708, -1, -1, 1, 100, 1),
(100006, 180391, 0, -14320.2, 443.482, 22.934, 4.69494, 0, 0, -0.71325, 0.70091, -1, -1, 1, 100, 1),
(100007, 180391, 0, -14298.3, 526.593, 8.76179, 0.820303, 0, 0, 0.398748, 0.91706, -1, -1, 1, 100, 1),
(100008, 180391, 0, -11800.3, 1299.85, -0.53611, 4.11898, 0, 0, -0.882947, 0.469473, -1, -1, 1, 100, 1);

-- Generic script for Creature Servant of the Hand
DELETE FROM `generic_scripts` WHERE `id`=1508001;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1508001, 0, 15, 17321, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Servant of the Hand - Cast Spell Spirit Spawn-in'),
(1508001, 17, 15, 24217, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Servant of the Hand - Cast Spell Quest - Heart of Hakkar, Ritual Cast Visual'),
(1508001, 49, 15, 24221, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Servant of the Hand - Cast Spell Quest - Teleport Spawn-out');

-- Generic script for Creature Servant of the Hand
DELETE FROM `generic_scripts` WHERE `id`=1508002;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1508002, 0, 15, 17321, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Servant of the Hand - Cast Spell Spirit Spawn-in'),
(1508002, 17, 15, 24217, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Servant of the Hand - Cast Spell Quest - Heart of Hakkar, Ritual Cast Visual'),
(1508002, 48, 15, 24221, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Servant of the Hand - Cast Spell Quest - Teleport Spawn-out');

-- Generic script for Creature Servant of the Hand
DELETE FROM `generic_scripts` WHERE `id`=1508003;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1508003, 0, 15, 17321, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Servant of the Hand - Cast Spell Spirit Spawn-in'),
(1508003, 17, 15, 24217, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Servant of the Hand - Cast Spell Quest - Heart of Hakkar, Ritual Cast Visual'),
(1508003, 49, 15, 24221, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Servant of the Hand - Cast Spell Quest - Teleport Spawn-out');

-- Generic script for Creature Servant of the Hand
DELETE FROM `generic_scripts` WHERE `id`=1508004;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1508004, 0, 15, 17321, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Servant of the Hand - Cast Spell Spirit Spawn-in'),
(1508004, 17, 15, 24217, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Servant of the Hand - Cast Spell Quest - Heart of Hakkar, Ritual Cast Visual'),
(1508004, 48, 15, 24221, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Servant of the Hand - Cast Spell Quest - Teleport Spawn-out');

-- Main script
DELETE FROM `quest_end_scripts` WHERE `id`=8183;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(8183, 0, 0, 4, 147, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Heart of Hakkar: Molthor - Remove Npc Flags'),
(8183, 0, 0, 4, 147, 1, 2, 0, 385, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Heart of Hakkar: Servant of the Hand - Remove Npc Flags'),
(8183, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Heart of Hakkar: Molthor - Emote'),
(8183, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10473, 0, 0, 0, 0, 0, 0, 0, 0, 'The Heart of Hakkar: Molthor - Say Text'),
(8183, 0, 0, 4, 147, 1, 2, 0, 723, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Heart of Hakkar: Servant of the Hand - Remove Npc Flags'),
(8183, 2, 0, 3, 0, 2445, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11823.4, 1250.01, 2.62618, 0, 0, 'The Heart of Hakkar: Molthor - Move'),
(8183, 4, 0, 9, 99909, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Heart of Hakkar: Respawn GameObject Servant of the Hand Summoning Circle'),
(8183, 4, 0, 9, 99908, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Heart of Hakkar: Respawn GameObject Servant of the Hand Summoning Circle'),
(8183, 4, 0, 9, 99911, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Heart of Hakkar: Respawn GameObject Servant of the Hand Summoning Circle'),
(8183, 4, 0, 9, 99910, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Heart of Hakkar: Respawn GameObject Servant of the Hand Summoning Circle'),
(8183, 4, 0, 3, 0, 2393, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11828.4, 1260.1, 1.75118, 0, 0, 'The Heart of Hakkar: Molthor - Move'),
(8183, 5, 0, 3, 0, 3797, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11836.6, 1280.52, 1.88022, 0, 0, 'The Heart of Hakkar: Molthor - Move'),
(8183, 7, 0, 3, 0, 2554, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11837.8, 1291.05, 1.39231, 0, 0, 'The Heart of Hakkar: Molthor - Move'),
(8183, 8, 0, 10, 15080, 60000, 0, 0, 0, 0, 0, 0, 2, 1508004, -1, 1, -11831.7, 1331.29, 1.93852, 0.942478, 0, 'The Heart of Hakkar: Summon Creature Servant of the Hand'),
(8183, 8, 0, 10, 15080, 60000, 0, 0, 0, 0, 0, 0, 2, 1508003, -1, 1, -11817.9, 1325.02, 1.55901, 1.51844, 0, 'The Heart of Hakkar: Summon Creature Servant of the Hand'),
(8183, 8, 0, 10, 15080, 60000, 0, 0, 0, 0, 0, 0, 2, 1508002, -1, 1, -11801.4, 1335.38, 1.36269, 2.61799, 0, 'The Heart of Hakkar: Summon Creature Servant of the Hand'),
(8183, 8, 0, 10, 15080, 60000, 0, 0, 0, 0, 0, 0, 2, 1508001, -1, 1, -11835.2, 1349.36, 2.11011, 6.05629, 0, 'The Heart of Hakkar: Summon Creature Servant of the Hand'),
(8183, 9, 0, 3, 0, 2768, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11833.9, 1301.87, 0.84901, 0, 0, 'The Heart of Hakkar: Molthor - Move'),
(8183, 11, 0, 3, 0, 4010, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11825.8, 1323.78, 0.491301, 0, 0, 'The Heart of Hakkar: Molthor - Move'),
(8183, 17, 0, 15, 24214, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Heart of Hakkar: Molthor - Cast Spell Heart of Hakkar - Molthor chucks the heart'),
(8183, 20, 0, 10, 15069, 28000, 0, 0, 0, 0, 0, 0, 2, 0, -1, 1, -11818.3, 1345.13, 8.0145, 1.32645, 0, 'The Heart of Hakkar: Summon Creature Heart of Hakkar'),
(8183, 20, 0, 9, 99912, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Heart of Hakkar: Respawn GameObject Heart of Hakkar Object'),
(8183, 21, 0, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.25664, 0, 'The Heart of Hakkar: Molthor - Set Orientation'),
(8183, 21, 0, 1, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Heart of Hakkar: Molthor - Emote OneShotShot'),
(8183, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10474, 0, 0, 0, 0, 0, 0, 0, 0, 'The Heart of Hakkar: Molthor - Say Text'),
(8183, 25, 0, 28, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Heart of Hakkar: Molthor - Set Stand State to UNIT_STAND_STATE_KNEEL'),
(8183, 26, 0, 9, 99915, 31, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Heart of Hakkar: Respawn GameObject Heart of Hakkar Portal Sound'),
(8183, 26, 0, 9, 99913, 31, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Heart of Hakkar: Respawn GameObject Heart of Hakkar Air Rift'),
(8183, 26, 0, 9, 99914, 31, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Heart of Hakkar: Respawn GameObject Heart of Hakkar Fire Rift'),
(8183, 26, 0, 15, 24202, 0, 0, 0, 15069, 30, 8, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Heart of Hakkar: Heart of Hakkar - Cast Spell Create Heart of Hakkar Rift'),
(8183, 26, 0, 15, 24203, 0, 0, 0, 15069, 30, 8, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Heart of Hakkar: Heart of Hakkar - Cast Spell Heart of Hakkar Banning'),
(8183, 42, 0, 10, 15073, 8000, 0, 0, 0, 0, 0, 0, 2, 0, -1, 1, -11818.3, 1345.13, 8.09784, 1.32645, 0, 'The Heart of Hakkar: Summon Creature Pat\'s Hellfire Guy'),
(8183, 42, 0, 15, 24215, 0, 0, 0, 15069, 30, 8, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Heart of Hakkar: Heart of Hakkar - Cast Spell Create Heart of Hakkar Explosion'),
(8183, 45, 0, 15, 24207, 0, 0, 0, 15073, 30, 8, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Heart of Hakkar: Pat\'s Hellfire Guy - Cast Spell Hellfire Cast Visual'),
(8183, 45, 0, 15, 24204, 0, 0, 0, 15069, 30, 8, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Heart of Hakkar: Heart of Hakkar - Cast Spell Heart of Hakkar Implode'),
(8183, 45, 0, 16, 7059, 2, 0, 0, 15069, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Heart of Hakkar: Heart of Hakkar - Play Sound AvatarofHakkarDeath'),
(8183, 46, 0, 4, 147, 1, 1, 0, 723, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Heart of Hakkar: Servant of the Hand - Add Npc Flags'),
(8183, 46, 0, 4, 147, 1, 1, 0, 385, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Heart of Hakkar: Servant of the Hand - Add Npc Flags'),
(8183, 49, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10537, 0, 0, 0, 0, 0, 0, 0, 0, 'The Heart of Hakkar: Molthor - Say Text'),
(8183, 49, 0, 1, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Heart of Hakkar: Molthor - Emote OneShotShot'),
(8183, 49, 0, 0, 0, 0, 0, 0, 436, 0, 9, 2, 10612, 0, 0, 0, 0, 0, 0, 0, 0, 'The Heart of Hakkar: Zandalarian Emissary - Say Text'),
(8183, 50, 0, 9, 99921, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Heart of Hakkar: Respawn GameObject Heart of Hakkar Spell Emitter'),
(8183, 50, 0, 9, 99920, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Heart of Hakkar: Respawn GameObject Heart of Hakkar Spell Emitter'),
(8183, 50, 0, 9, 100008, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Heart of Hakkar: Respawn GameObject Heart of Hakkar Spell Emitter'),
(8183, 50, 0, 9, 100005, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Heart of Hakkar: Respawn GameObject Heart of Hakkar Spell Emitter'),
(8183, 50, 0, 9, 100006, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Heart of Hakkar: Respawn GameObject Heart of Hakkar Spell Emitter'),
(8183, 50, 0, 9, 100007, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Heart of Hakkar: Respawn GameObject Heart of Hakkar Spell Emitter'),
(8183, 50, 0, 9, 100003, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Heart of Hakkar: Respawn GameObject Heart of Hakkar Spell Emitter'),
(8183, 50, 0, 9, 100002, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Heart of Hakkar: Respawn GameObject Heart of Hakkar Spell Emitter'),
(8183, 50, 0, 9, 100004, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Heart of Hakkar: Respawn GameObject Heart of Hakkar Spell Emitter'),
(8183, 50, 0, 9, 100001, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Heart of Hakkar: Respawn GameObject Heart of Hakkar Spell Emitter'),
(8183, 50, 0, 9, 99917, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Heart of Hakkar: Respawn GameObject Heart of Hakkar Spell Emitter'),
(8183, 50, 0, 9, 99916, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Heart of Hakkar: Respawn GameObject Heart of Hakkar Spell Emitter'),
(8183, 50, 0, 9, 99918, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Heart of Hakkar: Respawn GameObject Heart of Hakkar Spell Emitter'),
(8183, 50, 0, 9, 99919, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Heart of Hakkar: Respawn GameObject Heart of Hakkar Spell Emitter'),
(8183, 51, 0, 15, 24425, 0, 0, 0, 100003, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Heart of Hakkar: Heart of Hakkar Spell Emitter - Cast Spell'),
(8183, 51, 0, 15, 24425, 0, 0, 0, 100004, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Heart of Hakkar: Heart of Hakkar Spell Emitter - Cast Spell'),
(8183, 51, 0, 15, 24425, 0, 0, 0, 100006, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Heart of Hakkar: Heart of Hakkar Spell Emitter - Cast Spell'),
(8183, 51, 0, 15, 24425, 0, 0, 0, 100007, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Heart of Hakkar: Heart of Hakkar Spell Emitter - Cast Spell'),
(8183, 51, 0, 15, 24425, 0, 0, 0, 100008, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Heart of Hakkar: Heart of Hakkar Spell Emitter - Cast Spell'),
(8183, 51, 0, 15, 24425, 0, 0, 0, 100002, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Heart of Hakkar: Heart of Hakkar Spell Emitter - Cast Spell'),
(8183, 51, 0, 15, 24425, 0, 0, 0, 100001, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Heart of Hakkar: Heart of Hakkar Spell Emitter - Cast Spell'),
(8183, 51, 0, 15, 24425, 0, 0, 0, 99920, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Heart of Hakkar: Heart of Hakkar Spell Emitter - Cast Spell'),
(8183, 51, 0, 15, 24425, 0, 0, 0, 99919, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Heart of Hakkar: Heart of Hakkar Spell Emitter - Cast Spell'),
(8183, 51, 0, 15, 24425, 0, 0, 0, 99918, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Heart of Hakkar: Heart of Hakkar Spell Emitter - Cast Spell'),
(8183, 51, 0, 15, 24425, 0, 0, 0, 99917, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Heart of Hakkar: Heart of Hakkar Spell Emitter - Cast Spell'),
(8183, 51, 0, 15, 24425, 0, 0, 0, 99916, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Heart of Hakkar: Heart of Hakkar Spell Emitter - Cast Spell'),
(8183, 51, 0, 15, 24425, 0, 0, 0, 100005, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Heart of Hakkar: Heart of Hakkar Spell Emitter - Cast Spell'),
(8183, 53, 80, 80, 2, 0, 0, 0, 99911, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Heart of Hakkar: Servant of the Hand Summoning Circle - Set Go State to GO_STATE_ACTIVE_ALTERNATIVE'),
(8183, 53, 80, 80, 2, 0, 0, 0, 99910, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Heart of Hakkar: Servant of the Hand Summoning Circle - Set Go State to GO_STATE_ACTIVE_ALTERNATIVE'),
(8183, 53, 80, 80, 2, 0, 0, 0, 99909, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Heart of Hakkar: Servant of the Hand Summoning Circle - Set Go State to GO_STATE_ACTIVE_ALTERNATIVE'),
(8183, 53, 80, 80, 2, 0, 0, 0, 99908, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Heart of Hakkar: Servant of the Hand Summoning Circle - Set Go State to GO_STATE_ACTIVE_ALTERNATIVE'),
(8183, 54, 0, 3, 0, 3060, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11834.3, 1301.17, 0.815517, 0, 0, 'The Heart of Hakkar: Molthor - Move'),
(8183, 55, 0, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Heart of Hakkar: Molthor - Set Stand State to UNIT_STAND_STATE_STAND'),
(8183, 57, 0, 3, 0, 2028, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11838.1, 1289.74, 1.58054, 0, 0, 'The Heart of Hakkar: Molthor - Move'),
(8183, 58, 0, 3, 0, 3967, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11829.8, 1264.85, 1.62618, 0, 0, 'The Heart of Hakkar: Molthor - Move'),
(8183, 62, 0, 3, 0, 3061, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11818.5, 1249.37, 2.59151, 0, 0, 'The Heart of Hakkar: Molthor - Move'),
(8183, 65, 0, 3, 0, 1790, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11812.3, 1260.91, 5.99856, 0, 0, 'The Heart of Hakkar: Molthor - Move'),
(8183, 66, 0, 3, 0, 1163, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11812.3, 1260.91, 5.99856, 0, 0, 'The Heart of Hakkar: Molthor - Move'),
(8183, 68, 0, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4.27606, 0, 'The Heart of Hakkar: Molthor - Set Orientation'),
(8183, 70, 0, 4, 147, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Heart of Hakkar: Molthor - Add Npc Flags');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
