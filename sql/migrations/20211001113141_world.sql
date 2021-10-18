DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20211001113141');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20211001113141');
-- Add your query below.


-- Gameobjects spawned during quest Enticing Negolash.
SET @OGUID = 20982; 
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`) VALUES 
(@OGUID+0, 2332, 0, -14655.1, 146.671, 2.23095, 2.65289, 0, 0, 0.970295, 0.241925, -120, -120, 1, 100),
(@OGUID+1, 2332, 0, -14656.8, 148.893, 3.28866, 5.09636, 0, 0, -0.559193, 0.829038, -120, -120, 1, 100),
(@OGUID+2, 2332, 0, -14655.3, 147.802, 2.63972, 6.16101, 0, 0, -0.0610485, 0.998135, -120, -120, 1, 100),
(@OGUID+3, 2332, 0, -14652.9, 146.867, 2.50691, 2.94959, 0, 0, 0.995396, 0.0958512, -120, -120, 1, 100),
(@OGUID+4, 2332, 0, -14654.7, 146.142, 2.08906, 2.37364, 0, 0, 0.927183, 0.374608, -120, -120, 1, 100),
(@OGUID+5, 2332, 0, -14652.4, 146.512, 3.50118, 0.349065, 0, 0, 0.173648, 0.984808, -120, -120, 1, 100),
(@OGUID+6, 2332, 0, -14656.2, 147.096, 2.38777, 0.174532, 0, 0, 0.0871553, 0.996195, -120, -120, 1, 100),
(@OGUID+7, 2332, 0, -14654.5, 147.324, 2.45636, 1.81514, 0, 0, 0.788011, 0.615662, -120, -120, 1, 100),
(@OGUID+8, 2332, 0, -14653, 146.524, 2.35559, 6.00393, 0, 0, -0.139173, 0.990268, -120, -120, 1, 100),
(@OGUID+9, 2332, 0, -14654, 147.306, 2.46731, 0.942477, 0, 0, 0.45399, 0.891007, -120, -120, 1, 100),
(@OGUID+10, 2332, 0, -14654.9, 147.278, 2.42524, 5.88176, 0, 0, -0.199367, 0.979925, -120, -120, 1, 100),
(@OGUID+11, 2332, 0, -14653, 145.138, 2.65327, 5.84685, 0, 0, -0.216439, 0.976296, -120, -120, 1, 100),
(@OGUID+12, 2333, 0, -14656.8, 147.434, 3.10207, 3.01941, 0, 0, 0.998135, 0.0610518, -120, -120, 1, 100),
(@OGUID+13, 2333, 0, -14655.7, 148.978, 4.0564, 3.47321, 0, 0, -0.986285, 0.16505, -120, -120, 1, 100),
(@OGUID+14, 2333, 0, -14656.5, 147.595, 3.12908, 1.58825, 0, 0, 0.71325, 0.70091, -120, -120, 1, 100),
(@OGUID+15, 2333, 0, -14653, 145.389, 2.852, 4.85202, 0, 0, -0.656058, 0.75471, -120, -120, 1, 100),
(@OGUID+16, 2333, 0, -14657.2, 148.228, 2.88632, 1.53589, 0, 0, 0.694658, 0.71934, -120, -120, 1, 100),
(@OGUID+17, 2562, 0, -14653.8, 146.204, 2.14631, 4.88692, 0, 0, -0.642787, 0.766045, -120, -120, 1, 100),
(@OGUID+18, 2562, 0, -14652.4, 145.753, 3.25464, 2.93214, 0, 0, 0.994521, 0.104535, -120, -120, 1, 100),
(@OGUID+19, 2562, 0, -14656.1, 148.367, 3.51564, 5.63741, 0, 0, -0.317305, 0.948324, -120, -120, 1, 100);

-- Script on completion of quest Enticing Negolash.
DELETE FROM `quest_end_scripts` WHERE `id`=619;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(619, 0, 10, 1494, 120000, 0, 0, 0, 0, 0, 0, 0, 1494, -1, 1, -14598.6, 76.0563, -11.249, 0.925025, 0, 'Enticing Negolash: Ruined Lifeboat - Summon Creature Negolash'),
(619, 0, 9, @OGUID+0, 120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Enticing Negolash: Ruined Lifeboat - Respawn GameObject Barbequed Buzzard Wings'),
(619, 0, 9, @OGUID+1, 120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Enticing Negolash: Ruined Lifeboat - Respawn GameObject Barbequed Buzzard Wings'),
(619, 0, 9, @OGUID+2, 120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Enticing Negolash: Ruined Lifeboat - Respawn GameObject Barbequed Buzzard Wings'),
(619, 0, 9, @OGUID+3, 120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Enticing Negolash: Ruined Lifeboat - Respawn GameObject Barbequed Buzzard Wings'),
(619, 0, 9, @OGUID+4, 120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Enticing Negolash: Ruined Lifeboat - Respawn GameObject Barbequed Buzzard Wings'),
(619, 0, 9, @OGUID+5, 120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Enticing Negolash: Ruined Lifeboat - Respawn GameObject Barbequed Buzzard Wings'),
(619, 0, 9, @OGUID+6, 120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Enticing Negolash: Ruined Lifeboat - Respawn GameObject Barbequed Buzzard Wings'),
(619, 0, 9, @OGUID+7, 120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Enticing Negolash: Ruined Lifeboat - Respawn GameObject Barbequed Buzzard Wings'),
(619, 0, 9, @OGUID+8, 120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Enticing Negolash: Ruined Lifeboat - Respawn GameObject Barbequed Buzzard Wings'),
(619, 0, 9, @OGUID+9, 120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Enticing Negolash: Ruined Lifeboat - Respawn GameObject Barbequed Buzzard Wings'),
(619, 0, 9, @OGUID+10, 120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Enticing Negolash: Ruined Lifeboat - Respawn GameObject Barbequed Buzzard Wings'),
(619, 0, 9, @OGUID+11, 120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Enticing Negolash: Ruined Lifeboat - Respawn GameObject Barbequed Buzzard Wings'),
(619, 0, 9, @OGUID+12, 120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Enticing Negolash: Ruined Lifeboat - Respawn GameObject Stranglevine Wine'),
(619, 0, 9, @OGUID+13, 120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Enticing Negolash: Ruined Lifeboat - Respawn GameObject Stranglevine Wine'),
(619, 0, 9, @OGUID+14, 120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Enticing Negolash: Ruined Lifeboat - Respawn GameObject Stranglevine Wine'),
(619, 0, 9, @OGUID+15, 120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Enticing Negolash: Ruined Lifeboat - Respawn GameObject Stranglevine Wine'),
(619, 0, 9, @OGUID+16, 120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Enticing Negolash: Ruined Lifeboat - Respawn GameObject Stranglevine Wine'),
(619, 0, 9, @OGUID+17, 120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Enticing Negolash: Ruined Lifeboat - Respawn GameObject Baked Bread'),
(619, 0, 9, @OGUID+18, 120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Enticing Negolash: Ruined Lifeboat - Respawn GameObject Baked Bread'),
(619, 0, 9, @OGUID+19, 120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Enticing Negolash: Ruined Lifeboat - Respawn GameObject Baked Bread');

-- Summon script for Negolash.
DELETE FROM `generic_scripts` WHERE `id`=1494;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1494, 0, 60, 0, 0, 3000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Negolash - Start Waypoints');

-- Waypoints for Negolash.
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(1494, 1, -14598.599609, 76.056297, -11.249000, 100.000000, 0, 0.000000, 149401),
(1494, 2, -14603.400391, 87.177902, -10.240300, 100.000000, 0, 0.000000, 0),
(1494, 3, -14612.900391, 104.960999, -8.736550, 100.000000, 0, 0.000000, 0),
(1494, 4, -14625.200195, 125.224998, -5.169360, 100.000000, 0, 0.000000, 0),
(1494, 5, -14647.200195, 142.490005, 0.734623, 100.000000, 1000, 0.000000, 149405),
(1494, 6, -14647.200195, 142.490005, 0.734623, 1.421290, 1000, 0.000000, 0);

-- Waypoint scripts for Negolash.
DELETE FROM `creature_movement_scripts` WHERE `id`=149401;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(149401, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 731, 0, 0, 0, 0, 0, 0, 0, 0, 'Negolash - Say Text');
DELETE FROM `creature_movement_scripts` WHERE `id`=149405;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(149405, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 763, 0, 0, 0, 0, 0, 0, 0, 0, 'Negolash - Say Text');

-- This text should be yelled.
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=731;

-- Remove EventAI from Negolash.
DELETE FROM `creature_ai_scripts` WHERE `id` IN (149401);
DELETE FROM `creature_ai_events` WHERE `creature_id`=1494;
UPDATE `creature_template` SET `ai_name`='' WHERE `entry`=1494;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
