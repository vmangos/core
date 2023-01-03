DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220727031508');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220727031508');
-- Add your query below.


-- 237: No Player in 50 Yards
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (237, 56, 0, 50, 0, 0, 1);
-- 8502: TYPE_AVATAR is NOT_STARTED
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (8502, 34, 8, 0, 0, 0, 0);
-- 8503: TYPE_AVATAR is IN_PROGRESS
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (8503, 34, 8, 1, 0, 0, 0);
-- 8504: TYPE_ETERNAL_FLAME is 1
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (8504, 34, 10, 1, 0, 0, 0);
-- 8505: TYPE_ETERNAL_FLAME is 2
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (8505, 34, 10, 2, 0, 0, 0);
-- 8506: TYPE_ETERNAL_FLAME is 3
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (8506, 34, 10, 3, 0, 0, 0);
-- 8507: TYPE_ETERNAL_FLAME is 4
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (8507, 34, 10, 4, 0, 0, 0);
-- 8508: Scripted Map Event 8502 Is Active
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (8508, 36, 8502, 0, 0, 0, 0);
-- 8509: Spawned Nightmare Suppressor Count is 0
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (8509, 35, 8502, 0, 0, 0, 0);
-- 8510: Spawned Nightmare Suppressor Count is 1
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (8510, 35, 8502, 0, 1, 0, 0);
-- 8511: Spawned Nightmare Suppressor Count is 2
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (8511, 35, 8502, 0, 2, 0, 0);
-- 8512: Spawned Nightmare Suppressor Count is 3
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (8512, 35, 8502, 0, 3, 0, 0);
-- 8440: Source's Entry Is 8440
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (8440, 16, 8440, 0, 0, 0, 0);

-- Eternal Flame On Use Scripts
DELETE FROM `gameobject_scripts` WHERE `id`=47561;
INSERT INTO `gameobject_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(47561, 0, 0, 39, 850220, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 8503, 'Avatar of Hakkar Fight: Eternal Flame - Start Script');
DELETE FROM `gameobject_scripts` WHERE `id`=47562;
INSERT INTO `gameobject_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(47562, 0, 0, 39, 850220, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 8503, 'Avatar of Hakkar Fight: Eternal Flame - Start Script');
DELETE FROM `gameobject_scripts` WHERE `id`=47563;
INSERT INTO `gameobject_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(47563, 0, 0, 39, 850220, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 8503, 'Avatar of Hakkar Fight: Eternal Flame - Start Script');
DELETE FROM `gameobject_scripts` WHERE `id`=47564;
INSERT INTO `gameobject_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(47564, 0, 0, 39, 850220, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 8503, 'Avatar of Hakkar Fight: Eternal Flame - Start Script');
DELETE FROM `generic_scripts` WHERE `id`=850220;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(850220, 0, 1, 37, 10, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Fight: Eternal Flame - Increment Flames Counter'),
(850220, 0, 2, 39, 850213, 0, 0, 0, 8440, 100, 8, 2, 100, 0, 0, 0, 0, 0, 0, 0, 8504, 'Avatar of Hakkar Fight: Eternal Flame - Start Wave 1 Script'),
(850220, 0, 3, 39, 850215, 0, 0, 0, 8440, 100, 8, 2, 100, 0, 0, 0, 0, 0, 0, 0, 8505, 'Avatar of Hakkar Fight: Eternal Flame - Start Wave 2 Script'),
(850220, 0, 4, 39, 850217, 0, 0, 0, 8440, 100, 8, 2, 100, 0, 0, 0, 0, 0, 0, 0, 8506, 'Avatar of Hakkar Fight: Eternal Flame - Start Wave 3 Script'),
(850220, 0, 5, 39, 850219, 0, 0, 0, 8440, 100, 8, 2, 100, 0, 0, 0, 0, 0, 0, 0, 8507, 'Avatar of Hakkar Fight: Eternal Flame - Start Wave 4 Script'),
(850220, 2, 0, 80, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Fight: Eternal Flame - Set Go State to Alternative');

-- GameObjects spawned during script.
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `spawn_flags`) VALUES
(399162, 148998, 109, -467.622, 290.573, -90.8275, 0.523598, 0, 0, 0.258819, 0.965926, 0, 0, 1, 100, 2),
(399163, 148998, 109, -456.914, 286.912, -90.8275, 1.09956, 0, 0, 0.522498, 0.85264, 0, 0, 1, 100, 2),
(399165, 148998, 109, -451.389, 272.707, -90.8275, 2.49582, 0, 0, 0.948323, 0.317306, 0, 0, 1, 100, 2),
(399168, 148998, 109, -456.843, 261.305, -90.8275, 0.715585, 0, 0, 0.350207, 0.936672, 0, 0, 1, 100, 2),
(399179, 148998, 109, -467.861, 257.761, -90.8275, 3.15906, 0, 0, -0.999962, 0.00873464, 0, 0, 1, 100, 2),
(399182, 148998, 109, -476.698, 260.68, -90.8275, 5.044, 0, 0, -0.580703, 0.814116, 0, 0, 1, 100, 2),
(399184, 148998, 109, -482.814, 271.267, -90.8275, 6.26573, 0, 0, -0.00872612, 0.999962, 0, 0, 1, 100, 2),
(399188, 148998, 109, -477.915, 285.49, -90.8275, 4.31097, 0, 0, -0.833885, 0.551938, 0, 0, 1, 100, 2);

-- Generic script for GameObject Evil God Summoning Circle (Entry: 148998 Guid: 399162)
DELETE FROM `generic_scripts` WHERE `id`=850205;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(850205, 0, 0, 89, 1, 0, 0, 0, 8440, 100, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Fight: Evil God Summoning Circle - Play Custom Anim 1'),
(850205, 0, 0, 10, 8437, 300000, 0, 0, 0, 0, 0, 0, 0, 850202, -1, 1, -467.63, 290.649, -90.7441, 1.22173, 0, 'Avatar of Hakkar Fight: Summon Creature Hakkari Minion');

-- Generic script for GameObject Evil God Summoning Circle (Entry: 148998 Guid: 399163)
DELETE FROM `generic_scripts` WHERE `id`=850206;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(850206, 0, 89, 1, 0, 0, 0, 8440, 100, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Fight: Evil God Summoning Circle - Play Custom Anim 1'),
(850206, 0, 10, 8437, 300000, 0, 0, 0, 0, 0, 0, 0, 850202, -1, 1, -456.909, 287.061, -90.7442, 0.977384, 0, 'Avatar of Hakkar Fight: Summon Creature Hakkari Minion');

-- Generic script for GameObject Evil God Summoning Circle (Entry: 148998 Guid: 399165)
DELETE FROM `generic_scripts` WHERE `id`=850207;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(850207, 0, 89, 1, 0, 0, 0, 8440, 100, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Fight: Evil God Summoning Circle - Play Custom Anim 1'),
(850207, 0, 10, 8437, 300000, 0, 0, 0, 0, 0, 0, 0, 850202, -1, 1, -451.506, 272.673, -90.7442, 3.07178, 0, 'Avatar of Hakkar Fight: Summon Creature Hakkari Minion');

-- Generic script for GameObject Evil God Summoning Circle (Entry: 148998 Guid: 399168)
DELETE FROM `generic_scripts` WHERE `id`=850208;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(850208, 0, 89, 1, 0, 0, 0, 8440, 100, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Fight: Evil God Summoning Circle - Play Custom Anim 1'),
(850208, 0, 10, 8437, 300000, 0, 0, 0, 0, 0, 0, 0, 850202, -1, 1, -456.858, 261.533, -90.7442, 0.628319, 0, 'Avatar of Hakkar Fight: Summon Creature Hakkari Minion');

-- Generic script for GameObject Evil God Summoning Circle (Entry: 148998 Guid: 399179)
DELETE FROM `generic_scripts` WHERE `id`=850209;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(850209, 0, 89, 1, 0, 0, 0, 8440, 100, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Fight: Evil God Summoning Circle - Play Custom Anim 1'),
(850209, 0, 10, 8437, 300000, 0, 0, 0, 0, 0, 0, 0, 850202, -1, 1, -467.922, 257.83, -90.7441, 3.1765, 0, 'Avatar of Hakkar Fight: Summon Creature Hakkari Minion');

-- Generic script for GameObject Evil God Summoning Circle (Entry: 148998 Guid: 399182)
DELETE FROM `generic_scripts` WHERE `id`=850210;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(850210, 0, 89, 1, 0, 0, 0, 8440, 100, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Fight: Evil God Summoning Circle - Play Custom Anim 1'),
(850210, 0, 10, 8437, 300000, 0, 0, 0, 0, 0, 0, 0, 850202, -1, 1, -476.667, 260.69, -90.7441, 2.61799, 0, 'Avatar of Hakkar Fight: Summon Creature Hakkari Minion');

-- Generic script for GameObject Evil God Summoning Circle (Entry: 148998 Guid: 399184)
DELETE FROM `generic_scripts` WHERE `id`=850211;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(850211, 0, 89, 1, 0, 0, 0, 8440, 100, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Fight: Evil God Summoning Circle - Play Custom Anim 1'),
(850211, 0, 10, 8437, 300000, 0, 0, 0, 0, 0, 0, 0, 850202, -1, 1, -482.947, 271.299, -90.7441, 2.79253, 0, 'Avatar of Hakkar Fight: Summon Creature Hakkari Minion');

-- Generic script for GameObject Evil God Summoning Circle (Entry: 148998 Guid: 399188)
DELETE FROM `generic_scripts` WHERE `id`=850212;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(850212, 0, 0, 89, 1, 0, 0, 0, 8440, 100, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Fight: Evil God Summoning Circle - Play Custom Anim 1'),
(850212, 0, 0, 10, 8437, 300000, 0, 0, 0, 0, 0, 0, 0, 850202, -1, 1, -477.82, 285.663, -90.7441, 3.76991, 0, 'Avatar of Hakkar Fight: Summon Creature Hakkari Minion');

-- Event Start Script
DELETE FROM `event_scripts` WHERE `id`=8502;
INSERT INTO `event_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(8502, 0, 0, 10, 8440, 1200000, 1, 100, 0, 0, 0, 0, 8, 850200, -1, 1, -466.868, 272.312, -90.7441, 3.52557, 8502, 'Avatar of Hakkar Fight: Summon Creature Shade of Hakkar');

-- Spawn Script for Shade of Hakkar
DELETE FROM `generic_scripts` WHERE `id`=850200;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(850200, 0, 0, 61, 8502, 1200, 0, 0, 0, 0, 0, 12, 0, 850201, 237, 850204, 0, 0, 0, 0, 0, 'Avatar of Hakkar Fight: Start Scripted Map Event'),
(850200, 0, 1, 37, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Fight: Set Data Avatar to In Progress'),
(850200, 0, 2, 82, 399188, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Fight: Respawn GameObject Evil God Summoning Circle'),
(850200, 0, 3, 82, 399184, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Fight: Respawn GameObject Evil God Summoning Circle'),
(850200, 0, 4, 82, 399182, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Fight: Respawn GameObject Evil God Summoning Circle'),
(850200, 0, 5, 82, 399179, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Fight: Respawn GameObject Evil God Summoning Circle'),
(850200, 0, 6, 82, 399168, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Fight: Respawn GameObject Evil God Summoning Circle'),
(850200, 0, 7, 82, 399165, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Fight: Respawn GameObject Evil God Summoning Circle'),
(850200, 0, 8, 82, 399163, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Fight: Respawn GameObject Evil God Summoning Circle'),
(850200, 0, 9, 82, 399162, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Fight: Respawn GameObject Evil God Summoning Circle'),
(850200, 1, 0, 80, 1, 0, 0, 0, 149432, 100, 11, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Fight: DOOR1 - Set Go State to GO_STATE_READY'),
(850200, 1, 0, 80, 1, 0, 0, 0, 149433, 100, 11, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Fight: DOOR2 - Set Go State to GO_STATE_READY'),
(850200, 1, 0, 4, 9, 16, 2, 0, 47561, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Fight: Eternal Flame 1 - Remove No Interact Flag'),
(850200, 1, 0, 4, 9, 16, 2, 0, 47562, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Fight: Eternal Flame 2 - Remove No Interact Flag'),
(850200, 1, 0, 4, 9, 16, 2, 0, 47563, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Fight: Eternal Flame 3 - Remove No Interact Flag'),
(850200, 1, 0, 4, 9, 16, 2, 0, 47564, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Fight: Eternal Flame 4 - Remove No Interact Flag'),
(850200, 4, 0, 39, 850212, 0, 0, 0, 399188, 0, 12, 2, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Fight: Spawn Mobs at Summoning Circle'),
(850200, 4, 0, 39, 850211, 0, 0, 0, 399184, 0, 12, 2, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Fight: Spawn Mobs at Summoning Circle'),
(850200, 4, 0, 39, 850210, 0, 0, 0, 399182, 0, 12, 2, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Fight: Spawn Mobs at Summoning Circle'),
(850200, 4, 0, 39, 850209, 0, 0, 0, 399179, 0, 12, 2, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Fight: Spawn Mobs at Summoning Circle'),
(850200, 4, 0, 39, 850208, 0, 0, 0, 399168, 0, 12, 2, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Fight: Spawn Mobs at Summoning Circle'),
(850200, 4, 0, 39, 850207, 0, 0, 0, 399165, 0, 12, 2, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Fight: Spawn Mobs at Summoning Circle'),
(850200, 4, 0, 39, 850206, 0, 0, 0, 399163, 0, 12, 2, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Fight: Spawn Mobs at Summoning Circle'),
(850200, 4, 0, 39, 850205, 0, 0, 0, 399162, 0, 12, 2, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Fight: Spawn Mobs at Summoning Circle');

-- Success Script for Scripted Map Event
DELETE FROM `generic_scripts` WHERE `id`=850201;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(850201, 0, 37, 8, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Fight Completed: Set Data Avatar to Done'),
(850201, 1, 41, 0, 0, 0, 0, 399162, 0, 12, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Completed: Evil God Summoning Circle - Despawn GameObject'),
(850201, 1, 41, 0, 0, 0, 0, 399163, 0, 12, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Completed: Evil God Summoning Circle - Despawn GameObject'),
(850201, 1, 41, 0, 0, 0, 0, 399165, 0, 12, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Completed: Evil God Summoning Circle - Despawn GameObject'),
(850201, 1, 41, 0, 0, 0, 0, 399168, 0, 12, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Completed: Evil God Summoning Circle - Despawn GameObject'),
(850201, 1, 41, 0, 0, 0, 0, 399179, 0, 12, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Completed: Evil God Summoning Circle - Despawn GameObject'),
(850201, 1, 41, 0, 0, 0, 0, 399182, 0, 12, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Completed: Evil God Summoning Circle - Despawn GameObject'),
(850201, 1, 41, 0, 0, 0, 0, 399184, 0, 12, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Completed: Evil God Summoning Circle - Despawn GameObject'),
(850201, 1, 41, 0, 0, 0, 0, 399188, 0, 12, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Completed: Evil God Summoning Circle - Despawn GameObject');

-- Fail Script for Scripted Map Event
DELETE FROM `generic_scripts` WHERE `id`=850204;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(850204, 0, 0, 41, 0, 0, 0, 0, 399162, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Failed: Evil God Summoning Circle - Despawn'),
(850204, 0, 0, 41, 0, 0, 0, 0, 399163, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Failed: Evil God Summoning Circle - Despawn'),
(850204, 0, 0, 41, 0, 0, 0, 0, 399165, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Failed: Evil God Summoning Circle - Despawn'),
(850204, 0, 0, 41, 0, 0, 0, 0, 399168, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Failed: Evil God Summoning Circle - Despawn'),
(850204, 0, 0, 41, 0, 0, 0, 0, 399179, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Failed: Evil God Summoning Circle - Despawn'),
(850204, 0, 0, 41, 0, 0, 0, 0, 399182, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Failed: Evil God Summoning Circle - Despawn'),
(850204, 0, 0, 41, 0, 0, 0, 0, 399184, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Failed: Evil God Summoning Circle - Despawn'),
(850204, 0, 0, 41, 0, 0, 0, 0, 399188, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Failed: Evil God Summoning Circle - Despawn'),
(850204, 0, 0, 80, 0, 0, 0, 0, 149432, 100, 11, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Failed: DOOR1 - Open Door'),
(850204, 0, 0, 80, 0, 0, 0, 0, 149433, 100, 11, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Failed: DOOR2 - Open Door'),
(850204, 0, 0, 37, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Failed: Set Data Avatar to Failed'),
(850204, 0, 0, 37, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Failed: Set Data Eternal Flame to 0'),
(850204, 0, 0, 41, 0, 0, 0, 0, 47561, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Failed: Despawn Eternal Flame 1'),
(850204, 0, 0, 41, 0, 0, 0, 0, 47562, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Failed: Despawn Eternal Flame 2'),
(850204, 0, 0, 41, 0, 0, 0, 0, 47563, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Failed: Despawn Eternal Flame 3'),
(850204, 0, 0, 41, 0, 0, 0, 0, 47564, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Failed: Despawn Eternal Flame 4'),
(850204, 1, 0, 82, 47561, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Failed: Spawn Eternal Flame 1'),
(850204, 1, 0, 82, 47562, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Failed: Spawn Eternal Flame 2'),
(850204, 1, 0, 82, 47563, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Failed: Spawn Eternal Flame 3'),
(850204, 1, 0, 82, 47564, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Failed: Spawn Eternal Flame 4'),
(850204, 1, 1, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Failed: Shade of Hakkar - Despawn');

-- Summon script for creatures.
DELETE FROM `generic_scripts` WHERE `id`=850202;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(850202, 0, 0, 63, 8502, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 850203, 0, 0, 0, 0, 0, 'Avatar of Hakkar Fight: Add Creature to Scripted Map Event');

-- Script to despawn creatures on event ending.
DELETE FROM `generic_scripts` WHERE `id`=850203;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(850203, 0, 0, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Fight: Despawn Creature');

-- First Brazier Script
DELETE FROM `generic_scripts` WHERE `id`=850213;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(850213, 0, 16, 5867, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar First Brazier: Shade of Hakkar - Play Sound A_Avatar Of Hakkar Brazier01'),
(850213, 0, 15, 12639, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar First Brazier: Shade of Hakkar - Cast Spell Summon Hakkar'),
(850213, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4543, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar First Brazier: Shade of Hakkar - Say Text'),
(850213, 46, 89, 1, 0, 0, 0, 399168, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar First Brazier: Evil God Summoning Circle - Play Custom Anim 1'),
(850213, 46, 10, 8437, 300000, 0, 0, 0, 0, 0, 0, 0, 850202, -1, 1, -456.858, 261.533, -90.7442, 0.628319, 0, 'Avatar of Hakkar First Brazier: Summon Creature Hakkari Minion'),
(850213, 51, 89, 1, 0, 0, 0, 399165, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar First Brazier: Evil God Summoning Circle - Play Custom Anim 1'),
(850213, 52, 10, 8437, 300000, 0, 0, 0, 0, 0, 0, 0, 850202, -1, 1, -451.506, 272.673, -90.7442, 3.07178, 0, 'Avatar of Hakkar First Brazier: Summon Creature Hakkari Minion'),
(850213, 57, 89, 1, 0, 0, 0, 399163, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar First Brazier: Evil God Summoning Circle - Play Custom Anim 1'),
(850213, 57, 10, 8437, 300000, 0, 0, 0, 0, 0, 0, 0, 850202, -1, 1, -456.909, 287.061, -90.7442, 0.977384, 0, 'Avatar of Hakkar First Brazier: Summon Creature Hakkari Minion'),
(850213, 62, 89, 1, 0, 0, 0, 399184, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar First Brazier: Evil God Summoning Circle - Play Custom Anim 1'),
(850213, 62, 10, 8437, 300000, 0, 0, 0, 0, 0, 0, 0, 850202, -1, 1, -482.947, 271.299, -90.7441, 2.79253, 0, 'Avatar of Hakkar First Brazier: Summon Creature Hakkari Minion'),
(850213, 67, 89, 1, 0, 0, 0, 399188, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar First Brazier: Evil God Summoning Circle - Play Custom Anim 1'),
(850213, 67, 89, 1, 0, 0, 0, 399182, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar First Brazier: Evil God Summoning Circle - Play Custom Anim 1'),
(850213, 67, 89, 1, 0, 0, 0, 399179, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar First Brazier: Evil God Summoning Circle - Play Custom Anim 1'),
(850213, 68, 10, 8437, 300000, 0, 0, 0, 0, 0, 0, 0, 850202, -1, 1, -467.922, 257.83, -90.7441, 3.1765, 0, 'Avatar of Hakkar First Brazier: Summon Creature Hakkari Minion'),
(850213, 68, 10, 8437, 300000, 0, 0, 0, 0, 0, 0, 0, 850202, -1, 1, -477.82, 285.663, -90.7441, 3.76991, 0, 'Avatar of Hakkar First Brazier: Summon Creature Hakkari Minion'),
(850213, 68, 10, 8437, 300000, 0, 0, 0, 0, 0, 0, 0, 850202, -1, 1, -476.667, 260.69, -90.7441, 2.61799, 0, 'Avatar of Hakkar First Brazier: Summon Creature Hakkari Minion'),
(850213, 72, 89, 1, 0, 0, 0, 399162, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar First Brazier: Evil God Summoning Circle - Play Custom Anim 1'),
(850213, 73, 10, 8437, 300000, 0, 0, 0, 0, 0, 0, 0, 850202, -1, 1, -467.63, 290.649, -90.7441, 1.22173, 0, 'Avatar of Hakkar First Brazier: Summon Creature Hakkari Minion');

-- Second Brazier Script
DELETE FROM `generic_scripts` WHERE `id`=850215;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(850215, 0, 89, 1, 0, 0, 0, 399168, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Second Brazier: Evil God Summoning Circle - Play Custom Anim 1'),
(850215, 0, 10, 8437, 300000, 0, 0, 0, 0, 0, 0, 0, 850202, -1, 1, -456.858, 261.533, -90.7442, 0.628319, 0, 'Avatar of Hakkar Second Brazier: Summon Creature Hakkari Minion'),
(850215, 1, 16, 5868, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Second Brazier: Shade of Hakkar - Play Sound A_Avatar Of Hakkar Brazier02'),
(850215, 1, 15, 12639, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Second Brazier: Shade of Hakkar - Cast Spell Summon Hakkar'),
(850215, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6252, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Second Brazier: Shade of Hakkar - Say Text'),
(850215, 10, 89, 1, 0, 0, 0, 399165, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Second Brazier: Evil God Summoning Circle - Play Custom Anim 1'),
(850215, 10, 10, 8437, 300000, 0, 0, 0, 0, 0, 0, 0, 850202, -1, 1, -451.506, 272.673, -90.7442, 3.07178, 0, 'Avatar of Hakkar Second Brazier: Summon Creature Hakkari Minion'),
(850215, 26, 89, 1, 0, 0, 0, 399182, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Second Brazier: Evil God Summoning Circle - Play Custom Anim 1'),
(850215, 26, 10, 8437, 300000, 0, 0, 0, 0, 0, 0, 0, 850202, -1, 1, -476.667, 260.69, -90.7441, 2.61799, 0, 'Avatar of Hakkar Second Brazier: Summon Creature Hakkari Minion'),
(850215, 31, 89, 1, 0, 0, 0, 399179, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Second Brazier: Evil God Summoning Circle - Play Custom Anim 1'),
(850215, 31, 10, 8437, 300000, 0, 0, 0, 0, 0, 0, 0, 850202, -1, 1, -467.922, 257.83, -90.7441, 3.1765, 0, 'Avatar of Hakkar Second Brazier: Summon Creature Hakkari Minion'),
(850215, 36, 89, 1, 0, 0, 0, 399188, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Second Brazier: Evil God Summoning Circle - Play Custom Anim 1'),
(850215, 36, 89, 1, 0, 0, 0, 399163, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Second Brazier: Evil God Summoning Circle - Play Custom Anim 1'),
(850215, 36, 89, 1, 0, 0, 0, 399184, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Second Brazier: Evil God Summoning Circle - Play Custom Anim 1'),
(850215, 37, 10, 8437, 300000, 0, 0, 0, 0, 0, 0, 0, 850202, -1, 1, -477.82, 285.663, -90.7441, 3.76991, 0, 'Avatar of Hakkar Second Brazier: Summon Creature Hakkari Minion'),
(850215, 37, 10, 8437, 300000, 0, 0, 0, 0, 0, 0, 0, 850202, -1, 1, -482.947, 271.299, -90.7441, 2.79253, 0, 'Avatar of Hakkar Second Brazier: Summon Creature Hakkari Minion'),
(850215, 37, 10, 8437, 300000, 0, 0, 0, 0, 0, 0, 0, 850202, -1, 1, -456.909, 287.061, -90.7442, 0.977384, 0, 'Avatar of Hakkar Second Brazier: Summon Creature Hakkari Minion'),
(850215, 52, 89, 1, 0, 0, 0, 399162, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Second Brazier: Evil God Summoning Circle - Play Custom Anim 1'),
(850215, 53, 10, 8437, 300000, 0, 0, 0, 0, 0, 0, 0, 850202, -1, 1, -467.63, 290.649, -90.7441, 1.22173, 0, 'Avatar of Hakkar Second Brazier: Summon Creature Hakkari Minion'),
(850215, 63, 89, 1, 0, 0, 0, 399168, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Second Brazier: Evil God Summoning Circle - Play Custom Anim 1'),
(850215, 63, 10, 8437, 300000, 0, 0, 0, 0, 0, 0, 0, 850202, -1, 1, -456.858, 261.533, -90.7442, 0.628319, 0, 'Avatar of Hakkar Second Brazier: Summon Creature Hakkari Minion'),
(850215, 73, 89, 1, 0, 0, 0, 399165, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Second Brazier: Evil God Summoning Circle - Play Custom Anim 1'),
(850215, 74, 10, 8437, 300000, 0, 0, 0, 0, 0, 0, 0, 850202, -1, 1, -451.506, 272.673, -90.7442, 3.07178, 0, 'Avatar of Hakkar Second Brazier: Summon Creature Hakkari Minion');

-- Third Brazier Script
DELETE FROM `generic_scripts` WHERE `id`=850217;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(850217, 0, 16, 5869, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Third Brazier: Shade of Hakkar - Play Sound A_Avatar Of Hakkar Brazier03'),
(850217, 0, 15, 12639, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Third Brazier: Shade of Hakkar - Cast Spell Summon Hakkar'),
(850217, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6253, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Third Brazier: Shade of Hakkar - Say Text'),
(850217, 7, 89, 1, 0, 0, 0, 399182, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Third Brazier: Evil God Summoning Circle - Play Custom Anim 1'),
(850217, 7, 10, 8437, 300000, 0, 0, 0, 0, 0, 0, 0, 850202, -1, 1, -476.667, 260.69, -90.7441, 2.61799, 0, 'Avatar of Hakkar Third Brazier: Summon Creature Hakkari Minion'),
(850217, 12, 89, 1, 0, 0, 0, 399179, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Third Brazier: Evil God Summoning Circle - Play Custom Anim 1'),
(850217, 12, 10, 8437, 300000, 0, 0, 0, 0, 0, 0, 0, 850202, -1, 1, -467.922, 257.83, -90.7441, 3.1765, 0, 'Avatar of Hakkar Third Brazier: Summon Creature Hakkari Minion'),
(850217, 17, 89, 1, 0, 0, 0, 399184, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Third Brazier: Evil God Summoning Circle - Play Custom Anim 1'),
(850217, 17, 89, 1, 0, 0, 0, 399163, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Third Brazier: Evil God Summoning Circle - Play Custom Anim 1'),
(850217, 18, 10, 8437, 300000, 0, 0, 0, 0, 0, 0, 0, 850202, -1, 1, -482.947, 271.299, -90.7441, 2.79253, 0, 'Avatar of Hakkar Third Brazier: Summon Creature Hakkari Minion'),
(850217, 18, 10, 8437, 300000, 0, 0, 0, 0, 0, 0, 0, 850202, -1, 1, -456.909, 287.061, -90.7442, 0.977384, 0, 'Avatar of Hakkar Third Brazier: Summon Creature Hakkari Minion'),
(850217, 23, 89, 1, 0, 0, 0, 399162, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Third Brazier: Evil God Summoning Circle - Play Custom Anim 1'),
(850217, 23, 10, 8437, 300000, 0, 0, 0, 0, 0, 0, 0, 850202, -1, 1, -467.63, 290.649, -90.7441, 1.22173, 0, 'Avatar of Hakkar Third Brazier: Summon Creature Hakkari Minion'),
(850217, 28, 89, 1, 0, 0, 0, 399188, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Third Brazier: Evil God Summoning Circle - Play Custom Anim 1'),
(850217, 28, 10, 8437, 300000, 0, 0, 0, 0, 0, 0, 0, 850202, -1, 1, -477.82, 285.663, -90.7441, 3.76991, 0, 'Avatar of Hakkar Third Brazier: Summon Creature Hakkari Minion'),
(850217, 49, 89, 1, 0, 0, 0, 399168, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Third Brazier: Evil God Summoning Circle - Play Custom Anim 1'),
(850217, 49, 10, 8437, 300000, 0, 0, 0, 0, 0, 0, 0, 850202, -1, 1, -456.858, 261.533, -90.7442, 0.628319, 0, 'Avatar of Hakkar Third Brazier: Summon Creature Hakkari Minion'),
(850217, 54, 89, 1, 0, 0, 0, 399165, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Third Brazier: Evil God Summoning Circle - Play Custom Anim 1'),
(850217, 55, 10, 8437, 300000, 0, 0, 0, 0, 0, 0, 0, 850202, -1, 1, -451.506, 272.673, -90.7442, 3.07178, 0, 'Avatar of Hakkar Third Brazier: Summon Creature Hakkari Minion'),
(850217, 65, 89, 1, 0, 0, 0, 399182, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Third Brazier: Evil God Summoning Circle - Play Custom Anim 1'),
(850217, 65, 10, 8437, 300000, 0, 0, 0, 0, 0, 0, 0, 850202, -1, 1, -476.667, 260.69, -90.7441, 2.61799, 0, 'Avatar of Hakkar Third Brazier: Summon Creature Hakkari Minion'),
(850217, 70, 89, 1, 0, 0, 0, 399179, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Third Brazier: Evil God Summoning Circle - Play Custom Anim 1'),
(850217, 70, 10, 8437, 300000, 0, 0, 0, 0, 0, 0, 0, 850202, -1, 1, -467.922, 257.83, -90.7441, 3.1765, 0, 'Avatar of Hakkar Third Brazier: Summon Creature Hakkari Minion'),
(850217, 75, 89, 1, 0, 0, 0, 399184, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Third Brazier: Evil God Summoning Circle - Play Custom Anim 1'),
(850217, 76, 10, 8437, 300000, 0, 0, 0, 0, 0, 0, 0, 850202, -1, 1, -482.947, 271.299, -90.7441, 2.79253, 0, 'Avatar of Hakkar Third Brazier: Summon Creature Hakkari Minion');

-- Fourth Brazier Script
DELETE FROM `generic_scripts` WHERE `id`=850219;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(850219, 0, 0, 16, 5870, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Fourth Brazier: Shade of Hakkar - Play Sound A_Avatar Of Hakkar Brazier04'),
(850219, 0, 1, 15, 12639, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Fourth Brazier: Shade of Hakkar - Cast Spell Summon Hakkar'),
(850219, 0, 2, 27, 8443, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Fourth Brazier: Shade of Hakkar - Update Entry to Avatar of Hakkar'),
(850219, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4545, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Fourth Brazier: Shade of Hakkar - Say Text'),
(850219, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6254, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Fourth Brazier: Shade of Hakkar - Say Text'),
(850219, 1, 0, 15, 12948, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Fourth Brazier: Shade of Hakkar - Cast Spell Avatar of Hakkar is summoned'),
(850219, 1, 1, 62, 8502, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Fourth Brazier: Complete Scripted Map Event'),
(850219, 3, 0, 16, 5871, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Fourth Brazier: Shade of Hakkar - Play Sound A_Avatar Of Hakkar Aggro01'),
(850219, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4546, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Fourth Brazier: Shade of Hakkar - Say Text'),
(850219, 5, 0, 20, 1, 1, 0, 1, 0, 0, 0, 4, 0, 0, 0, 0, 45, 0, 0, 0, 117, 'Avatar of Hakkar Fourth Brazier: Shade of Hakkar - Move Random'),
(850219, 6, 0, 4, 46, 33554688, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avatar of Hakkar Fourth Brazier: Shade of Hakkar - Remove Unit Flags');

-- Assign condition to check if event is still running on long scripts with delays.
UPDATE `generic_scripts` SET `condition_id`=8508 WHERE `id` IN (850213, 850215, 850217);

-- Events list for Hakkari Bloodkeeper
DELETE FROM `creature_ai_scripts` WHERE `id` IN (843801, 843802);
DELETE FROM `creature_ai_events` WHERE `creature_id`=8438;
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (84380, 'Sunken Temple - Hakkari Bloodkeeper', 11671, 100, 4, 0, 0, 32, 0, 4, 0, 4, 0, 12471, 100, 1, 0, 0, 8, 0, 3, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `ai_name`='', `spell_list_id`=84380, `movement_type`=1, `spawn_spell_id`=7741 WHERE `entry`=8438;

-- Events list for Nightmare Suppressor
DELETE FROM `creature_ai_events` WHERE `creature_id`=8497;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(849701, 8497, 0, 29, 0, 100, 0, 8, 1, 0, 0, 849701, 0, 0, 'Nightmare Suppressor - Cast Spell Suppression on Reaching Point'),
(849702, 8497, 8512, 6, 0, 100, 0, 0, 0, 0, 0, 849702, 0, 0, 'Nightmare Suppressor - Reset Event Data on Death');
DELETE FROM `creature_ai_scripts` WHERE `id`=849701;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(849701, 0, 0, 15, 12623, 0, 0, 0, 8440, 30, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Nightmare Suppressor - Cast Spell Suppression'),
(849701, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4547, 0, 0, 0, 0, 0, 0, 0, 0, 'Nightmare Suppressor - Say Text');
DELETE FROM `creature_ai_scripts` WHERE `id`=849702;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(849702, 0, 0, 65, 8502, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Nightmare Suppressor - Set Event Data to 0');
UPDATE `creature_template` SET `ai_name`='EventAI', `movement_type`=0 WHERE `entry`=8497;

-- Nightmare Suppressor 1 Spawn Script
DELETE FROM `generic_scripts` WHERE `id`=850214;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(850214, 0, 0, 63, 8502, 0, 0, 0, 0, 0, 0, 0, 0, 850203, 0, 850203, 0, 0, 0, 0, 0, 'Nightmare Suppressor - Add Creature to Scripted Map Event'),
(850214, 0, 0, 65, 8502, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Nightmare Suppressor - Set Event Data to 1'),
(850214, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4529, 4530, 4531, 4532, 0, 0, 0, 0, 0, 'Nightmare Suppressor - Say Text'),
(850214, 2, 0, 3, 0, 0, 3, 2, 0, 0, 0, 0, 1, 0, 0, 0, -479.385, 266.634, -90.5644, 0, 0, 'Nightmare Suppressor - Move');

-- Nightmare Suppressor 2 Spawn Script
DELETE FROM `generic_scripts` WHERE `id`=850216;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(850216, 0, 0, 63, 8502, 0, 0, 0, 0, 0, 0, 0, 0, 850203, 0, 850203, 0, 0, 0, 0, 0, 'Nightmare Suppressor - Add Creature to Scripted Map Event'),
(850216, 0, 0, 65, 8502, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Nightmare Suppressor - Set Event Data to 2'),
(850216, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4529, 4530, 4531, 4532, 0, 0, 0, 0, 0, 'Nightmare Suppressor - Say Text'),
(850216, 2, 0, 3, 0, 0, 3, 2, 0, 0, 0, 0, 1, 0, 0, 0, -454.664, 267.629, -90.7051, 0, 0, 'Nightmare Suppressor - Move');

-- Nightmare Suppressor 3 Spawn Script
DELETE FROM `generic_scripts` WHERE `id`=850218;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(850218, 0, 0, 63, 8502, 0, 0, 0, 0, 0, 0, 0, 0, 850203, 0, 850203, 0, 0, 0, 0, 0, 'Nightmare Suppressor - Add Creature to Scripted Map Event'),
(850218, 0, 0, 65, 8502, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Nightmare Suppressor - Set Event Data to 3'),
(850218, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4529, 4530, 4531, 4532, 0, 0, 0, 0, 0, 'Nightmare Suppressor - Say Text'),
(850218, 2, 0, 3, 0, 0, 3, 2, 0, 0, 0, 0, 1, 0, 0, 0, -457.903, 285.8, -90.6785, 0, 0, 'Nightmare Suppressor - Move');

-- Events list for Shade of Hakkar
DELETE FROM `creature_ai_events` WHERE `creature_id`=8440;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (844001, 8440, 0, 1, 7, 100, 1, 3000, 3000, 3000, 3000, 844001, 0, 0, 'Shade of Hakkar - Fail Event on Hit By Suppression 3 Times');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (844002, 8440, 0, 6, 0, 100, 0, 0, 0, 0, 0, 844002, 0, 0, 'Shade of Hakkar - Open Doors on Death');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (844003, 8440, 0, 7, 0, 100, 0, 0, 0, 0, 0, 844002, 0, 0, 'Shade of Hakkar - Open Doors on Evade');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (844004, 8440, 8440, 1, 0, 100, 1, 60000, 60000, 60000, 110000, 844004, 0, 0, 'Shade of Hakkar - Summon Nightmare Suppressor OOC');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (844005, 8440, 8440, 1, 0, 100, 1, 4000, 5000, 60000, 110000, 844005, 0, 0, 'Shade of Hakkar - Summon Hakkari Bloodkeeper OOC');
DELETE FROM `creature_ai_scripts` WHERE `id`=844001;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(844001, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4544, 0, 0, 0, 0, 0, 0, 0, 0, 'Shade of Hakkar - Say Text'),
(844001, 0, 0, 62, 8502, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shade of Hakkar - Fail Scripted Map Event');
DELETE FROM `creature_ai_scripts` WHERE `id`=844002;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(844002, 0, 0, 80, 0, 0, 0, 0, 149432, 100, 11, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shade of Hakkar - Open Door 1'),
(844002, 0, 0, 80, 0, 0, 0, 0, 149433, 100, 11, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shade of Hakkar - Open Door 2');
DELETE FROM `creature_ai_scripts` WHERE `id`=844004;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(844004, 0, 0, 10, 8497, 300000, 0, 0, 0, 0, 0, 0, 0, 850214, -1, 1, -511.953, 277.613, -90.7445, 6.24828, 8509, 'Shade of Hakkar - Summon Creature Nightmare Suppressor 1'),
(844004, 0, 0, 10, 8497, 300000, 0, 0, 0, 0, 0, 0, 0, 850216, -1, 1, -420.937, 279.458, -90.7446, 3.1765, 8510, 'Shade of Hakkar - Summon Creature Nightmare Suppressor 2'),
(844004, 0, 0, 10, 8497, 300000, 0, 0, 0, 0, 0, 0, 0, 850218, -1, 1, -419.751, 286.416, -90.7447, 3.07178, 8511, 'Shade of Hakkar - Summon Creature Nightmare Suppressor 3');
DELETE FROM `creature_ai_scripts` WHERE `id`=844005;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(844005, 0, 0, 10, 8438, 300000, 4, 100, 148998, 50, 27, 6, 8, 0, -1, 1, 0, 0, 0, 0, 0, 'Shade of Hakkar - Summon Hakkari Bloodkeeper on Random Summoning Circle');
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (84430, 'Sunken Temple - Avatar of Hakkar', 6607, 100, 1, 0, 0, 32, 9, 18, 9, 18, 0, 12888, 100, 1, 0, 0, 32, 9, 10, 9, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `ai_name`='EventAI', `script_name`='', `spell_list_id`=84430, `auras`='9617', `unit_flags`=33554752 WHERE `entry`=8440;

-- Events list for Avatar of Hakkar
DELETE FROM `creature_ai_scripts` WHERE `id` IN (844301, 844302, 844303);
DELETE FROM `creature_ai_events` WHERE `creature_id`=8443;
UPDATE `creature_template` SET `ai_name`='', `spell_list_id`=84430, `unit_flags`=33554752 WHERE `entry`=8443;

-- Remove hardcoded script from Eternal Flame.
UPDATE `gameobject_template` SET `flags`=16, `script_name`='' WHERE `entry` IN (148418, 148419, 148420, 148421);

-- Type: Yell Text: No!  We cannot allow you to summon Hakkar!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=4529;
-- Type: Yell Text: You must not summon our god!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=4530;
-- Type: Yell Text: No!  You must not do this!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=4531;
-- Type: Yell Text: Stop!  Infidels!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=4532;
-- Type: Yell Text: I DRAW CLOSER TO THIS WORLD!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=4543;
-- Type: Yell Text: NOOOO!!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=4544;
-- Type: Yell Text: I AM HERE!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=4545;
-- Type: Yell Text: DIE, MORTALS!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=4546;
-- Type: Yell Text: I TASTE THE BLOOD OF LIFE!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=6252;
-- Type: Yell Text: I AM NEAR!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=6253;
-- Type: Yell Text: HAKKAR LIVES!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=6254;

-- Remove texts from custom table.
DELETE FROM `script_texts` WHERE `entry` IN (-1109006, -1109007, -1109008, -1109009, -1109010);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
