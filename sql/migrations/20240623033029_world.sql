DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240623033029');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20240623033029');
-- Add your query below.


-- Updated Updated Edge of Madness tablets to use the correct gameobject entries
DELETE FROM `gameobject_template` WHERE `entry`=987654;
DELETE FROM `gameobject_template` WHERE `entry`=987655;
DELETE FROM `gameobject_template` WHERE `entry`=987656;
DELETE FROM `gameobject_template` WHERE `entry`=987657;
DELETE FROM `gameobject` WHERE `guid`=396401;
DELETE FROM `gameobject` WHERE `guid`=396402;
DELETE FROM `gameobject` WHERE `guid`=396403;
DELETE FROM `gameobject` WHERE `guid`=396404;
DELETE FROM `game_event_gameobject` WHERE `guid`=396401 AND `event`=29;
DELETE FROM `game_event_gameobject` WHERE `guid`=396402 AND `event`=30;
DELETE FROM `game_event_gameobject` WHERE `guid`=396403 AND `event`=31;
DELETE FROM `game_event_gameobject` WHERE `guid`=396404 AND `event`=32;
-- Delete the correct objects from 'game_event_gameobject' as they serve no purpose being stored there
DELETE FROM `game_event_gameobject` WHERE `guid`=28664 AND `event`=29;
DELETE FROM `game_event_gameobject` WHERE `guid`=28664 AND `event`=30;
DELETE FROM `game_event_gameobject` WHERE `guid`=28664 AND `event`=31;
DELETE FROM `game_event_gameobject` WHERE `guid`=28661 AND `event`=29;
DELETE FROM `game_event_gameobject` WHERE `guid`=28661 AND `event`=31;
DELETE FROM `game_event_gameobject` WHERE `guid`=28661 AND `event`=32;
DELETE FROM `game_event_gameobject` WHERE `guid`=28660 AND `event`=30;
DELETE FROM `game_event_gameobject` WHERE `guid`=28660 AND `event`=31;
DELETE FROM `game_event_gameobject` WHERE `guid`=28660 AND `event`=32;
DELETE FROM `game_event_gameobject` WHERE `guid`=28659 AND `event`=29;
DELETE FROM `game_event_gameobject` WHERE `guid`=28659 AND `event`=30;
DELETE FROM `game_event_gameobject` WHERE `guid`=28659 AND `event`=32;
-- Should use different pageMaterial according to sniff
UPDATE `gameobject_template` SET `data2`=1 WHERE `entry`=180358;
UPDATE `gameobject_template` SET `data2`=1 WHERE `entry`=180364;
UPDATE `gameobject_template` SET `data2`=1 WHERE `entry`=180365;
UPDATE `gameobject_template` SET `data2`=1 WHERE `entry`=180393;
-- Update position
UPDATE `gameobject` SET `orientation`=4.69494 WHERE `guid`=28661;
UPDATE `gameobject` SET `rotation2`=-1 WHERE `guid`=28659;
UPDATE `gameobject` SET `orientation`=6.25701 WHERE `guid`=28664;

-- Update position of Troll Hero Fire Portal
UPDATE `gameobject` SET `position_x`=-11900.6, `position_y`=-1905.15, `position_z`=65.3134, `orientation`=3.14159, `rotation2`=-1, `rotation3`=0 WHERE `guid`=396315;
-- Spawn missing Troll Hero Air Portal
DELETE FROM `gameobject` WHERE `id`=180253;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES (396316, 180253, 309, -11900.6, -1905.16, 65.3128, 3.78737, 0, 0, -0.948323, 0.317306, -17, -17, 100, 1, 0, 0, 5, 10);
-- Spawn missing Troll Hero Portal Sound
DELETE FROM `gameobject` WHERE `id`=180385;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES (396314, 180385, 309, -11900.4, -1905.5, 65.3169, 0.837757, 0, 0, 0.406736, 0.913546, -17, -17, 100, 1, 0, 0, 5, 10);

-- No random movement for Edge of Madness bosses
UPDATE `creature_template` SET `movement_type`=0 WHERE `entry`=15082;
UPDATE `creature_template` SET `movement_type`=0 WHERE `entry`=15083;
UPDATE `creature_template` SET `movement_type`=0 WHERE `entry`=15084;
UPDATE `creature_template` SET `movement_type`=0 WHERE `entry`=15085;

-- Delete custom Troll Hero Lightning.
DELETE FROM `gameobject` WHERE `guid`=396317;
DELETE FROM `gameobject` WHERE `guid`=396318;
DELETE FROM `gameobject` WHERE `guid`=396320;
DELETE FROM `gameobject` WHERE `guid`=396321;
DELETE FROM `gameobject` WHERE `guid`=396322;
DELETE FROM `gameobject` WHERE `guid`=396323;
DELETE FROM `gameobject` WHERE `guid`=396324;
DELETE FROM `gameobject` WHERE `guid`=396325;
DELETE FROM `gameobject` WHERE `guid`=396326;

-- Add missing Air Portal to all scripts and fix timings
DELETE FROM `gameobject_scripts` WHERE `id`=21608;
INSERT INTO `gameobject_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(21608, 3, 0, 39, 180327, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Brazier of Madness - Activate Troll Hero Lightning Script'),
(21608, 9, 0, 9, 396316, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brazier of Madness - Respawn Air Portal'),
(21608, 9, 0, 9, 396314, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brazier of Madness - Respawn Portal Sound'),
(21608, 9, 0, 9, 396315, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brazier of Madness - Respawn Fire Portal'),
(21608, 19, 0, 10, 15083, 900000, 0, 0, 0, 0, 0, 0, 0, 180328, -1, 1, -11901.3, -1906.52, 65.36, 0.9, 0, 'Brazier of Madness - Summon Creature Hazza\'rah');
DELETE FROM `gameobject_scripts` WHERE `id`=21609;
INSERT INTO `gameobject_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(21609, 3, 0, 39, 180327, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Brazier of Madness - Activate Troll Hero Lightning Script'),
(21609, 9, 0, 9, 396316, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brazier of Madness - Respawn Air Portal'),
(21609, 9, 0, 9, 396314, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brazier of Madness - Respawn Portal Sound'),
(21609, 9, 0, 9, 396315, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brazier of Madness - Respawn Fire Portal'),
(21609, 19, 0, 10, 15084, 900000, 0, 0, 0, 0, 0, 0, 0, 180328, -1, 1, -11901.3, -1906.52, 65.36, 0.9, 0, 'Brazier of Madness - Summon Creature Renataki');
DELETE FROM `gameobject_scripts` WHERE `id`=21610;
INSERT INTO `gameobject_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(21610, 3, 0, 39, 180327, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Brazier of Madness - Activate Troll Hero Lightning Script'),
(21610, 9, 0, 9, 396316, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brazier of Madness - Respawn Air Portal'),
(21610, 9, 0, 9, 396314, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brazier of Madness - Respawn Portal Sound'),
(21610, 9, 0, 9, 396315, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brazier of Madness - Respawn Fire Portal'),
(21610, 19, 0, 10, 15085, 900000, 0, 0, 0, 0, 0, 0, 0, 180328, -1, 1, -11901.3, -1906.52, 65.36, 0.9, 0, 'Brazier of Madness - Summon Creature Wushoolay');
DELETE FROM `gameobject_scripts` WHERE `id`=28704;
INSERT INTO `gameobject_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(28704, 3, 0, 39, 180327, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Brazier of Madness - Activate Troll Hero Lightning Script'),
(28704, 9, 0, 9, 396316, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brazier of Madness - Respawn Air Portal'),
(28704, 9, 0, 9, 396314, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brazier of Madness - Respawn Portal Sound'),
(28704, 9, 0, 9, 396315, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brazier of Madness - Respawn Fire Portal'),
(28704, 5, 0, 9, 396315, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brazier of Madness - Respawn Portal'),
(28704, 19, 0, 10, 15082, 900000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, -11901.3, -1906.52, 65.36, 0.9, 0, 'Brazier of Madness - Summon Creature Gri\'lek');

-- Remake the lightning script, previous was custom
DELETE FROM `generic_scripts` WHERE `id`=180327;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(180327, 0, 0, 89, 0, 0, 0, 0, 28670, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Edge of Madness - CustomAnim Lightning Wave1'),
(180327, 0, 0, 89, 0, 0, 0, 0, 28672, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Edge of Madness - CustomAnim Lightning Wave1'),
(180327, 0, 0, 89, 0, 0, 0, 0, 28671, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Edge of Madness - CustomAnim Lightning Wave1'),
(180327, 3, 1, 89, 0, 0, 0, 0, 28672, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Edge of Madness - CustomAnim Lightning Wave2'),
(180327, 5, 2, 89, 0, 0, 0, 0, 28671, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Edge of Madness - CustomAnim Lightning Wave3'),
(180327, 5, 2, 89, 0, 0, 0, 0, 28670, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Edge of Madness - CustomAnim Lightning Wave3'),
(180327, 7, 3, 89, 0, 0, 0, 0, 28672, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Edge of Madness - CustomAnim Lightning Wave4'),
(180327, 9, 4, 89, 0, 0, 0, 0, 28670, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Edge of Madness - CustomAnim Lightning Wave5'),
(180327, 11, 5, 89, 0, 0, 0, 0, 28671, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Edge of Madness - CustomAnim Lightning Wave6'),
(180327, 11, 5, 89, 0, 0, 0, 0, 28672, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Edge of Madness - CustomAnim Lightning Wave6'),
(180327, 13, 6, 89, 0, 0, 0, 0, 28670, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Edge of Madness - CustomAnim Lightning Wave7'),
(180327, 16, 7, 89, 1, 0, 0, 0, 28671, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Edge of Madness - CustomAnim Lightning Wave8'),
(180327, 16, 7, 89, 1, 0, 0, 0, 28672, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Edge of Madness - CustomAnim Lightning Wave8'),
(180327, 16, 7, 89, 1, 0, 0, 0, 28670, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Edge of Madness - CustomAnim Lightning Wave8'),
(180327, 18, 8, 89, 2, 0, 0, 0, 28671, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Edge of Madness - CustomAnim Lightning Wave9'),
(180327, 18, 8, 89, 2, 0, 0, 0, 28670, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Edge of Madness - CustomAnim Lightning Wave9'),
(180327, 20, 9, 89, 2, 0, 0, 0, 28672, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Edge of Madness - CustomAnim Lightning Wave10'),
(180327, 22, 10, 89, 2, 0, 0, 0, 28671, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Edge of Madness - CustomAnim Lightning Wave11'),
(180327, 22, 10, 89, 2, 0, 0, 0, 28670, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Edge of Madness - CustomAnim Lightning Wave11'),
(180327, 27, 11, 89, 0, 0, 0, 0, 28670, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Edge of Madness - CustomAnim Lightning Wave12'),
(180327, 27, 11, 89, 0, 0, 0, 0, 28672, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Edge of Madness - CustomAnim Lightning Wave12'),
(180327, 56, 12, 89, 0, 0, 0, 0, 28671, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Edge of Madness - CustomAnim Lightning Wave13');

-- Add roar emote on spawn for the bosses that needs it
DELETE FROM `generic_scripts` WHERE `id`=180328;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(180328, 0, 0, 1, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Edge of Madness - Emote Roar');


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
