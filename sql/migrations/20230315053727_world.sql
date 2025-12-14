DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230315053727');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230315053727');
-- Add your query below.


-- Remove unused custom copies of Blackwing Technician.
DELETE FROM `event_scripts` WHERE `id`=8452;
DELETE FROM `creature_template` WHERE `entry` IN (988001, 988002, 988003, 988004, 988005, 988006);
DELETE FROM `creature_equip_template` WHERE `entry` IN (988001, 988002, 988003, 988004, 988005, 988006);

-- Remove custom creature Madness Trigger.
DELETE FROM `creature_template` WHERE `entry`=987800;
DELETE FROM `generic_scripts` WHERE `id`=180327;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(180327, 0, 0, 13, 0, 0, 0, 0, 180252, 100, 27, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brazier of Madness - Activate Troll Hero Lightning Wave 1 Use 1'),
(180327, 0, 0, 13, 0, 0, 0, 0, 180252, 100, 27, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brazier of Madness - Activate Troll Hero Lightning Wave 1 Use 2'),
(180327, 0, 0, 13, 0, 0, 0, 0, 180252, 100, 27, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brazier of Madness - Activate Troll Hero Lightning Wave 1 Use 3'),
(180327, 0, 0, 13, 0, 0, 0, 0, 180252, 100, 27, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brazier of Madness - Activate Troll Hero Lightning Wave 1 Use 4'),
(180327, 1, 0, 13, 0, 0, 0, 0, 180252, 100, 27, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brazier of Madness - Activate Troll Hero Lightning Wave 2 Use 1'),
(180327, 1, 0, 13, 0, 0, 0, 0, 180252, 100, 27, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brazier of Madness - Activate Troll Hero Lightning Wave 2 Use 2'),
(180327, 1, 0, 13, 0, 0, 0, 0, 180252, 100, 27, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brazier of Madness - Activate Troll Hero Lightning Wave 2 Use 3'),
(180327, 1, 0, 13, 0, 0, 0, 0, 180252, 100, 27, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brazier of Madness - Activate Troll Hero Lightning Wave 2 Use 4'),
(180327, 1, 0, 13, 0, 0, 0, 0, 180252, 100, 27, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brazier of Madness - Activate Troll Hero Lightning Wave 2 Use 5'),
(180327, 1, 0, 13, 0, 0, 0, 0, 180252, 100, 27, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brazier of Madness - Activate Troll Hero Lightning Wave 2 Use 6'),
(180327, 1, 0, 13, 0, 0, 0, 0, 180252, 100, 27, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brazier of Madness - Activate Troll Hero Lightning Wave 2 Use 7'),
(180327, 1, 0, 13, 0, 0, 0, 0, 180252, 100, 27, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brazier of Madness - Activate Troll Hero Lightning Wave 2 Use 8'),
(180327, 1, 0, 13, 0, 0, 0, 0, 180252, 100, 27, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brazier of Madness - Activate Troll Hero Lightning Wave 2 Use 9'),
(180327, 1, 0, 13, 0, 0, 0, 0, 180252, 100, 27, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brazier of Madness - Activate Troll Hero Lightning Wave 2 Use 10'),
(180327, 1, 0, 13, 0, 0, 0, 0, 180252, 100, 27, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brazier of Madness - Activate Troll Hero Lightning Wave 2 Use 11'),
(180327, 1, 0, 13, 0, 0, 0, 0, 180252, 100, 27, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brazier of Madness - Activate Troll Hero Lightning Wave 2 Use 12'),
(180327, 2, 0, 13, 0, 0, 0, 0, 180252, 100, 27, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brazier of Madness - Activate Troll Hero Lightning Wave 3 Use 1'),
(180327, 2, 0, 13, 0, 0, 0, 0, 180252, 100, 27, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brazier of Madness - Activate Troll Hero Lightning Wave 3 Use 2'),
(180327, 2, 0, 13, 0, 0, 0, 0, 180252, 100, 27, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brazier of Madness - Activate Troll Hero Lightning Wave 3 Use 3'),
(180327, 2, 0, 13, 0, 0, 0, 0, 180252, 100, 27, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brazier of Madness - Activate Troll Hero Lightning Wave 3 Use 4'),
(180327, 2, 0, 13, 0, 0, 0, 0, 180252, 100, 27, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brazier of Madness - Activate Troll Hero Lightning Wave 3 Use 5'),
(180327, 2, 0, 13, 0, 0, 0, 0, 180252, 100, 27, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brazier of Madness - Activate Troll Hero Lightning Wave 3 Use 6');
DELETE FROM `gameobject_scripts` WHERE `id`=21608;
INSERT INTO `gameobject_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(21608, 3, 0, 39, 180327, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Brazier of Madness - Activate Troll Hero Lightning Script'),
(21608, 5, 0, 9, 396315, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brazier of Madness - Respawn Portal'),
(21608, 15, 0, 10, 15083, 900000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, -11901.3, -1906.52, 65.36, 0.9, 0, 'Brazier of Madness - Summon Creature Hazza\'rah');
DELETE FROM `gameobject_scripts` WHERE `id`=21609;
INSERT INTO `gameobject_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(21609, 3, 0, 39, 180327, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Brazier of Madness - Activate Troll Hero Lightning Script'),
(21609, 5, 0, 9, 396315, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brazier of Madness - Respawn Portal'),
(21609, 15, 0, 10, 15084, 900000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, -11901.3, -1906.52, 65.36, 0.9, 0, 'Brazier of Madness - Summon Creature Renataki');
DELETE FROM `gameobject_scripts` WHERE `id`=21610;
INSERT INTO `gameobject_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(21610, 3, 0, 39, 180327, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Brazier of Madness - Activate Troll Hero Lightning Script'),
(21610, 5, 0, 9, 396315, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brazier of Madness - Respawn Portal'),
(21610, 15, 0, 10, 15085, 900000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, -11901.3, -1906.52, 65.36, 0.9, 0, 'Brazier of Madness - Summon Creature Wushoolay');
DELETE FROM `gameobject_scripts` WHERE `id`=28704;
INSERT INTO `gameobject_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(28704, 3, 0, 39, 180327, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Brazier of Madness - Activate Troll Hero Lightning Script'),
(28704, 5, 0, 9, 396315, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brazier of Madness - Respawn Portal'),
(28704, 15, 0, 10, 15082, 900000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, -11901.3, -1906.52, 65.36, 0.9, 0, 'Brazier of Madness - Summon Creature Gri\'lek');

-- Troll Hero Lightning was being wrongly used in Maws script.
DELETE FROM `gameobject` WHERE `id`=180252 && `map` != 309;
DELETE FROM `event_scripts` WHERE `id`=9542;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(9542, 0, 76, 180670, 9000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3477.38, -6565.47, -20.0101, 1.79769, 0, 'Place Arcanite Buoy: Summon GameObject Bay of Storms Lightning Storm'),
(9542, 1, 10, 15571, 9000000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, 3564.83, -6723.55, -10.8831, 0.395452, 0, 'Place Arcanite Buoy: Summon Creature Maws');
UPDATE `creature_template` SET `faction`=1194, `auras`='8876' WHERE `entry`=15571;
UPDATE `gameobject_template` SET `script_name`='go_bay_of_storms' WHERE `entry`=180670;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
