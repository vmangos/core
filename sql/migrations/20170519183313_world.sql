INSERT INTO `migrations` VALUES ('20170519183313'); 

-- Forlorn Spirit should talk on aggro not spawn.
UPDATE `creature_ai_scripts` SET `event_type`=4 WHERE `id`=204401;

-- Old script was spawning 2 spirits and they weren't attacking.
DELETE FROM `quest_end_scripts` WHERE `id`=67;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (67, 0, 10, 2044, 300000, 0, 0, 0, 0, 0, 0, 0, -10953.3, 1568.47, 46.978, 3.392, 'Summon Forlorn Spirit');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (67, 3, 26, 0, 2044, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Forlorn Spirit Attack');

-- Old script was spawning the spirit inside a wall.
DELETE FROM `quest_start_scripts` WHERE `id`=74;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (74, 2, 10, 2044, 300000, 0, 0, 0, 0, 0, 0, 0, -8842.9, 984.95, 98.704, 5.712, 'Summon Forlorn Spirit');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (74, 4, 26, 0, 2044, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Forlorn Spirit Attack');

-- There already is a core script for this.
DELETE FROM `event_scripts` WHERE `id`=264;
UPDATE `gameobject_template` SET `data6`=0 WHERE `entry`=1562;