DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20211126195700');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20211126195700');
-- Add your query below.


-- Add missing gameobject spawns.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`) VALUES 
(14199, 2872, 1, -2369.22, -4091.97, 8.74555, 6.07375, 0, 0, -0.104528, 0.994522, -120, -120, 1, 100),
(14200, 2872, 1, -2370.43, -4092.22, 8.73379, 5.98648, 0, 0, -0.147809, 0.989016, -120, -120, 1, 100),
(14201, 2872, 1, -2370.81, -4091.5, 8.72544, 0.366518, 0, 0, 0.182235, 0.983255, -120, -120, 1, 100),
(14202, 2872, 1, -2369.27, -4090.82, 8.54136, 0, 0, 0, 0, 1, -120, -120, 1, 100),
(14203, 20917, 1, -2370.01, -4091.62, 9.75972, 0, 0, 0, 0, 1, -120, -120, 1, 100);

-- Update script which summons Dagun the Ravenous.
DELETE FROM `event_scripts` WHERE `id`=452;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(452, 0, 10, 2937, 300000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, -2405.19, -4172.46, -7.055216, 0.977384, 0, 'Enchanted Sea Kelp - Summon Creature Dagun the Ravenous'),
(452, 0, 9, 14199, 120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Enchanted Sea Kelp - Respawn GameObject Enchanted Sea Kelp (Guid: 14199)'),
(452, 0, 9, 14200, 120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Enchanted Sea Kelp - Respawn GameObject Enchanted Sea Kelp (Guid: 14200)'),
(452, 0, 9, 14201, 120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Enchanted Sea Kelp - Respawn GameObject Enchanted Sea Kelp (Guid: 14201)'),
(452, 0, 9, 14202, 120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Enchanted Sea Kelp - Respawn GameObject Enchanted Sea Kelp (Guid: 14202)'),
(452, 0, 9, 14203, 120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Enchanted Sea Kelp - Respawn GameObject Blue Aura (Guid: 14203)');

-- Waypoints for Dagun the Ravenous.
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(2937, 1, -2404.259766, -4170.693359, -6.805216, 100.000000, 0, 0.000000, 0),
(2937, 2, -2394.033203, -4151.228516, -0.012980, 100.000000, 0, 0.000000, 0),
(2937, 3, -2389.862305, -4143.289551, 2.730242, 100.000000, 0, 0.000000, 0),
(2937, 4, -2380.409668, -4121.422852, 6.931906, 100.000000, 0, 0.000000, 0),
(2937, 5, -2377.267334, -4104.551758, 6.827217, 100.000000, 0, 0.000000, 0),
(2937, 6, -2373.932861, -4095.415771, 6.722568, 100.000000, 11000, 0.000000, 0),
(2937, 7, -2379.112793, -4091.868408, 6.722568, 100.000000, 120000, 3.000000, 0),
(2937, 8, -2378.163574, -4108.716797, 7.028881, 100.000000, 0, 0.000000, 0),
(2937, 9, -2381.520508, -4120.508789, 6.823725, 100.000000, 0, 0.000000, 0),
(2937, 10, -2387.505615, -4134.225098, 4.900465, 100.000000, 0, 0.000000, 0),
(2937, 11, -2394.902344, -4150.740234, 0.187639, 100.000000, 0, 0.000000, 0),
(2937, 12, -2404.299316, -4171.755371, -7.025187, 100.000000, 1000, 0.000000, 4),
(2937, 13, -2404.299316, -4171.755371, -7.025187, 100.000000, 0, 0.000000, 0);

-- Update comments for some generic waypoint scripts.
UPDATE `creature_movement_scripts` SET `comments` = 'Generic - Move Random at Current Position' WHERE `id`=2 && `command`=20;
UPDATE `creature_movement_scripts` SET `comments` = 'Generic - Set Home at Current Position' WHERE `id`=2 && `command`=34;
UPDATE `creature_movement_scripts` SET `comments` = 'Generic - Despawn Creature' WHERE `id`=4;
UPDATE `creature_movement_scripts` SET `comments` = 'Generic - Set Run' WHERE `id`=11;
UPDATE `creature_movement_scripts` SET `comments` = 'Generic - Set Walk' WHERE `id`=13;

-- Correct stats for Dagun the Ravenous.
UPDATE `creature_template` SET `dmg_min`=153.089, `dmg_max`=203.02, `attack_power`=162, `ranged_dmg_min`=60.8462, `ranged_dmg_max`=82.5551, `ranged_attack_power`=122, `armor`=2414 WHERE `entry`=2937;
-- Correct inhabit type and default movement type for Dagun the Ravenous.
UPDATE `creature_template` SET `movement_type`=2, `inhabit_type`=1 WHERE `entry`=2937;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
