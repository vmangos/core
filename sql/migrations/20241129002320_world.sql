DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20241129002320');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20241129002320');
-- Add your query below.


-- GO 149032 Event 3204
DELETE FROM `gameobject` WHERE `guid` IN (16735, 16740);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`) VALUES
(16000, 149020, 0, -6898.63, -1087.29, 271.889, 4.57276, 0, 0, -0.754709, 0.656059, -600, -600, 1, 100),
(16004, 149020, 0, -6898.92, -1077.38, 270.633, 3.80482, 0, 0, -0.945518, 0.325568, -600, -600, 1, 100),
(16005, 149020, 0, -6905.65, -1078.26, 270.919, 0.0523589, 0, 0, 0.0261765, 0.999657, -600, -600, 1, 100),
(16006, 149020, 0, -6908.71, -1085.48, 270.645, 4.17134, 0, 0, -0.870356, 0.492424, -600, -600, 1, 100),
(16008, 149022, 0, -6904.82, -1084.9, 274.224, 1.64061, 0, 0, 0.731353, 0.681999, -600, -600, 1, 100);
DELETE FROM `event_scripts` WHERE `id`=3204;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(3204, 0, 9, 16006, 600, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Flames of Retribution: Respawn GameObject Tower Fire'),
(3204, 0, 9, 16005, 600, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Flames of Retribution: Respawn GameObject Tower Fire'),
(3204, 0, 9, 16004, 600, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Flames of Retribution: Respawn GameObject Tower Fire'),
(3204, 0, 9, 16000, 600, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Flames of Retribution: Respawn GameObject Tower Fire'),
(3204, 0, 9, 16008, 600, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Flames of Retribution: Respawn GameObject Tower Smoke');

-- GO 149025 Event 3201
DELETE FROM `gameobject` WHERE `guid` IN (16736, 16741);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`) VALUES
(16009, 148996, 0, -6998.74, -1129.94, 274.076, 1.09956, 0, 0, 0.522498, 0.85264, -600, -600, 1, 100),
(16010, 148997, 0, -6996.39, -1127.29, 274.009, 0.558504, 0, 0, 0.275637, 0.961262, -600, -600, 1, 100),
(16012, 148996, 0, -6984.54, -1138.07, 271.103, 3.87463, 0, 0, -0.93358, 0.358368, -600, -600, 1, 100),
(16013, 148996, 0, -6998.01, -1142.71, 271.848, 1.78023, 0, 0, 0.777145, 0.629321, -600, -600, 1, 100),
(16014, 148997, 0, -6990.19, -1129.89, 274.166, 4.38078, 0, 0, -0.814116, 0.580703, -600, -600, 1, 100);
DELETE FROM `event_scripts` WHERE `id`=3201;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(3201, 0, 9, 16014, 600, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Flames of Retribution: Respawn GameObject Tower Smoke'),
(3201, 0, 9, 16012, 600, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Flames of Retribution: Respawn GameObject Tower Fire'),
(3201, 0, 9, 16013, 600, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Flames of Retribution: Respawn GameObject Tower Fire'),
(3201, 0, 9, 16010, 600, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Flames of Retribution: Respawn GameObject Tower Smoke'),
(3201, 0, 9, 16009, 600, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Flames of Retribution: Respawn GameObject Tower Fire');

-- GO 149030 Event 3202
DELETE FROM `gameobject` WHERE `guid` IN (16737, 16742);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`) VALUES
(16016, 149017, 0, -7025.74, -1292.02, 276.15, 5.65487, 0, 0, -0.309016, 0.951057, -600, -600, 1, 100),
(16017, 149017, 0, -7022.36, -1286.55, 276.976, 5.58505, 0, 0, -0.34202, 0.939693, -600, -600, 1, 100),
(16018, 149017, 0, -7028.73, -1286.88, 273.117, 2.44346, 0, 0, 0.939692, 0.34202, -600, -600, 1, 100),
(16019, 149018, 0, -7022.2, -1287.73, 277.618, 1.90241, 0, 0, 0.814116, 0.580703, -600, -600, 1, 100),
(16020, 149018, 0, -7016.08, -1295.58, 276.686, 3.17653, 0, 0, -0.999847, 0.0174693, -600, -600, 1, 100);
DELETE FROM `event_scripts` WHERE `id`=3202;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(3202, 0, 9, 16019, 600, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Flames of Retribution: Respawn GameObject Tower Smoke'),
(3202, 0, 9, 16016, 600, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Flames of Retribution: Respawn GameObject Tower Fire'),
(3202, 0, 9, 16020, 600, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Flames of Retribution: Respawn GameObject Tower Smoke'),
(3202, 0, 9, 16017, 600, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Flames of Retribution: Respawn GameObject Tower Fire'),
(3202, 0, 9, 16018, 600, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Flames of Retribution: Respawn GameObject Tower Fire');

-- GO 149031 Event 3203
DELETE FROM `gameobject` WHERE `guid` IN (16738, 16743);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`) VALUES
(16021, 149019, 0, -6937.06, -1431.65, 271.514, 5.86431, 0, 0, -0.207911, 0.978148, -600, -600, 1, 100),
(16023, 149019, 0, -6932.1, -1433.43, 271.239, 4.15388, 0, 0, -0.874619, 0.48481, -600, -600, 1, 100),
(16024, 149019, 0, -6927.74, -1429.19, 271.513, 4.83456, 0, 0, -0.66262, 0.748956, -600, -600, 1, 100),
(16025, 149019, 0, -6928.63, -1423.98, 271.389, 5.41052, 0, 0, -0.422618, 0.906308, -600, -600, 1, 100),
(16026, 149021, 0, -6930.65, -1428.61, 273.899, 0.244346, 0, 0, 0.121869, 0.992546, -600, -600, 1, 100);
DELETE FROM `event_scripts` WHERE `id`=3203;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(3203, 0, 9, 16025, 600, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Flames of Retribution: Respawn GameObject Tower Fire'),
(3203, 0, 9, 16024, 600, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Flames of Retribution: Respawn GameObject Tower Fire'),
(3203, 0, 9, 16023, 600, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Flames of Retribution: Respawn GameObject Tower Fire'),
(3203, 0, 9, 16021, 600, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Flames of Retribution: Respawn GameObject Tower Fire'),
(3203, 0, 9, 16026, 600, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Flames of Retribution: Respawn GameObject Tower Smoke');


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
